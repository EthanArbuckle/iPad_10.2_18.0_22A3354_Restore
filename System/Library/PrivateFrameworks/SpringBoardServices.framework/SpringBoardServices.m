id SBLogAnalytics()
{
  if (SBLogAnalytics_onceToken != -1)
    dispatch_once(&SBLogAnalytics_onceToken, &__block_literal_global_63);
  return (id)SBLogAnalytics___logObj;
}

id SBLogTraitsArbiter()
{
  if (SBLogTraitsArbiter_onceToken != -1)
    dispatch_once(&SBLogTraitsArbiter_onceToken, &__block_literal_global_103);
  return (id)SBLogTraitsArbiter___logObj;
}

id SBLogStatusBarish()
{
  if (SBLogStatusBarish_onceToken != -1)
    dispatch_once(&SBLogStatusBarish_onceToken, &__block_literal_global_69);
  return (id)SBLogStatusBarish___logObj;
}

uint64_t __sb__runningInSpringBoard()
{
  if (__sb__runningInSpringBoard___once != -1)
    dispatch_once(&__sb__runningInSpringBoard___once, &__block_literal_global_21);
  if (__sb__overrideRunningInSpringBoard)
    return objc_msgSend((id)__sb__overrideRunningInSpringBoard, "BOOLValue");
  else
    return __sb__runningInSpringBoard___result;
}

void *SBSCopyBundleInfoValueForKeyAndProcessID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  _SBApplicationStateGetMonitor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleInfoValueForKey:PID:", a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

id _SBApplicationStateGetMonitor()
{
  void *v0;

  pthread_mutex_lock(&sRegistrationCountLock);
  _SBApplicationStateGetMonitor_Locked();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&sRegistrationCountLock);
  return v0;
}

id _SBApplicationStateGetMonitor_Locked()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)sMonitor;
  if (!sMonitor)
  {
    v1 = objc_alloc(MEMORY[0x1E0D00C50]);
    v2 = objc_msgSend(v1, "initWithBundleIDs:states:elevatedPriority:", 0, *MEMORY[0x1E0D008F8], 1);
    v3 = (void *)sMonitor;
    sMonitor = v2;

    v0 = (void *)sMonitor;
  }
  return v0;
}

__CFString *SBSDisplayLayoutRoleDescription(unint64_t a1)
{
  if (a1 < 0xC)
    return off_1E288E918[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_DWORD *_XDeactivateReachability(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigDeactivateReachability(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigDeactivateReachability(uint64_t a1, _OWORD *a2)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDeactivateReachability");
  if (!FunctionForSymbol)
    return 5;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

void *SBMigGetFunctionForSymbol(const void *a1)
{
  uint64_t context;
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *value;
  uint8_t buf[4];
  _BYTE v26[14];
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)__SharedWorkloop);
  context = dispatch_mach_mig_demux_get_context();
  if (context)
  {
    v3 = context;
    value = 0;
    NSMapMember((NSMapTable *)__FunctionMap, a1, 0, &value);
    if (value)
      v4 = "implemented";
    else
      v4 = "not implemented";
    v5 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 20);
    v6 = objc_msgSend(*(id *)(v3 + 16), "pid");
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      BSProcessNameForPID();
      v9 = objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "processName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)v26 = v9;
        *(_WORD *)&v26[8] = 1024;
        *(_DWORD *)&v26[10] = v6;
        v27 = 2082;
        *(_QWORD *)v28 = a1;
        *(_WORD *)&v28[8] = 1024;
        *(_DWORD *)&v28[10] = v5;
        v29 = 2082;
        v30 = v4;
        v31 = 2114;
        v32 = v23;
        _os_log_debug_impl(&dword_18EB52000, v10, OS_LOG_TYPE_DEBUG, "[SBMig] %{public}@:%d calling %{public}s (msgID %d) --> %{public}s by %{public}@.", buf, 0x36u);

      }
    }
    else
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "processName");
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v26 = v6;
        *(_WORD *)&v26[4] = 2082;
        *(_QWORD *)&v26[6] = a1;
        v27 = 1024;
        *(_DWORD *)v28 = v5;
        *(_WORD *)&v28[4] = 2082;
        *(_QWORD *)&v28[6] = v4;
        v29 = 2114;
        v30 = v21;
        _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_INFO, "[SBMig] Process %d calling %{public}s (msgID %d) --> %{public}s by %{public}@.", buf, 0x2Cu);

      }
    }

    return value;
  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      SBMigGetFunctionForSymbol_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    return 0;
  }
}

id SBLogCommon()
{
  if (SBLogCommon_onceToken != -1)
    dispatch_once(&SBLogCommon_onceToken, &__block_literal_global_13);
  return (id)SBLogCommon___logObj;
}

uint64_t SBSBacklightChangeSourceForDisplayLayoutTransitionReason(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.programmatic")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.homeButton")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.lockButton")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.volumeButton")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.otherButton")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.keyboard")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.smartCover")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.idleTimer")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.touch")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.plugin")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.notification")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.prox")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.siri")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.boot")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.pocketState")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.externalRequest")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.externalAppRequest")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.springboardRequest")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.liftToWake")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.logout")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.notificationCenter")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.acPowerChange")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.chargingAccessoryChange")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.restoring")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.fullScreenAlert")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.languageChange")) & 1) != 0)
  {
    v2 = 27;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.unknownUserEvent")) & 1) != 0)
  {
    v2 = 28;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.coverSheet")) & 1) != 0)
  {
    v2 = 29;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.SOSDismiss")) & 1) != 0)
  {
    v2 = 30;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.actionButton")) & 1) != 0)
  {
    v2 = 31;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.cameraButton")) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.PowerDownDismiss")) & 1) != 0)
  {
    v2 = 33;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.mouseButton")) & 1) != 0)
  {
    v2 = 34;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.accessibility")) & 1) != 0)
  {
    v2 = 35;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.accessoryAttached")) & 1) != 0)
  {
    v2 = 36;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.authentication")) & 1) != 0)
  {
    v2 = 37;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.sessionAlert")) & 1) != 0)
  {
    v2 = 40;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.systemApertureClientRequest")) & 1) != 0)
  {
    v2 = 41;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.ambient")) & 1) != 0)
  {
    v2 = 42;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.bumpToWake")) & 1) != 0)
  {
    v2 = 43;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.motionDetection")) & 1) != 0)
  {
    v2 = 44;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.captureButton")) & 1) != 0)
  {
    v2 = 46;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.captureButtonAccidentalActivationMitigation")) & 1) != 0)
  {
    v2 = 48;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.magicKeyboardExtended")))
  {
    v2 = 47;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18EB55FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_SBFScreenTimeNameForCategory(unsigned int a1)
{
  if (a1 > 0x13)
    return 0;
  else
    return off_1E288CFA0[a1];
}

uint64_t soft_ADClientAddValueForScalarKey(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  v8 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  if (!getADClientAddValueForScalarKeySymbolLoc_ptr)
  {
    v3 = (void *)AggregateDictionaryLibrary();
    v2 = dlsym(v3, "ADClientAddValueForScalarKey");
    v6[3] = (uint64_t)v2;
    getADClientAddValueForScalarKeySymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft_ADClientAddValueForScalarKey_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(a1, 1);
}

void sub_18EB560A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _SBFScreenTimePostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1;

  v1 = state64;
  LODWORD(state64) = _SBFScreenTimePostExternalChangeNotification_token;
  if (_SBFScreenTimePostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.screenchanged", &_SBFScreenTimePostExternalChangeNotification_token), state64 = _SBFScreenTimePostExternalChangeNotification_token, _SBFScreenTimePostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.screenchanged");
  }
  return state64;
}

__CFString *NSStringFromSBSHardwareButtonKind(unint64_t a1)
{
  if (a1 < 0xB)
    return off_1E288DEE8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x193FF8644]();
  +[_SBSDisplayIdentifiersCache sharedInstance](_SBSDisplayIdentifiersCache, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");

  objc_autoreleasePoolPop(v0);
  return v3;
}

void SBMachChannelHandleEvent(uint64_t *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int buf;
  uint8_t buf_4[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 7:
      SBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        SBMachChannelHandleEvent_cold_5(v8, v9, v10, v11, v12, v13, v14, v15);

      if (a1)
      {
        BSMachReceiveRightRelease();
        *((_DWORD *)a1 + 2) = 0;
        v16 = (void *)a1[5];
        a1[5] = 0;

      }
      break;
    case 2:
      v26 = 0;
      dispatch_mach_msg_get_msg();
      SBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        SBMachChannelHandleEvent_cold_4(v18, v19, v20, v21, v22, v23, v24, v25);

      break;
    case 1:
      if (a1)
      {
        SBLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = *a1;
          buf = 136446210;
          *(_QWORD *)buf_4 = v7;
          _os_log_impl(&dword_18EB52000, v6, OS_LOG_TYPE_INFO, "[SBMig] Service connected: %{public}s", (uint8_t *)&buf, 0xCu);
        }

      }
      break;
    default:
      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        buf = 134217984;
        *(_QWORD *)buf_4 = a2;
        _os_log_impl(&dword_18EB52000, v17, OS_LOG_TYPE_INFO, "[SBMig] Unhandled dispatch mach reason %lu.", (uint8_t *)&buf, 0xCu);
      }

      break;
  }

}

uint64_t _SBSupportedType(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v19;
      v6 = 1;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 &= _SBSupportedType(v8);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
      goto LABEL_20;
    }
LABEL_19:
    LOBYTE(v6) = 1;
LABEL_20:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      v6 = 1;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v2);
          v6 &= _SBSupportedType(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j));
        }
        v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    LOBYTE(v6) = objc_opt_isKindOfClass();
  }
LABEL_25:

  return v6 & 1;
}

double __sb__mainScreenReferenceBounds()
{
  void *v0;
  double v1;
  double v2;

  __sb__mainDisplayConfiguration();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  return v2;
}

id __sb__mainDisplayConfiguration()
{
  if (__sb__mainDisplayConfiguration___once != -1)
    dispatch_once(&__sb__mainDisplayConfiguration___once, &__block_literal_global_2);
  return (id)__sb__mainDisplayConfiguration___mainDisplayConfiguration;
}

id SBLogAuthenticationController()
{
  if (SBLogAuthenticationController_onceToken != -1)
    dispatch_once(&SBLogAuthenticationController_onceToken, &__block_literal_global_142);
  return (id)SBLogAuthenticationController___logObj;
}

id SBLogPIP()
{
  if (SBLogPIP_onceToken != -1)
    dispatch_once(&SBLogPIP_onceToken, &__block_literal_global_97);
  return (id)SBLogPIP___logObj;
}

id SBLogKeyboardFocus()
{
  if (SBLogKeyboardFocus_onceToken != -1)
    dispatch_once(&SBLogKeyboardFocus_onceToken, &__block_literal_global_101);
  return (id)SBLogKeyboardFocus___logObj;
}

id SBLogIdleTimer()
{
  if (SBLogIdleTimer_onceToken != -1)
    dispatch_once(&SBLogIdleTimer_onceToken, &__block_literal_global_37);
  return (id)SBLogIdleTimer___logObj;
}

id SBLogZStack()
{
  if (SBLogZStack_onceToken != -1)
    dispatch_once(&SBLogZStack_onceToken, &__block_literal_global_99);
  return (id)SBLogZStack___logObj;
}

BOOL SBSDisplayLayoutRoleIsDefined(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xA;
}

id SBLogDockRecents()
{
  if (SBLogDockRecents_onceToken != -1)
    dispatch_once(&SBLogDockRecents_onceToken, &__block_literal_global_57);
  return (id)SBLogDockRecents___logObj;
}

id SBLogMedusaKeyboard()
{
  if (SBLogMedusaKeyboard_onceToken != -1)
    dispatch_once(&SBLogMedusaKeyboard_onceToken, &__block_literal_global_105);
  return (id)SBLogMedusaKeyboard___logObj;
}

id SBLogDashBoard()
{
  if (SBLogDashBoard_onceToken != -1)
    dispatch_once(&SBLogDashBoard_onceToken, &__block_literal_global_5_0);
  return (id)SBLogDashBoard___logObj;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t _SBSDeactivateReachability(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186D600000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

id SBLogIconDragging()
{
  if (SBLogIconDragging_onceToken != -1)
    dispatch_once(&SBLogIconDragging_onceToken, &__block_literal_global_59_0);
  return (id)SBLogIconDragging___logObj;
}

BOOL SBSProcessIDForDisplayIdentifier(uint64_t a1, int *a2)
{
  id v4;
  int v5;
  _BOOL8 v6;

  v4 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v5 = objc_msgSend(v4, "pidForApplication:", a1);
  if (a2 && v5 >= 1)
    *a2 = v5;
  v6 = v5 > 0;

  return v6;
}

void SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  if (SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_onceToken != -1)
    dispatch_once(&SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_onceToken, &__block_literal_global_2);
  v2 = (void *)SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary___oldToNewKeys;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke_2;
  v4[3] = &unk_1E288D148;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id SBLogAppShortcuts()
{
  if (SBLogAppShortcuts_onceToken != -1)
    dispatch_once(&SBLogAppShortcuts_onceToken, &__block_literal_global_71);
  return (id)SBLogAppShortcuts___logObj;
}

id SBLogInputUI()
{
  if (SBLogInputUI_onceToken != -1)
    dispatch_once(&SBLogInputUI_onceToken, &__block_literal_global_119);
  return (id)SBLogInputUI___logObj;
}

uint64_t _XSetShowsProgress(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetShowsProgress(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigSetShowsProgress(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetShowsProgress");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

void sub_18EB5803C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB587A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void SBSSetStatusBarShowsActivityForApplication(int a1, void *a2, int a3)
{
  void *v6;
  id v7;
  void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  uint64_t v15;
  const void *v16;
  _QWORD v17[4];
  id v18;
  int v19;
  char v20;

  v6 = (void *)MEMORY[0x193FF8644]();
  v7 = a2;
  if (!v7 || (v8 = v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    SBSSetStatusBarShowsActivityForApplication_cold_1();
  if ((unint64_t)objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4) <= 0x3FF)
  {
    v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSSetStatusBarShowsActivityForApplication-%@"), v8);
    _SBSRestartLock();
    _SBSRestartGetInfoForIdentifier(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v11 = 0;
    if (v11 == (a1 == 0))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __SBSSetStatusBarShowsActivityForApplication_block_invoke;
      v17[3] = &unk_1E288E7B8;
      v18 = v8;
      v20 = a1;
      v19 = a3;
      v12 = MEMORY[0x193FF87DC](v17);
      v13 = (void (**)(_QWORD))v12;
      if (a1)
        v14 = (void *)v12;
      else
        v14 = 0;
      _SBSRestartScheduleBlockForIdentifier(v9, v14);

    }
    else
    {
      v13 = 0;
    }
    if (a1)
      v15 = v11 + 1;
    else
      v15 = v11 - 1;
    if (v15)
      v16 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    else
      v16 = 0;
    _SBSRestartSetInfoForIdentifier(v9, v16);
    if (v13)
      v13[2](v13);
    _SBSRestartUnlock();

  }
  objc_autoreleasePoolPop(v6);
}

uint64_t _SBSRestartLock()
{
  if (_SBSRestartLock_once != -1)
    dispatch_once(&_SBSRestartLock_once, &__block_literal_global_35);
  return objc_msgSend((id)__SBSRestartLock, "lock");
}

uint64_t _SBSRestartUnlock()
{
  return objc_msgSend((id)__SBSRestartLock, "unlock");
}

uint64_t _SBSRestartSetInfoForIdentifier(CFTypeRef cf, const void *a2)
{
  CFTypeID v4;

  if (!cf || (v4 = CFGetTypeID(cf), v4 != CFStringGetTypeID()))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("identifier must be valid"));
  _SBSRestartLock();
  if (a2)
    CFDictionarySetValue((CFMutableDictionaryRef)__SBSRestartInfo, cf, a2);
  else
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__SBSRestartInfo, cf);
  return objc_msgSend((id)__SBSRestartLock, "unlock");
}

void _SBSRestartScheduleBlockForIdentifier(const void *a1, void *a2)
{
  CFTypeID v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!a1 || (v3 = CFGetTypeID(a1), v3 != CFStringGetTypeID()))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("identifier must be valid"));
  _SBSRestartLock();
  v4 = (void *)__SBSRestartBlocks;
  if (v6)
  {
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, a1);

  }
  else
  {
    objc_msgSend((id)__SBSRestartBlocks, "removeObjectForKey:", a1);
  }
  objc_msgSend((id)__SBSRestartLock, "unlock");

}

const void *_SBSRestartGetInfoForIdentifier(CFTypeRef cf)
{
  CFTypeID v2;
  const void *Value;

  if (!cf || (v2 = CFGetTypeID(cf), v2 != CFStringGetTypeID()))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("identifier must be valid"));
  _SBSRestartLock();
  Value = CFDictionaryGetValue((CFDictionaryRef)__SBSRestartInfo, cf);
  objc_msgSend((id)__SBSRestartLock, "unlock");
  return Value;
}

uint64_t _SBSSetApplicationShowsProgress(mach_port_name_t a1, const char *a2, int a3, mach_msg_timeout_t a4)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  uint64_t v10;
  mach_port_name_t name[4];
  __int128 v13;
  _OWORD v14[65];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 480);
  *(_OWORD *)name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 44;
  *(_DWORD *)((char *)v14 + v8 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v13 = 0x186D900000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v10 = mach_msg((mach_msg_header_t *)name, 2097169, v9, 0, 0, a4, 0);
  if ((v10 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v10;
}

void sub_18EB5916C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SBSSetTypingActive(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardBackgroundServerPort();
  return SBSetTypingActive(v2, a1);
}

uint64_t SBSSetStatusBarShowsActivity(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetShowsProgress(v2, a1);
}

uint64_t SBSUIAppDeactivateReachability()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBDeactivateReachability(v0);
}

uint64_t SBSServerPortHelper(const char *a1, mach_port_name_t *a2)
{
  uint64_t v4;
  ipc_space_t *v5;
  mach_port_type_t ptype;

  if (SBSServerPortHelper_onceToken != -1)
    dispatch_once(&SBSServerPortHelper_onceToken, &__block_literal_global_6);
  if ((SBSServerPortHelper_isAppleTV & 1) != 0)
    return 0;
  pthread_mutex_lock(&springboardServerPortLock);
  ptype = 0;
  v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (mach_port_type(*MEMORY[0x1E0C83DA0], *a2, &ptype) || (ptype & 0x100000) != 0)
  {
    if (*a2 + 1 >= 2)
      mach_port_deallocate(*v5, *a2);
    *a2 = 0;
    bootstrap_look_up(*MEMORY[0x1E0C81720], a1, a2);
  }
  v4 = *a2;
  pthread_mutex_unlock(&springboardServerPortLock);
  return v4;
}

uint64_t SBSSpringBoardServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.services", springboardServerPort);
}

uint64_t SBSSpringBoardBackgroundServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.backgroundappservices", springboardServerPort2);
}

uint64_t _SBSGetDisplayIdentifiers(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x30D4600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 200106)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSAddBiometricAssertion(mach_port_t a1, const char *a2, int a3, char a4)
{
  int v6;
  uint64_t v7;
  char *v8;
  mach_msg_size_t v9;
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  mach_msg_header_t rcv_name;
  int v15;
  int v16;
  __int128 v17;
  _OWORD v18[65];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  memset(v18, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v15 = 1;
  v16 = a3;
  DWORD1(v17) = 1310720;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v6 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  else
    v6 = mig_strncpy((char *)v18 + 8, a2, 1024);
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  v8 = (char *)&rcv_name + v7;
  v8[56] = a4;
  *(_WORD *)(v8 + 57) = 0;
  v8[59] = 0;
  v9 = v7 + 60;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186CE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v11 = mach_msg(&rcv_name, 3162115, v9, 0x2Cu, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v11)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v12 - 268435459) > 1)
      return v12;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v12;
  }
  if (rcv_name.msgh_id == 71)
  {
    v12 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100146)
  {
    v12 = 4294966995;
    goto LABEL_22;
  }
  v12 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name.msgh_size != 36)
    goto LABEL_22;
  if (rcv_name.msgh_remote_port)
    goto LABEL_22;
  v12 = v17;
  if ((_DWORD)v17)
    goto LABEL_22;
  return v12;
}

uint64_t _SBSSetShowsProgress(mach_port_t a1, int a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  int v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100056;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

id SBLogSystemUIScene()
{
  if (SBLogSystemUIScene_onceToken != -1)
    dispatch_once(&SBLogSystemUIScene_onceToken, &__block_literal_global_125);
  return (id)SBLogSystemUIScene___logObj;
}

uint64_t _XSetTypingActive(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetTypingActive(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigSetTypingActive(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetTypingActive");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t SBSProcessAssertionGetNameForReason(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D00DB8], "NameForReason:", a1);
}

const __CFString *SBApplicationStateGetDescription(int a1)
{
  const __CFString *result;

  result = CFSTR("Unknown");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("Terminated");
      break;
    case 2:
      result = CFSTR("Background Task Suspended");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      result = CFSTR("Background Running");
      break;
    case 8:
      result = CFSTR("Foreground Running");
      break;
    default:
      if (a1 == 16)
      {
        result = CFSTR("Process Server");
      }
      else if (a1 == 32)
      {
        result = CFSTR("Foreground Running Obscured");
      }
      else
      {
LABEL_6:
        result = 0;
      }
      break;
  }
  return result;
}

void ____sb__runningInSpringBoard_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __sb__runningInSpringBoard___result = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.springboard"));

}

id SBLogCoverSheet()
{
  if (SBLogCoverSheet_onceToken != -1)
    dispatch_once(&SBLogCoverSheet_onceToken, &__block_literal_global_51);
  return (id)SBLogCoverSheet___logObj;
}

void sub_18EB5AA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBLogAppQuitMonitor()
{
  if (SBLogAppQuitMonitor_onceToken != -1)
    dispatch_once(&SBLogAppQuitMonitor_onceToken, &__block_literal_global_83);
  return (id)SBLogAppQuitMonitor___logObj;
}

id SBLogSpotlight()
{
  if (SBLogSpotlight_onceToken != -1)
    dispatch_once(&SBLogSpotlight_onceToken, &__block_literal_global_113);
  return (id)SBLogSpotlight___logObj;
}

uint64_t SBSIsSystemApertureAvailable()
{
  if (SBSIsSystemApertureAvailable___onceToken != -1)
    dispatch_once(&SBSIsSystemApertureAvailable___onceToken, &__block_literal_global_53);
  return SBSIsSystemApertureAvailable___isSystemApertureAvailable;
}

void SBSRegisterDisplayIdentifiersChangedBlock(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[_SBSDisplayIdentifiersCache sharedInstance](_SBSDisplayIdentifiersCache, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerChangedBlock:", v1);

}

id SBLogDisplayControlling()
{
  if (SBLogDisplayControlling_onceToken != -1)
    dispatch_once(&SBLogDisplayControlling_onceToken, &__block_literal_global_17_0);
  return (id)SBLogDisplayControlling___logObj;
}

uint64_t _SBSSetTypingActive(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100051;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

const __CFString *NSStringFromSBIdleTimerConfigSettingPrecedence(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Normal");
  if (a1 == 1)
    v1 = CFSTR("High");
  if (a1 == 2)
    return CFSTR("Critical");
  else
    return v1;
}

void sub_18EB5B520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBLogLockScreenBiometricCoordinator()
{
  if (SBLogLockScreenBiometricCoordinator_onceToken != -1)
    dispatch_once(&SBLogLockScreenBiometricCoordinator_onceToken, &__block_literal_global_129);
  return (id)SBLogLockScreenBiometricCoordinator___logObj;
}

_DWORD *_XGetDisplayIdentifiers(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  result = (_DWORD *)_SBMigGetDisplayIdentifiers(v5, (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigGetDisplayIdentifiers(uint64_t a1, _QWORD *a2, _DWORD *a3, _OWORD *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  _OWORD v11[2];

  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetDisplayIdentifiers");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

void sub_18EB5B848(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_DWORD *_XSetApplicationShowsProgress(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_16;
  v8 = 1064;
  if (result[1] < 0x428uLL)
    v8 = result[1];
  result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(unsigned int *)((char *)v3 + v6 + 40);
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (_DWORD *)_SBMigSetApplicationShowsProgress(v11, (uint64_t)(v3 + 10), v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigSetApplicationShowsProgress(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationShowsProgress");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _XAddWallpaperAnimationSuspensionAssertion(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v6 = *(_DWORD *)(result + 52);
  v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6)
    goto LABEL_3;
  if ((_DWORD)v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      v8 = *(unsigned int *)(v4 + 12);
      v9 = *(unsigned int *)(v4 + 28);
      v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      result = _SBMigAddWallpaperAnimationSuspensionAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    v3 = -309;
  }
  else
  {
LABEL_2:
    v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigAddWallpaperAnimationSuspensionAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddWallpaperAnimationSuspensionAssertion");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _XAddBiometricAssertion(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x3C || v5 > 0x43C)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v6 = *(_DWORD *)(result + 52);
  if (v6 > 0x400)
    goto LABEL_2;
  v3 = -304;
  if ((int)v5 - 60 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 60)
    goto LABEL_3;
  v8 = 1080;
  if (*(unsigned int *)(result + 4) < 0x438uLL)
    v8 = *(unsigned int *)(result + 4);
  result = (uint64_t)memchr((void *)(result + 56), 0, v8 - 56);
  if (result)
  {
    v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      v10 = *(unsigned int *)(v4 + 12);
      v11 = *(unsigned int *)(v4 + 28);
      v12 = *(unsigned __int8 *)(v4 + v7 + 56);
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = _SBMigAddBiometricAssertion(v10, v4 + 56, v11, v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    v3 = -309;
  }
  else
  {
LABEL_2:
    v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _SBMigAddBiometricAssertion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v11;
  _OWORD v13[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddBiometricAssertion");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _SBSAddWallpaperAnimationSuspensionAssertion(mach_port_t a1, const char *a2, int a3)
{
  int v4;
  mach_msg_size_t v5;
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t rcv_name;
  int v11;
  int v12;
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v11 = 1;
  v12 = a3;
  DWORD1(v13) = 1310720;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186D700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100155)
  {
    v8 = 4294966995;
    goto LABEL_22;
  }
  v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name.msgh_size != 36)
    goto LABEL_22;
  if (rcv_name.msgh_remote_port)
    goto LABEL_22;
  v8 = v13;
  if ((_DWORD)v13)
    goto LABEL_22;
  return v8;
}

void sub_18EB5CBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _SBFScreenTimeRegisterForExternalChangeNotification()
{
  if (_SBFScreenTimeRegisterForExternalChangeNotification___once != -1)
    dispatch_once(&_SBFScreenTimeRegisterForExternalChangeNotification___once, &__block_literal_global_1);
}

void sub_18EB5D558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBSCopyDisplayIdentifierForProcessID(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  _OWORD v5[64];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, 512);
  v2 = SBSSpringBoardBackgroundServerPort();
  v3 = SBDisplayIdentifierForPID(v2, a1, v5);
  result = 0;
  if (!v3)
  {
    if (LOBYTE(v5[0]))
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
  }
  return result;
}

CFPropertyListRef SBSCopyDisplayIdentifiersForProcessID(uint64_t a1)
{
  uint64_t v2;
  int v3;
  CFPropertyListRef v4;
  id v5;
  const __CFData *v6;
  unsigned int v8;
  uint64_t v9;

  v9 = 0;
  v8 = 0;
  v2 = SBSSpringBoardBackgroundServerPort();
  v3 = SBDisplayIdentifiersForPID(v2, a1, &v9, &v8);
  v4 = 0;
  if (!v3)
  {
    if (v9)
    {
      v5 = objc_alloc(MEMORY[0x1E0C99D50]);
      v6 = (const __CFData *)objc_msgSend(v5, "initWithBytesNoCopy:length:freeWhenDone:", v9, v8, 0);
      v4 = CFPropertyListCreateWithData(0, v6, 0, 0, 0);
      MEMORY[0x193FF895C](*MEMORY[0x1E0C83DA0], v9, v8);

      if (v4)
      {
        if (!CFArrayGetCount((CFArrayRef)v4))
        {
          CFRelease(v4);
          return 0;
        }
      }
    }
  }
  return v4;
}

BOOL SBSSuspendFrontmostApplication()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBSuspendFrontmostApp(v0) == 0;
}

BOOL SBSInterruptKeybagRefetch()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBInterruptKeybagRefetch(v0) == 0;
}

CFPropertyListRef SBSCopyApplicationDisplayIdentifiers(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  CFPropertyListRef v6;
  const __CFData *v7;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v4 = SBSSpringBoardBackgroundServerPort();
  v5 = SBApplicationDisplayIdentifiers(v4, a1, a2, &length[1], length);
  v6 = 0;
  if (!v5 && *(_QWORD *)&length[1])
  {
    v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v6 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v7);
    MEMORY[0x193FF895C](*MEMORY[0x1E0C83DA0], *(_QWORD *)&length[1], length[0]);
  }
  return v6;
}

CFStringRef SBSCopyFrontmostApplicationDisplayIdentifier()
{
  uint64_t v0;
  int v1;
  CFStringRef result;
  _OWORD v3[64];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, 512);
  v0 = SBSSpringBoardBackgroundServerPort();
  v1 = SBFrontmostApplicationDisplayIdentifier(v0, v3);
  result = 0;
  if (!v1)
  {
    if (LOBYTE(v3[0]))
      return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
  }
  return result;
}

CFStringRef SBSCopyBundlePathForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v1;
  _OWORD v3[64];
  char buffer[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  *(_OWORD *)buffer = 0u;
  memset(v3, 0, 512);
  if (CFStringGetCString(a1, buffer, 1024, 0x8000100u)
    && (v1 = SBSSpringBoardBackgroundServerPort(), !SBBundlePathForDisplayIdentifier(v1, buffer, v3)))
  {
    return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

const UInt8 *SBSCopyIconImagePNGDataForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v1;
  const UInt8 *v2;
  CFIndex v3;
  const __CFAllocator *v4;
  unsigned int v6;
  const UInt8 *v7;
  CFAllocatorContext context;
  char buffer[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)buffer = 0u;
  if (!CFStringGetCString(a1, buffer, 1024, 0x8000100u))
    return 0;
  v1 = SBSSpringBoardBackgroundServerPort();
  SBGetIconPNGData(v1, buffer, 0, &v7, &v6);
  v2 = v7;
  if (v7)
  {
    v3 = v6;
    context.version = 0;
    memset(&context.retain, 0, 40);
    context.info = (void *)v6;
    context.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
    context.preferredSize = 0;
    v4 = CFAllocatorCreate(0, &context);
    v2 = (const UInt8 *)CFDataCreateWithBytesNoCopy(0, v2, v3, v4);
    CFRelease(v4);
  }
  return v2;
}

const __CFURL *SBSCopyExecutablePathForDisplayIdentifier(const __CFString *a1)
{
  const __CFString *v1;
  __CFBundle *v2;
  const __CFURL *v3;
  CFBundleRef v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  const __CFURL *v8;

  v1 = SBSCopyBundlePathForDisplayIdentifier(a1);
  if (v1)
  {
    v2 = (__CFBundle *)v1;
    v3 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u);
    if (!v3)
    {
      v4 = v2;
LABEL_12:
      CFRelease(v4);
      return v3;
    }
    v4 = CFBundleCreate(0, v3);
    CFRelease(v3);
    CFRelease(v2);
    if (v4)
    {
      v5 = CFBundleCopyExecutableURL(v4);
      if (v5)
      {
        v6 = v5;
        v7 = CFURLCopyAbsoluteURL(v5);
        if (v7)
        {
          v8 = v7;
          v3 = (const __CFURL *)CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
          CFRelease(v8);
        }
        else
        {
          v3 = 0;
        }
        CFRelease(v6);
      }
      else
      {
        v3 = 0;
      }
      goto LABEL_12;
    }
  }
  return 0;
}

uint64_t SBSCopyIconImagePathForDisplayIdentifier()
{
  return 0;
}

CFStringRef SBSCopyLocalizedApplicationNameForDisplayIdentifier(const __CFString *a1)
{
  uint64_t v1;
  _OWORD v3[64];
  char buffer[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  *(_OWORD *)buffer = 0u;
  memset(v3, 0, 512);
  if (CFStringGetCString(a1, buffer, 1024, 0x8000100u)
    && (v1 = SBSSpringBoardBackgroundServerPort(),
        !SBLocalizedApplicationNameForDisplayIdentifier(v1, buffer, v3)))
  {
    return CFStringCreateWithCString(0, (const char *)v3, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

const __CFString *SBSApplicationLaunchingErrorString(int a1)
{
  if ((a1 - 1) > 0xB)
    return CFSTR("unknown error");
  else
    return off_1E288D1B8[a1 - 1];
}

uint64_t SBSApplicationCanBeLaunched(uint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v5 = 1;
  objc_msgSend(v2, "canOpenApplication:reason:", a1, &v5);
  if (v5 > 8)
    v3 = 12;
  else
    v3 = dword_18EBC9338[v5];

  return v3;
}

uint64_t SBSLaunchApplicationWithIdentifier(uint64_t a1, int a2)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, 0, 0, 0, a2);
}

uint64_t SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  dispatch_semaphore_t v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  if (!a1)
    return 2;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v10 = (void *)MEMORY[0x193FF8644]();
  v11 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v12 = objc_msgSend(v11, "createClientPort");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  v32 = 0;
  _splitOptionsIntoApplicationOptionsAndRealOptions(a4, &v32, &v31);
  v14 = v32;
  v15 = v31;

  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(v15);
  objc_msgSend(v15, "bs_setSafeObject:forKey:", a2, *MEMORY[0x1E0D22D78]);
  objc_msgSend(v15, "bs_setSafeObject:forKey:", a3, *MEMORY[0x1E0D22D60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5 != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bs_setSafeObject:forKey:", v16, *MEMORY[0x1E0D22D00]);

  objc_msgSend(v15, "bs_setSafeObject:forKey:", v14, *MEMORY[0x1E0D22D70]);
  v17 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v18 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions_block_invoke;
  v23[3] = &unk_1E288D170;
  v25 = &v33;
  v26 = &v27;
  v19 = v17;
  v24 = v19;
  objc_msgSend(v18, "openApplication:options:clientPort:withResult:", a1, v15, v12, v23);
  v20 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v19, v20);
  if (!*((_BYTE *)v28 + 24))
    *((_DWORD *)v34 + 6) = 11;

  _Block_object_dispose(&v27, 8);
  objc_autoreleasePoolPop(v10);
  v21 = *((unsigned int *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return v21;
}

void sub_18EB5E3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSLaunchApplicationWithIdentifierAndURL(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, a2, a3, 0, a4);
}

uint64_t SBSLaunchApplicationWithIdentifierAndLaunchOptions(uint64_t a1, void *a2, int a3)
{
  return SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions(a1, 0, 0, a2, a3);
}

uint64_t SBSCreateClientEntitlementEnforcementPort()
{
  id v0;
  uint64_t v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v1 = objc_msgSend(v0, "createClientPort");

  return v1;
}

void _splitOptionsIntoApplicationOptionsAndRealOptions(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (_splitOptionsIntoApplicationOptionsAndRealOptions_onceToken != -1)
    dispatch_once(&_splitOptionsIntoApplicationOptionsAndRealOptions_onceToken, &__block_literal_global_59);
  if (v5)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = a3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)_splitOptionsIntoApplicationOptionsAndRealOptions___realOptionsThatArentApplicationOptions;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "setObject:forKey:", v14, v13);
          objc_msgSend(v6, "removeObjectForKey:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    a3 = v15;
  }
  if (a2)
  {
    if (!v6)
      _splitOptionsIntoApplicationOptionsAndRealOptions_cold_2();
    *a2 = objc_retainAutorelease(v6);
  }
  if (a3)
  {
    if (!v7)
      _splitOptionsIntoApplicationOptionsAndRealOptions_cold_1();
    *a3 = objc_retainAutorelease(v7);
  }

}

void SBSCleanupClientEntitlementEnforcementPort(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D23288]);
  objc_msgSend(v2, "cleanupClientPort:", a1);

}

uint64_t SBSLaunchApplicationForDebugging(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7)
{
  return SBSLaunchApplicationForDebuggingWithOptions(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t SBSLaunchApplicationForDebuggingWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *context;
  void *contexta;
  unsigned int v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;

  if (!(a1 | a2))
    return 2;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  context = (void *)MEMORY[0x193FF8644]();
  v17 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v38 = objc_msgSend(v17, "createClientPort");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bs_setSafeObject:forKey:", a3, *MEMORY[0x1E0D22C18]);
  objc_msgSend(v18, "bs_setSafeObject:forKey:", a4, *MEMORY[0x1E0D22C38]);
  objc_msgSend(v18, "bs_setSafeObject:forKey:", a7, *MEMORY[0x1E0D22C58]);
  objc_msgSend(v18, "bs_setSafeObject:forKey:", a8, *MEMORY[0x1E0D22C50]);
  if ((a9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, context);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_setSafeObject:forKey:", v19, *MEMORY[0x1E0D22C60]);

  }
  if ((a9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_setSafeObject:forKey:", v20, *MEMORY[0x1E0D22C30]);

  }
  if ((a9 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_setSafeObject:forKey:", v21, *MEMORY[0x1E0D22C28]);

  }
  if ((a9 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_setSafeObject:forKey:", v22, *MEMORY[0x1E0D22C20]);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", context);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v23;
  v43 = 0;
  _splitOptionsIntoApplicationOptionsAndRealOptions(a6, &v43, &v42);
  v24 = v43;
  v25 = v42;

  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary(v25);
  objc_msgSend(v25, "bs_setSafeObject:forKey:", a2, *MEMORY[0x1E0D22D78]);
  objc_msgSend(v25, "bs_setSafeObject:forKey:", v18, *MEMORY[0x1E0D22D18]);
  objc_msgSend(v25, "bs_setSafeObject:forKey:", a5, *MEMORY[0x1E0D22D60]);
  objc_msgSend(v25, "bs_setSafeObject:forKey:", v24, *MEMORY[0x1E0D22D70]);
  if ((a9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v26, *MEMORY[0x1E0D22D00]);

  }
  if ((a9 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v27, *MEMORY[0x1E0D22CE8]);

  }
  if ((a9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v28, *MEMORY[0x1E0D22DA8]);

  }
  if ((a9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v29, CFSTR("revealIcon"));

  }
  if ((a9 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v30, *MEMORY[0x1E0D22D88]);

  }
  v31 = dispatch_semaphore_create(0);
  v32 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __SBSLaunchApplicationForDebuggingWithOptions_block_invoke;
  v39[3] = &unk_1E288D198;
  v41 = &v44;
  v33 = v31;
  v40 = v33;
  objc_msgSend(v32, "openApplication:options:clientPort:withResult:", a1, v25, v38, v39);
  dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(contexta);
  v34 = *((unsigned int *)v45 + 6);
  _Block_object_dispose(&v44, 8);
  return v34;
}

void sub_18EB5EB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSOpenSensitiveURL(uint64_t a1)
{
  return SBSOpenSensitiveURLAndUnlock(a1, 0);
}

uint64_t SBSOpenSensitiveURLAndUnlock(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (__loadLSIfNecessary_onceToken != -1)
    dispatch_once(&__loadLSIfNecessary_onceToken, &__block_literal_global_66);
  if (!__loadLSIfNecessary_mobileCoreServices)
    return 0;
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, *MEMORY[0x1E0D22DA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[objc_class defaultWorkspace](NSClassFromString(CFSTR("LSApplicationWorkspace")), "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "openSensitiveURL:withOptions:", a1, v6);

  return v7;
}

uint64_t SBSOpenDataActivationURL(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD v21[2];
  int v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x193FF8644]();
  v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x2020000000;
  v22 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v4 = *MEMORY[0x1E0D22D00];
  v23[0] = *MEMORY[0x1E0D22D28];
  v23[1] = v4;
  v24[0] = MEMORY[0x1E0C9AAB0];
  v24[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = *MEMORY[0x1E0D22D78];
  v24[2] = a1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __SBSOpenDataActivationURL_block_invoke;
  v12[3] = &unk_1E288D170;
  v14 = &v20;
  v15 = &v16;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v3, "openApplication:options:withResult:", CFSTR("com.apple.DataActivation"), v5, v12);
  v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v7, v8);
  if (*((_BYTE *)v17 + 24))
  {
    if (!*(_DWORD *)(v21[0] + 24))
    {
      v9 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    *(_DWORD *)(v21[0] + 24) = 11;
  }
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    SBSOpenDataActivationURL_cold_1((uint64_t)v21, v10);

  v9 = 0;
LABEL_8:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  objc_autoreleasePoolPop(v2);
  return v9;
}

void sub_18EB5EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___splitOptionsIntoApplicationOptionsAndRealOptions_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("launchSuspended"), CFSTR("launchInClassic"), CFSTR("unlockDevice"), CFSTR("unlockDevice"), CFSTR("promptUnlock"), CFSTR("revealIcon"), CFSTR("LSOpenSensitiveURLOption"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_splitOptionsIntoApplicationOptionsAndRealOptions___realOptionsThatArentApplicationOptions;
  _splitOptionsIntoApplicationOptionsAndRealOptions___realOptionsThatArentApplicationOptions = v0;

}

void *____loadLSIfNecessary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  __loadLSIfNecessary_mobileCoreServices = (uint64_t)result;
  return result;
}

void vmDeallocateCallback()
{
  JUMPOUT(0x193FF895CLL);
}

void sub_18EB5F2AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18EB5F3F8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EB5FEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

__CFString *NSStringFromSBSSmartCoverState(unint64_t a1)
{
  if (a1 < 4)
    return off_1E288D380[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<0x%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18EB61B88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return SBSServerPortHelper("com.apple.springboard.blockableservices", &springboardBlockableServerPort);
}

void sub_18EB62514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB6301C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB630DC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EB63360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB63420(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id NSStringFromSBSLibraryPodPresentationErrorCode(unint64_t a1)
{
  if (a1 < 0xA)
    return *((id *)&off_1E288D468 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t SBSWatchdogAssertionGetTypeID()
{
  pthread_once(&__SBSWatchdogAssertionRegisterOnce, (void (*)(void))SBSWatchdogAssertionRegisterClass);
  return __SBSWatchdogTypeID;
}

uint64_t SBSWatchdogAssertionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __SBSWatchdogTypeID = result;
  return result;
}

uint64_t SBSWatchdogAssertionCreateForPID(double a1)
{
  uint64_t Instance;
  uint64_t v3;

  pthread_once(&__SBSWatchdogAssertionRegisterOnce, (void (*)(void))SBSWatchdogAssertionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v3 = BKSWatchdogAssertionCreateForPID();
  *(_QWORD *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_QWORD *)(Instance + 72) = 0;
  *(_QWORD *)(Instance + 80) = v3;
  *(double *)(Instance + 88) = a1;
  if (!v3)
  {
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  return Instance;
}

uint64_t SBSWatchdogAssertionCancel(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(const void **)(a1 + 80);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(a1 + 80) = 0;
  return pthread_mutex_unlock(v2);
}

double SBSWatchdogAssertionGetRenewalInterval(uint64_t a1)
{
  pthread_mutex_t *v2;
  double v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(double *)(a1 + 88) <= 0.0)
    v3 = 60.0;
  else
    v3 = *(double *)(a1 + 88);
  pthread_mutex_unlock(v2);
  return v3;
}

BOOL SBSWatchdogAssertionRenew(uint64_t a1)
{
  pthread_mutex_t *v2;
  _BOOL8 v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(_QWORD *)(a1 + 80) != 0;
  pthread_mutex_unlock(v2);
  return v3;
}

void SBSWatchdogAssertionDestroy(uint64_t a1)
{
  const void *v2;

  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v2 = *(const void **)(a1 + 80);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 80) = 0;
}

BOOL SBSWatchdogAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSWatchdogAssertionDescribe(_QWORD *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<SBSWatchdogAssertion %p> %p"), a1, a1[10]);
}

id SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  v1 = a1;
  if ((objc_msgSend(v1, "isExternal") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(FBSDisplayIdentity *__strong _Nonnull)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSExternalDisplayLayout.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[displayIdentity isExternal]"));

  }
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "rootIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.springboard.external:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id SBSCreateExternalDisplayLayoutServiceEndpoint()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", CFSTR("com.apple.frontboard.systemappservices"), v1, CFSTR("com.apple.springboard.external"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id SBSCreateLayoutServiceEndpointForExternalDisplay(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  v1 = a1;
  if ((objc_msgSend(v1, "isExternal") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSServiceConnectionEndpoint * _Nullable SBSCreateLayoutServiceEndpointForExternalDisplay(FBSDisplayIdentity *__strong _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBSExternalDisplayLayout.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identity isExternal]"));

  }
  v2 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "endpointForMachName:service:instance:", CFSTR("com.apple.frontboard.systemappservices"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t SBSApplicationShortcutSystemIconTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeCompose")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypePlay")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypePause")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeAdd")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeLocation")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeSearch")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeShare")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeProhibit")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeContact")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeHome")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeMarkLocation")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeFavorite")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeLove")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeCloud")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeInvitation")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeConfirmation")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeMail")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeMessage")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeDate")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeTime")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeCapturePhoto")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeCaptureVideo")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeTask")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeTaskCompleted")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeAlarm")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeBookmark")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeShuffle")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeAudio")) & 1) != 0)
  {
    v2 = 27;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("UIApplicationShortcutIconTypeUpdate")))
  {
    v2 = 28;
  }
  else
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t SBSApplicationShortcutItemActivationModeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("foreground")) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("background")))
  {
    v2 = 1;
  }
  else
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

CFPropertyListRef SBSCopyDisplayIdentifiersForExternalAccessoryProtocol(void *a1)
{
  void *v2;
  uint64_t v3;
  const __CFAllocator *v4;
  const __CFData *v5;
  const __CFData *v6;
  CFPropertyListRef v7;
  _DWORD length[3];

  v2 = (void *)MEMORY[0x193FF8644]();
  memset(length, 0, sizeof(length));
  v3 = SBSSpringBoardBackgroundServerPort();
  SBGetDisplayIdentifiersForExternalAccessoryProtocols(v3, objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), &length[1], length);
  if (length[0]
    && (v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        (v5 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E0C9AE20])) != 0))
  {
    v6 = v5;
    v7 = CFPropertyListCreateWithData(v4, v5, 0, 0, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  if (*(_QWORD *)&length[1])
    MEMORY[0x193FF895C](*MEMORY[0x1E0C83DA0], *(_QWORD *)&length[1], length[0]);
  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t SBSCopyNowPlayingAppBundleIdentifier()
{
  uint64_t v0;
  _OWORD v2[64];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(v2, 0, 512);
  v0 = SBSSpringBoardServerPort();
  if (SBGetNowPlayingAppBundleIdentifier(v0, v2))
    return 0;
  else
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v2);
}

uint64_t SBSTopButtonFramesForPosters@<X0>(_QWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  int v4;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9D648];
  *((_OWORD *)a1 + 1) = v3;
  *((_OWORD *)a1 + 2) = v2;
  *((_OWORD *)a1 + 3) = v3;
  v4 = SBSSpringBoardServerPort();
  return SBGetTopButtonFrames(v4, a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5, a1 + 6, a1 + 7);
}

uint64_t SBSIsSystemApplication(_BYTE *a1)
{
  uint64_t v2;
  __int16 v4;

  v4 = 0;
  v2 = SBSSpringBoardBackgroundServerPort();
  SBIsSystemApplication(v2, (char *)&v4 + 1, &v4);
  if (a1)
    *a1 = v4;
  return HIBYTE(v4);
}

uint64_t SBSSetInterceptsMenuButton(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetInterceptsMenuButton(v2, a1, 0);
}

uint64_t SBSSetInterceptsMenuButtonForever(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetInterceptsMenuButton(v2, a1, 1);
}

void SBSSetVoiceRecognitionAudioInputPaths(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  v4 = SBSSpringBoardServerPort();
  v5 = objc_retainAutorelease(v2);
  SBSetVoiceRecognitionAudioInputPaths(v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

void SBSSetAssistantRecognitionStrings(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  v4 = SBSSpringBoardServerPort();
  v5 = objc_retainAutorelease(v2);
  SBSetAssistantRecognitionStrings(v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

uint64_t SBSUndimScreen()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBDimScreen(v0, 0);
}

BOOL SBSGetScreenLockStatus(BOOL *a1)
{
  uint64_t v2;
  __int16 v4;

  v4 = 0;
  v2 = SBSSpringBoardServerPort();
  SBGetScreenLockStatus(v2, (char *)&v4 + 1, &v4);
  if (a1)
    *a1 = (_BYTE)v4 != 0;
  return HIBYTE(v4) != 0;
}

uint64_t SBSLockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = SBSSpringBoardServerPort();
  return SBLockDeviceAndFeatures(v4, a1, a2);
}

void SBSRequestPasscodeUnlockUI(void *a1)
{
  id v1;
  SBSLockScreenService *v2;
  SBSLockScreenService *v3;
  id v4;
  _QWORD v5[4];
  SBSLockScreenService *v6;
  id v7;

  v1 = a1;
  v2 = objc_alloc_init(SBSLockScreenService);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SBSRequestPasscodeUnlockUI_block_invoke;
  v5[3] = &unk_1E288D828;
  v6 = v2;
  v7 = v1;
  v3 = v2;
  v4 = v1;
  -[SBSLockScreenService requestPasscodeUnlockUIWithOptions:withCompletion:](v3, "requestPasscodeUnlockUIWithOptions:withCompletion:", 0, v5);

}

void SBSRequestPasscodeUnlockAlertUI(void *a1)
{
  id v1;
  SBSLockScreenService *v2;
  SBSUnlockOptions *v3;
  SBSLockScreenService *v4;
  id v5;
  _QWORD v6[4];
  SBSLockScreenService *v7;
  id v8;

  v1 = a1;
  v2 = objc_alloc_init(SBSLockScreenService);
  v3 = objc_alloc_init(SBSUnlockOptions);
  -[SBSUnlockOptions _setAboveOtherContexts:](v3, "_setAboveOtherContexts:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SBSRequestPasscodeUnlockAlertUI_block_invoke;
  v6[3] = &unk_1E288D828;
  v7 = v2;
  v8 = v1;
  v4 = v2;
  v5 = v1;
  -[SBSLockScreenService requestPasscodeUnlockUIWithOptions:withCompletion:](v4, "requestPasscodeUnlockUIWithOptions:withCompletion:", v3, v6);

}

void SBSRequestPasscodeCheckUI(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  SBSLockScreenService *v8;
  SBSUnlockOptions *v9;
  SBSLockScreenService *v10;
  id v11;
  _QWORD v12[4];
  SBSLockScreenService *v13;
  id v14;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_alloc_init(SBSLockScreenService);
  v9 = objc_alloc_init(SBSUnlockOptions);
  -[SBSUnlockOptions _setTitle:](v9, "_setTitle:", v7);

  -[SBSUnlockOptions _setSubtitle:](v9, "_setSubtitle:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __SBSRequestPasscodeCheckUI_block_invoke;
  v12[3] = &unk_1E288D828;
  v13 = v8;
  v14 = v5;
  v10 = v8;
  v11 = v5;
  -[SBSLockScreenService requestPasscodeCheckUIWithOptions:withCompletion:](v10, "requestPasscodeCheckUIWithOptions:withCompletion:", v9, v12);

}

void SBSResetHomeScreenLayout(void *a1)
{
  id v1;
  SBSHomeScreenService *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  v2 = objc_alloc_init(SBSHomeScreenService);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SBSResetHomeScreenLayout_block_invoke;
  v4[3] = &unk_1E288D850;
  v5 = v1;
  v3 = v1;
  -[SBSHomeScreenService resetHomeScreenLayoutWithCompletion:](v2, "resetHomeScreenLayoutWithCompletion:", v4);

}

void SBSRequestSuggestedApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  SBSHomeScreenService *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(SBSHomeScreenService);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SBSRequestSuggestedApplication_block_invoke;
  v7[3] = &unk_1E288D878;
  v8 = v3;
  v6 = v3;
  -[SBSHomeScreenService requestSuggestedApplicationWithBundleIdentifier:completion:](v5, "requestSuggestedApplicationWithBundleIdentifier:completion:", v4, v7);

}

void SBSRequestAppSwitcherAppearanceForHiddenApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  SBSAppSwitcherSystemService *v5;
  SBSAppSwitcherSystemService *v6;
  id v7;
  _QWORD v8[4];
  SBSAppSwitcherSystemService *v9;
  id v10;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(SBSAppSwitcherSystemService);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __SBSRequestAppSwitcherAppearanceForHiddenApplication_block_invoke;
  v8[3] = &unk_1E288D8A0;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  v7 = v3;
  -[SBSAppSwitcherSystemService requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:completion:](v6, "requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:completion:", v4, v8);

}

uint64_t SBSShutDown()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBShutDown(v0);
}

BOOL SBSActivateAssistant(uint64_t a1)
{
  return SBSActivateAssistantWithContext(a1, 0);
}

BOOL SBSActivateAssistantWithContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BOOL8 v8;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = SBSSpringBoardServerPort();
  v7 = objc_retainAutorelease(v4);
  v8 = SBActivateAssistantWithContext(v6, a1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length")) == 0;

  return v8;
}

uint64_t SBSTagTouchForTypingMenu(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardBackgroundServerPort();
  return SBTagTouchForTypingMenu(v2, a1);
}

void SBSAcquireFocusPreventingFullScreenPresentationAssertion(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a1;
  v4 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v5, "isUsable"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __SBSAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke;
    v6[3] = &unk_1E288D8C8;
    v7 = v3;
    v9 = &v10;
    v8 = v5;
    objc_msgSend(v8, "accessPort:", v6);

  }
  v4[2](v4, v11[5]);

  _Block_object_dispose(&v10, 8);
}

void sub_18EB662F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSIsReachabilityEnabled()
{
  uint64_t v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = SBSSpringBoardServerPort();
  SBIsReachabilityEnabled(v0, &v2);
  return v2;
}

uint64_t SBSSetReachabilityEnabled(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetReachabilityEnabled(v2, a1);
}

uint64_t SBSPresentPowerDownUI()
{
  uint64_t v0;

  v0 = SBSSpringBoardServerPort();
  return SBPresentPowerDownUI(v0);
}

uint64_t SBSOverrideDisplayedDate(const __CFString *a1)
{
  uint64_t v1;
  _OWORD v3[64];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, 512);
  CFStringGetCString(a1, (char *)v3, 1024, 0x8000100u);
  v1 = SBSSpringBoardServerPort();
  return SBOverrideDisplayedDate(v1, v3);
}

uint64_t SBSSetIdleText(const __CFString *a1)
{
  uint64_t v1;
  _OWORD v3[64];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, 512);
  CFStringGetCString(a1, (char *)v3, 1024, 0x8000100u);
  v1 = SBSSpringBoardServerPort();
  return SBSetIdleText(v1, v3);
}

void sub_18EB66878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

id SBLogDashBoardScrollGestures()
{
  if (SBLogDashBoardScrollGestures_onceToken != -1)
    dispatch_once(&SBLogDashBoardScrollGestures_onceToken, &__block_literal_global_7);
  return (id)SBLogDashBoardScrollGestures___logObj;
}

id SBLogDashBoardHostedAppViewController()
{
  if (SBLogDashBoardHostedAppViewController_onceToken != -1)
    dispatch_once(&SBLogDashBoardHostedAppViewController_onceToken, &__block_literal_global_9);
  return (id)SBLogDashBoardHostedAppViewController___logObj;
}

id SBLogDashBoardCallToActionLabel()
{
  if (SBLogDashBoardCallToActionLabel_onceToken != -1)
    dispatch_once(&SBLogDashBoardCallToActionLabel_onceToken, &__block_literal_global_11);
  return (id)SBLogDashBoardCallToActionLabel___logObj;
}

id SBLogDashBoardTelemetrySignposts()
{
  if (SBLogDashBoardTelemetrySignposts_onceToken != -1)
    dispatch_once(&SBLogDashBoardTelemetrySignposts_onceToken, &__block_literal_global_13);
  return (id)SBLogDashBoardTelemetrySignposts___logObj;
}

id SBLogDisplayAssertions()
{
  if (SBLogDisplayAssertions_onceToken != -1)
    dispatch_once(&SBLogDisplayAssertions_onceToken, &__block_literal_global_15);
  return (id)SBLogDisplayAssertions___logObj;
}

id SBLogDisplayEducation()
{
  if (SBLogDisplayEducation_onceToken != -1)
    dispatch_once(&SBLogDisplayEducation_onceToken, &__block_literal_global_19);
  return (id)SBLogDisplayEducation___logObj;
}

id SBLogDisplayScaleMapping()
{
  if (SBLogDisplayScaleMapping_onceToken != -1)
    dispatch_once(&SBLogDisplayScaleMapping_onceToken, &__block_literal_global_21);
  return (id)SBLogDisplayScaleMapping___logObj;
}

id SBLogDisplayTransforming()
{
  if (SBLogDisplayTransforming_onceToken != -1)
    dispatch_once(&SBLogDisplayTransforming_onceToken, &__block_literal_global_23);
  return (id)SBLogDisplayTransforming___logObj;
}

id SBLogFBDisplayManagerCallbacks()
{
  if (SBLogFBDisplayManagerCallbacks_onceToken != -1)
    dispatch_once(&SBLogFBDisplayManagerCallbacks_onceToken, &__block_literal_global_25);
  return (id)SBLogFBDisplayManagerCallbacks___logObj;
}

id SBLogDoNotDisturbWhileDriving()
{
  if (SBLogDoNotDisturbWhileDriving_onceToken != -1)
    dispatch_once(&SBLogDoNotDisturbWhileDriving_onceToken, &__block_literal_global_27);
  return (id)SBLogDoNotDisturbWhileDriving___logObj;
}

id SBLogDoNotDisturbBedtime()
{
  if (SBLogDoNotDisturbBedtime_onceToken != -1)
    dispatch_once(&SBLogDoNotDisturbBedtime_onceToken, &__block_literal_global_29);
  return (id)SBLogDoNotDisturbBedtime___logObj;
}

id SBLogFocusModes()
{
  if (SBLogFocusModes_onceToken != -1)
    dispatch_once(&SBLogFocusModes_onceToken, &__block_literal_global_31);
  return (id)SBLogFocusModes___logObj;
}

id SBLogApplicationRestrictionMonitoring()
{
  if (SBLogApplicationRestrictionMonitoring_onceToken != -1)
    dispatch_once(&SBLogApplicationRestrictionMonitoring_onceToken, &__block_literal_global_33);
  return (id)SBLogApplicationRestrictionMonitoring___logObj;
}

id SBLogHomeScreenConfiguration()
{
  if (SBLogHomeScreenConfiguration_onceToken != -1)
    dispatch_once(&SBLogHomeScreenConfiguration_onceToken, &__block_literal_global_35);
  return (id)SBLogHomeScreenConfiguration___logObj;
}

id SBLogMotionGesture()
{
  if (SBLogMotionGesture_onceToken != -1)
    dispatch_once(&SBLogMotionGesture_onceToken, &__block_literal_global_39);
  return (id)SBLogMotionGesture___logObj;
}

id SBLogMotionAlarm()
{
  if (SBLogMotionAlarm_onceToken != -1)
    dispatch_once(&SBLogMotionAlarm_onceToken, &__block_literal_global_41);
  return (id)SBLogMotionAlarm___logObj;
}

id SBLogPrototypeController()
{
  if (SBLogPrototypeController_onceToken != -1)
    dispatch_once(&SBLogPrototypeController_onceToken, &__block_literal_global_43);
  return (id)SBLogPrototypeController___logObj;
}

id SBLogWallet()
{
  if (SBLogWallet_onceToken != -1)
    dispatch_once(&SBLogWallet_onceToken, &__block_literal_global_45);
  return (id)SBLogWallet___logObj;
}

id SBLogLiquidDetection()
{
  if (SBLogLiquidDetection_onceToken != -1)
    dispatch_once(&SBLogLiquidDetection_onceToken, &__block_literal_global_47);
  return (id)SBLogLiquidDetection___logObj;
}

id SBLogAutoLaunching()
{
  if (SBLogAutoLaunching_onceToken != -1)
    dispatch_once(&SBLogAutoLaunching_onceToken, &__block_literal_global_49);
  return (id)SBLogAutoLaunching___logObj;
}

id SBLogCoverSheetActivities()
{
  if (SBLogCoverSheetActivities_onceToken != -1)
    dispatch_once(&SBLogCoverSheetActivities_onceToken, &__block_literal_global_53);
  return (id)SBLogCoverSheetActivities___logObj;
}

id SBLogCoverSheetWidgets()
{
  if (SBLogCoverSheetWidgets_onceToken != -1)
    dispatch_once(&SBLogCoverSheetWidgets_onceToken, &__block_literal_global_55);
  return (id)SBLogCoverSheetWidgets___logObj;
}

id SBLogMedusaDropDestination()
{
  if (SBLogMedusaDropDestination_onceToken != -1)
    dispatch_once(&SBLogMedusaDropDestination_onceToken, &__block_literal_global_61);
  return (id)SBLogMedusaDropDestination___logObj;
}

id SBLogLockScreenNowPlaying()
{
  if (SBLogLockScreenNowPlaying_onceToken != -1)
    dispatch_once(&SBLogLockScreenNowPlaying_onceToken, &__block_literal_global_65);
  return (id)SBLogLockScreenNowPlaying___logObj;
}

id SBLogScreenWake()
{
  if (SBLogScreenWake_onceToken != -1)
    dispatch_once(&SBLogScreenWake_onceToken, &__block_literal_global_67);
  return (id)SBLogScreenWake___logObj;
}

id SBLogWallpaper()
{
  if (SBLogWallpaper_onceToken != -1)
    dispatch_once(&SBLogWallpaper_onceToken, &__block_literal_global_73);
  return (id)SBLogWallpaper___logObj;
}

id SBLogCFUserNotifications()
{
  if (SBLogCFUserNotifications_onceToken != -1)
    dispatch_once(&SBLogCFUserNotifications_onceToken, &__block_literal_global_75);
  return (id)SBLogCFUserNotifications___logObj;
}

id SBLogTransientOverlay()
{
  if (SBLogTransientOverlay_onceToken != -1)
    dispatch_once(&SBLogTransientOverlay_onceToken, &__block_literal_global_77);
  return (id)SBLogTransientOverlay___logObj;
}

id SBLogRootController()
{
  if (SBLogRootController_onceToken != -1)
    dispatch_once(&SBLogRootController_onceToken, &__block_literal_global_79);
  return (id)SBLogRootController___logObj;
}

id SBLogWidgets()
{
  if (SBLogWidgets_onceToken != -1)
    dispatch_once(&SBLogWidgets_onceToken, &__block_literal_global_81);
  return (id)SBLogWidgets___logObj;
}

id SBLogInCallPresentation()
{
  if (SBLogInCallPresentation_onceToken != -1)
    dispatch_once(&SBLogInCallPresentation_onceToken, &__block_literal_global_85);
  return (id)SBLogInCallPresentation___logObj;
}

id SBLogSystemNotes()
{
  if (SBLogSystemNotes_onceToken != -1)
    dispatch_once(&SBLogSystemNotes_onceToken, &__block_literal_global_87);
  return (id)SBLogSystemNotes___logObj;
}

id SBLogAccessibilityWindowHosting()
{
  if (SBLogAccessibilityWindowHosting_onceToken != -1)
    dispatch_once(&SBLogAccessibilityWindowHosting_onceToken, &__block_literal_global_89);
  return (id)SBLogAccessibilityWindowHosting___logObj;
}

id SBLogBanners()
{
  if (SBLogBanners_onceToken != -1)
    dispatch_once(&SBLogBanners_onceToken, &__block_literal_global_91);
  return (id)SBLogBanners___logObj;
}

id SBLogNotifications()
{
  if (SBLogNotifications_onceToken != -1)
    dispatch_once(&SBLogNotifications_onceToken, &__block_literal_global_93);
  return (id)SBLogNotifications___logObj;
}

id SBLogWebClip()
{
  if (SBLogWebClip_onceToken != -1)
    dispatch_once(&SBLogWebClip_onceToken, &__block_literal_global_95);
  return (id)SBLogWebClip___logObj;
}

id SBLogKeyboardDismissal()
{
  if (SBLogKeyboardDismissal_onceToken != -1)
    dispatch_once(&SBLogKeyboardDismissal_onceToken, &__block_literal_global_107);
  return (id)SBLogKeyboardDismissal___logObj;
}

id SBLogActiveDisplay()
{
  if (SBLogActiveDisplay_onceToken != -1)
    dispatch_once(&SBLogActiveDisplay_onceToken, &__block_literal_global_109);
  return (id)SBLogActiveDisplay___logObj;
}

id SBLogZStackSystemApertureSuppression()
{
  if (SBLogZStackSystemApertureSuppression_onceToken != -1)
    dispatch_once(&SBLogZStackSystemApertureSuppression_onceToken, &__block_literal_global_111);
  return (id)SBLogZStackSystemApertureSuppression___logObj;
}

id SBLogHearingTestMode()
{
  if (SBLogHearingTestMode_onceToken != -1)
    dispatch_once(&SBLogHearingTestMode_onceToken, &__block_literal_global_115);
  return (id)SBLogHearingTestMode___logObj;
}

id SBLogPhoneUnlockWithWatch()
{
  if (SBLogPhoneUnlockWithWatch_onceToken != -1)
    dispatch_once(&SBLogPhoneUnlockWithWatch_onceToken, &__block_literal_global_117);
  return (id)SBLogPhoneUnlockWithWatch___logObj;
}

id SBLogProductivityGestures()
{
  if (SBLogProductivityGestures_onceToken != -1)
    dispatch_once(&SBLogProductivityGestures_onceToken, &__block_literal_global_121);
  return (id)SBLogProductivityGestures___logObj;
}

id SBLogSceneSnapshots()
{
  if (SBLogSceneSnapshots_onceToken != -1)
    dispatch_once(&SBLogSceneSnapshots_onceToken, &__block_literal_global_123);
  return (id)SBLogSceneSnapshots___logObj;
}

id SBLogBiometricResource()
{
  if (SBLogBiometricResource_onceToken != -1)
    dispatch_once(&SBLogBiometricResource_onceToken, &__block_literal_global_127);
  return (id)SBLogBiometricResource___logObj;
}

id SBLogLockScreenBiometricWalletPreArm()
{
  if (SBLogLockScreenBiometricWalletPreArm_onceToken != -1)
    dispatch_once(&SBLogLockScreenBiometricWalletPreArm_onceToken, &__block_literal_global_131);
  return (id)SBLogLockScreenBiometricWalletPreArm___logObj;
}

id SBLogLockScreenBiometricFaceIDCoaching()
{
  if (SBLogLockScreenBiometricFaceIDCoaching_onceToken != -1)
    dispatch_once(&SBLogLockScreenBiometricFaceIDCoaching_onceToken, &__block_literal_global_133);
  return (id)SBLogLockScreenBiometricFaceIDCoaching___logObj;
}

id SBLogLockScreenMesaWalletPreArm()
{
  if (SBLogLockScreenMesaWalletPreArm_onceToken != -1)
    dispatch_once(&SBLogLockScreenMesaWalletPreArm_onceToken, &__block_literal_global_135);
  return (id)SBLogLockScreenMesaWalletPreArm___logObj;
}

id SBLogLockScreenMesaUnlockBehaviors()
{
  if (SBLogLockScreenMesaUnlockBehaviors_onceToken != -1)
    dispatch_once(&SBLogLockScreenMesaUnlockBehaviors_onceToken, &__block_literal_global_136);
  return (id)SBLogLockScreenMesaUnlockBehaviors___logObj;
}

id SBLogLockScreenMesaHomeButtonPasscodeRecognizer()
{
  if (SBLogLockScreenMesaHomeButtonPasscodeRecognizer_onceToken != -1)
    dispatch_once(&SBLogLockScreenMesaHomeButtonPasscodeRecognizer_onceToken, &__block_literal_global_138);
  return (id)SBLogLockScreenMesaHomeButtonPasscodeRecognizer___logObj;
}

id SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer()
{
  if (SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_onceToken != -1)
    dispatch_once(&SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_onceToken, &__block_literal_global_140);
  return (id)SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer___logObj;
}

id SBLogAuthenticationRequests()
{
  if (SBLogAuthenticationRequests_onceToken != -1)
    dispatch_once(&SBLogAuthenticationRequests_onceToken, &__block_literal_global_144);
  return (id)SBLogAuthenticationRequests___logObj;
}

id SBLogAuthenticationKeybag()
{
  if (SBLogAuthenticationKeybag_onceToken != -1)
    dispatch_once(&SBLogAuthenticationKeybag_onceToken, &__block_literal_global_146);
  return (id)SBLogAuthenticationKeybag___logObj;
}

id SBLogAuthenticationAssertions()
{
  if (SBLogAuthenticationAssertions_onceToken != -1)
    dispatch_once(&SBLogAuthenticationAssertions_onceToken, &__block_literal_global_148);
  return (id)SBLogAuthenticationAssertions___logObj;
}

id SBLogAuthenticationModel()
{
  if (SBLogAuthenticationModel_onceToken != -1)
    dispatch_once(&SBLogAuthenticationModel_onceToken, &__block_literal_global_150);
  return (id)SBLogAuthenticationModel___logObj;
}

id SBLogCameraCaptureAccidentalActivationMitigationSession()
{
  if (SBLogCameraCaptureAccidentalActivationMitigationSession_onceToken != -1)
    dispatch_once(&SBLogCameraCaptureAccidentalActivationMitigationSession_onceToken, &__block_literal_global_152);
  return (id)SBLogCameraCaptureAccidentalActivationMitigationSession___logObj;
}

id SBLogCameraCaptureAppConfiguration()
{
  if (SBLogCameraCaptureAppConfiguration_onceToken != -1)
    dispatch_once(&SBLogCameraCaptureAppConfiguration_onceToken, &__block_literal_global_154);
  return (id)SBLogCameraCaptureAppConfiguration___logObj;
}

id SBLogCameraCaptureRestriction()
{
  if (SBLogCameraCaptureRestriction_onceToken != -1)
    dispatch_once(&SBLogCameraCaptureRestriction_onceToken, &__block_literal_global_156);
  return (id)SBLogCameraCaptureRestriction___logObj;
}

id SBLogHardwareButtonService()
{
  if (SBLogHardwareButtonService_onceToken != -1)
    dispatch_once(&SBLogHardwareButtonService_onceToken, &__block_literal_global_158);
  return (id)SBLogHardwareButtonService___logObj;
}

id SBLogSystemApertureHosting()
{
  if (SBLogSystemApertureHosting_onceToken != -1)
    dispatch_once(&SBLogSystemApertureHosting_onceToken, &__block_literal_global_160);
  return (id)SBLogSystemApertureHosting___logObj;
}

id SBLogHangTracer()
{
  if (SBLogHangTracer_onceToken != -1)
    dispatch_once(&SBLogHangTracer_onceToken, &__block_literal_global_162);
  return (id)SBLogHangTracer___logObj;
}

__CFString *NSStringFromSBSHardwareButtonHapticType(unint64_t a1)
{
  if (a1 < 4)
    return off_1E288DEC8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromSBSHardwareButtonToggleState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 3)
    return off_1E288DF40[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromSBSHardwareButtonEventPriority(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 0:
      return CFSTR("normal");
    case 100:
      return CFSTR("lockScreenPluginView");
    case 300:
      v1 = CFSTR("aboveGuidedAccess");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

const __CFString *NSStringFromSBSHardwareButtonHintContentAppearState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("visible");
  if (a1)
    return v1;
  else
    return CFSTR("hidden");
}

const __CFString *NSStringFromSBSHardwareButtonSystemGlowStyle(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("fullyPresented");
  if (a1)
    return v1;
  else
    return CFSTR("activating");
}

__CFString *NSStringFromSBSCaptureButtonSuppressionOptions(uint64_t a1)
{
  if (!a1)
    return CFSTR("complete");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unrecognized:0x%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t SBApplicationStateBeginGeneratingChangeNotifications()
{
  uint64_t v0;
  void *v2;
  void *v3;

  v0 = pthread_mutex_lock(&sRegistrationCountLock);
  if (!sRegisterCount++)
  {
    v2 = (void *)MEMORY[0x193FF8644](v0);
    _SBApplicationStateGetMonitor_Locked();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHandler:", &__block_literal_global_14);

    objc_autoreleasePoolPop(v2);
  }
  return pthread_mutex_unlock(&sRegistrationCountLock);
}

uint64_t SBApplicationStateEndGeneratingChangeNotifications()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = pthread_mutex_lock(&sRegistrationCountLock);
  if (!--sRegisterCount)
  {
    v1 = (void *)MEMORY[0x193FF8644](v0);
    _SBApplicationStateGetMonitor_Locked();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHandler:", 0);

    objc_autoreleasePoolPop(v1);
  }
  return pthread_mutex_unlock(&sRegistrationCountLock);
}

uint64_t SBSGetApplicationState(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x193FF8644]();
  _SBApplicationStateGetMonitor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "applicationStateForApplication:", a1);

  objc_autoreleasePoolPop(v2);
  return v4;
}

uint64_t SBSGetMostElevatedApplicationStateForProcessID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x193FF8644]();
  _SBApplicationStateGetMonitor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mostElevatedApplicationStateForPID:", a1);

  objc_autoreleasePoolPop(v2);
  return v4;
}

uint64_t SBSCopyInfoForApplicationWithProcessID(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  _SBApplicationStateGetMonitor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationInfoForPID:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_18EB6BD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getATXHomeScreenPageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppPredictionClientLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E288E008;
    v5 = 0;
    AppPredictionClientLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionClientLibraryCore_frameworkLibrary)
    __getATXHomeScreenPageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("ATXHomeScreenPage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getATXHomeScreenPageClass_block_invoke_cold_2();
  getATXHomeScreenPageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18EB6C538(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18EB6C644(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SBSProcessAssertionGetTypeID()
{
  pthread_once(&__SBSProcessAssertionRegisterOnce, (void (*)(void))SBSProcessAssertionRegisterClass);
  return __SBSProcessAssertionTypeID;
}

uint64_t SBSProcessAssertionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __SBSProcessAssertionTypeID = result;
  return result;
}

uint64_t SBSProcessAssertionCreateForPID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t Instance;
  void *v10;
  void *v11;
  void *v12;
  __CFArray *Mutable;
  _QWORD v15[4];
  int v16;

  pthread_once(&__SBSProcessAssertionRegisterOnce, (void (*)(void))SBSProcessAssertionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v10 = (void *)MEMORY[0x193FF8644]();
    *(_QWORD *)(Instance + 16) = 850045863;
    *(_OWORD *)(Instance + 24) = 0u;
    *(_OWORD *)(Instance + 40) = 0u;
    *(_OWORD *)(Instance + 56) = 0u;
    *(_QWORD *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 80) = a2;
    *(_BYTE *)(Instance + 84) = 1;
    *(_QWORD *)(Instance + 88) = 0;
    *(_QWORD *)(Instance + 96) = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00DB8]), "initWithPID:flags:reason:name:", a2, a3, a4, a5);
    *(_QWORD *)(Instance + 104) = v11;
    if (objc_msgSend(v11, "acquire"))
    {
      v12 = *(void **)(Instance + 104);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __SBSProcessAssertionCreateForPID_block_invoke;
      v15[3] = &__block_descriptor_36_e5_v8__0l;
      v16 = a2;
      objc_msgSend(v12, "setInvalidationHandler:", v15);
      pthread_mutex_lock(&sAssertionArrayLock);
      Mutable = (__CFArray *)sAssertionArray;
      if (!sAssertionArray)
      {
        Mutable = CFArrayCreateMutable(0, 0, 0);
        sAssertionArray = (uint64_t)Mutable;
      }
      CFArrayAppendValue(Mutable, (const void *)Instance);
      pthread_mutex_unlock(&sAssertionArrayLock);
    }
    else
    {
      CFRelease((CFTypeRef)Instance);
      Instance = 0;
    }
    objc_autoreleasePoolPop(v10);
  }
  return Instance;
}

uint64_t SBSProcessAssertionSetFlags(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  pthread_mutex_t *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v3 = result;
    v4 = (pthread_mutex_t *)(result + 16);
    v5 = pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    v6 = (void *)MEMORY[0x193FF8644](v5);
    if (*(_BYTE *)(v3 + 84))
      objc_msgSend(*(id *)(v3 + 104), "setFlags:", a2);
    objc_autoreleasePoolPop(v6);
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t SBSProcessAssertionSetInvalidationCallBack(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  pthread_mutex_t *v6;

  if (result)
  {
    v5 = result;
    v6 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    if (*(_BYTE *)(v5 + 84))
    {
      *(_QWORD *)(v5 + 88) = a2;
      *(_QWORD *)(v5 + 96) = a3;
    }
    return pthread_mutex_unlock(v6);
  }
  return result;
}

uint64_t SBSProcessAssertionIsValid(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 16);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    v1 = *(unsigned __int8 *)(v1 + 84);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

CFTypeRef SBSProcessAssertionCopyIdentifier(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1
    && (v2 = (pthread_mutex_t *)(a1 + 16),
        v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16)),
        v4 = (void *)MEMORY[0x193FF8644](v3),
        v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "name"), "copy"),
        objc_autoreleasePoolPop(v4),
        pthread_mutex_unlock(v2),
        (v6 = v5) != 0))
  {
    return CFRetain(v6);
  }
  else
  {
    return 0;
  }
}

uint64_t SBSProcessAssertionDealloc(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  void *v4;
  const __CFArray *v5;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  v2 = (pthread_mutex_t *)(a1 + 16);
  v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_BYTE *)(a1 + 84))
  {
    v4 = (void *)MEMORY[0x193FF8644](v3);
    pthread_mutex_lock(&sAssertionArrayLock);
    v5 = (const __CFArray *)sAssertionArray;
    if (sAssertionArray)
    {
      v8.length = CFArrayGetCount((CFArrayRef)sAssertionArray);
      v8.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v8, (const void *)a1);
      if (FirstIndexOfValue != -1)
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)sAssertionArray, FirstIndexOfValue);
    }
    pthread_mutex_unlock(&sAssertionArrayLock);
    *(_BYTE *)(a1 + 84) = 0;
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 104), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 104), "invalidate");

  *(_QWORD *)(a1 + 104) = 0;
  return pthread_mutex_unlock(v2);
}

BOOL SBSProcessAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSProcessAssertionDescribe(uint64_t a1)
{
  void *v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  CFStringRef v5;

  v2 = (void *)MEMORY[0x193FF8644]();
  v3 = CFGetAllocator((CFTypeRef)a1);
  if (*(_BYTE *)(a1 + 84))
    v4 = CFSTR("engaged");
  else
    v4 = CFSTR("invalid");
  v5 = CFStringCreateWithFormat(v3, 0, CFSTR("<SBSProcessAssertion %p> pid = %d %@ reason = %@"), a1, *(unsigned int *)(a1 + 80), v4, objc_msgSend(MEMORY[0x1E0D00DB8], "NameForReason:", objc_msgSend(*(id *)(a1 + 104), "reason")));
  objc_autoreleasePoolPop(v2);
  return v5;
}

uint64_t SBDataReset(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  LODWORD(v2) = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)getDDRResetOptionsClass_softClass;
  v22 = getDDRResetOptionsClass_softClass;
  if (!getDDRResetOptionsClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getDDRResetOptionsClass_block_invoke;
    v17 = &unk_1E288DFE8;
    v18 = &v19;
    __getDDRResetOptionsClass_block_invoke((uint64_t)&v14);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  v5 = objc_alloc_init(v4);
  v6 = v5;
  v2 = v2;
  switch((int)v2)
  {
    case 1:
      v2 = 3;
      goto LABEL_8;
    case 2:
      goto LABEL_8;
    case 3:
    case 6:
      goto LABEL_7;
    case 4:
    case 7:
      objc_msgSend(v5, "setEraseDataPlan:", 1);
      goto LABEL_7;
    case 5:
      objc_msgSend(v5, "setEraseDataPlan:", 1);
      objc_msgSend(v6, "setHideProgress:", 1);
LABEL_7:
      v2 = 4;
      goto LABEL_8;
    case 8:
      objc_msgSend(v5, "setEraseDataPlan:", 1);
      objc_msgSend(v6, "setHideProgress:", 1);
      v2 = 5;
LABEL_8:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v7 = (void *)getDDRResetRequestClass_softClass;
      v22 = getDDRResetRequestClass_softClass;
      if (!getDDRResetRequestClass_softClass)
      {
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __getDDRResetRequestClass_block_invoke;
        v17 = &unk_1E288DFE8;
        v18 = &v19;
        __getDDRResetRequestClass_block_invoke((uint64_t)&v14);
        v7 = (void *)v20[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v19, 8);
      v9 = (void *)objc_msgSend([v8 alloc], "initWithMode:options:reason:", v2, v6, CFSTR("unknown"));
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v10 = (void *)getDDRResetServiceClass_softClass;
      v22 = getDDRResetServiceClass_softClass;
      if (!getDDRResetServiceClass_softClass)
      {
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __getDDRResetServiceClass_block_invoke;
        v17 = &unk_1E288DFE8;
        v18 = &v19;
        __getDDRResetServiceClass_block_invoke((uint64_t)&v14);
        v10 = (void *)v20[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v19, 8);
      objc_msgSend(v11, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "resetWithRequest:completion:", v9, 0);

      break;
    default:
      break;
  }

  return 0;
}

void sub_18EB6D630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBGetTopButtonFrames(int a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  return _SBSGetTopButtonFrames(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t SBRegisterRemoteView()
{
  return 5;
}

uint64_t SBUnregisterRemoteView()
{
  return 5;
}

uint64_t SBPresentSheetView()
{
  return 5;
}

uint64_t SBDismissSheetView()
{
  return 5;
}

uint64_t SBGetHomeScreenIconMetrics(int a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  return _SBSGetHomeScreenIconMetrics(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t SBSetWallpaperImageForLocations(mach_port_t a1, uint64_t a2, int a3, char a4, char a5, char a6, char a7, char *src, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, uint64_t a19, unsigned int a20,_BYTE *a21)
{
  return _SBSSetWallpaperImageForLocations(a1, a2, a3, a4, a5, a6, a7, src, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t SBSetWallpaperImageSurfaceForLocations(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, char a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, char *src, char a20,char a21,char a22,uint64_t a23,int a24,_BYTE *a25)
{
  return _SBSSetWallpaperImageSurfaceForLocations(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, src,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t SBGetWallpaperOptions(int a1, char a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _BYTE *a9, _BYTE *a10, _BYTE *a11, _QWORD *a12, _QWORD *a13, _DWORD *a14)
{
  return _SBSGetWallpaperOptions(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

Class __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetOptionsClass_block_invoke_cold_1();
  getDDRResetOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void EmbeddedDataResetLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E288E040;
    v2 = 0;
    EmbeddedDataResetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
    EmbeddedDataResetLibrary_cold_1(&v0);
}

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetRequestClass_block_invoke_cold_1();
  getDDRResetRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetServiceClass_block_invoke_cold_1();
  getDDRResetServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SBSAcquireBiometricUnlockSuppressionAssertion(void *a1, void *a2)
{
  id v3;
  id v4;
  SBSBiometricsService *v5;
  SBSBiometricsService *v6;
  _QWORD v7[4];
  SBSBiometricsService *v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = a1;
    v5 = objc_alloc_init(SBSBiometricsService);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __SBSAcquireBiometricUnlockSuppressionAssertion_block_invoke;
    v7[3] = &unk_1E288D8A0;
    v8 = v5;
    v9 = v3;
    v6 = v5;
    -[SBSBiometricsService acquireUnlockSuppressionAssertionForReason:completion:](v6, "acquireUnlockSuppressionAssertionForReason:completion:", v4, v7);

  }
}

uint64_t AggregateDictionaryLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AggregateDictionaryLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E288E0A0;
    v3 = 0;
    AggregateDictionaryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AggregateDictionaryLibraryCore_frameworkLibrary)
    AggregateDictionaryLibrary_cold_1(&v1);
  return AggregateDictionaryLibraryCore_frameworkLibrary;
}

char *OUTLINED_FUNCTION_0_1()
{
  return dlerror();
}

const __CFString *SBSDisplayScaleDescription(uint64_t a1)
{
  const __CFString *result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  result = CFSTR(".LargerText");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR(".Standard");
      break;
    case 2:
      result = CFSTR(".MoreSpace");
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBSDisplayScaleDescription(SBSDisplayScale)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSDisplayModeSettings.m"), 20, CFSTR("invalid scale: %lu"), 3);

      goto LABEL_6;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBSDisplayScaleDescription(SBSDisplayScale)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBSDisplayModeSettings.m"), 24, CFSTR("invalid scale: %lu"), a1);

LABEL_6:
      result = CFSTR("-INVALID-");
      break;
  }
  return result;
}

const __CFString *SBSDisplayOverscanCompensationDescription(unint64_t a1)
{
  void *v3;
  void *v4;

  if (a1 < 3)
    return off_1E288E0F8[a1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBSDisplayOverscanCompensationDescription(SBSDisplayOverscanCompensation)");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBSDisplayModeSettings.m"), 34, CFSTR("invalid compensation: %lu"), a1);

  return CFSTR("-INVALID-");
}

__CFString *SBSDisplayScaleMaskDescription(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  _QWORD *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  __CFString *v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  char v16;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __SBSDisplayScaleMaskDescription_block_invoke;
    v11 = &unk_1E288E0D8;
    v13 = v14;
    v3 = v2;
    v12 = v3;
    v4 = v9;
    v16 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(_QWORD *))v10)(v4);
          if (v16)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    v3 = CFSTR(".None");
  }
  return v3;
}

void sub_18EB6E034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBSDisplayScaleMaskFromScale(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  if (a1 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SBSDisplayScaleMask SBSDisplayScaleMaskFromScale(SBSDisplayScale)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBSDisplayModeSettings.m"), 82, CFSTR("invalid scale: %lu"), 3);

    return 0;
  }
  else
  {
    v1 = 1;
    if (a1 == 1)
      v1 = 2;
    if (a1 == 2)
      return 4;
    else
      return v1;
  }
}

uint64_t FBSDisplayOverscanCompensationForDisplayValue(unint64_t a1)
{
  unint64_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSDisplayOverscanCompensation FBSDisplayOverscanCompensationForDisplayValue(SBSDisplayOverscanCompensation)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBSDisplayModeSettings.m"), 97, CFSTR("invalid value: %lu"), v1);

    return -1;
  }
  return v1;
}

__CFString *NSStringFromSBSRemoteContentDismissType(unint64_t a1)
{
  if (a1 < 9)
    return off_1E288E150[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown dismiss type (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *SBSInCallPresentationModeDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("unknown");
  else
    return off_1E288E198[a1];
}

void sub_18EB72494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB726C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromSBSAccidentalActivationMitigationSessionState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("initial");
  else
    return off_1E288E1B8[a1 - 1];
}

void __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(void *a1, void *a2)
{
  id v3;
  id v4;
  SBSAppSwitcherSystemService *v5;
  void *v6;
  id v7;
  SBSAppSwitcherSystemService *v8;
  _QWORD v9[4];
  id v10;
  SBSAppSwitcherSystemService *v11;
  id v12;
  id location;

  v3 = a1;
  v4 = a2;
  objc_initWeak(&location, v3);
  v5 = objc_alloc_init(SBSAppSwitcherSystemService);
  -[SBSAbstractSystemService client](v5, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke;
  v9[3] = &unk_1E288E228;
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v11 = v8;
  objc_msgSend(v6, "requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:reacquiringExistingAssertion:completion:", v7, v3, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void sub_18EB733FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB73574(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __sb__setOverrideRunningInSpringBoard(id obj)
{
  objc_storeStrong((id *)&__sb__overrideRunningInSpringBoard, obj);
}

double __sb__mainScreenScale()
{
  void *v0;
  double v1;
  double v2;

  __sb__mainDisplayConfiguration();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  return v2;
}

void ____sb__mainDisplayConfiguration_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSDisplayConfiguration *__sb__mainDisplayConfiguration(void)_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_SBSPrefixHelper.m"), 45, CFSTR("Must be running in SpringBoard to compute the reference bounds for SpringBoard."));

  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v0 = (void *)getFBDisplayManagerClass_softClass;
  v11 = getFBDisplayManagerClass_softClass;
  if (!getFBDisplayManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getFBDisplayManagerClass_block_invoke;
    v7[3] = &unk_1E288DFE8;
    v7[4] = &v8;
    __getFBDisplayManagerClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)__sb__mainDisplayConfiguration___mainDisplayConfiguration;
  __sb__mainDisplayConfiguration___mainDisplayConfiguration = v3;

}

void sub_18EB73938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBDisplayManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E288E290;
    v5 = 0;
    FrontBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardLibraryCore_frameworkLibrary)
    __getFBDisplayManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FBDisplayManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFBDisplayManagerClass_block_invoke_cold_2();
  getFBDisplayManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18EB74894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB775C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB77808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB77A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB77CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB78070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB781B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

_BYTE *OUTLINED_FUNCTION_6(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_18EB7CFF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t _SBMigGetIsAlive(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  return 0;
}

uint64_t _SBMigDisplayIdentifierForPID(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDisplayIdentifierForPID");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigDisplayIdentifiersForPID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v11;
  _OWORD v13[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXDisplayIdentifiersForPID");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _SBMigAppSwitcherServiceRegister(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v11;
  _OWORD v13[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAppSwitcherServiceRegister");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, a2, a3, a4, v13);
}

uint64_t _SBMigApplicationDisplayIdentifiers(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v13;
  _OWORD v15[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXApplicationDisplayIdentifiers");
  if (!FunctionForSymbol)
    return 5;
  v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigFrontmostApplicationDisplayIdentifier(int a1, uint64_t a2, __int128 *a3)
{
  void *FunctionForSymbol;
  __int128 v7;
  _QWORD block[6];
  int v10;
  __int128 v11;
  __int128 v12;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXFrontmostApplicationDisplayIdentifier");
  if (!FunctionForSymbol)
    return 5;
  block[1] = 3221225472;
  v7 = a3[1];
  v11 = *a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = ___SBMigFrontmostApplicationDisplayIdentifier_block_invoke;
  block[3] = &__block_descriptor_84_e5_v8__0l;
  v10 = a1;
  block[4] = FunctionForSymbol;
  block[5] = a2;
  v12 = v7;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  return 0;
}

uint64_t _SBMigBundlePathForDisplayIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXBundlePathForDisplayIdentifier");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigLocalizedApplicationNameForDisplayIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLocalizedApplicationNameForDisplayIdentifier");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSuspendFrontmostApp(int a1, __int128 *a2)
{
  void *FunctionForSymbol;
  __int128 v5;
  _QWORD v7[5];
  int v8;
  __int128 v9;
  __int128 v10;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSuspendFrontmostApp");
  if (!FunctionForSymbol)
    return 5;
  v7[1] = 3221225472;
  v5 = a2[1];
  v9 = *a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = ___SBMigSuspendFrontmostApp_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  v7[4] = FunctionForSymbol;
  v8 = a1;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  return 0;
}

uint64_t _SBMigInterruptKeybagRefetch(uint64_t a1, _OWORD *a2)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXInterruptKeybagRefetch");
  if (!FunctionForSymbol)
    return 5;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigGetActiveInterfaceOrientation(int a1, uint64_t a2)
{
  void *FunctionForSymbol;
  _QWORD block[6];
  int v7;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetInterfaceOrientation");
  if (!FunctionForSymbol)
    return 5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBMigGetActiveInterfaceOrientation_block_invoke;
  block[3] = &__block_descriptor_52_e5_v8__0l;
  v7 = a1;
  block[4] = FunctionForSymbol;
  block[5] = a2;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  return 0;
}

uint64_t _SBMigSetWantsVolumeButtonEvents(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetWantsVolumeButtonEvents");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetWantsLockButtonEvents(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetWantsLockButtonEvents");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigPresentPowerDownUI(uint64_t a1, _OWORD *a2)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXPresentPowerDownUI");
  if (!FunctionForSymbol)
    return 5;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigReboot(int a1, __int128 *a2)
{
  void *FunctionForSymbol;
  __int128 v5;
  _QWORD v7[5];
  int v8;
  __int128 v9;
  __int128 v10;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXReboot");
  if (!FunctionForSymbol)
    return 5;
  v7[1] = 3221225472;
  v5 = a2[1];
  v9 = *a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = ___SBMigReboot_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  v7[4] = FunctionForSymbol;
  v8 = a1;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  return 0;
}

uint64_t _SBMigShutDown(int a1, __int128 *a2)
{
  void *FunctionForSymbol;
  __int128 v5;
  _QWORD v7[5];
  int v8;
  __int128 v9;
  __int128 v10;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXShutDown");
  if (!FunctionForSymbol)
    return 5;
  v7[1] = 3221225472;
  v5 = a2[1];
  v9 = *a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = ___SBMigShutDown_block_invoke;
  v7[3] = &__block_descriptor_76_e5_v8__0l;
  v7[4] = FunctionForSymbol;
  v8 = a1;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  return 0;
}

uint64_t _SBMigIsSystemApplication(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXIsSystemApplication");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetApplicationBadgeNumber(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationBadgeNumber");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetApplicationBadgeString(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationBadgeString");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigSetAllApplicationsShowProgress(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAllApplicationsShowProgress");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetAllApplicationsShowSyncIndicator(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAllApplicationsShowSyncIndicator");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetShowsOverridesForRecording(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetShowsOverridesForRecording");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigEnableLockScreenBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v13;
  _OWORD v15[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXEnableLockScreenBundle");
  if (!FunctionForSymbol)
    return 5;
  v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigGetScreenLockStatus(int a1, _BYTE *a2, _BYTE *a3)
{
  void *FunctionForSymbol;
  uint64_t v7;
  _QWORD block[8];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetScreenLockStatus");
  if (!FunctionForSymbol)
    return 5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBMigGetScreenLockStatus_block_invoke;
  block[3] = &unk_1E288E5F8;
  block[4] = &v11;
  block[5] = FunctionForSymbol;
  v10 = a1;
  block[6] = a2;
  block[7] = a3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v7 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t _SBMigLockDeviceAndFeatures(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLockDeviceAndFeatures");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigLockDevice(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v5;
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3[1];
  v9 = *a3;
  v10 = v5;
  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXLockDeviceAndFeatures");
  if (!FunctionForSymbol)
    return 5;
  v8[0] = v9;
  v8[1] = v10;
  return FunctionForSymbol(a1, a2, 1, v8);
}

uint64_t _SBMigShowNetworkPromptsIfNecessary(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXShowNetworkPromptsIfNecessary");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigGetCurrentBacklightFactor(int a1, _DWORD *a2)
{
  void *FunctionForSymbol;
  uint64_t v5;
  int v6;
  _QWORD v8[7];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetCurrentBacklightFactor");
  if (FunctionForSymbol)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___SBMigGetCurrentBacklightFactor_block_invoke;
    v8[3] = &unk_1E288E620;
    v8[4] = &v10;
    v8[5] = FunctionForSymbol;
    v9 = a1;
    v8[6] = a2;
    dispatch_sync(MEMORY[0x1E0C80D38], v8);
    v5 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BKSHIDServicesGetBacklightFactor();
    *a2 = v6;
    return 5;
  }
  return v5;
}

uint64_t _SBMigDimScreen(int a1, char a2, __int128 *a3)
{
  void *FunctionForSymbol;
  __int128 v7;
  uint64_t v8;
  _QWORD block[6];
  int v11;
  __int128 v12;
  __int128 v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXDimScreen");
  if (!FunctionForSymbol)
    return 5;
  v17 = 0x2020000000;
  block[1] = 3221225472;
  v7 = a3[1];
  v12 = *a3;
  v15 = 0;
  v16 = &v15;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = ___SBMigDimScreen_block_invoke;
  block[3] = &unk_1E288E648;
  block[4] = &v15;
  block[5] = FunctionForSymbol;
  v11 = a1;
  v14 = a2;
  v13 = v7;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v8 = *((unsigned int *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t _SBMigGetBatteryAwakeTime(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetBatteryAwakeTime");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigGetRecentSleepsWakes(uint64_t a1, _QWORD *a2, _DWORD *a3, _OWORD *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  _OWORD v11[2];

  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetRecentSleepsWakes");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetScheduledPowerEvents(uint64_t a1, _QWORD *a2, _DWORD *a3, _OWORD *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetScheduledPowerEvents");
  if (FunctionForSymbol)
  {
    v9 = a4[1];
    v11[0] = *a4;
    v11[1] = v9;
    return ((uint64_t (*)(uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
  }
  else
  {
    *a2 = 0;
    *a3 = 0;
    return 5;
  }
}

uint64_t _SBMigGetBatteryUsageTimesInSeconds(int a1, _DWORD *a2, _DWORD *a3, _BYTE *a4, _BYTE *a5, __int128 *a6)
{
  void *FunctionForSymbol;
  __int128 v13;
  uint64_t v14;
  _QWORD block[10];
  int v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetBatteryUsageTimesInSeconds");
  if (!FunctionForSymbol)
    return 5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBMigGetBatteryUsageTimesInSeconds_block_invoke;
  block[3] = &unk_1E288E670;
  block[4] = &v20;
  block[5] = FunctionForSymbol;
  v17 = a1;
  block[6] = a2;
  block[7] = a3;
  block[8] = a4;
  block[9] = a5;
  v13 = *a6;
  v19 = a6[1];
  v18 = v13;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v14 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(&v20, 8);
  return v14;
}

uint64_t _SBMigAddWebClipToHomeScreen(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddWebClipToHomeScreen");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigRemoveWebClipFromHomeScreen(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXRemoveWebClipFromHomeScreen");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigReloadIconForIdentifier(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXReloadIconForIdentifier");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigAddDownloadingIconForDisplayIdentifier()
{
  return 5;
}

uint64_t _SBMigScrollToIconWithDisplayIdentifier()
{
  return 5;
}

uint64_t _SBMigGetNowPlayingAppBundleIdentifier(uint64_t a1, _BYTE *a2, _OWORD *a3)
{
  void *FunctionForSymbol;
  __int128 v7;
  _OWORD v9[2];

  *a2 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetNowPlayingAppBundleIdentifier");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return ((uint64_t (*)(uint64_t, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, v9);
}

uint64_t _SBMigGetTopButtonFrames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v19;
  _OWORD v21[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetTopButtonFrames");
  if (!FunctionForSymbol)
    return 5;
  v19 = a10[1];
  v21[0] = *a10;
  v21[1] = v19;
  return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, v21);
}

uint64_t _SBMigSetApplicationNetworkFlags(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetApplicationNetworkFlags");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigGetApplicationNetworkFlags(uint64_t a1, _BYTE *a2, _BYTE *a3, _OWORD *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  _OWORD v11[2];

  *a2 = 0;
  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetApplicationNetworkFlags");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, _BYTE *, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetDisplayIdentifiersForExternalAccessoryProtocols(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _OWORD *a5)
{
  void *FunctionForSymbol;
  __int128 v11;
  _OWORD v13[2];

  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetDisplayIdentifiersForExternalAccessoryProtocols");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigSetVoiceControlEnabled(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetVoiceControlEnabled");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetInterceptsMenuButton(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetInterceptsMenuButton");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

void *_SBMigGetMediaVolume(uint64_t a1, _DWORD *a2, _OWORD *a3)
{
  void *result;
  __int128 v7;
  _OWORD v8[2];

  result = SBMigGetFunctionForSymbol("_SBXXGetMediaVolume");
  if (result)
  {
    v7 = a3[1];
    v8[0] = *a3;
    v8[1] = v7;
    return (void *)((uint64_t (*)(uint64_t, _DWORD *, _OWORD *))result)(a1, a2, v8);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

uint64_t _SBMigSetMediaVolume(uint64_t a1, _OWORD *a2, float a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *, float);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *, float))SBMigGetFunctionForSymbol("_SBXXSetMediaVolume");
  if (!FunctionForSymbol)
    return 5;
  v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  return FunctionForSymbol(a1, v9, a3);
}

uint64_t _SBMigGetHomeScreenIconMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SBMigGetFunctionForSymbol("_SBXXGetHomeScreenIconMetrics");
  if (FunctionForSymbol)
    return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  else
    return 5;
}

uint64_t _SBMigGetIconState(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _OWORD *a5)
{
  void *FunctionForSymbol;
  __int128 v11;
  _OWORD v13[2];

  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetIconState");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigGetPendingIconState(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _OWORD *a5)
{
  void *FunctionForSymbol;
  __int128 v11;
  _OWORD v13[2];

  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetPendingIconState");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigGetFlattenedIconState(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _OWORD *a5)
{
  void *FunctionForSymbol;
  __int128 v11;
  _OWORD v13[2];

  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetFlattenedIconState");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigSetIconState(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetIconState");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigGetIconPNGData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, _OWORD *a6)
{
  void *FunctionForSymbol;
  __int128 v13;
  _OWORD v15[2];

  *a4 = 0;
  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetIconPNGData");
  if (!FunctionForSymbol)
    return 5;
  v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigFlashColor(uint64_t a1, float a2, float a3, float a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, float, float, float);

  FunctionForSymbol = (uint64_t (*)(uint64_t, float, float, float))SBMigGetFunctionForSymbol("_SBXXFlashColor");
  if (FunctionForSymbol)
    return FunctionForSymbol(a1, a2, a3, a4);
  else
    return 5;
}

uint64_t _SBMigProgrammaticSwitchAppGestureMoveToLeft(uint64_t a1, _OWORD *a2)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXProgrammaticSwitchAppGestureMoveToLeft");
  if (!FunctionForSymbol)
    return 5;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigProgrammaticSwitchAppGestureMoveToRight(uint64_t a1, _OWORD *a2)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXProgrammaticSwitchAppGestureMoveToRight");
  if (!FunctionForSymbol)
    return 5;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return FunctionForSymbol(a1, v7);
}

uint64_t _SBMigSetVoiceRecognitionAudioInputPaths(int a1, uint64_t a2, int a3, __int128 *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[7];
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetVoiceRecognitionAudioInputPaths");
  if (!FunctionForSymbol)
    return 5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetVoiceRecognitionAudioInputPaths_block_invoke;
  v12[3] = &unk_1E288E698;
  v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  v13 = a1;
  v14 = a3;
  v9 = a4[1];
  v15 = *a4;
  v16 = v9;
  dispatch_sync(MEMORY[0x1E0C80D38], v12);
  v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAssistantRecognitionStrings(int a1, uint64_t a2, int a3, __int128 *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[7];
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAssistantRecognitionStrings");
  if (!FunctionForSymbol)
    return 5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAssistantRecognitionStrings_block_invoke;
  v12[3] = &unk_1E288E698;
  v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  v13 = a1;
  v14 = a3;
  v9 = a4[1];
  v15 = *a4;
  v16 = v9;
  dispatch_sync(MEMORY[0x1E0C80D38], v12);
  v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAlertSuppressionContexts(int a1, uint64_t a2, int a3, __int128 *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[7];
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAlertSuppressionContexts");
  if (!FunctionForSymbol)
    return 5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAlertSuppressionContexts_block_invoke;
  v12[3] = &unk_1E288E698;
  v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  v13 = a1;
  v14 = a3;
  v9 = a4[1];
  v15 = *a4;
  v16 = v9;
  dispatch_sync(MEMORY[0x1E0C80D38], v12);
  v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAlertSuppressionContextsBySectionIdentifier(int a1, uint64_t a2, int a3, __int128 *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[7];
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetAlertSuppressionContextsBySectionIdentifier");
  if (!FunctionForSymbol)
    return 5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___SBMigSetAlertSuppressionContextsBySectionIdentifier_block_invoke;
  v12[3] = &unk_1E288E698;
  v12[4] = &v17;
  v12[5] = FunctionForSymbol;
  v12[6] = a2;
  v13 = a1;
  v14 = a3;
  v9 = a4[1];
  v15 = *a4;
  v16 = v9;
  dispatch_sync(MEMORY[0x1E0C80D38], v12);
  v10 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t _SBMigSetAppIsConnectedToEA(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetAppIsConnectedToEA");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

uint64_t _SBMigGetWallpaperPreviewSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, _OWORD *a6, double a7)
{
  void *FunctionForSymbol;
  __int128 v15;
  _OWORD v17[2];

  *a5 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperPreviewSurface");
  if (!FunctionForSymbol)
    return 5;
  v15 = a6[1];
  v17[0] = *a6;
  v17[1] = v15;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, _OWORD *, double))FunctionForSymbol)(a1, a2, a3, a4, a5, v17, a7);
}

uint64_t _SBMigGetWallpaperPreview(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _OWORD *a8, double a9)
{
  void *FunctionForSymbol;
  __int128 v19;
  _OWORD v21[2];

  *a7 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperPreview");
  if (!FunctionForSymbol)
    return 5;
  v19 = a8[1];
  v21[0] = *a8;
  v21[1] = v19;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, _OWORD *, double))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, v21, a9);
}

uint64_t _SBMigSetWallpaperOptionsForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, _OWORD *a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15)
{
  void *FunctionForSymbol;
  __int128 v31;
  _OWORD v33[2];

  *a7 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperOptionsForLocations");
  if (!FunctionForSymbol)
    return 5;
  v31 = a8[1];
  v33[0] = *a8;
  v33[1] = v31;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, _OWORD *, float, float, float, float, float, float, double))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, v33, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t _SBMigActivateAssistantWithContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t (*FunctionForSymbol)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  _OWORD v13[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))SBMigGetFunctionForSymbol("_SBXXActivateAssistantWithContext");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return FunctionForSymbol(a1, v13, a2, a3, a4);
}

uint64_t _SBMigSetProceduralWallpaper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v13;
  _OWORD v15[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetProceduralWallpaper");
  if (!FunctionForSymbol)
    return 5;
  v13 = a6[1];
  v15[0] = *a6;
  v15[1] = v13;
  return FunctionForSymbol(a1, a2, a3, a4, a5, v15);
}

uint64_t _SBMigSetWallpaperImageForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, unsigned __int8 a17, unsigned __int8 a18, uint64_t a19, int a20,_BYTE *a21,_OWORD *a22)
{
  void *FunctionForSymbol;
  __int128 v38;
  int v40;
  _OWORD v41[2];

  *a21 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperImageForLocations");
  if (!FunctionForSymbol)
    return 5;
  v38 = a22[1];
  v41[0] = *a22;
  v41[1] = v38;
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a18, a17);
  LOBYTE(v40) = a16;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float, float, float, float, float, float, double, int, uint64_t, int, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v40, a19, a20, a21,
           v41);
}

uint64_t _SBMigSetWallpaperImageSurfaceForLocations(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, unsigned __int8 a17, unsigned __int8 a18, uint64_t a19, char a20,unsigned __int8 a21,unsigned __int8 a22,uint64_t a23,int a24,_BYTE *a25,_OWORD *a26)
{
  void *FunctionForSymbol;
  __int128 v42;
  int v44;
  int v45;
  _OWORD v46[2];

  *a25 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperImageSurfaceForLocations");
  if (!FunctionForSymbol)
    return 5;
  v42 = a26[1];
  v46[0] = *a26;
  v46[1] = v42;
  *(_WORD *)((char *)&v45 + 1) = __PAIR16__(a22, a21);
  LOBYTE(v45) = a20;
  *(_WORD *)((char *)&v44 + 1) = __PAIR16__(a18, a17);
  LOBYTE(v44) = a16;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float, float, float, float, float, float, double, int, uint64_t, int, uint64_t, int, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v44, a19, v45, a23,
           a24,
           a25,
           v46);
}

uint64_t _SBMigClearWallpaperAsset(uint64_t a1, _BYTE *a2, _OWORD *a3)
{
  void *FunctionForSymbol;
  __int128 v7;
  _OWORD v9[2];

  *a2 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXClearWallpaperAsset");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return ((uint64_t (*)(uint64_t, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, v9);
}

uint64_t _SBMigGetWallpaperOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _OWORD *a15)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v24;
  _OWORD v26[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXGetWallpaperOptions");
  if (!FunctionForSymbol)
    return 5;
  v24 = a15[1];
  v26[0] = *a15;
  v26[1] = v24;
  return FunctionForSymbol(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, v26);
}

uint64_t _SBMigSetWallpaperVariant(uint64_t a1, uint64_t a2, _BYTE *a3, _OWORD *a4)
{
  void *FunctionForSymbol;
  __int128 v9;
  _OWORD v11[2];

  *a3 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXSetWallpaperVariant");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return ((uint64_t (*)(uint64_t, uint64_t, _BYTE *, _OWORD *))FunctionForSymbol)(a1, a2, a3, v11);
}

uint64_t _SBMigGetWallpaperLegibilitySettings(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _OWORD *a5)
{
  void *FunctionForSymbol;
  __int128 v11;
  _OWORD v13[2];

  *a3 = 0;
  *a4 = 0;
  FunctionForSymbol = SBMigGetFunctionForSymbol("_SBXXGetWallpaperLegibilitySettings");
  if (!FunctionForSymbol)
    return 5;
  v11 = a5[1];
  v13[0] = *a5;
  v13[1] = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD *, _DWORD *, _OWORD *))FunctionForSymbol)(a1, a2, a3, a4, v13);
}

uint64_t _SBMigAddAlertItemsSuppressionAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v10;
  NSObject *v12;
  _OWORD v13[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAddAlertItemsSuppressionAssertion");
  if (FunctionForSymbol)
  {
    v9 = FunctionForSymbol;
    if (BSMachPortIsType())
    {
      v10 = a4[1];
      v13[0] = *a4;
      v13[1] = v10;
      return v9(a1, a2, a3, v13);
    }
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      _SBMigAddAlertItemsSuppressionAssertion_cold_1(v12);

  }
  return 5;
}

uint64_t _SBMigTagTouchForTypingMenu(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXTagTouchForTypingMenu");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigAcquireFocusPreventingFullScreenPresentationAssertion(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v11[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXAcquireFocusPreventingFullScreenPresentationAssertion");
  if (!FunctionForSymbol)
    return 5;
  v9 = a4[1];
  v11[0] = *a4;
  v11[1] = v9;
  return FunctionForSymbol(a1, a2, a3, v11);
}

void *_SBMigIsReachabilityEnabled(uint64_t a1, _BYTE *a2, _OWORD *a3)
{
  void *result;
  __int128 v7;
  _OWORD v8[2];

  *a2 = 0;
  result = SBMigGetFunctionForSymbol("_SBXXIsReachabilityEnabled");
  if (result)
  {
    v7 = a3[1];
    v8[0] = *a3;
    v8[1] = v7;
    return (void *)((uint64_t (*)(uint64_t, _BYTE *, _OWORD *))result)(a1, a2, v8);
  }
  return result;
}

uint64_t _SBMigSetReachabilityEnabled(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetReachabilityEnabled");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigOverrideDisplayedDate(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXOverrideDisplayedDate");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

uint64_t _SBMigSetIdleText(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t (*FunctionForSymbol)(uint64_t, uint64_t, _OWORD *);
  __int128 v7;
  _OWORD v9[2];

  FunctionForSymbol = (uint64_t (*)(uint64_t, uint64_t, _OWORD *))SBMigGetFunctionForSymbol("_SBXXSetIdleText");
  if (!FunctionForSymbol)
    return 5;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return FunctionForSymbol(a1, a2, v9);
}

void SBSSetAllApplicationsShowProgress(int a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  const void *v11;
  _QWORD v12[4];
  int v13;
  char v14;

  v4 = (void *)MEMORY[0x193FF8644]();
  _SBSRestartLock();
  _SBSRestartGetInfoForIdentifier(CFSTR("SBSSetAllApplicationsShowProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v6 = 0;
  if (v6 == (a1 == 0))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __SBSSetAllApplicationsShowProgress_block_invoke;
    v12[3] = &__block_descriptor_37_e5_v8__0l;
    v14 = a1;
    v13 = a2;
    v7 = MEMORY[0x193FF87DC](v12);
    v8 = (void (**)(_QWORD))v7;
    if (a1)
      v9 = (void *)v7;
    else
      v9 = 0;
    _SBSRestartScheduleBlockForIdentifier(CFSTR("SBSSetAllApplicationsShowProgress"), v9);
  }
  else
  {
    v8 = 0;
  }
  if (a1)
    v10 = v6 + 1;
  else
    v10 = v6 - 1;
  if (v10)
    v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  else
    v11 = 0;
  _SBSRestartSetInfoForIdentifier(CFSTR("SBSSetAllApplicationsShowProgress"), v11);
  if (v8)
    v8[2](v8);
  _SBSRestartUnlock();

  objc_autoreleasePoolPop(v4);
}

void SBSSetStatusBarShowsSyncActivity(int a1, int a2)
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD v5[4];
  int v6;
  char v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SBSSetStatusBarShowsSyncActivity_block_invoke;
  v5[3] = &__block_descriptor_37_e5_v8__0l;
  v7 = a1;
  v6 = a2;
  v3 = (void (**)(_QWORD))MEMORY[0x193FF87DC](v5);
  _SBSRestartLock();
  if (a1)
    v4 = v3;
  else
    v4 = 0;
  _SBSRestartScheduleBlockForIdentifier(CFSTR("SBSSetStatusBarShowsSyncActivity"), v4);
  v3[2](v3);
  _SBSRestartUnlock();

}

void SBSSetStatusBarShowsOverridesForRecording(int a1)
{
  void (**v2)(_QWORD);
  void *v3;
  _QWORD v4[4];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SBSSetStatusBarShowsOverridesForRecording_block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a1;
  v2 = (void (**)(_QWORD))MEMORY[0x193FF87DC](v4);
  _SBSRestartLock();
  if (a1)
    v3 = v2;
  else
    v3 = 0;
  _SBSRestartScheduleBlockForIdentifier(CFSTR("SBSSetStatusBarOverridesForRecording"), v3);
  v2[2](v2);
  _SBSRestartUnlock();

}

uint64_t SBSAlertItemsSuppressionAssertionGetTypeID()
{
  if (SBSAlertItemsSuppressionAssertionGetTypeID_once != -1)
    dispatch_once(&SBSAlertItemsSuppressionAssertionGetTypeID_once, &__block_literal_global_26);
  return SBSAlertItemsSuppressionAssertionGetTypeID_typeID;
}

uint64_t SBSAlertItemsSuppressionAssertionDestroy(uint64_t a1)
{
  pthread_mutex_t *v2;
  mach_port_name_t v3;
  const void *v4;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 80);
  if (v3 + 1 >= 2)
  {
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v3, 1u, -1);
    *(_DWORD *)(a1 + 80) = 0;
    v4 = *(const void **)(a1 + 88);
    if (v4)
      CFRelease(v4);
  }
  return pthread_mutex_unlock(v2);
}

BOOL SBSAlertItemsSuppressionAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef SBSAlertItemsSuppressionAssertionDescribe(_QWORD *cf)
{
  const __CFString *v2;
  const __CFAllocator *v3;
  char buffer;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[31];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v20, 0, sizeof(v20));
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  buffer = 48;
  v2 = (const __CFString *)cf[11];
  if (v2)
    CFStringGetCString(v2, &buffer, 256, 0x8000100u);
  v3 = CFGetAllocator(cf);
  return CFStringCreateWithFormat(v3, 0, CFSTR("<SBSAlertItemsSuppressionAssertion %p: reason='%s'>"), cf, &buffer);
}

uint64_t SBSAlertItemsSuppressionAssertionCreate(const __CFAllocator *a1, const __CFString *a2)
{
  uint64_t Instance;
  CFStringRef Copy;
  uint64_t v6;
  uint64_t v8;
  mach_port_name_t name;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (SBSAlertItemsSuppressionAssertionGetTypeID_once != -1)
    dispatch_once(&SBSAlertItemsSuppressionAssertionGetTypeID_once, &__block_literal_global_26);
  Instance = _CFRuntimeCreateInstance();
  *(_QWORD *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_QWORD *)(Instance + 72) = 0;
  if (a2)
    Copy = CFStringCreateCopy(a1, a2);
  else
    Copy = 0;
  *(_QWORD *)(Instance + 88) = Copy;
  name = 0;
  if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name))
  {
    SBSSpringBoardServerPort();
LABEL_9:
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  *(_DWORD *)(Instance + 80) = name;
  v6 = SBSSpringBoardServerPort();
  if ((v6 + 1) < 2)
    goto LABEL_9;
  v8 = v6;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buffer = 0u;
  v11 = 0u;
  if (!CFStringGetCString(a2, buffer, 1024, 0x8000100u)
    || SBAddAlertItemsSuppressionAssertion(v8, buffer, name))
  {
    goto LABEL_9;
  }
  return Instance;
}

void sub_18EB80C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB81130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *SBSRemoteAlertHandleInvalidationErrorDescription(unint64_t a1)
{
  if (a1 > 8)
    return CFSTR("invalidated due to unknown reason");
  else
    return off_1E288E9F8[a1];
}

uint64_t SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason(unint64_t a1)
{
  if (a1 > 5)
    return 1;
  else
    return qword_18EBC95A0[a1];
}

const __CFString *SBSHearingTestModeDescription(uint64_t a1)
{
  if (a1)
    return CFSTR("active");
  else
    return CFSTR("inactive");
}

void sub_18EB82B5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_18EB83224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB83A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB84234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB8572C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB85928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB85B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB85D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB86014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB86280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB865F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB8679C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *SBSStringFromWebClipServiceLaunchOrigin(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E288EDA0[a1];
}

void sub_18EB8A95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB8ABF8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SBSCreateOpenApplicationServiceEndpoint()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D23170], "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", CFSTR("com.apple.frontboard.systemappservices"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t SBSCreateOpenApplicationService()
{
  return objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
}

uint64_t SBSApplicationTerminationAssertionGetTypeID()
{
  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1)
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  return SBSApplicationTerminationAssertionGetTypeID_typeID;
}

uint64_t SBSApplicationTerminationAssertionEqual(id *a1, _QWORD *a2)
{
  CFTypeID v4;
  uint64_t v5;

  v4 = CFGetTypeID(a1);
  v5 = v4 == CFGetTypeID(a2);
  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1)
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  if (SBSApplicationTerminationAssertionGetTypeID_typeID == v5)
    return objc_msgSend(a1[2], "isEqual:", a2[2]);
  else
    return 0;
}

uint64_t SBSApplicationTerminationAssertionHash(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), "hash");
}

CFStringRef SBSApplicationTerminationAssertionCopyDebugDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;

  v2 = CFGetAllocator((CFTypeRef)a1);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = objc_msgSend(*(id *)(a1 + 16), "isValid");
  v5 = CFSTR("false");
  if (v4)
    v5 = CFSTR("true");
  return CFStringCreateWithFormat(v2, 0, CFSTR("<SBSApplicationTerminationAssertion %p> identifier = %@, valid = %@"), a1, v3, v5);
}

_QWORD *SBSApplicationTerminationAssertionCreate(uint64_t a1, const void *a2, int a3)
{
  return SBSApplicationTerminationAssertionCreateWithError(a1, a2, a3, 0);
}

_QWORD *SBSApplicationTerminationAssertionCreateWithError(uint64_t a1, const void *a2, int a3, _BYTE *a4)
{
  _QWORD *Instance;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  CFTypeRef v14;
  int v15;
  id v17;

  if (SBSApplicationTerminationAssertionGetTypeID_pred != -1)
    dispatch_once(&SBSApplicationTerminationAssertionGetTypeID_pred, &__block_literal_global_34);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a3)
      v8 = 20;
    else
      v8 = 30;
    if (a3 == 255)
      v9 = 40;
    else
      v9 = v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("SBSApplicationTerminationAssertion"));
    objc_msgSend(v10, "setReportType:", 0);
    objc_msgSend(v10, "setExceptionCode:", 95805101);
    objc_msgSend(v10, "setExceptionDomain:", 0);
    objc_msgSend(v10, "setMaximumTerminationResistance:", v9);
    v11 = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", a2);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E10]), "initWithPredicate:context:", v11, v10);
    v17 = 0;
    v13 = objc_msgSend(v12, "acquireWithError:", &v17);

    if (v13)
    {
      Instance[2] = v12;
      v14 = CFRetain(a2);
      v15 = 0;
      Instance[3] = v14;
      if (!a4)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(v12, "invalidate");

      if (objc_msgSend(v17, "code") == 4)
        v15 = 1;
      else
        v15 = 4;
      if (!a4)
        goto LABEL_15;
    }
    goto LABEL_14;
  }
  v15 = 4;
  if (a4)
LABEL_14:
    *a4 = v15;
LABEL_15:
  if (Instance && v15)
  {
    CFRelease(Instance);
    return 0;
  }
  return Instance;
}

uint64_t SBSApplicationTerminationAssertionGetDisplayIdentifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t SBSApplicationTerminationAssertionGetIsValid(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), "isValid");
}

void SBSApplicationTerminationAssertionInvalidate(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 16), "invalidate");

  *(_QWORD *)(a1 + 16) = 0;
  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const __CFString *SBSApplicationTerminationAssertionErrorString(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("unknown error");
  else
    return off_1E288EF18[(char)a1];
}

void sub_18EB8D3BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t SBSSystemApertureRootWindowRequestPortalSource(uint64_t a1)
{
  return +[SBSSystemAperturePortalSourceInfoRequest rootWindowPortalSourceWithCompletion:](SBSSystemAperturePortalSourceInfoRequest, "rootWindowPortalSourceWithCompletion:", a1);
}

uint64_t SBSDiffSystemNotesPresentationConfigurations(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 15;
  if (v3 && v4)
  {
    objc_msgSend(v3, "sceneBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = objc_msgSend(v3, "preferredPresentationMode");
    if (v10 == objc_msgSend(v5, "preferredPresentationMode"))
      v11 = v9 ^ 1u;
    else
      v11 = v9 ^ 1u | 2;
    objc_msgSend(v3, "userActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {

    }
    else
    {
      objc_msgSend(v3, "userActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(v5, "userActivity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v16 != 0;

      }
      if (v15)
        v11 |= 4uLL;
    }
    objc_msgSend(v3, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (v19)
      v6 = v11;
    else
      v6 = v11 | 8;
  }

  return v6;
}

__CFString *NSStringFromSBSMultitaskingApplicationSupportedShortcutActionMask(char a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("fullscreen"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("leftSplit"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "addObject:", CFSTR("rightSplit"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", CFSTR("allWindows"));
  if ((a1 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("addToWindowSet"));
LABEL_7:
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("none");
  }

  return v4;
}

void sub_18EB8E6E8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

const __CFString *SBSSystemNotesConnectionSourceDescription(unint64_t a1)
{
  void *v3;
  void *v4;

  if (a1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBSSystemNotesConnectionSourceDescription(SBSSystemNotesSceneConnectionSource)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBSSystemNotesSceneConnectionSource.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source < SBSSystemNotesSceneConnectionSourceCount"));

  }
  if (a1 > 2)
    return CFSTR("-unknown-");
  else
    return (const __CFString *)*((_QWORD *)&off_1E288F058 + a1);
}

void _SBSRestarted()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x193FF8644]();
  _SBSRestartLock();
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend((id)__SBSRestartBlocks, "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

  objc_msgSend((id)__SBSRestartLock, "unlock");
  objc_autoreleasePoolPop(v0);
}

void SBSSetAlertSuppressionContexts(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a1;
  v1 = (void *)MEMORY[0x193FF8644]();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v3 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v8, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  v6 = SBSSpringBoardServerPort();
  v7 = objc_retainAutorelease(v2);
  SBSetAlertSuppressionContexts(v6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v1);
}

void SBSSetAlertSuppressionContextsBySectionIdentifier(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a1;
  v1 = (void *)MEMORY[0x193FF8644]();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __SBSSetAlertSuppressionContextsBySectionIdentifier_block_invoke;
    v9[3] = &unk_1E288D148;
    v10 = v3;
    v4 = v3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  v6 = SBSSpringBoardServerPort();
  v7 = objc_retainAutorelease(v2);
  SBSetAlertSuppressionContextsBySectionIdentifier(v6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v1);
}

const __CFString *secureAppTypeName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("SBSSecureAppTypeNone");
  else
    return (const __CFString *)*((_QWORD *)&off_1E288F140 + a1 - 1);
}

uint64_t SBSSecureAppTypeForIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.calculator")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobiletimer")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Magnifier")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.VoiceMemos")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.TVRemoteUIService")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.VirtualDisplayTest")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.sidecar")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ContinuityCaptureShieldUI")) & 1) != 0)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.BarcodeScanner")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t SBSIdentifierForSecureAppType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC)
    return 0;
  else
    return *((_QWORD *)&off_1E288F1B0 + a1 - 1);
}

__CFString *SBSDisplayLayoutBacklightTransitionReasonForBacklightChangeSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x2F)
    return 0;
  else
    return off_1E288F558[a1 - 1];
}

id SBSDisplayLayoutTransitionReasonForSourceApplication(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("SBSourceApplication:"), a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id SBSDisplayLayoutTransitionSourceApplicationFromReason(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("SBSourceApplication:")))
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("SBSourceApplication:"), "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

double SBSConvertPointFromDisplayToNeighboringDisplay(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v6 = a1;
  v7 = a4;
  objc_msgSend(v6, "hardwareIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "isMainDisplay");

  objc_msgSend(v7, "hardwareIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (v9 != objc_msgSend(v7, "isMainDisplay"))
      goto LABEL_6;
LABEL_9:
    a2 = 1.79769313e308;
    goto LABEL_48;
  }

  if ((v9 & 1) == 0)
    goto LABEL_9;
LABEL_6:
  if (__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  }
  v12 = v11;
  objc_msgSend(v11, "objectForKey:", CFSTR("SBExternalDisplayArrangementEdge"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "unsignedIntValue");
  else
    v15 = 1;
  if (v9)
    v16 = v6;
  else
    v16 = v7;
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  if (BSInterfaceOrientationIsLandscape() && v18 < v20
    || BSInterfaceOrientationIsPortrait() && v20 < v18)
  {
    v21 = v18;
  }
  else
  {
    v21 = v20;
    v20 = v18;
  }
  if (v9)
    v22 = v7;
  else
    v22 = v6;
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;
  if (BSInterfaceOrientationIsLandscape() && v24 < v26
    || BSInterfaceOrientationIsPortrait() && v26 < v24)
  {
    v27 = v26;
  }
  else
  {
    v27 = v24;
    v24 = v26;
  }
  v28 = v21 - v24;
  if ((v15 & 0xFFFFFFFD) == 1)
    v28 = v20 - v27;
  v29 = fabs(v28 * 0.5);
  switch(v15)
  {
    case 0:
      if (!v9)
        v27 = -v27;
      goto LABEL_43;
    case 1:
      v30 = -v29;
      if (v9)
        v30 = v29;
      a2 = a2 + v30;
      break;
    case 2:
      v27 = -v20;
      if (!v9)
        v27 = v20;
LABEL_43:
      a2 = a2 + v27;
      break;
    case 3:
      v31 = -v29;
      if (v9)
        v31 = v29;
      a2 = a2 + v31;
      break;
    default:
      break;
  }

LABEL_48:
  return a2;
}

void SBSConvertRectFromDisplayToNeighboringDisplay(void *a1, uint64_t a2, void *a3, double a4)
{
  SBSConvertPointFromDisplayToNeighboringDisplay(a1, a4, a2, a3);
}

BOOL SBSRectOnDisplayIntersectsNeighboringDisplay(void *a1, uint64_t a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int IsLandscape;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL8 v50;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  uint64_t v61;
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v13 = a1;
  v14 = a3;
  objc_msgSend(v13, "hardwareIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = 0;
  else
    v16 = objc_msgSend(v13, "isMainDisplay");

  objc_msgSend(v14, "hardwareIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = 0;
  else
    v18 = objc_msgSend(v14, "isMainDisplay");

  if (v18 == v16)
    goto LABEL_40;
  v19 = v16 ? v13 : v14;
  objc_msgSend(v19, "bounds");
  v62 = v20;
  v22 = v21;
  v24 = v23;
  v60 = a7;
  v61 = v25;
  v58 = a5;
  v59 = a6;
  if (BSInterfaceOrientationIsLandscape())
  {
    if (v22 < v24)
      goto LABEL_15;
  }
  if (BSInterfaceOrientationIsPortrait() && v24 < v22)
  {
LABEL_15:
    v26 = v24;
  }
  else
  {
    v26 = v22;
    v22 = v24;
  }
  v27 = v16 ? v14 : v13;
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  IsLandscape = BSInterfaceOrientationIsLandscape();
  v37 = v33;
  if (IsLandscape)
  {
    if (v33 < v35)
      goto LABEL_24;
  }
  v38 = v33;
  if (BSInterfaceOrientationIsPortrait() && (v37 = v33, v35 < v33))
LABEL_24:
    v38 = v35;
  else
    v37 = v35;
  v39 = v16 ? v22 : v37;
  v40 = v16 ? v26 : v38;
  v57 = v26;
  v41 = v16 ? v61 : v31;
  v56 = v31;
  v42 = v29;
  v43 = v16 ? v62 : v29;
  v63.origin.x = a4;
  v44 = v38;
  v63.origin.y = v58;
  v45 = v37;
  v63.size.width = v59;
  v63.size.height = v60;
  if (!CGRectIntersectsRect(v63, *(CGRect *)(&v39 - 3))
    || (SBSConvertRectFromDisplayToNeighboringDisplay(v13, a2, v14, a4),
        x = v64.origin.x,
        y = v64.origin.y,
        width = v64.size.width,
        height = v64.size.height,
        CGRectIsNull(v64)))
  {
LABEL_40:
    v50 = 0;
  }
  else
  {
    if (v16)
      v52 = v45;
    else
      v52 = v22;
    if (v16)
      v53 = v44;
    else
      v53 = v57;
    if (v16)
      v54 = v56;
    else
      v54 = v61;
    if (v16)
      v55 = v42;
    else
      v55 = v62;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v50 = CGRectIntersectsRect(v65, *(CGRect *)(&v52 - 3));
  }

  return v50;
}

uint64_t SBSDisplayEdgeAdjacentToNeighboringDisplay(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  if (__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  }
  v3 = v2;
  objc_msgSend(v2, "objectForKey:", CFSTR("SBExternalDisplayArrangementEdge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntValue");
  else
    v6 = 1;
  objc_msgSend(v1, "hardwareIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if ((objc_msgSend(v1, "isMainDisplay") & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((v6 - 1) > 2)
    v6 = 2;
  else
    v6 = dword_18EBC95F0[(int)v6 - 1];
LABEL_13:

  return v6;
}

const __CFString *SBSSystemNotesPresentationModeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (!a1)
    v1 = CFSTR("floating-window");
  if (a1 == 1)
    return CFSTR("minimized");
  else
    return v1;
}

BOOL SBSSystemNotesPresentationModeIsValid(unint64_t a1)
{
  return a1 < 2;
}

const __CFString *SBSSystemNotesCreateReasonDescription(unint64_t a1)
{
  void *v3;
  void *v4;

  if (a1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBSSystemNotesCreateReasonDescription(SBSSystemNotesCreateReason)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBSSystemNotesCreateReason.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason >= SBSSystemNotesCreateReasonInvalid && reason <= SBSSystemNotesCreateReasonCount"));

  }
  if (a1 > 2)
    return CFSTR("-unknown-");
  else
    return off_1E288F6E0[a1];
}

uint64_t SBCardItemsControllerClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE143F20);
}

id SBCardItemsControllerServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE14A1E0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setCardItems_forControllerWithIdentifier_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getCardItemsForControllerWithIdentifier_withHandler_, 0, 1);

  return v0;
}

void sub_18EB93D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SystemStatusLibraryCore_frameworkLibrary;
  v6 = SystemStatusLibraryCore_frameworkLibrary;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E288F800;
    v8 = *(_OWORD *)&off_1E288F810;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SystemStatusLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB94444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = SystemStatusLibraryCore();
  if (!result)
    SystemStatusLibrary_cold_1(&v1);
  return result;
}

void *getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr;
  v6 = getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusLibrary();
    v0 = dlsym(v1, "STBackgroundActivityIdentifierBackgroundLocation");
    v4[3] = (uint64_t)v0;
    getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB94524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getSTBackgroundActivityIdentifierBackgroundLocation()
{
  id *STBackgroundActivityIdentifierBackgroundLocationSymbolLoc;

  STBackgroundActivityIdentifierBackgroundLocationSymbolLoc = (id *)getSTBackgroundActivityIdentifierBackgroundLocationSymbolLoc();
  if (!STBackgroundActivityIdentifierBackgroundLocationSymbolLoc)
    getSTBackgroundActivityIdentifierBackgroundLocation_cold_1();
  return *STBackgroundActivityIdentifierBackgroundLocationSymbolLoc;
}

void *getSTBackgroundActivityIdentifiersDescriptionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  v6 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusLibrary();
    v0 = dlsym(v1, "STBackgroundActivityIdentifiersDescription");
    v4[3] = (uint64_t)v0;
    getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB945D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STBackgroundActivityIdentifiersDescription(uint64_t a1)
{
  uint64_t (*STBackgroundActivityIdentifiersDescriptionSymbolLoc)(uint64_t);

  STBackgroundActivityIdentifiersDescriptionSymbolLoc = (uint64_t (*)(uint64_t))getSTBackgroundActivityIdentifiersDescriptionSymbolLoc();
  if (!STBackgroundActivityIdentifiersDescriptionSymbolLoc)
    soft_STBackgroundActivityIdentifiersDescription_cold_1();
  return STBackgroundActivityIdentifiersDescriptionSymbolLoc(a1);
}

uint64_t SystemStatusUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SystemStatusUILibraryCore_frameworkLibrary;
  v6 = SystemStatusUILibraryCore_frameworkLibrary;
  if (!SystemStatusUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E288F820;
    v8 = *(_OWORD *)&off_1E288F830;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SystemStatusUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB946CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusUILibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = SystemStatusUILibraryCore();
  if (!result)
    SystemStatusUILibrary_cold_1(&v1);
  return result;
}

void *getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  v6 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  if (!getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusUILibrary();
    v0 = dlsym(v1, "STUIBackgroundActivityIdentifiersForStyleOverrides");
    v4[3] = (uint64_t)v0;
    getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB947AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  uint64_t (*STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc)(uint64_t);

  STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc = (uint64_t (*)(uint64_t))getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc();
  if (!STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc)
    soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1();
  return STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc(a1);
}

void *getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  v6 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  if (!getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusUILibrary();
    v0 = dlsym(v1, "STUIStyleOverridesForBackgroundActivityIdentifiers");
    v4[3] = (uint64_t)v0;
    getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EB9486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(uint64_t a1)
{
  uint64_t (*STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc)(uint64_t);

  STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc = (uint64_t (*)(uint64_t))getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc();
  if (!STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc)
    soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1();
  return STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc(a1);
}

void sub_18EB95200(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void SBSEventObserverInitialize(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __SBSEventObserverInitialize_block_invoke;
  handler[3] = &unk_1E288FAA8;
  v6 = v3;
  v4 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", a1, handler);

}

void SBSEventObserverStartObservingEvent(void *a1)
{
  void *v1;
  const char *v2;
  id v3;

  v1 = a1;
  if (!CFEqual(a1, CFSTR("SignificantTimeChangeNotification")))
    v1 = (void *)objc_msgSend(CFSTR("com.apple.springboardservices.eventobserver.internal"), "stringByAppendingString:", v1);
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "Notification", v2);
  xpc_set_event();

}

uint64_t __SBSEventObserverGetDarwinNotificationFromEvent(const void *a1)
{
  if (CFEqual(a1, CFSTR("SignificantTimeChangeNotification")))
    return (uint64_t)a1;
  else
    return objc_msgSend(CFSTR("com.apple.springboardservices.eventobserver.internal"), "stringByAppendingString:", a1);
}

uint64_t SBSEventObserverStopObservingEvent(void *a1)
{
  void *v1;

  v1 = a1;
  if (!CFEqual(a1, CFSTR("SignificantTimeChangeNotification")))
    v1 = (void *)objc_msgSend(CFSTR("com.apple.springboardservices.eventobserver.internal"), "stringByAppendingString:", v1);
  objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
  return xpc_set_event();
}

void SBSEventObserverStopObservingAllEvents()
{
  id v0;

  v0 = (id)xpc_copy_event();
  xpc_dictionary_apply(v0, &__block_literal_global_39);

}

uint64_t SBSEventObserverGetValueForState(void *a1)
{
  void *v1;
  uint32_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v6;
  int out_token;

  v1 = a1;
  if (!CFEqual(a1, CFSTR("SignificantTimeChangeNotification")))
    v1 = (void *)objc_msgSend(CFSTR("com.apple.springboardservices.eventobserver.internal"), "stringByAppendingString:", v1);
  out_token = 0;
  v2 = notify_register_check((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"), &out_token);
  v3 = 0;
  if (!v2)
  {
    v6 = 0;
    if (notify_get_state(out_token, &v6))
      v4 = 1;
    else
      v4 = v6 == 0;
    v3 = !v4;
    notify_cancel(out_token);
  }
  return v3;
}

void _SBSAutolockTimerRegisterForExternalChangeNotification()
{
  if (_SBSAutolockTimerRegisterForExternalChangeNotification___once != -1)
    dispatch_once(&_SBSAutolockTimerRegisterForExternalChangeNotification___once, &__block_literal_global_40);
}

uint64_t _SBSAutolockTimerPostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1;

  v1 = state64;
  LODWORD(state64) = _SBSAutolockTimerPostExternalChangeNotification_token;
  if (_SBSAutolockTimerPostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.autolockfired", &_SBSAutolockTimerPostExternalChangeNotification_token), state64 = _SBSAutolockTimerPostExternalChangeNotification_token, _SBSAutolockTimerPostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.autolockfired");
  }
  return state64;
}

void sub_18EB95DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB96124(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SBSUIAppSetWantsVolumeButtonEvents(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetWantsVolumeButtonEvents(v2, a1);
}

uint64_t SBSUIAppSetWantsLockButtonEvents(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetWantsLockButtonEvents(v2, a1);
}

id SBSBackgroundActivityAssertionClientInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE144428);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_invalidateBackgroundActivityAssertionsWithIdentifiers_, 0, 0);

  return v0;
}

id SBBackgroundActivityAssertionServerInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE14A480);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_activateBackgroundActivityAssertions_reply_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_activateBackgroundActivityAssertions_reply_, 0, 1);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_deactivateBackgroundActivityAssertionsWithIdentifiers_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setStatusString_forAssertionWithIdentifier_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setStatusString_forAssertionWithIdentifier_, 1, 0);

  return v0;
}

void sub_18EB96750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB96990(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_18EB993D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB994F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EB9A504(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18EB9ABD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18EB9AD80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EB9B2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB9B414(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EB9C4B4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_18EB9DDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EB9DF18(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromPreferredNotificationListMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("inherit");
  else
    return off_1E288FEA8[a1 - 1];
}

const __CFString *NSStringFromPreferredLayout(uint64_t a1)
{
  if (a1)
    return CFSTR("centeredY");
  else
    return CFSTR("default");
}

const __CFString *NSStringFromRemoteContentBackgroundStyle(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("dark");
  else
    return off_1E288FEC8[a1];
}

uint64_t SBSAppSwitcherServiceRegistrationGetTypeID()
{
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1)
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  return SBSAppSwitcherServiceRegistrationGetTypeID_typeID;
}

void SBSAppSwitcherServiceRegistrationFinalize(uint64_t a1)
{
  mach_port_name_t v1;
  const void *v3;
  const void *v4;

  v1 = *(_DWORD *)(a1 + 80);
  if (v1)
  {
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v1, 1u, -1);
    *(_DWORD *)(a1 + 80) = 0;
    v3 = *(const void **)(a1 + 88);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 88) = 0;
    }
    v4 = *(const void **)(a1 + 96);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
}

uint64_t SBSAppSwitcherServiceRegistrationEqual(const __CFString *a1, const __CFString *a2)
{
  CFStringRef ComposedKey;
  CFStringRef v5;
  CFTypeID v6;
  CFTypeID v7;
  uint64_t v8;
  Boolean v9;

  ComposedKey = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a1);
  v5 = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a2);
  v6 = CFGetTypeID(a1);
  v7 = CFGetTypeID(a2);
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1)
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  v8 = SBSAppSwitcherServiceRegistrationGetTypeID_typeID;
  v9 = CFEqual(ComposedKey, v5);
  if (ComposedKey)
    CFRelease(ComposedKey);
  if (v5)
    CFRelease(v5);
  return (v8 == (v6 == v7)) & v9;
}

CFHashCode SBSAppSwitcherServiceRegistrationHash(const __CFString *a1)
{
  CFStringRef ComposedKey;
  CFHashCode v3;

  ComposedKey = _SBSAppSwitcherServiceRegistrationCreateComposedKey(a1);
  v3 = CFHash(a1[3].isa);
  if (ComposedKey)
    CFRelease(ComposedKey);
  return v3;
}

uint64_t SBSAppSwitcherServiceRegister(const __CFAllocator *a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t Instance;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  mach_port_name_t name;
  char v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD buffer[64];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      SBSAppSwitcherServiceRegister_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_13;
  }
  if (!a3)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      SBSAppSwitcherServiceRegister_cold_2(v8, v16, v17, v18, v19, v20, v21, v22);
LABEL_13:

    return 0;
  }
  if (SBSAppSwitcherServiceRegistrationGetTypeID_onceToken != -1)
    dispatch_once(&SBSAppSwitcherServiceRegistrationGetTypeID_onceToken, &__block_literal_global_51);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    name = 0;
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name))
      goto LABEL_8;
    *(_DWORD *)(Instance + 80) = name;
    *(_QWORD *)(Instance + 88) = CFStringCreateCopy(a1, a2);
    *(_QWORD *)(Instance + 96) = CFStringCreateCopy(a1, a3);
    memset(buffer, 0, 512);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    *(_OWORD *)v25 = 0u;
    v26 = 0u;
    CFStringGetCString(*(CFStringRef *)(Instance + 88), (char *)buffer, 1024, 0x8000100u);
    CFStringGetCString(*(CFStringRef *)(Instance + 96), v25, 1024, 0x8000100u);
    v7 = SBSSpringBoardServerPort();
    if (SBAppSwitcherServiceRegister(v7, *(unsigned int *)(Instance + 80), buffer, v25))
    {
LABEL_8:
      CFRelease((CFTypeRef)Instance);
      return 0;
    }
  }
  return Instance;
}

uint64_t SBSAppSwitcherServiceRegistrationGetBundleID(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 80))
      return *(_QWORD *)(result + 88);
    else
      return 0;
  }
  return result;
}

BOOL SBSAppSwitcherServiceRegistrationGetIsValid(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 80) != 0;
  return result;
}

uint64_t SBSAppSwitcherServiceRegistrationGetViewControllerClassName(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 80))
      return *(_QWORD *)(result + 96);
    else
      return 0;
  }
  return result;
}

CFStringRef _SBSAppSwitcherServiceRegistrationCreateComposedKey(const __CFString *a1)
{
  CFStringRef v1;
  void *v2;
  void *isa;
  const __CFArray *v4;
  _QWORD v6[3];

  v1 = a1;
  v6[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x193FF8644]();
    isa = v1[3].isa;
    v6[0] = v1[2].length;
    v6[1] = isa;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v1 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, CFSTR(":"));

    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

uint64_t SBSThermalWarningAssertionCreateForBundleID()
{
  return 0;
}

void SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)_requiredContextIdsForMedusaDragAndDrop;
  _requiredContextIdsForMedusaDragAndDrop = v1;

}

id SBSRequiredContextIdsForMedusaDragAndDropForSpotlightOnly()
{
  return (id)_requiredContextIdsForMedusaDragAndDrop;
}

uint64_t SBSEnableJindo()
{
  return 1;
}

const __CFString *NSStringFromSBSAccessoryType(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("Unknown");
  else
    return off_1E2890078[a1];
}

void sub_18EBA3868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EBA39E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EBA4C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w40_s40_s48(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  objc_storeStrong((id *)(a1 + 40), *((id *)a2 + 5));
  objc_storeStrong((id *)(a1 + 48), *((id *)a2 + 6));
}

void SBMachServiceInitialize(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  char IsUsable;
  NSObject *v13;
  NSObject *v14;
  void *f;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)a1;
  if (*(_QWORD *)(a1 + 40))
  {
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      SBMachServiceInitialize_cold_2(v1, v2, v3, v4, v5, v6, v7, v8);
LABEL_13:

    return;
  }
  if (!v1 || !*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 16))
  {
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      SBMachServiceInitialize_cold_1(v1, v2, v18, v19, v20, v21, v22, v23);
    goto LABEL_13;
  }
  v10 = *(unsigned int *)(a1 + 8);
  v11 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 8);
  IsUsable = BSMachPortIsUsable();
  SBLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((IsUsable & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 136446466;
      v25 = v1;
      v26 = 1024;
      v27 = v11;
      _os_log_impl(&dword_18EB52000, v14, OS_LOG_TYPE_INFO, "[SBMig] Service initialized: %{public}s (ID %d)", (uint8_t *)&v24, 0x12u);
    }

    v24 = 16;
    MEMORY[0x193FF856C](*MEMORY[0x1E0C83DA0], v10, 1, &v24, 1);
    f = (void *)dispatch_mach_create_f();
    dispatch_set_qos_class_fallback();
    v16 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = f;
    v17 = f;

    dispatch_mach_connect();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136446210;
      v25 = v1;
      _os_log_impl(&dword_18EB52000, v14, OS_LOG_TYPE_DEFAULT, "[SBMig] Service \"%{public}s\" cannot be initialized because the receive port is invalid.", (uint8_t *)&v24, 0xCu);
    }

  }
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t SBSUIActivateRemoteAlert(void *a1, void *a2)
{
  return SBSUIActivateRemoteAlertWithLifecycleNotifications(a1, a2, 0, 0);
}

uint64_t SBSUIActivateRemoteAlertWithLifecycleNotifications(void *a1, void *a2, void *a3, void *a4)
{
  void (**v7)(id, uint64_t);
  id v8;
  id v9;
  id v10;
  void *v11;
  SBSRemoteAlertDefinition *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  void (**v25)(id, uint64_t);
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  _SBSUIRemoteAlertServiceObserverHandle *v34;

  v7 = a3;
  v8 = a4;
  v9 = a1;
  if (v9)
  {
    v10 = a2;
    objc_msgSend(v10, "bs_safeStringForKey:", CFSTR("ViewControllerClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[SBSRemoteAlertDefinition initWithServiceName:viewControllerClassName:]([SBSRemoteAlertDefinition alloc], "initWithServiceName:viewControllerClassName:", v9, v11);
      -[SBSRemoteAlertDefinition setForCarPlay:](v12, "setForCarPlay:", objc_msgSend(v10, "bs_BOOLForKey:", CFSTR("CarDisplay")));
      +[SBSRemoteAlertConfigurationContext configurationContextWithLegacyAlertOptions:](SBSRemoteAlertConfigurationContext, "configurationContextWithLegacyAlertOptions:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSRemoteAlertHandle lookupHandlesForDefinition:creatingIfNone:configurationContext:](SBSRemoteAlertHandle, "lookupHandlesForDefinition:creatingIfNone:configurationContext:", v12, 1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__4;
        v33 = __Block_byref_object_dispose__4;
        v34 = objc_alloc_init(_SBSUIRemoteAlertServiceObserverHandle);
        objc_msgSend(v15, "registerObserver:", v30[5]);
        v16 = (void *)v30[5];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke;
        v26[3] = &unk_1E28901A8;
        v27 = v8;
        v28 = &v29;
        objc_msgSend(v16, "setDeactivationHandler:", v26);
        if (objc_msgSend(v15, "isActive"))
        {
          if (v7)
            v7[2](v7, 1);
        }
        else
        {
          v18 = (void *)v30[5];
          v21 = MEMORY[0x1E0C809B0];
          v22 = 3221225472;
          v23 = __SBSUIActivateRemoteAlertWithLifecycleNotifications_block_invoke_2;
          v24 = &unk_1E288D850;
          v25 = v7;
          objc_msgSend(v18, "setActivationHandler:", &v21);
          +[SBSRemoteAlertActivationContext activationContextWithLegacyAlertOptions:](SBSRemoteAlertActivationContext, "activationContextWithLegacyAlertOptions:", v10, v21, v22, v23, v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setShouldInvalidateWhenDeactivated:", 1);
          objc_msgSend(v15, "activateWithContext:", v19);

        }
        _Block_object_dispose(&v29, 8);

        v17 = 1;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_18EBA5900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBSUIIsNamedRemoteAlertCurrentlyActive(void *a1, void *a2)
{
  id v3;
  id v4;
  SBSRemoteAlertDefinition *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    v5 = -[SBSRemoteAlertDefinition initWithServiceName:viewControllerClassName:]([SBSRemoteAlertDefinition alloc], "initWithServiceName:viewControllerClassName:", v3, v4);
    +[SBSRemoteAlertHandle lookupHandlesForDefinition:creatingIfNone:](SBSRemoteAlertHandle, "lookupHandlesForDefinition:creatingIfNone:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

const __CFString *NSStringFromAnalyticsQueryName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("FolderStats");
  else
    return *(&off_1E2890220 + a1 - 1);
}

const __CFString *NSStringFromAnalyticsEventType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x43)
    return CFSTR("HomeButtonPressed");
  else
    return *(&off_1E2890490 + a1 - 1);
}

const __CFString *NSStringFromSBSAnalyticsActionButtonInteractionType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Pressed");
  if (a1 == 1)
    v1 = CFSTR("LongPressed");
  if (a1 == 2)
    return CFSTR("Suppressed");
  else
    return v1;
}

uint64_t _SBSGetIsAlive(int a1, _BYTE *a2, mach_msg_timeout_t a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v11 = 5395;
  *(_QWORD *)rcv_name_12 = 0x30D4000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    special_reply_port = rcv_name_8;
  }
  v7 = mach_msg((mach_msg_header_t *)&v11, 3162387, 0x18u, 0x30u, special_reply_port, a3, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 200100)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v8 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v9 = 1;
            else
              v9 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSDisplayIdentifierForPID(mach_port_t a1, mach_port_t a2, char *a3)
{
  mach_port_t special_reply_port;
  uint64_t v6;
  uint64_t msgh_remote_port;
  BOOL v8;
  mach_msg_header_t msg[44];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  *(_OWORD *)&msg[0].msgh_size = 0u;
  *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C804E8];
  msg[1].msgh_remote_port = a2;
  special_reply_port = mig_get_special_reply_port();
  msg[0].msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x30D4100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    special_reply_port = msg[0].msgh_local_port;
  }
  v6 = mach_msg(msg, 3162115, 0x24u, 0x434u, special_reply_port, 0, 0);
  msgh_remote_port = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (msg[0].msgh_id == 71)
      {
        msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 200101)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port)
              v8 = 1;
            else
              v8 = msg[1].msgh_remote_port == 0;
            if (!v8 && msg[0].msgh_size == 36)
              msgh_remote_port = msg[1].msgh_remote_port;
            else
              msgh_remote_port = 4294966996;
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        msgh_remote_port = 4294966996;
      }
      else
      {
        msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSDisplayIdentifiersForPID(int a1, int a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int msg;
  _BYTE msg_4[60];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg_4[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x30D4200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200102)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_27;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v9 = 0;
            *a3 = *(_QWORD *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSApplicationDisplayIdentifiers(int a1, char a2, char a3, _QWORD *a4, _DWORD *a5)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int msg;
  _BYTE msg_4[60];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  msg_4[32] = a3;
  *(_WORD *)&msg_4[33] = 0;
  msg_4[35] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x30D4300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x40u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200103)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v10 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v10 = 4294966996;
              else
                v10 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v10 = 4294966996;
          }
          goto LABEL_27;
        }
        v10 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v11 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v10 = 0;
            *a4 = *(_QWORD *)&msg_4[24];
            *a5 = v11;
            return v10;
          }
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v10;
}

uint64_t _SBSFrontmostApplicationDisplayIdentifier(mach_port_t a1, char *a2)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t msgh_remote_port;
  BOOL v7;
  mach_msg_header_t msg[44];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  special_reply_port = mig_get_special_reply_port();
  msg[0].msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x30D4400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    special_reply_port = msg[0].msgh_local_port;
  }
  v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (msg[0].msgh_id == 71)
      {
        msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 200104)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port)
              v7 = 1;
            else
              v7 = msg[1].msgh_remote_port == 0;
            if (!v7 && msg[0].msgh_size == 36)
              msgh_remote_port = msg[1].msgh_remote_port;
            else
              msgh_remote_port = 4294966996;
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        msgh_remote_port = 4294966996;
      }
      else
      {
        msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSBundlePathForDisplayIdentifier(mach_port_name_t a1, const char *a2, char *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v14 = 0x30D4500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x434u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v14) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v14) == 200105)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v15[0]) == 0;
            if (!v10 && rcv_name[1] == 36)
              v9 = LODWORD(v15[0]);
            else
              v9 = 4294966996;
            goto LABEL_30;
          }
          if (!rcv_name[2])
          {
            v9 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              v9 = 4294966996;
              if (DWORD2(v15[0]) <= 0x400
                && rcv_name[1] - 44 >= DWORD2(v15[0])
                && rcv_name[1] == ((DWORD2(v15[0]) + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)v15 + 12, 1024);
                return 0;
              }
            }
            goto LABEL_30;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v9;
}

uint64_t _SBSIsSystemApplication(int a1, _BYTE *a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BYTE msg[36];
  __int128 v12;

  *(_OWORD *)&msg[20] = 0u;
  v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x30D4700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 200107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSLocalizedApplicationNameForDisplayIdentifier(mach_port_name_t a1, const char *a2, char *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v14 = 0x30D4800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x434u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v14) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v14) == 200108)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v15[0]) == 0;
            if (!v10 && rcv_name[1] == 36)
              v9 = LODWORD(v15[0]);
            else
              v9 = 4294966996;
            goto LABEL_30;
          }
          if (!rcv_name[2])
          {
            v9 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              v9 = 4294966996;
              if (DWORD2(v15[0]) <= 0x400
                && rcv_name[1] - 44 >= DWORD2(v15[0])
                && rcv_name[1] == ((DWORD2(v15[0]) + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a3, (const char *)v15 + 12, 1024);
                return 0;
              }
            }
            goto LABEL_30;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v9;
}

uint64_t _SBSGetDisplayIdentifiersForExternalAccessoryProtocols(mach_port_name_t a1, const char *a2, _QWORD *a3, _DWORD *a4)
{
  int v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_port_name_t rcv_name[4];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  *(_OWORD *)rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((_QWORD *)&v15[0] + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v15[0] = 0x30D4900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 200109)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2])
                v11 = 4294966996;
              else
                v11 = LODWORD(v15[1]);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_30;
        }
        v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            v11 = 0;
            *a3 = *(_QWORD *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v11;
}

uint64_t _SBSGetIconState(int a1, char a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int msg;
  _BYTE msg_4[60];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x30D4A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200110)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_27;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v9 = 0;
            *a3 = *(_QWORD *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSGetPendingIconState(int a1, char a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int msg;
  _BYTE msg_4[60];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x30D4B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200111)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_27;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v9 = 0;
            *a3 = *(_QWORD *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSGetFlattenedIconState(int a1, char a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int msg;
  _BYTE msg_4[60];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x30D4C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 200112)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_27;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v9 = 0;
            *a3 = *(_QWORD *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSSetIconState(mach_port_t a1, uint64_t a2, int a3)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = a2;
  v11 = 16777472;
  v12 = a3;
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v8.msgh_bits = 2147489043;
  v8.msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(_QWORD *)&v8.msgh_voucher_port = 0x30D4D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v8);
    special_reply_port = v8.msgh_local_port;
  }
  v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1)
      return v6;
    if ((v8.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v8.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 200113)
  {
    v6 = 4294966995;
    goto LABEL_18;
  }
  v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v8.msgh_size != 36)
    goto LABEL_18;
  v6 = HIDWORD(v10);
  if (HIDWORD(v10))
    goto LABEL_18;
  return v6;
}

uint64_t _SBSSetApplicationBadgeNumber(mach_port_name_t a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  mach_msg_size_t v7;
  uint64_t v8;
  mach_port_name_t name[4];
  __int128 v11;
  _OWORD v12[65];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 0, 480);
  *(_OWORD *)name = 0u;
  v11 = 0u;
  *((_QWORD *)&v11 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v12 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v12 + 8, a2, 1024);
  LODWORD(v12[0]) = 0;
  DWORD1(v12[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = v6 + 44;
  *(_DWORD *)((char *)v12 + v6 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v11 = 0x30D4E00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v8 = mach_msg((mach_msg_header_t *)name, 2097153, v7, 0, 0, 0, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v8;
}

uint64_t _SBSSetApplicationBadgeString(mach_port_name_t a1, const char *a2, const char *a3)
{
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD);
  int v6;
  uint64_t v7;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  mach_msg_size_t v13;
  uint64_t v14;
  mach_port_name_t name[4];
  __int128 v17;
  _OWORD v18[129];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, 480);
  *(_OWORD *)name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  v5 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v6 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  else
    v6 = mig_strncpy((char *)v18 + 8, a2, 1024);
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  v8 = v7 + 48;
  v9 = (char *)name + v7;
  v10 = v9 - 1024;
  v11 = v9 + 48;
  if (v5)
    v12 = mig_strncpy_zerofill(v11, a3, 1024);
  else
    v12 = mig_strncpy(v11, a3, 1024);
  *((_DWORD *)v10 + 267) = v12;
  *((_DWORD *)v10 + 266) = 0;
  v13 = v8 + ((v12 + 3) & 0xFFFFFFFC);
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v17 = 0x30D4F00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v14 = mach_msg((mach_msg_header_t *)name, 2097153, v13, 0, 0, 0, 0);
  if ((v14 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v14;
}

uint64_t _SBSSetWantsVolumeButtonEvents(mach_port_t a1, int a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  int v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 200016;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetIconPNGData(mach_port_name_t a1, const char *a2, char a3, _QWORD *a4, _DWORD *a5)
{
  int v9;
  uint64_t v10;
  char *v11;
  mach_msg_size_t v12;
  mach_port_name_t special_reply_port;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_port_name_t rcv_name[4];
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  *(_OWORD *)rcv_name = 0u;
  memset(v19, 0, sizeof(v19));
  *((_QWORD *)&v19[0] + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v9 = mig_strncpy_zerofill((char *)&v19[1] + 8, a2, 1024);
  else
    v9 = mig_strncpy((char *)&v19[1] + 8, a2, 1024);
  LODWORD(v19[1]) = 0;
  DWORD1(v19[1]) = v9;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = (char *)rcv_name + v10;
  v11[40] = a3;
  *(_WORD *)(v11 + 41) = 0;
  v11[43] = 0;
  v12 = v10 + 44;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v19[0] = 0x30D5100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v14 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v12, 0x40u, special_reply_port, 0, 0);
  v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v14)
    {
      if (DWORD1(v19[0]) == 71)
      {
        v15 = 4294966988;
      }
      else if (DWORD1(v19[0]) == 200117)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v15 = 4294966996;
            if (LODWORD(v19[1]))
            {
              if (rcv_name[2])
                v15 = 4294966996;
              else
                v15 = LODWORD(v19[1]);
            }
          }
          else
          {
            v15 = 4294966996;
          }
          goto LABEL_30;
        }
        v15 = 4294966996;
        if (DWORD2(v19[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v19[1]) == 1)
        {
          v16 = DWORD2(v19[1]);
          if (DWORD2(v19[1]) == DWORD1(v20))
          {
            v15 = 0;
            *a4 = *(_QWORD *)((char *)v19 + 12);
            *a5 = v16;
            return v15;
          }
        }
      }
      else
      {
        v15 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v15;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v15 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v15;
}

uint64_t (*SpringBoardUtility_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 200018) >= 0xFFFFFFEE)
    return _SBMigSpringBoardUtility_subsystem[5 * (v1 - 200000) + 5];
  else
    return 0;
}

_DWORD *_XGetIsAlive(_DWORD *result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetIsAlive(result[3], (_BYTE *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

size_t _XDisplayIdentifierForPID(size_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v4 = *(unsigned int *)(result + 12);
  v5 = *(unsigned int *)(result + 32);
  v6 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v6;
  result = _SBMigDisplayIdentifierForPID(v4, v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = result;
  v7 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v7;
    result = strlen((const char *)(a2 + 44));
    if (!((result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = result + 1;
      *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

uint64_t _XDisplayIdentifiersForPID(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = a2 + 52;
  v5 = a2 + 28;
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned int *)(result + 32);
  v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  result = _SBMigDisplayIdentifiersForPID(v6, v7, v5, v4, v9);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XApplicationDisplayIdentifiers(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = a2 + 52;
  v5 = a2 + 28;
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned __int8 *)(result + 32);
  v8 = *(unsigned __int8 *)(result + 36);
  v9 = *(_OWORD *)(result + 76);
  v10[0] = *(_OWORD *)(result + 60);
  v10[1] = v9;
  result = _SBMigApplicationDisplayIdentifiers(v6, v7, v8, v5, v4, v10);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XFrontmostApplicationDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  result = (_DWORD *)_SBMigFrontmostApplicationDisplayIdentifier(v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v7 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v7;
    result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = (_DWORD)result + 1;
      *(_DWORD *)(a2 + 4) = (((_DWORD)result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XBundlePathForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[2];

  if ((*result & 0x80000000) != 0
    || (v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    v9 = -309;
    goto LABEL_12;
  }
  v11 = v3[3];
  v12 = *(_OWORD *)(v10 + 36);
  v14[0] = *(_OWORD *)(v10 + 20);
  v14[1] = v12;
  result = (_DWORD *)_SBMigBundlePathForDisplayIdentifier(v11, (uint64_t)(v3 + 10), a2 + 44, v14);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v13 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v13;
    result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = (_DWORD)result + 1;
      *(_DWORD *)(a2 + 4) = (((_DWORD)result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v13;
  return result;
}

_DWORD *_XIsSystemApplication(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)_SBMigIsSystemApplication(v6, a2 + 36, a2 + 40, v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

_DWORD *_XLocalizedApplicationNameForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[2];

  if ((*result & 0x80000000) != 0
    || (v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    v9 = -309;
    goto LABEL_12;
  }
  v11 = v3[3];
  v12 = *(_OWORD *)(v10 + 36);
  v14[0] = *(_OWORD *)(v10 + 20);
  v14[1] = v12;
  result = (_DWORD *)_SBMigLocalizedApplicationNameForDisplayIdentifier(v11, (uint64_t)(v3 + 10), a2 + 44, v14);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v13 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v13;
    result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = (_DWORD)result + 1;
      *(_DWORD *)(a2 + 4) = (((_DWORD)result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v13;
  return result;
}

_DWORD *_XGetDisplayIdentifiersForExternalAccessoryProtocols(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) != 0
    || (v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
    v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    goto LABEL_13;
  }
  v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    v9 = -309;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v11 = v3[3];
  v12 = *(_OWORD *)(v10 + 36);
  v13[0] = *(_OWORD *)(v10 + 20);
  v13[1] = v12;
  result = (_DWORD *)_SBMigGetDisplayIdentifiersForExternalAccessoryProtocols(v11, (uint64_t)(v3 + 10), (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), v13);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_13:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XGetIconState(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = (_DWORD *)(a2 + 52);
  v5 = (_QWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned __int8 *)(result + 32);
  v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  result = _SBMigGetIconState(v6, v7, v5, v4, v9);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XGetPendingIconState(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = (_DWORD *)(a2 + 52);
  v5 = (_QWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned __int8 *)(result + 32);
  v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  result = _SBMigGetPendingIconState(v6, v7, v5, v4, v9);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XGetFlattenedIconState(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = (_DWORD *)(a2 + 52);
  v5 = (_QWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned __int8 *)(result + 32);
  v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  result = _SBMigGetFlattenedIconState(v6, v7, v5, v4, v9);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XSetIconState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(unsigned int *)(a1 + 40), (_DWORD)v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        v6 = *(unsigned int *)(a1 + 12);
        v7 = *(_QWORD *)(a1 + 28);
        v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetIconState(v6, v7, v4, v9);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

_DWORD *_XSetApplicationBadgeNumber(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_16;
  v8 = 1064;
  if (result[1] < 0x428uLL)
    v8 = result[1];
  result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(unsigned int *)((char *)v3 + v6 + 40);
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (_DWORD *)_SBMigSetApplicationBadgeNumber(v11, (uint64_t)(v3 + 10), v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XSetApplicationBadgeString(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v8;
  char *v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  int v14;
  uint64_t v15;
  _BYTE *v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_17;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x30)
    goto LABEL_17;
  if (v4 > 0x830)
    goto LABEL_17;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_17;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 < v6 + 48)
    goto LABEL_17;
  v8 = v4 - v6;
  v9 = (char *)result + v6;
  v10 = *((_DWORD *)v9 + 11);
  v11 = v10 <= 0x400 && v8 - 48 >= v10;
  v12 = ((v10 + 3) & 0xFFFFFFFC) + 48;
  if (!v11 || v8 != v12)
    goto LABEL_17;
  v15 = 1064;
  if (result[1] < 0x428uLL)
    v15 = result[1];
  result = memchr(result + 10, 0, v15 - 40);
  if (result
    && ((v16 = v9 + 48, (char *)v3 + v4 - v16 >= 1024) ? (v17 = 1024) : (v17 = (char *)v3 + v4 - v16),
        (result = memchr(v16, 0, v17)) != 0))
  {
    v18 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v18 && *((_DWORD *)v18 + 1) > 0x1Fu)
    {
      v19 = v3[3];
      v20 = *(_OWORD *)(v18 + 36);
      v21[0] = *(_OWORD *)(v18 + 20);
      v21[1] = v20;
      result = (_DWORD *)_SBMigSetApplicationBadgeString(v19, (uint64_t)(v3 + 10), (uint64_t)v16, v21);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v14 = -309;
  }
  else
  {
LABEL_17:
    v14 = -304;
  }
  *(_DWORD *)(a2 + 32) = v14;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetWantsVolumeButtonEvents(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetWantsVolumeButtonEvents(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetIconPNGData(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_16;
  v8 = 1064;
  if (result[1] < 0x428uLL)
    v8 = result[1];
  result = memchr(result + 10, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    v10 = -304;
    goto LABEL_17;
  }
  v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    goto LABEL_18;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v11 = v3[3];
  v12 = *((unsigned __int8 *)v3 + v6 + 40);
  v13 = *(_OWORD *)(v9 + 36);
  v14[0] = *(_OWORD *)(v9 + 20);
  v14[1] = v13;
  result = (_DWORD *)_SBMigGetIconPNGData(v11, (uint64_t)(v3 + 10), v12, (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), v14);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_18:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t SpringBoardUtility_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 200018) >= 0xFFFFFFEE
    && (v5 = (void (*)(void))_SBMigSpringBoardUtility_subsystem[5 * (v4 - 200000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _SBSSuspendFrontmostApp(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186A000000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSInterruptKeybagRefetch(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186A100000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSGetActiveInterfaceOrientation(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186A200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100102)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSPresentPowerDownUI(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186A300000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSReboot(int a1)
{
  mach_port_name_t special_reply_port;
  uint64_t v3;
  uint64_t v4;
  _BYTE msg[36];
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186A400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1)
      return v4;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100104)
  {
    v4 = 4294966995;
    goto LABEL_19;
  }
  v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v4;
}

uint64_t _SBSShutDown(int a1)
{
  mach_port_name_t special_reply_port;
  uint64_t v3;
  uint64_t v4;
  _BYTE msg[36];
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186A500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1)
      return v4;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100105)
  {
    v4 = 4294966995;
    goto LABEL_19;
  }
  v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v4;
}

uint64_t _SBSEnableLockScreenBundle(mach_port_t a1, char a2, char *src, uint64_t a4, unsigned int a5)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  uint64_t v10;
  mach_msg_header_t name;
  int v13;
  uint64_t v14;
  int v15;
  _BYTE v16[24];
  _OWORD v17[64];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 448);
  *(_OWORD *)&v16[8] = 0u;
  memset(&name, 0, sizeof(name));
  v13 = 1;
  v14 = a4;
  v15 = 16777472;
  *(_QWORD *)v16 = a5;
  *(_QWORD *)&v16[4] = *MEMORY[0x1E0C804E8];
  v16[12] = a2;
  *(_WORD *)&v16[13] = 0;
  v16[15] = 0;
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v17, src, 1024);
  else
    v7 = mig_strncpy((char *)v17, src, 1024);
  *(_DWORD *)&v16[16] = 0;
  *(_DWORD *)&v16[20] = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 68;
  *(_DWORD *)((char *)v17 + v8) = a5;
  name.msgh_bits = -2147483629;
  name.msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(_QWORD *)&name.msgh_voucher_port = 0x186A600000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&name);
  v10 = mach_msg(&name, 2097153, v9, 0, 0, 0, 0);
  if ((v10 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name.msgh_local_port);
    mach_msg_destroy(&name);
  }
  return v10;
}

uint64_t _SBSGetScreenLockStatus(int a1, _BYTE *a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BYTE msg[36];
  __int128 v12;

  *(_OWORD *)&msg[20] = 0u;
  v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186A700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSLockDevice(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100008;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSShowNetworkPromptsIfNecessary(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100009;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetCurrentBacklightFactor(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186AA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100110)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSDimScreen(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100011;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSAddWebClipToHomeScreen(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_port_name_t rcv_name[4];
  __int128 v10;
  _OWORD v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v10 = 0u;
  *((_QWORD *)&v10 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v10 = 0x186AC00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100112)
  {
    v7 = 4294966995;
    goto LABEL_22;
  }
  v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0]))
    goto LABEL_22;
  return v7;
}

uint64_t _SBSRemoveWebClipFromHomeScreen(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_port_name_t rcv_name[4];
  __int128 v10;
  _OWORD v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v10 = 0u;
  *((_QWORD *)&v10 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v10 = 0x186AD00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100113)
  {
    v7 = 4294966995;
    goto LABEL_22;
  }
  v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0]))
    goto LABEL_22;
  return v7;
}

uint64_t _SBSReloadIconForIdentifier(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  uint64_t v5;
  mach_port_name_t name[4];
  __int128 v8;
  _OWORD v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v8 = 0x186AE00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v5 = mach_msg((mach_msg_header_t *)name, 2097153, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _SBSAddDownloadingIconForDisplayIdentifier(mach_port_name_t a1, const char *a2, const char *a3)
{
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD);
  int v6;
  uint64_t v7;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  mach_msg_size_t v13;
  mach_port_name_t special_reply_port;
  uint64_t v15;
  uint64_t v16;
  mach_port_name_t rcv_name[4];
  __int128 v19;
  _OWORD v20[129];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v20, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v19 = 0u;
  *((_QWORD *)&v19 + 1) = *MEMORY[0x1E0C804E8];
  v5 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v6 = mig_strncpy_zerofill((char *)v20 + 8, a2, 1024);
  else
    v6 = mig_strncpy((char *)v20 + 8, a2, 1024);
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  v8 = v7 + 48;
  v9 = (char *)rcv_name + v7;
  v10 = v9 - 1024;
  v11 = v9 + 48;
  if (v5)
    v12 = mig_strncpy_zerofill(v11, a3, 1024);
  else
    v12 = mig_strncpy(v11, a3, 1024);
  *((_DWORD *)v10 + 267) = v12;
  *((_DWORD *)v10 + 266) = 0;
  v13 = v8 + ((v12 + 3) & 0xFFFFFFFC);
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v19 = 0x186AF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v15 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v13, 0x2Cu, special_reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    goto LABEL_20;
  if ((_DWORD)v15)
  {
    mig_dealloc_special_reply_port();
LABEL_20:
    if ((v16 - 268435459) > 1)
      return v16;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v16;
  }
  if (DWORD1(v19) == 71)
  {
    v16 = 4294966988;
    goto LABEL_25;
  }
  if (DWORD1(v19) != 100115)
  {
    v16 = 4294966995;
    goto LABEL_25;
  }
  v16 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_25;
  if (rcv_name[1] != 36)
    goto LABEL_25;
  if (rcv_name[2])
    goto LABEL_25;
  v16 = LODWORD(v20[0]);
  if (LODWORD(v20[0]))
    goto LABEL_25;
  return v16;
}

uint64_t _SBSScrollToIconWithDisplayIdentifier(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  uint64_t v9;
  mach_port_name_t name[4];
  __int128 v12;
  _OWORD v13[65];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, 480);
  *(_OWORD *)name = 0u;
  v12 = 0u;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v12 = 0x186B000000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v9 = mach_msg((mach_msg_header_t *)name, 2097153, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _SBSGetNowPlayingAppBundleIdentifier(mach_port_t a1, char *a2)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t msgh_remote_port;
  BOOL v7;
  mach_msg_header_t msg[44];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  special_reply_port = mig_get_special_reply_port();
  msg[0].msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x186B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    special_reply_port = msg[0].msgh_local_port;
  }
  v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (msg[0].msgh_id == 71)
      {
        msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 100117)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port)
              v7 = 1;
            else
              v7 = msg[1].msgh_remote_port == 0;
            if (!v7 && msg[0].msgh_size == 36)
              msgh_remote_port = msg[1].msgh_remote_port;
            else
              msgh_remote_port = 4294966996;
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        msgh_remote_port = 4294966996;
      }
      else
      {
        msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSGetTopButtonFrames(int a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  mach_port_name_t special_reply_port;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  _BYTE msg[36];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186B200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v18 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x6Cu, special_reply_port, 0, 0);
  v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v18)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v19 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100118)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 100)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v19 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v23;
                *a3 = *((_QWORD *)&v23 + 1);
                *a4 = v24;
                *a5 = *((_QWORD *)&v24 + 1);
                *a6 = v25;
                *a7 = *((_QWORD *)&v25 + 1);
                *a8 = v26;
                *a9 = *((_QWORD *)&v26 + 1);
                return v19;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v20 = 1;
            else
              v20 = *(_DWORD *)&msg[32] == 0;
            if (v20)
              v19 = 4294966996;
            else
              v19 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v19 = 4294966996;
      }
      else
      {
        v19 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v19;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v19 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v19;
}

uint64_t _SBSSetApplicationNetworkFlags(int a1, char a2, char a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  _BYTE msg[36];
  uint64_t v9;

  *(_OWORD *)&msg[20] = 0u;
  v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  LOBYTE(v9) = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186B300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v5)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v6 - 268435459) > 1)
      return v6;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v6;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v6 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 100119)
  {
    v6 = 4294966995;
    goto LABEL_19;
  }
  v6 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v6 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v6;
}

uint64_t _SBSGetApplicationNetworkFlags(int a1, _BYTE *a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BYTE msg[36];
  __int128 v12;

  *(_OWORD *)&msg[20] = 0u;
  v12 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186B400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100120)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v12;
                *a3 = BYTE4(v12);
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _SBSAppSwitcherServiceRegister(mach_port_t a1, int a2, char *src, const char *a4)
{
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD);
  int v7;
  uint64_t v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  mach_msg_size_t v14;
  mach_port_t special_reply_port;
  uint64_t v16;
  uint64_t v17;
  mach_msg_header_t rcv_name;
  int v20;
  int v21;
  __int128 v22;
  _OWORD v23[129];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  memset(v23, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v20 = 1;
  v21 = a2;
  DWORD1(v22) = 1310720;
  *((_QWORD *)&v22 + 1) = *MEMORY[0x1E0C804E8];
  v6 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v23 + 8, src, 1024);
  else
    v7 = mig_strncpy((char *)v23 + 8, src, 1024);
  LODWORD(v23[0]) = 0;
  DWORD1(v23[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 64;
  v10 = (char *)&rcv_name + v8;
  v11 = v10 - 1024;
  v12 = v10 + 64;
  if (v6)
    v13 = mig_strncpy_zerofill(v12, a4, 1024);
  else
    v13 = mig_strncpy(v12, a4, 1024);
  *((_DWORD *)v11 + 271) = v13;
  *((_DWORD *)v11 + 270) = 0;
  v14 = v9 + ((v13 + 3) & 0xFFFFFFFC);
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186B500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v16 = mach_msg(&rcv_name, 3162115, v14, 0x2Cu, special_reply_port, 0, 0);
  v17 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
    goto LABEL_20;
  if ((_DWORD)v16)
  {
    mig_dealloc_special_reply_port();
LABEL_20:
    if ((v17 - 268435459) > 1)
      return v17;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v17;
  }
  if (rcv_name.msgh_id == 71)
  {
    v17 = 4294966988;
    goto LABEL_25;
  }
  if (rcv_name.msgh_id != 100121)
  {
    v17 = 4294966995;
    goto LABEL_25;
  }
  v17 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_25;
  if (rcv_name.msgh_size != 36)
    goto LABEL_25;
  if (rcv_name.msgh_remote_port)
    goto LABEL_25;
  v17 = v22;
  if ((_DWORD)v22)
    goto LABEL_25;
  return v17;
}

uint64_t _SBSSetVoiceControlEnabled(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100022;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSSetInterceptsMenuButton(mach_port_t a1, char a2, char a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  char v7;
  __int16 v8;
  char v9;
  char v10;
  __int16 v11;
  char v12;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = 0;
  v9 = 0;
  v10 = a3;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100023;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSSetWantsLockButtonEvents(mach_port_t a1, int a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  int v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100024;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetMediaVolume(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186B900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100125)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSSetMediaVolume(mach_port_t a1, float a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  float v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100026;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetHomeScreenIconMetrics(int a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  mach_port_name_t special_reply_port;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  int v25;
  int v26;
  int v27;
  int v28;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[20];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  *(_OWORD *)&rcv_name_12[4] = 0u;
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v28 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186BB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v28);
    special_reply_port = rcv_name_8;
  }
  v21 = mach_msg((mach_msg_header_t *)&v28, 3162115, 0x18u, 0x68u, special_reply_port, 0, 0);
  v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v21)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v22 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100127)
      {
        if ((v28 & 0x80000000) == 0)
        {
          if (rcv_name == 96)
          {
            if (!rcv_name_4)
            {
              v22 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = v33;
                *a3 = *((_QWORD *)&v33 + 1);
                *a4 = v34;
                *a5 = *((_QWORD *)&v34 + 1);
                v25 = DWORD1(v35);
                *a6 = v35;
                *a7 = v25;
                v26 = HIDWORD(v35);
                *a8 = DWORD2(v35);
                *a9 = v26;
                v27 = DWORD1(v36);
                *a10 = v36;
                *a11 = v27;
                *a12 = DWORD2(v36);
                return v22;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v23 = 1;
            else
              v23 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v23)
              v22 = 4294966996;
            else
              v22 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v22 = 4294966996;
      }
      else
      {
        v22 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v28);
      return v22;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v22 - 268435459) <= 1)
  {
    if ((v28 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v22;
}

uint64_t _SBSFlashColor(mach_port_t a1, float a2, float a3, float a4)
{
  mach_port_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_msg_header_t v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;

  v10 = *MEMORY[0x1E0C804E8];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v9.msgh_bits = 5395;
  v9.msgh_remote_port = a1;
  v9.msgh_local_port = special_reply_port;
  *(_QWORD *)&v9.msgh_voucher_port = 0x186BC00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v9);
    special_reply_port = v9.msgh_local_port;
  }
  v6 = mach_msg(&v9, 3162115, 0x2Cu, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((v9.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v9.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v9);
    return v7;
  }
  if (v9.msgh_id == 71)
  {
    v7 = 4294966988;
    goto LABEL_18;
  }
  if (v9.msgh_id != 100128)
  {
    v7 = 4294966995;
    goto LABEL_18;
  }
  v7 = 4294966996;
  if ((v9.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v9.msgh_size != 36)
    goto LABEL_18;
  v7 = LODWORD(v11);
  if (v11 != 0.0)
    goto LABEL_18;
  return v7;
}

uint64_t _SBSProgrammaticSwitchAppGestureMoveToLeft(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186BD00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSProgrammaticSwitchAppGestureMoveToRight(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186BE00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _SBSSetVoiceRecognitionAudioInputPaths(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EBC9870;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAssistantRecognitionStrings(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EBC9880;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAlertSuppressionContexts(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EBC9890;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAlertSuppressionContextsBySectionIdentifier(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EBC98A0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _SBSSetAppIsConnectedToEA(mach_port_t a1, int a2, char a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  int v7;
  char v8;
  __int16 v9;
  char v10;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100035;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSLockDeviceAndFeatures(mach_port_t a1, char a2, char a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  char v7;
  __int16 v8;
  char v9;
  char v10;
  __int16 v11;
  char v12;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = 0;
  v9 = 0;
  v10 = a3;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100036;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _SBSActivateAssistantWithContext(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  mach_port_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_msg_header_t msg;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 1;
  v11 = a3;
  v12 = 16777472;
  v13 = a4;
  v14 = *MEMORY[0x1E0C804E8];
  v15 = a2;
  v16 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186C500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v6 = mach_msg(&msg, 3162115, 0x3Cu, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
LABEL_19:
    mach_msg_destroy(&msg);
    return v7;
  }
  if (msg.msgh_id == 71)
  {
    v7 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 100137)
  {
    v7 = 4294966995;
    goto LABEL_19;
  }
  v7 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_19;
  if (msg.msgh_size != 36)
    goto LABEL_19;
  if (msg.msgh_remote_port)
    goto LABEL_19;
  v7 = HIDWORD(v11);
  if (HIDWORD(v11))
    goto LABEL_19;
  return v7;
}

uint64_t _SBSSetProceduralWallpaper(mach_port_t a1, const char *a2, char a3, uint64_t a4, unsigned int a5)
{
  int v8;
  uint64_t v9;
  char *v10;
  mach_msg_size_t v11;
  mach_port_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  mach_msg_header_t rcv_name;
  int v17;
  uint64_t v18;
  int v19;
  _BYTE v20[24];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  *(_OWORD *)&v20[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v17 = 1;
  v18 = a4;
  v19 = 16777472;
  *(_QWORD *)v20 = a5;
  *(_QWORD *)&v20[4] = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v8 = mig_strncpy_zerofill(&v20[20], a2, 1024);
  else
    v8 = mig_strncpy(&v20[20], a2, 1024);
  *(_DWORD *)&v20[12] = 0;
  *(_DWORD *)&v20[16] = v8;
  v9 = (v8 + 3) & 0xFFFFFFFC;
  v10 = (char *)&rcv_name + v9;
  v10[60] = a3;
  *(_WORD *)(v10 + 61) = 0;
  v10[63] = 0;
  v11 = v9 + 68;
  *((_DWORD *)v10 + 16) = a5;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186C600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v13 = mach_msg(&rcv_name, 3162115, v11, 0x2Cu, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v13)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v14 - 268435459) > 1)
      return v14;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v14;
  }
  if (rcv_name.msgh_id == 71)
  {
    v14 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100138)
  {
    v14 = 4294966995;
    goto LABEL_22;
  }
  v14 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name.msgh_size != 36)
    goto LABEL_22;
  if (rcv_name.msgh_remote_port)
    goto LABEL_22;
  v14 = HIDWORD(v18);
  if (HIDWORD(v18))
    goto LABEL_22;
  return v14;
}

uint64_t _SBSSetWallpaperImageForLocations(mach_port_t a1, uint64_t a2, int a3, char a4, char a5, char a6, char a7, char *src, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, uint64_t a19, unsigned int a20,_BYTE *a21)
{
  int v22;
  uint64_t v23;
  char *v24;
  mach_msg_size_t v25;
  mach_port_t special_reply_port;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  mach_msg_header_t rcv_name;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  _BYTE v38[24];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[65];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  memset(v42, 0, 384);
  v40 = 0u;
  v41 = 0u;
  *(_OWORD *)&v38[8] = 0u;
  v39 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v32 = 2;
  v33 = a2;
  v34 = 16777472;
  v35 = a3;
  v36 = a19;
  v37 = 16777472;
  *(_QWORD *)v38 = a20;
  *(_QWORD *)&v38[4] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v38[12] = a3;
  v38[16] = a4;
  *(_WORD *)&v38[17] = 0;
  v38[19] = 0;
  *(float *)&v38[20] = a9;
  *(_QWORD *)&v39 = __PAIR64__(LODWORD(a11), LODWORD(a10));
  *((_QWORD *)&v39 + 1) = __PAIR64__(LODWORD(a13), LODWORD(a12));
  *(float *)&v40 = a14;
  BYTE4(v40) = a5;
  BYTE7(v40) = 0;
  *(_WORD *)((char *)&v40 + 5) = 0;
  BYTE8(v40) = a6;
  BYTE11(v40) = 0;
  *(_WORD *)((char *)&v40 + 9) = 0;
  BYTE12(v40) = a7;
  HIBYTE(v40) = 0;
  *(_WORD *)((char *)&v40 + 13) = 0;
  *(double *)&v41 = a15;
  if (MEMORY[0x1E0C84128])
    v22 = mig_strncpy_zerofill((char *)v42, src, 1024);
  else
    v22 = mig_strncpy((char *)v42, src, 1024);
  DWORD2(v41) = 0;
  HIDWORD(v41) = v22;
  v23 = (v22 + 3) & 0xFFFFFFFC;
  v24 = (char *)&rcv_name + v23;
  v24[128] = a16;
  *(_WORD *)(v24 + 129) = 0;
  v24[131] = 0;
  v24[132] = a17;
  *(_WORD *)(v24 + 133) = 0;
  v24[135] = 0;
  v24[136] = a18;
  *(_WORD *)(v24 + 137) = 0;
  v24[139] = 0;
  v25 = v23 + 144;
  *((_DWORD *)v24 + 35) = a20;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186C700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v27 = mach_msg(&rcv_name, 3162115, v25, 0x30u, special_reply_port, 0, 0);
  v28 = v27;
  if ((v27 - 268435458) > 0xE || ((1 << (v27 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v27)
    {
      if (rcv_name.msgh_id == 71)
      {
        v28 = 4294966988;
      }
      else if (rcv_name.msgh_id == 100139)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              v28 = HIDWORD(v33);
              if (!HIDWORD(v33))
              {
                *a21 = v34;
                return v28;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port)
              v29 = 1;
            else
              v29 = HIDWORD(v33) == 0;
            if (v29)
              v28 = 4294966996;
            else
              v28 = HIDWORD(v33);
            goto LABEL_28;
          }
        }
        v28 = 4294966996;
      }
      else
      {
        v28 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v28;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v28 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    goto LABEL_28;
  }
  return v28;
}

uint64_t _SBSSetWallpaperImageSurfaceForLocations(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, char a8, float a9, float a10, float a11, float a12, float a13, float a14, double a15, char a16, char a17, char a18, char *src, char a20,char a21,char a22,uint64_t a23,int a24,_BYTE *a25)
{
  int v26;
  uint64_t v27;
  char *v28;
  mach_msg_size_t v29;
  mach_port_t special_reply_port;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  mach_msg_header_t rcv_name;
  int v36;
  int v37;
  __int128 v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[32];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  *(_OWORD *)&v51[16] = 0u;
  v52 = 0u;
  v50 = 0u;
  *(_OWORD *)v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v36 = 5;
  v37 = a2;
  DWORD1(v38) = 1245184;
  DWORD2(v38) = a3;
  v39 = 1245184;
  v40 = a4;
  v41 = 16777472;
  v42 = a5;
  v43 = a6;
  v44 = 16777472;
  v45 = a7;
  v46 = a23;
  v47 = 16777472;
  LODWORD(v48) = a24;
  *(_QWORD *)((char *)&v48 + 4) = *MEMORY[0x1E0C804E8];
  HIDWORD(v48) = a5;
  LODWORD(v49) = a7;
  BYTE4(v49) = a8;
  BYTE7(v49) = 0;
  *(_WORD *)((char *)&v49 + 5) = 0;
  *((_QWORD *)&v49 + 1) = __PAIR64__(LODWORD(a10), LODWORD(a9));
  *(_QWORD *)&v50 = __PAIR64__(LODWORD(a12), LODWORD(a11));
  *((_QWORD *)&v50 + 1) = __PAIR64__(LODWORD(a14), LODWORD(a13));
  v51[0] = a16;
  v51[3] = 0;
  *(_WORD *)&v51[1] = 0;
  v51[4] = a17;
  v51[7] = 0;
  *(_WORD *)&v51[5] = 0;
  v51[8] = a18;
  v51[11] = 0;
  *(_WORD *)&v51[9] = 0;
  *(double *)&v51[12] = a15;
  if (MEMORY[0x1E0C84128])
    v26 = mig_strncpy_zerofill(&v51[28], src, 1024);
  else
    v26 = mig_strncpy(&v51[28], src, 1024);
  *(_DWORD *)&v51[20] = 0;
  *(_DWORD *)&v51[24] = v26;
  v27 = (v26 + 3) & 0xFFFFFFFC;
  v28 = (char *)&rcv_name + v27;
  v28[172] = a20;
  *(_WORD *)(v28 + 173) = 0;
  v28[175] = 0;
  v28[176] = a21;
  *(_WORD *)(v28 + 177) = 0;
  v28[179] = 0;
  v28[180] = a22;
  *(_WORD *)(v28 + 181) = 0;
  v28[183] = 0;
  v29 = v27 + 188;
  *((_DWORD *)v28 + 46) = a24;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186C800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v31 = mach_msg(&rcv_name, 3162115, v29, 0x30u, special_reply_port, 0, 0);
  v32 = v31;
  if ((v31 - 268435458) > 0xE || ((1 << (v31 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v31)
    {
      if (rcv_name.msgh_id == 71)
      {
        v32 = 4294966988;
      }
      else if (rcv_name.msgh_id == 100140)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              v32 = v38;
              if (!(_DWORD)v38)
              {
                *a25 = BYTE4(v38);
                return v32;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port)
              v33 = 1;
            else
              v33 = (_DWORD)v38 == 0;
            if (v33)
              v32 = 4294966996;
            else
              v32 = v38;
            goto LABEL_28;
          }
        }
        v32 = 4294966996;
      }
      else
      {
        v32 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v32;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v32 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    goto LABEL_28;
  }
  return v32;
}

uint64_t _SBSClearWallpaperAsset(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186C900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100141)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSGetWallpaperOptions(int a1, char a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _BYTE *a9, _BYTE *a10, _BYTE *a11, _QWORD *a12, _QWORD *a13, _DWORD *a14)
{
  mach_port_name_t special_reply_port;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _BYTE msg[36];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&msg[20] = 0u;
  v30 = 0u;
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186CA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v22 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x6Cu, special_reply_port, 0, 0);
  v23 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v22)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v23 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100142)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v23 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v23 = 4294966996;
              else
                v23 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v23 = 4294966996;
          }
          goto LABEL_27;
        }
        v23 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 100 && !*(_DWORD *)&msg[8] && BYTE3(v30) == 1)
        {
          v24 = DWORD1(v30);
          if (DWORD1(v30) == HIDWORD(v33))
          {
            v23 = 0;
            v25 = DWORD1(v31);
            *a3 = v31;
            *a4 = v25;
            v26 = HIDWORD(v31);
            *a5 = DWORD2(v31);
            *a6 = v26;
            v27 = DWORD1(v32);
            *a7 = v32;
            *a8 = v27;
            *a9 = BYTE8(v32);
            *a10 = BYTE12(v32);
            *a11 = v33;
            *a12 = *(_QWORD *)((char *)&v33 + 4);
            *a13 = *(_QWORD *)&msg[28];
            *a14 = v24;
            return v23;
          }
        }
      }
      else
      {
        v23 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v23;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v23 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_27;
  }
  return v23;
}

uint64_t _SBSSetWallpaperVariant(int a1, char a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  rcv_name[28] = a2;
  *(_WORD *)&rcv_name[29] = 0;
  rcv_name[31] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x186CB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 100143)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = rcv_name[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
            goto LABEL_25;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((v10 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_25;
  }
  return v7;
}

uint64_t _SBSGetWallpaperLegibilitySettings(int a1, char a2, _QWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int msg;
  _BYTE msg_4[60];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  msg_4[28] = a2;
  *(_WORD *)&msg_4[29] = 0;
  msg_4[31] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x186CC00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 100144)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg_4[28];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_27;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          v10 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            v9 = 0;
            *a3 = *(_QWORD *)&msg_4[24];
            *a4 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_27;
  }
  return v9;
}

uint64_t _SBSAddAlertItemsSuppressionAssertion(mach_port_t a1, const char *a2, int a3)
{
  int v4;
  mach_msg_size_t v5;
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t rcv_name;
  int v11;
  int v12;
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v11 = 1;
  v12 = a3;
  DWORD1(v13) = 1310720;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186CD00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100145)
  {
    v8 = 4294966995;
    goto LABEL_22;
  }
  v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name.msgh_size != 36)
    goto LABEL_22;
  if (rcv_name.msgh_remote_port)
    goto LABEL_22;
  v8 = v13;
  if ((_DWORD)v13)
    goto LABEL_22;
  return v8;
}

uint64_t _SBSIsReachabilityEnabled(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x186CF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 100147)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _SBSSetReachabilityEnabled(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100048;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSOverrideDisplayedDate(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_port_name_t rcv_name[4];
  __int128 v10;
  _OWORD v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v10 = 0u;
  *((_QWORD *)&v10 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v10 = 0x186D100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100149)
  {
    v7 = 4294966995;
    goto LABEL_22;
  }
  v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0]))
    goto LABEL_22;
  return v7;
}

uint64_t _SBSSetIdleText(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_port_name_t rcv_name[4];
  __int128 v10;
  _OWORD v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v10 = 0u;
  *((_QWORD *)&v10 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v10 = 0x186D200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v6 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v4, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    v7 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v10) != 100150)
  {
    v7 = 4294966995;
    goto LABEL_22;
  }
  v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0]))
    goto LABEL_22;
  return v7;
}

uint64_t _SBSTagTouchForTypingMenu(mach_port_t a1, int a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  int v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100052;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSAcquireFocusPreventingFullScreenPresentationAssertion(mach_port_t a1, const char *a2, int a3)
{
  int v4;
  mach_msg_size_t v5;
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t rcv_name;
  int v11;
  int v12;
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  memset(v14, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v11 = 1;
  v12 = a3;
  DWORD1(v13) = 1310720;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v4 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v4 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v4;
  v5 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x186D500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v7 = mach_msg(&rcv_name, 3162115, v5, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_22:
    mach_msg_destroy(&rcv_name);
    return v8;
  }
  if (rcv_name.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_22;
  }
  if (rcv_name.msgh_id != 100153)
  {
    v8 = 4294966995;
    goto LABEL_22;
  }
  v8 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name.msgh_size != 36)
    goto LABEL_22;
  if (rcv_name.msgh_remote_port)
    goto LABEL_22;
  v8 = v13;
  if ((_DWORD)v13)
    goto LABEL_22;
  return v8;
}

uint64_t _SBSSetAllApplicationsShowProgress(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  uint64_t v4;
  mach_msg_header_t msg;
  uint64_t v7;
  int v8;

  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100058;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v4 = mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v4;
}

uint64_t _SBSSetAllApplicationsShowSyncIndicator(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  uint64_t v4;
  mach_msg_header_t msg;
  uint64_t v7;
  int v8;

  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100059;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v4 = mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v4;
}

uint64_t _SBSSetShowsOverridesForRecording(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 100060;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _SBSGetWallpaperPreviewSurface(int a1, char a2, int a3, int a4, _DWORD *a5, double a6)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[36];
  int v13;
  uint64_t v14;
  char v15;
  __int16 v16;
  char v17;
  double v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a4;
  v13 = 1245184;
  v14 = *MEMORY[0x1E0C804E8];
  v15 = a2;
  v16 = 0;
  v17 = 0;
  v18 = a6;
  v19 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0x186DD00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100161)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v10 = 4294966996;
              else
                v10 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v10 = 4294966996;
          }
          goto LABEL_26;
        }
        v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 40 && !*(_DWORD *)&msg[8] && HIWORD(v13) << 16 == 1114112)
        {
          v10 = 0;
          *a5 = *(_DWORD *)&msg[28];
          return v10;
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_26;
  }
  return v10;
}

uint64_t _SBSGetWallpaperPreview(mach_port_t a1, char a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7, double a8)
{
  mach_port_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  double v23;
  int v24;
  int v25;

  v17 = 1;
  v18 = a4;
  v19 = 16777472;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  LOBYTE(v22) = a2;
  *(_WORD *)((char *)&v22 + 1) = 0;
  HIBYTE(v22) = 0;
  v23 = a8;
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x186DE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 3162115, 0x48u, 0x40u, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (msg.msgh_id == 100162)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            v13 = 4294966996;
            if (HIDWORD(v18))
            {
              if (msg.msgh_remote_port)
                v13 = 4294966996;
              else
                v13 = HIDWORD(v18);
            }
          }
          else
          {
            v13 = 4294966996;
          }
          goto LABEL_27;
        }
        v13 = 4294966996;
        if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
        {
          v14 = v20;
          if (v20 == v22)
          {
            v13 = 0;
            *a6 = v18;
            *a7 = v14;
            return v13;
          }
        }
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_27;
  }
  return v13;
}

uint64_t _SBSSetWallpaperOptionsForLocations(mach_port_name_t a1, char a2, char a3, char a4, char *src, char a6, _BYTE *a7, float a8, float a9, float a10, float a11, float a12, float a13, double a14)
{
  int v17;
  uint64_t v18;
  char *v19;
  mach_msg_size_t v20;
  mach_port_name_t special_reply_port;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  mach_port_name_t rcv_name[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[64];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  memset(v31, 0, 432);
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v27 = 0u;
  *((_QWORD *)&v27 + 1) = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&v28 = __PAIR64__(LODWORD(a9), LODWORD(a8));
  *((_QWORD *)&v28 + 1) = __PAIR64__(LODWORD(a11), LODWORD(a10));
  *(_QWORD *)&v29 = __PAIR64__(LODWORD(a13), LODWORD(a12));
  BYTE8(v29) = a2;
  *(_WORD *)((char *)&v29 + 9) = 0;
  BYTE11(v29) = 0;
  BYTE12(v29) = a3;
  *(_WORD *)((char *)&v29 + 13) = 0;
  HIBYTE(v29) = 0;
  LOBYTE(v30) = a4;
  *(_WORD *)((char *)&v30 + 1) = 0;
  BYTE3(v30) = 0;
  *(double *)((char *)&v30 + 4) = a14;
  if (MEMORY[0x1E0C84128])
    v17 = mig_strncpy_zerofill((char *)v31 + 4, src, 1024);
  else
    v17 = mig_strncpy((char *)v31 + 4, src, 1024);
  HIDWORD(v30) = 0;
  LODWORD(v31[0]) = v17;
  v18 = (v17 + 3) & 0xFFFFFFFC;
  v19 = (char *)rcv_name + v18;
  v19[84] = a6;
  *(_WORD *)(v19 + 85) = 0;
  v19[87] = 0;
  v20 = v18 + 88;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v27 = 0x186DF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v22 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v20, 0x30u, special_reply_port, 0, 0);
  v23 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v22)
    {
      if (DWORD1(v27) == 71)
      {
        v23 = 4294966988;
      }
      else if (DWORD1(v27) == 100163)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v23 = v28;
              if (!(_DWORD)v28)
              {
                *a7 = BYTE4(v28);
                return v23;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v24 = 1;
            else
              v24 = (_DWORD)v28 == 0;
            if (v24)
              v23 = 4294966996;
            else
              v23 = v28;
            goto LABEL_28;
          }
        }
        v23 = 4294966996;
      }
      else
      {
        v23 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v23;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v23 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v23;
}

uint64_t _SBSGetBatteryAwakeTime(mach_port_t a1, char *a2)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t msgh_remote_port;
  BOOL v7;
  mach_msg_header_t msg[44];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  special_reply_port = mig_get_special_reply_port();
  msg[0].msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x186E000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    special_reply_port = msg[0].msgh_local_port;
  }
  v5 = mach_msg(msg, 3162115, 0x18u, 0x434u, special_reply_port, 0, 0);
  msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (msg[0].msgh_id == 71)
      {
        msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 100164)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 1069 <= 0xFFFFFBFE)
          {
            if (msg[0].msgh_remote_port)
              v7 = 1;
            else
              v7 = msg[1].msgh_remote_port == 0;
            if (!v7 && msg[0].msgh_size == 36)
              msgh_remote_port = msg[1].msgh_remote_port;
            else
              msgh_remote_port = 4294966996;
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x400
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 1024);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        msgh_remote_port = 4294966996;
      }
      else
      {
        msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t _SBSGetRecentSleepsWakes(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x186E100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 100165)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSGetScheduledPowerEvents(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x186E200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 100166)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t _SBSGetBatteryUsageTimesInSeconds(int a1, _DWORD *a2, _DWORD *a3, _BYTE *a4, _BYTE *a5)
{
  mach_port_name_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  _BYTE msg[36];
  __int128 v17;
  uint64_t v18;

  v18 = 0;
  v17 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x186E300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v11 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x3Cu, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 100167)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 52)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v12 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v15 = DWORD1(v17);
                *a2 = v17;
                *a3 = v15;
                *a4 = BYTE8(v17);
                *a5 = BYTE12(v17);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v13 = 1;
            else
              v13 = *(_DWORD *)&msg[32] == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v12;
}

uint64_t (*SpringBoardUser_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 100068) >= 0xFFFFFFBC)
    return _SBMigSpringBoardUser_subsystem[5 * (v1 - 100000) + 5];
  else
    return 0;
}

_DWORD *_XSuspendFrontmostApp(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  __int128 v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigSuspendFrontmostApp(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XInterruptKeybagRefetch(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigInterruptKeybagRefetch(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetActiveInterfaceOrientation(_DWORD *result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetActiveInterfaceOrientation(result[3], a2 + 36);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XPresentPowerDownUI(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigPresentPowerDownUI(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XReboot(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  __int128 v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigReboot(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_8;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XShutDown(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  __int128 v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigShutDown(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_8;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XEnableLockScreenBundle(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x44 || v5 > 0x444)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(a1 + 60);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v5 - 68 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 68)
    goto LABEL_3;
  v8 = *(unsigned int *)(a1 + 40);
  if ((_DWORD)v8 != *(_DWORD *)(a1 + v7 + 64))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v9 = 1088;
  if (*(unsigned int *)(a1 + 4) < 0x440uLL)
    v9 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 64), 0, v9 - 64))
    goto LABEL_2;
  v10 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v10 && *(_DWORD *)(v10 + 4) > 0x1Fu)
  {
    v11 = *(unsigned int *)(a1 + 12);
    v12 = *(unsigned __int8 *)(a1 + 52);
    v13 = *(_QWORD *)(a1 + 28);
    v14 = *(_OWORD *)(v10 + 36);
    v15[0] = *(_OWORD *)(v10 + 20);
    v15[1] = v14;
    *(_DWORD *)(a2 + 32) = _SBMigEnableLockScreenBundle(v11, v12, a1 + 64, v13, v8, v15);
    mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(_QWORD *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 40) = 0;
    return;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

_DWORD *_XGetScreenLockStatus(_DWORD *result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetScreenLockStatus(result[3], (_BYTE *)(a2 + 36), (_BYTE *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XLockDevice(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigLockDevice(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XShowNetworkPromptsIfNecessary(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigShowNetworkPromptsIfNecessary(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetCurrentBacklightFactor(_DWORD *result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetCurrentBacklightFactor(result[3], (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XDimScreen(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  char v5;
  __int128 v6;
  __int128 v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(_DWORD *)(result + 12);
      v5 = *(_BYTE *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigDimScreen(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XAddWebClipToHomeScreen(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      result = (_DWORD *)_SBMigAddWebClipToHomeScreen(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_13;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XRemoveWebClipFromHomeScreen(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      result = (_DWORD *)_SBMigRemoveWebClipFromHomeScreen(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_13;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XReloadIconForIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      result = (_DWORD *)_SBMigReloadIconForIdentifier(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XAddDownloadingIconForDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v8;
  char *v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v14;
  size_t v15;

  if ((*result & 0x80000000) != 0)
    goto LABEL_17;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x30)
    goto LABEL_17;
  if (v4 > 0x830)
    goto LABEL_17;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_17;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 < v6 + 48)
    goto LABEL_17;
  v8 = v4 - v6;
  v9 = (char *)result + v6;
  v10 = *((_DWORD *)v9 + 11);
  v11 = v10 <= 0x400 && v8 - 48 >= v10;
  v12 = ((v10 + 3) & 0xFFFFFFFC) + 48;
  if (!v11 || v8 != v12)
    goto LABEL_17;
  v14 = 1064;
  if (result[1] < 0x428uLL)
    v14 = result[1];
  result = memchr(result + 10, 0, v14 - 40);
  if (result
    && ((char *)v3 + v4 - (v9 + 48) >= 1024 ? (v15 = 1024) : (v15 = (char *)v3 + v4 - (v9 + 48)),
        (result = memchr(v9 + 48, 0, v15)) != 0))
  {
    result = (_DWORD *)_SBMigAddDownloadingIconForDisplayIdentifier();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XScrollToIconWithDisplayIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  _DWORD *v8;
  int v9;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = result[9];
  if (v5 > 0x400)
    goto LABEL_16;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != ((v5 + 3) & 0xFFFFFFFC) + 44)
    goto LABEL_16;
  v7 = 1064;
  if (result[1] < 0x428uLL)
    v7 = result[1];
  result = memchr(result + 10, 0, v7 - 40);
  if (result)
  {
    v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = (_DWORD *)_SBMigScrollToIconWithDisplayIdentifier();
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
LABEL_16:
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetNowPlayingAppBundleIdentifier(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  result = (_DWORD *)_SBMigGetNowPlayingAppBundleIdentifier(v5, (_BYTE *)(a2 + 44), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v7 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v7;
    result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = (_DWORD)result + 1;
      *(_DWORD *)(a2 + 4) = (((_DWORD)result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XGetTopButtonFrames(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)_SBMigGetTopButtonFrames(v6, a2 + 36, a2 + 44, a2 + 52, a2 + 60, a2 + 68, a2 + 76, a2 + 84, a2 + 92, v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 100;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XSetApplicationNetworkFlags(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(unsigned __int8 *)(result + 36);
      v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      result = _SBMigSetApplicationNetworkFlags(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetApplicationNetworkFlags(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)_SBMigGetApplicationNetworkFlags(v6, (_BYTE *)(a2 + 36), (_BYTE *)(a2 + 40), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XAppSwitcherServiceRegister(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x40 || v5 > 0x840)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v6 = *(_DWORD *)(result + 52);
  if (v6 > 0x400)
    goto LABEL_2;
  v3 = -304;
  if ((int)v5 - 64 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 < v7 + 64)
    goto LABEL_3;
  v8 = v5 - v7;
  v9 = result + v7;
  v10 = *(_DWORD *)(v9 + 60);
  v11 = v10 <= 0x400 && v8 - 64 >= v10;
  if (!v11 || v8 != ((v10 + 3) & 0xFFFFFFFC) + 64)
    goto LABEL_2;
  v12 = 1080;
  if (*(unsigned int *)(result + 4) < 0x438uLL)
    v12 = *(unsigned int *)(result + 4);
  result = (uint64_t)memchr((void *)(result + 56), 0, v12 - 56);
  if (result
    && ((v13 = (void *)(v9 + 64), v4 + v5 - (uint64_t)v13 >= 1024) ? (v14 = 1024) : (v14 = v4 + v5 - (_QWORD)v13),
        (result = (uint64_t)memchr(v13, 0, v14)) != 0))
  {
    v15 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v15 && *(_DWORD *)(v15 + 4) > 0x1Fu)
    {
      v16 = *(unsigned int *)(v4 + 12);
      v17 = *(unsigned int *)(v4 + 28);
      v18 = *(_OWORD *)(v15 + 36);
      v19[0] = *(_OWORD *)(v15 + 20);
      v19[1] = v18;
      result = _SBMigAppSwitcherServiceRegister(v16, v17, v4 + 56, (uint64_t)v13, v19);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    v3 = -309;
  }
  else
  {
LABEL_2:
    v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetVoiceControlEnabled(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetVoiceControlEnabled(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetInterceptsMenuButton(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(unsigned __int8 *)(result + 36);
      v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      result = _SBMigSetInterceptsMenuButton(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetWantsLockButtonEvents(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetWantsLockButtonEvents(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetMediaVolume(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = _SBMigGetMediaVolume(v6, (_DWORD *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XSetMediaVolume(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  float v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(float *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetMediaVolume(v4, v7, v5);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetHomeScreenIconMetrics(_DWORD *result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  result = (_DWORD *)_SBMigGetHomeScreenIconMetrics(result[3], a2 + 36, a2 + 44, a2 + 52, a2 + 60, a2 + 68, a2 + 72, a2 + 76, a2 + 80, a2 + 84, a2 + 88, a2 + 92);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 96;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XFlashColor(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 44) && *(_DWORD *)(result + 48) > 0x1Fu)
    {
      result = _SBMigFlashColor(*(unsigned int *)(result + 12), *(float *)(result + 32), *(float *)(result + 36), *(float *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XProgrammaticSwitchAppGestureMoveToLeft(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigProgrammaticSwitchAppGestureMoveToLeft(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XProgrammaticSwitchAppGestureMoveToRight(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      v5 = result[3];
      v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      result = (_DWORD *)_SBMigProgrammaticSwitchAppGestureMoveToRight(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XSetVoiceRecognitionAudioInputPaths(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        v6 = *(_DWORD *)(a1 + 12);
        v7 = *(_QWORD *)(a1 + 28);
        v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetVoiceRecognitionAudioInputPaths(v6, v7, v4, v9);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetAssistantRecognitionStrings(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        v6 = *(_DWORD *)(a1 + 12);
        v7 = *(_QWORD *)(a1 + 28);
        v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAssistantRecognitionStrings(v6, v7, v4, v9);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetAlertSuppressionContexts(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        v6 = *(_DWORD *)(a1 + 12);
        v7 = *(_QWORD *)(a1 + 28);
        v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAlertSuppressionContexts(v6, v7, v4, v9);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetAlertSuppressionContextsBySectionIdentifier(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        v6 = *(_DWORD *)(a1 + 12);
        v7 = *(_QWORD *)(a1 + 28);
        v8 = *(_OWORD *)(a1 + 92);
        v9[0] = *(_OWORD *)(a1 + 76);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = _SBMigSetAlertSuppressionContextsBySectionIdentifier(v6, v7, v4, v9);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t _XSetAppIsConnectedToEA(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(unsigned __int8 *)(result + 36);
      v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      result = _SBMigSetAppIsConnectedToEA(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XLockDeviceAndFeatures(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(unsigned __int8 *)(result + 36);
      v7 = *(_OWORD *)(result + 76);
      v8[0] = *(_OWORD *)(result + 60);
      v8[1] = v7;
      result = _SBMigLockDeviceAndFeatures(v4, v5, v6, v8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XActivateAssistantWithContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(unsigned int *)(a1 + 40), (_DWORD)v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 60) && *(_DWORD *)(a1 + 64) > 0x1Fu)
      {
        v6 = *(unsigned int *)(a1 + 12);
        v7 = *(unsigned int *)(a1 + 52);
        v8 = *(_QWORD *)(a1 + 28);
        v9 = *(_OWORD *)(a1 + 96);
        v10[0] = *(_OWORD *)(a1 + 80);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = _SBMigActivateAssistantWithContext(v6, v7, v8, v4, v10);
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetProceduralWallpaper(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  _OWORD v16[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x44 || v5 > 0x444)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(a1 + 56);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v5 - 68 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 68)
    goto LABEL_3;
  v8 = a1 + v7;
  v9 = *(unsigned int *)(a1 + 40);
  if ((_DWORD)v9 != *(_DWORD *)(v8 + 64))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = 1084;
  if (*(unsigned int *)(a1 + 4) < 0x43CuLL)
    v10 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 60), 0, v10 - 60))
    goto LABEL_2;
  v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v11 && *(_DWORD *)(v11 + 4) > 0x1Fu)
  {
    v12 = *(unsigned int *)(a1 + 12);
    v13 = *(unsigned __int8 *)(v8 + 60);
    v14 = *(_QWORD *)(a1 + 28);
    v15 = *(_OWORD *)(v11 + 36);
    v16[0] = *(_OWORD *)(v11 + 20);
    v16[1] = v15;
    *(_DWORD *)(a2 + 32) = _SBMigSetProceduralWallpaper(v12, a1 + 60, v13, v14, v9, v16);
    mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(_QWORD *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_4;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetWallpaperImageForLocations(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  char v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint64_t v30;
  __int128 v31;
  _OWORD v32[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2)
    goto LABEL_3;
  v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x90 || v6 > 0x490)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1 || *(_BYTE *)(a1 + 55) != 1)
    goto LABEL_22;
  v7 = *(_DWORD *)(a1 + 124);
  if (v7 > 0x400)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v6 - 144 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v6 != v8 + 144)
    goto LABEL_3;
  v9 = *(unsigned int *)(a1 + 40);
  if ((_DWORD)v9 != *(_DWORD *)(a1 + 68)
    || (v10 = (_BYTE *)(a1 + v8 - 1024), v11 = *(_DWORD *)(a1 + 56), v11 != *(_DWORD *)(a1 + v8 + 140)))
  {
LABEL_22:
    v3 = -300;
    goto LABEL_3;
  }
  v12 = 1152;
  if (*(unsigned int *)(a1 + 4) < 0x480uLL)
    v12 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 128), 0, v12 - 128))
    goto LABEL_2;
  v13 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v13 || *(_DWORD *)(v13 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v14 = *(unsigned int *)(a1 + 12);
  v15 = *(_QWORD *)(a1 + 28);
  v16 = *(unsigned __int8 *)(a1 + 72);
  v17 = *(float *)(a1 + 76);
  v18 = *(float *)(a1 + 80);
  v19 = *(float *)(a1 + 84);
  v20 = *(float *)(a1 + 88);
  v21 = *(float *)(a1 + 92);
  v22 = *(float *)(a1 + 96);
  v23 = *(unsigned __int8 *)(a1 + 100);
  v24 = *(unsigned __int8 *)(a1 + 104);
  v25 = *(unsigned __int8 *)(a1 + 108);
  v26 = *(double *)(a1 + 112);
  v27 = v10[1152];
  v28 = v10[1156];
  v29 = v10[1160];
  v30 = *(_QWORD *)(a1 + 44);
  v31 = *(_OWORD *)(v13 + 36);
  v32[0] = *(_OWORD *)(v13 + 20);
  v32[1] = v31;
  *(_DWORD *)(a2 + 32) = _SBMigSetWallpaperImageForLocations(v14, v15, v9, v16, v23, v24, v25, a1 + 128, v17, v18, v19, v20, v21, v22, v26, v27, v28, v29, v30,
                           v11,
                           (_BYTE *)(a2 + 36),
                           v32);
  mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  v4 = *MEMORY[0x1E0C804E8];
  if (!*(_DWORD *)(a2 + 32))
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
}

void _XSetWallpaperImageSurfaceForLocations(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  char v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  double v28;
  char v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t v32;
  __int128 v33;
  _BYTE *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  _OWORD v38[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 5)
    goto LABEL_24;
  v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0xBC || v5 > 0x4BC)
    goto LABEL_24;
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(unsigned __int16 *)(a1 + 50) << 16 != 1114112
    || *(_BYTE *)(a1 + 63) != 1
    || *(_BYTE *)(a1 + 79) != 1
    || *(_BYTE *)(a1 + 95) != 1)
  {
    goto LABEL_23;
  }
  v6 = *(_DWORD *)(a1 + 168);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v3;
    v12 = *MEMORY[0x1E0C804E8];
    goto LABEL_25;
  }
  v3 = -304;
  if (v5 - 188 < v6)
    goto LABEL_24;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 188)
    goto LABEL_24;
  if (*(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 108)
    || *(_DWORD *)(a1 + 80) != *(_DWORD *)(a1 + 112)
    || (v8 = a1 + v7 - 1024, *(_DWORD *)(a1 + 96) != *(_DWORD *)(v8 + 1208)))
  {
LABEL_23:
    v3 = -300;
    goto LABEL_24;
  }
  v34 = (_BYTE *)v8;
  v35 = *(_DWORD *)(a1 + 96);
  v37 = *(_DWORD *)(a1 + 80);
  v36 = *(_DWORD *)(a1 + 64);
  v9 = 1196;
  v10 = *(unsigned int *)(a1 + 4);
  if (v10 < 0x4AC)
    v9 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 172), 0, v9 - 172))
    goto LABEL_2;
  v11 = ((v10 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_24;
  }
  v13 = *(unsigned int *)(a1 + 12);
  v14 = *(unsigned int *)(a1 + 28);
  v15 = *(unsigned int *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 52);
  v17 = *(_QWORD *)(a1 + 68);
  v18 = *(unsigned __int8 *)(a1 + 116);
  v19 = *(float *)(a1 + 120);
  v20 = *(float *)(a1 + 124);
  v21 = *(float *)(a1 + 128);
  v22 = *(float *)(a1 + 132);
  v23 = *(float *)(a1 + 136);
  v24 = *(float *)(a1 + 140);
  v25 = *(_BYTE *)(a1 + 144);
  v26 = *(_BYTE *)(a1 + 148);
  v27 = *(_BYTE *)(a1 + 152);
  v28 = *(double *)(a1 + 156);
  v29 = v34[1196];
  v30 = v34[1200];
  v31 = v34[1204];
  v32 = *(_QWORD *)(a1 + 84);
  v33 = *(_OWORD *)(v11 + 36);
  v38[0] = *(_OWORD *)(v11 + 20);
  v38[1] = v33;
  *(_DWORD *)(a2 + 32) = _SBMigSetWallpaperImageSurfaceForLocations(v13, v14, v15, v16, v36, v17, v37, v18, v19, v20, v21, v22, v23, v24, v28, v25, v26, v27, a1 + 172,
                           v29,
                           v30,
                           v31,
                           v32,
                           v35,
                           (_BYTE *)(a2 + 36),
                           v38);
  mig_deallocate(*(_QWORD *)(a1 + 84), *(unsigned int *)(a1 + 96));
  *(_QWORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 68), *(unsigned int *)(a1 + 80));
  *(_QWORD *)(a1 + 68) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 52), *(unsigned int *)(a1 + 64));
  *(_QWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  v12 = *MEMORY[0x1E0C804E8];
  if (!*(_DWORD *)(a2 + 32))
  {
    *(_QWORD *)(a2 + 24) = v12;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_25:
  *(_QWORD *)(a2 + 24) = v12;
}

_DWORD *_XClearWallpaperAsset(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)_SBMigClearWallpaperAsset(v6, (_BYTE *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XGetWallpaperOptions(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v4 = *(unsigned int *)(result + 12);
  v5 = *(unsigned __int8 *)(result + 32);
  v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  result = _SBMigGetWallpaperOptions(v4, v5, a2 + 52, a2 + 56, a2 + 60, a2 + 64, a2 + 68, a2 + 72, a2 + 76, a2 + 80, a2 + 84, a2 + 88, a2 + 28, a2 + 96, v7);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 96);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 100;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetWallpaperVariant(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v5 = *(unsigned int *)(result + 12);
  v6 = *(unsigned __int8 *)(result + 32);
  v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  result = _SBMigSetWallpaperVariant(v5, v6, (_BYTE *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XGetWallpaperLegibilitySettings(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v4 = (_DWORD *)(a2 + 52);
  v5 = (_QWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned __int8 *)(result + 32);
  v8 = *(_OWORD *)(result + 72);
  v9[0] = *(_OWORD *)(result + 56);
  v9[1] = v8;
  result = _SBMigGetWallpaperLegibilitySettings(v6, v7, v5, v4, v9);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XAddAlertItemsSuppressionAssertion(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v6 = *(_DWORD *)(result + 52);
  v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6)
    goto LABEL_3;
  if ((_DWORD)v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      v8 = *(unsigned int *)(v4 + 12);
      v9 = *(unsigned int *)(v4 + 28);
      v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      result = _SBMigAddAlertItemsSuppressionAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    v3 = -309;
  }
  else
  {
LABEL_2:
    v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XIsReachabilityEnabled(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = _SBMigIsReachabilityEnabled(v6, (_BYTE *)(a2 + 36), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XSetReachabilityEnabled(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetReachabilityEnabled(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XOverrideDisplayedDate(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      result = (_DWORD *)_SBMigOverrideDisplayedDate(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_13;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XSetIdleText(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 10, 0, v4 - 40)) != 0))
  {
    v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      v11 = v3[3];
      v12 = *(_OWORD *)(v10 + 36);
      v13[0] = *(_OWORD *)(v10 + 20);
      v13[1] = v12;
      result = (_DWORD *)_SBMigSetIdleText(v11, (uint64_t)(v3 + 10), v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_13;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
LABEL_13:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XTagTouchForTypingMenu(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigTagTouchForTypingMenu(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XAcquireFocusPreventingFullScreenPresentationAssertion(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x38 || v5 > 0x438)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v6 = *(_DWORD *)(result + 52);
  v3 = -304;
  if (v6 > 0x400 || (int)v5 - 56 < v6)
    goto LABEL_3;
  if ((_DWORD)v5 == ((v6 + 3) & 0xFFFFFFFC) + 56 && (result = (uint64_t)memchr((void *)(result + 56), 0, v5 - 56)) != 0)
  {
    v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
    if (!*(_DWORD *)v7 && *(_DWORD *)(v7 + 4) > 0x1Fu)
    {
      v8 = *(unsigned int *)(v4 + 12);
      v9 = *(unsigned int *)(v4 + 28);
      v10 = *(_OWORD *)(v7 + 36);
      v11[0] = *(_OWORD *)(v7 + 20);
      v11[1] = v10;
      result = _SBMigAcquireFocusPreventingFullScreenPresentationAssertion(v8, v4 + 56, v9, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    v3 = -309;
  }
  else
  {
LABEL_2:
    v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetAllApplicationsShowProgress(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetAllApplicationsShowProgress(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetAllApplicationsShowSyncIndicator(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetAllApplicationsShowSyncIndicator(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetShowsOverridesForRecording(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned __int8 *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = _SBMigSetShowsOverridesForRecording(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XGetWallpaperPreviewSurface(uint64_t result, _DWORD *a2)
{
  int v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    a2[8] = v3;
    goto LABEL_10;
  }
  v4 = a2 + 7;
  *((_QWORD *)a2 + 4) = 0x11000000000000;
  v5 = *(unsigned int *)(result + 12);
  v6 = *(unsigned __int8 *)(result + 48);
  v7 = *(double *)(result + 52);
  v8 = *(unsigned int *)(result + 60);
  v9 = *(unsigned int *)(result + 28);
  v10 = *(_OWORD *)(result + 100);
  v11[0] = *(_OWORD *)(result + 84);
  v11[1] = v10;
  result = _SBMigGetWallpaperPreviewSurface(v5, v6, v8, v9, v4, v11, v7);
  if (!(_DWORD)result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }
  a2[8] = result;
LABEL_10:
  *((_QWORD *)a2 + 3) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XGetWallpaperPreview(uint64_t a1, uint64_t a2)
{
  int v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int WallpaperPreview;
  _OWORD v15[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 72)
  {
    v4 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 68))
  {
    v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(a1 + 72) || *(_DWORD *)(a1 + 76) <= 0x1Fu)
  {
    v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v5 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777472;
  v6 = a2 + 28;
  v7 = *(unsigned int *)(a1 + 12);
  v8 = *(unsigned __int8 *)(a1 + 52);
  v9 = *(double *)(a1 + 56);
  v10 = *(unsigned int *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 28);
  v12 = *(unsigned int *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 108);
  v15[0] = *(_OWORD *)(a1 + 92);
  v15[1] = v13;
  WallpaperPreview = _SBMigGetWallpaperPreview(v7, v8, v10, v11, v12, v6, v5, v15, v9);
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!WallpaperPreview)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = WallpaperPreview;
LABEL_11:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

_DWORD *_XSetWallpaperOptionsForLocations(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x58)
    goto LABEL_16;
  if (v4 > 0x458)
    goto LABEL_16;
  v5 = result[20];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 88 < v5 || (_DWORD)v4 != v6 + 88)
    goto LABEL_16;
  v8 = 1108;
  if (result[1] < 0x454uLL)
    v8 = result[1];
  result = memchr(result + 21, 0, v8 - 84);
  if (!result)
  {
LABEL_16:
    v10 = -304;
    goto LABEL_17;
  }
  v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    v11 = *MEMORY[0x1E0C804E8];
    goto LABEL_18;
  }
  v12 = v3[3];
  v13 = *((float *)v3 + 8);
  v14 = *((float *)v3 + 9);
  v15 = *((float *)v3 + 10);
  v16 = *((float *)v3 + 11);
  v17 = *((float *)v3 + 12);
  v18 = *((float *)v3 + 13);
  v19 = *((unsigned __int8 *)v3 + 56);
  v20 = *((unsigned __int8 *)v3 + 60);
  v21 = *((unsigned __int8 *)v3 + 64);
  v22 = *(double *)(v3 + 17);
  v23 = *((unsigned __int8 *)v3 + v6 + 84);
  v24 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v24;
  result = (_DWORD *)_SBMigSetWallpaperOptionsForLocations(v12, v19, v20, v21, (uint64_t)(v3 + 21), v23, (_BYTE *)(a2 + 36), v25, v13, v14, v15, v16, v17, v18, v22);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v11 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v11;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_18:
  *(_QWORD *)(a2 + 24) = v11;
  return result;
}

_DWORD *_XGetBatteryAwakeTime(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v6;
  result = (_DWORD *)_SBMigGetBatteryAwakeTime(v5, a2 + 44, v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v7 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v7;
    result = (_DWORD *)strlen((const char *)(a2 + 44));
    if (!(((unint64_t)result + 1) >> 32))
    {
      *(_DWORD *)(a2 + 36) = 0;
      *(_DWORD *)(a2 + 40) = (_DWORD)result + 1;
      *(_DWORD *)(a2 + 4) = (((_DWORD)result + 4) & 0xFFFFFFFC) + 44;
      return result;
    }
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XGetRecentSleepsWakes(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  result = (_DWORD *)_SBMigGetRecentSleepsWakes(v5, (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetScheduledPowerEvents(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  result = (_DWORD *)_SBMigGetScheduledPowerEvents(v5, (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), v7);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XGetBatteryUsageTimesInSeconds(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int v6;
  __int128 v7;
  __int128 v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)_SBMigGetBatteryUsageTimesInSeconds(v6, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_BYTE *)(a2 + 44), (_BYTE *)(a2 + 48), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 52;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t SpringBoardUser_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 100068) >= 0xFFFFFFBC
    && (v5 = (void (*)(void))_SBMigSpringBoardUser_subsystem[5 * (v4 - 100000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _splitOptionsIntoApplicationOptionsAndRealOptions_cold_1()
{
  __assert_rtn("_splitOptionsIntoApplicationOptionsAndRealOptions", "SBSApplicationLaunching.m", 142, "local_realOptions != nil");
}

void _splitOptionsIntoApplicationOptionsAndRealOptions_cold_2()
{
  __assert_rtn("_splitOptionsIntoApplicationOptionsAndRealOptions", "SBSApplicationLaunching.m", 138, "local_applicationOptions != nil");
}

void SBSOpenDataActivationURL_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "Error opening data activation URL: %d", (uint8_t *)v3, 8u);
}

void __getATXHomeScreenPageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppPredictionClientLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBSFocusModesHomeScreenSettingsRequest.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getATXHomeScreenPageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getATXHomeScreenPageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBSFocusModesHomeScreenSettingsRequest.m"), 18, CFSTR("Unable to find class %s"), "ATXHomeScreenPage");

  __break(1u);
}

void __getDDRResetOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SpringBoardLegacyServerUser.m"), 23, CFSTR("Unable to find class %s"), "DDRResetOptions");

  __break(1u);
}

void EmbeddedDataResetLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EmbeddedDataResetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SpringBoardLegacyServerUser.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDDRResetRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SpringBoardLegacyServerUser.m"), 22, CFSTR("Unable to find class %s"), "DDRResetRequest");

  __break(1u);
}

void __getDDRResetServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SpringBoardLegacyServerUser.m"), 21, CFSTR("Unable to find class %s"), "DDRResetService");

  __break(1u);
}

void soft_ADClientAddValueForScalarKey_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_ADClientAddValueForScalarKey(CFStringRef, int64_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBScreenTimeTrackingController.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void AggregateDictionaryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AggregateDictionaryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBScreenTimeTrackingController.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFBDisplayManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_SBSPrefixHelper.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFBDisplayManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBDisplayManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_SBSPrefixHelper.m"), 19, CFSTR("Unable to find class %s"), "FBDisplayManager");

  __break(1u);
}

void _SBMigAddAlertItemsSuppressionAssertion_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_SBXXAddAlertItemsSuppressionAssertion";
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "[SBMig] invalid assertion port sent to %s", (uint8_t *)&v1, 0xCu);
}

void SBSSetStatusBarShowsActivityForApplication_cold_1()
{
  __assert_rtn("SBSSetStatusBarShowsActivityForApplication", "SBSUIUtilities.m", 27, "displayID && [displayID isKindOfClass:[NSString class]]");
}

void SystemStatusLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SystemStatusLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_SBSSystemStatusSoftLinking.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void getSTBackgroundActivityIdentifierBackgroundLocation_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (STBackgroundActivityIdentifierBackgroundLocation) (*)(void))0)()) getSTBackgroundActivityIdentifierBackgroundLocation(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBSSystemStatusSoftLinking.m"), 13, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void soft_STBackgroundActivityIdentifiersDescription_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef soft_STBackgroundActivityIdentifiersDescription(CFSetRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBSSystemStatusSoftLinking.m"), 14, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void SystemStatusUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SystemStatusUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_SBSSystemStatusSoftLinking.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFSetRef soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBSSystemStatusSoftLinking.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(CFSetRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBSSystemStatusSoftLinking.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void SBSAppSwitcherServiceRegister_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EB52000, a1, a3, "%s Required serviceBundleID", a5, a6, a7, a8, 2u);
}

void SBSAppSwitcherServiceRegister_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EB52000, a1, a3, "%s Required serviceViewControllerClassName", a5, a6, a7, a8, 2u);
}

void SBMigGetFunctionForSymbol_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "[SBMig] No mig demux context exists: this call cannot be serviced.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void SBMachServiceInitialize_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EB52000, a2, a3, "[SBMig] Invalid specification for service \"%{public}s\" -- server will not run!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void SBMachServiceInitialize_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EB52000, a2, a3, "[SBMig] Service already initialized: %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void SBMachChannelHandleEvent_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_18EB52000, a2, a3, "[SBMig] Unable to load or validate audit token for messageID %d. Ignoring.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void SBMachChannelHandleEvent_cold_2(int *a1, int a2, NSObject *a3)
{
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  BSProcessNameForPID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109634;
  v7[1] = v5;
  v8 = 2114;
  v9 = v6;
  v10 = 1024;
  v11 = a2;
  _os_log_error_impl(&dword_18EB52000, a3, OS_LOG_TYPE_ERROR, "[SBMig] ERROR: No service found for message id %d from caller %{public}@:%d", (uint8_t *)v7, 0x18u);

}

void SBMachChannelHandleEvent_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_18EB52000, a2, a3, "[SBMig] Error demultiplexing messageID %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void SBMachChannelHandleEvent_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "[SBMig] ERROR: Got bad message from dispatch_mach_msg_get_msg()", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void SBMachChannelHandleEvent_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "[SBMig] Handling DISPATCH_MACH_DISCONNECTED. This is unnexpected.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

uint64_t BKSHIDServicesGetBacklightFactor()
{
  return MEMORY[0x1E0D00B10]();
}

uint64_t BKSWatchdogAssertionCreateForPID()
{
  return MEMORY[0x1E0D00BF8]();
}

uint64_t BSCreateDeserializedArrayFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01148]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01158]();
}

uint64_t BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01160]();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01168]();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return MEMORY[0x1E0D01170]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01198]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011A0]();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011A8]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011C0]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011D0]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011D8]();
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011E0]();
}

uint64_t BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011E8]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011F0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D01210]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1E0D01348]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1E0D01350]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1E0D01368]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSMachPortIsType()
{
  return MEMORY[0x1E0D013F8]();
}

uint64_t BSMachPortIsUsable()
{
  return MEMORY[0x1E0D01400]();
}

uint64_t BSMachReceiveRightRelease()
{
  return MEMORY[0x1E0D01408]();
}

uint64_t BSProcessNameForPID()
{
  return MEMORY[0x1E0D014B0]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01518]();
}

uint64_t BSSerializeArrayToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01520]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01528]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01530]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01548]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01550]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01560]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01568]();
}

uint64_t BSSerializeSetToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01570]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01578]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1E0C82DD0]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1E0C82DD8]();
}

uint64_t dispatch_mach_mig_demux_get_context()
{
  return MEMORY[0x1E0C82DE0]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C840F0]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C840F8](a1, a2);
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C84108]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1E0C86140]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

