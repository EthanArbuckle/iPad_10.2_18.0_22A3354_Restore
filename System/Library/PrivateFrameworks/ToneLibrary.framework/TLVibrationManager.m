@implementation TLVibrationManager

+ (TLVibrationManager)sharedVibrationManager
{
  if (sharedVibrationManager__TLVibrationManagerSharedInstanceOnceToken != -1)
    dispatch_once(&sharedVibrationManager__TLVibrationManagerSharedInstanceOnceToken, &__block_literal_global_3);
  return (TLVibrationManager *)(id)sharedVibrationManager__TLVibrationManagerSharedInstance;
}

void __44__TLVibrationManager_sharedVibrationManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TLVibrationManager _initWithSpecialBehaviors:]([TLVibrationManager alloc], "_initWithSpecialBehaviors:", 1);
  v1 = (void *)sharedVibrationManager__TLVibrationManagerSharedInstance;
  sharedVibrationManager__TLVibrationManagerSharedInstance = (uint64_t)v0;

}

- (TLVibrationManager)init
{
  return (TLVibrationManager *)-[TLVibrationManager _initWithSpecialBehaviors:](self, "_initWithSpecialBehaviors:", 0);
}

- (id)_initWithSpecialBehaviors:(unint64_t)a3
{
  TLVibrationManager *v4;
  TLAccessQueue *v5;
  TLAccessQueue *accessQueue;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSDictionary *synchronizedVibrationPatternFromToneIdentifierMapping;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v14;
  uint64_t v15;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TLVibrationManager;
  v4 = -[TLVibrationManager init](&v20, sel_init);
  if (v4)
  {
    v5 = -[TLAccessQueue initWithLabel:appendUUIDToLabel:]([TLAccessQueue alloc], "initWithLabel:appendUUIDToLabel:", CFSTR("_TLVibrationManagerAccessQueue"), 1);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Chord"), CFSTR("texttone:Calendar Alert"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Ding"), CFSTR("texttone:New Mail"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Pulse"), CFSTR("texttone:Air Drop Invitation"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Swish"), CFSTR("texttone:Sharing Post"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Swoosh"), CFSTR("texttone:Sent Mail"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Tweet"), CFSTR("texttone:Sent Tweet"));
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "wantsModernDefaultRingtone");

    if (v9)
      objc_msgSend(v7, "setObject:forKey:", CFSTR("Reflection"), CFSTR("<default>"));
    objc_msgSend(v7, "objectForKey:", CFSTR("<default>"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(v7, "setObject:forKey:", CFSTR("Opening"), CFSTR("<default>"));
    v11 = objc_msgSend(v7, "copy");
    synchronizedVibrationPatternFromToneIdentifierMapping = v4->_synchronizedVibrationPatternFromToneIdentifierMapping;
    v4->_synchronizedVibrationPatternFromToneIdentifierMapping = (NSDictionary *)v11;

    v4->_specialBehaviors = a3;
    v4->_allowsAutoRefresh = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if ((a3 & 2) != 0)
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_TLVibrationManagerHandleUserGeneratedVibrationsDidChangeNotification, CFSTR("TLVibrationManagerUserGeneratedVibrationsDidChange"), 0, (CFNotificationSuspensionBehavior)1026);
    v14 = (id)objc_opt_class();
    objc_sync_enter(v14);
    v15 = _TLVibrationManagerInstancesCount;
    if (!_TLVibrationManagerInstancesCount)
    {
      v16 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v16, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrationPreferencesDidChangeNotification, CFSTR("_TLVibrationPreferencesDidChangeNotification"), 0, (CFNotificationSuspensionBehavior)1026);
      objc_msgSend(v14, "_handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:atInitiativeOfVibrationManager:", 3, 0);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrateOnRingOrSilentDidChangeNotification, CFSTR("com.apple.springboard.ring-vibrate.changed"), 0, (CFNotificationSuspensionBehavior)1026);
      v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v18, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrateOnRingOrSilentDidChangeNotification, CFSTR("com.apple.springboard.silent-vibrate.changed"), 0, (CFNotificationSuspensionBehavior)1026);
      v15 = _TLVibrationManagerInstancesCount;
    }
    _TLVibrationManagerInstancesCount = v15 + 1;
    objc_sync_exit(v14);

  }
  return v4;
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D33D5000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", v1, 2u);
}

void __29__TLVibrationManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0;

}

- (void)setAllowsAutoRefresh:(BOOL)a3
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;

  if ((self->_specialBehaviors & 1) != 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("*** -[%@ %@] Attempted to mutate the shared vibration manager: %@. Create your own instance of %@ manually if you need to mutate it."), v9, v8, self, v9);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__TLVibrationManager_setAllowsAutoRefresh___block_invoke;
    v10[3] = &unk_1E952AAE8;
    v10[4] = self;
    v11 = a3;
    -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v10);
  }
}

_BYTE *__43__TLVibrationManager_setAllowsAutoRefresh___block_invoke(uint64_t a1)
{
  _BYTE *result;
  char v3;

  result = *(_BYTE **)(a1 + 32);
  if (result[65] != *(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = 1;
    }
    else
    {
      v3 = result[64];
      if (v3)
      {
        objc_msgSend(result, "refresh");
        v3 = *(_BYTE *)(a1 + 40);
        result = *(_BYTE **)(a1 + 32);
      }
    }
    result[65] = v3;
  }
  return result;
}

- (BOOL)refresh
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__TLVibrationManager_refresh__block_invoke;
  v4[3] = &unk_1E952A860;
  v4[4] = self;
  v4[5] = &v5;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__TLVibrationManager_refresh__block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40))
  {
    v3 = *(_BYTE *)(v1 + 65);
    *(_BYTE *)(v1 + 65) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_userGeneratedVibrationPatterns");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = v3;
  }
}

- (id)currentVibrationIdentifierForAlertType:(int64_t)a3
{
  return -[TLVibrationManager currentVibrationIdentifierForAlertType:topic:](self, "currentVibrationIdentifierForAlertType:topic:", a3, 0);
}

- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4
{
  -[TLVibrationManager setCurrentVibrationIdentifier:forAlertType:topic:](self, "setCurrentVibrationIdentifier:forAlertType:topic:", a3, a4, 0);
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:](self, "_currentVibrationIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:", a3, a4, 1);
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _BOOL4 v44;
  void *v45;
  _BOOL4 v46;
  uint8_t buf[4];
  TLVibrationManager *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  _BYTE v54[18];
  uint64_t v55;

  v5 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  TLLogVibrationManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = self;
    v49 = 2114;
    v50 = v10;
    v51 = 2114;
    v52 = (uint64_t)v8;
    v53 = 1024;
    *(_DWORD *)v54 = v5;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(%{BOOL}u).", buf, 0x26u);

  }
  v11 = objc_msgSend(v8, "length");
  -[TLVibrationManager _systemWideVibrationPatternPreferenceKeyForAlertType:](self, "_systemWideVibrationPatternPreferenceKeyForAlertType:", a3);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && v11)
  {
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("PerAccount"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
  }
  v15 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  v16 = v15;
  if (v13 && v15)
  {
    v46 = v5;
    v17 = (void *)CFPreferencesCopyValue(v13, v15, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    TLLogVibrationManagement();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v48 = self;
      v49 = 2114;
      v50 = v19;
      v51 = 2114;
      v52 = (uint64_t)v13;
      v53 = 2114;
      *(_QWORD *)v54 = v16;
      *(_WORD *)&v54[8] = 2114;
      *(_QWORD *)&v54[10] = v17;
      _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from domain '%{public}@': %{public}@.", buf, 0x34u);

    }
    if (!v17)
    {
      v28 = 0;
      v24 = 0;
LABEL_35:
      v5 = v46;
      goto LABEL_36;
    }
    if (v11)
    {
      objc_msgSend(v17, "objectForKey:", v8);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      TLLogVibrationManagement();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = self;
        v49 = 2114;
        v50 = v22;
        v51 = 2114;
        v52 = (uint64_t)v20;
        v23 = "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Per-topic: persistedVibrationIdenti"
              "fier = %{public}@.";
LABEL_24:
        _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

      }
    }
    else
    {
      v20 = v17;
      TLLogVibrationManagement();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = self;
        v49 = 2114;
        v50 = v22;
        v51 = 2114;
        v52 = (uint64_t)v20;
        v23 = "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. persistedVibrationIdentifier = %{public}@.";
        goto LABEL_24;
      }
    }

    v45 = v20;
    if (objc_msgSend(v20, "length"))
    {
      v44 = -[TLVibrationManager vibrationWithIdentifierIsValid:](self, "vibrationWithIdentifierIsValid:", v20);
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        TLLogVibrationManagement();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = self;
          v49 = 2114;
          v50 = v30;
          v51 = 2114;
          v52 = (uint64_t)v24;
          _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

        }
      }
      else
      {
        TLLogVibrationManagement();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = self;
          v49 = 2114;
          v50 = v31;
          _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. persistedVibrationIdentifierWasInvalid = YES.", buf, 0x16u);

        }
        v24 = 0;
      }
      v28 = !v44;

    }
    else
    {
      v24 = 0;
      v28 = 0;
    }
    CFRelease(v17);

    goto LABEL_35;
  }
  -[TLVibrationManager _defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, v8, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogVibrationManagement();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v26 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = self;
    v49 = 2114;
    v50 = v27;
    v51 = 2114;
    v52 = (uint64_t)v24;
    _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Vibration is not settable for this alert type. Returning corresponding default vibration. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

    v5 = v26;
  }

  if (!v16)
  {
    if (objc_msgSend(v24, "length") || !v11)
      goto LABEL_54;
    v28 = 0;
    goto LABEL_38;
  }
  v28 = 0;
LABEL_36:
  CFRelease(v16);
  if (objc_msgSend(v24, "length") || !v11)
  {
    if (!v28)
      goto LABEL_54;
    goto LABEL_46;
  }
LABEL_38:
  v32 = v24;
  -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:](self, "_currentVibrationIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:", a3, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  TLLogVibrationManagement();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = self;
    v49 = 2114;
    v50 = v34;
    v51 = 2114;
    v52 = (uint64_t)v24;
    _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Falling back to current vibration without topic. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

  }
  if (v28)
  {
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("<none>")))
    {

      TLLogVibrationManagement();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = self;
        v49 = 2114;
        v50 = v36;
        v51 = 2114;
        v52 = 0;
        _os_log_impl(&dword_1D33D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, and fallback value is none. Ignoring fallback value. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

      }
      v24 = 0;
    }
LABEL_46:
    if (!objc_msgSend(v24, "length"))
    {
      if (v5)
      {
        -[TLVibrationManager _defaultPreferablyNonSilentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultPreferablyNonSilentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, v8, 0);
        v37 = objc_claimAutoreleasedReturnValue();

        TLLogVibrationManagement();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = self;
          v49 = 2114;
          v50 = v39;
          v51 = 2114;
          v52 = v37;
          _os_log_impl(&dword_1D33D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid; falling "
            "back to non-silent default vibration. currentVibrationIdentifier = %{public}@.",
            buf,
            0x20u);

        }
      }
      else
      {
        TLLogVibrationManagement();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = self;
          v49 = 2114;
          v50 = v40;
          v51 = 2114;
          v52 = (uint64_t)v24;
          _os_log_impl(&dword_1D33D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, but falling back to non-silent default vibration is disallowed. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

        }
        v37 = (uint64_t)v24;
      }

      v24 = (void *)v37;
    }
  }
LABEL_54:
  TLLogVibrationManagement();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v48 = self;
    v49 = 2114;
    v50 = v42;
    v51 = 2114;
    v52 = (uint64_t)v8;
    v53 = 1024;
    *(_DWORD *)v54 = v5;
    *(_WORD *)&v54[4] = 2114;
    *(_QWORD *)&v54[6] = v24;
    _os_log_impl(&dword_1D33D5000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(%{BOOL}u). Returning: %{public}@.", buf, 0x30u);

  }
  return v24;
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  return -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:allowsNoneDefaultToAnyActualVibrationSubstitution:](self, "_currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:allowsNoneDefaultToAnyActualVibrationSubstitution:", a3, a4, a5, 1);
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v36;
  uint8_t buf[4];
  TLVibrationManager *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a4;
  v11 = a5;
  TLLogVibrationManagement();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v38 = self;
    v39 = 2114;
    v40 = v13;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v11;
    v45 = 1024;
    v46 = v6;
    _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@) allowsNoneDefaultToAnyActualVibrationSubstitution:(%{BOOL}u).", buf, 0x30u);

  }
  if (+[TLAlert _currentOverridePolicyForType:](TLAlert, "_currentOverridePolicyForType:", a3) != 1)
    goto LABEL_7;
  v14 = CFSTR("<none>");
  TLLogVibrationManagement();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = self;
    v39 = 2114;
    v40 = v16;
    v41 = 2114;
    v42 = v14;
    _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Falling back to none due to alert override policy. vibrationIdentifier = %{public}@.", buf, 0x20u);

  }
  if (!v14)
  {
LABEL_7:
    if (v10)
    {
      if (a3 == 13)
      {
        if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")))
        {
          TLLogVibrationManagement();
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
          {
LABEL_34:

LABEL_35:
            -[TLVibrationManager _defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, v10, v11);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            TLLogVibrationManagement();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromTLAlertType(a3);
              v26 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v38 = self;
              v39 = 2114;
              v40 = v26;
              v41 = 2114;
              v42 = v14;
              _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. vibrationIdentifier = %{public}@.", buf, 0x20u);

            }
            goto LABEL_38;
          }
          NSStringFromTLAlertType(0xDuLL);
          v18 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = self;
          v39 = 2114;
          v40 = v18;
          v41 = 2114;
          v42 = v10;
          _os_log_impl(&dword_1D33D5000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Skipping Preferences lookup for topic %{public}@.", buf, 0x20u);
LABEL_33:

          goto LABEL_34;
        }
      }
      else if (a3 == 2)
      {
        if ((-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHeart")) & 1) != 0|| (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsUp")) & 1) != 0|| (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsDown")) & 1) != 0|| (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHaHa")) & 1) != 0|| (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentExclamation")) & 1) != 0)
        {
          v17 = 1;
        }
        else
        {
          v17 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentQuestionMark"));
        }
        goto LABEL_20;
      }
    }
    v17 = 0;
LABEL_20:
    -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:](self, "_currentVibrationIdentifierForAlertType:topic:", a3, v10);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    TLLogVibrationManagement();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v21;
      v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: vibrationIdentifier = %{public}@.", buf, 0x20u);

    }
    if (v19)
    {
      LOBYTE(v36) = v6;
      -[TLVibrationManager _sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:useDefaultVibrationAsFallback:allowsNoneDefaultToAnyActualVibrationSubstitution:didFallback:](self, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:useDefaultVibrationAsFallback:allowsNoneDefaultToAnyActualVibrationSubstitution:didFallback:", v19, a3, v10, 0, v11, 1, v36, 0);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      TLLogVibrationManagement();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = self;
        v39 = 2114;
        v40 = v23;
        v41 = 2114;
        v42 = v14;
        _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Sanitized: vibrationIdentifier = %{public}@.", buf, 0x20u);

      }
      if (!v17)
      {
LABEL_29:
        if (v14)
          goto LABEL_38;
        goto LABEL_35;
      }
    }
    else
    {
      v14 = 0;
      if (!v17)
        goto LABEL_29;
    }
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("<none>")) & 1) != 0)
      goto LABEL_29;
    TLLogVibrationManagement();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v24 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v24;
      v41 = 2114;
      v42 = CFSTR("<none>");
      _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method was not %{public}@; ignoring it.",
        buf,
        0x20u);

    }
    goto LABEL_33;
  }
LABEL_38:
  if (a3 == 18)
  {
    -[TLVibrationManager currentVibrationIdentifierForAlertType:topic:](self, "currentVibrationIdentifierForAlertType:topic:", 1, v10);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    TLLogVibrationManagement();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(0x12uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v31;
      v41 = 2114;
      v42 = (const __CFString *)v27;
      _os_log_impl(&dword_1D33D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected alert type for emergency alert. Resolving to current vibration identifier for incoming call: vibrationIdentifier = %{public}@.", buf, 0x20u);

    }
    v28 = (__CFString *)v27;
    goto LABEL_53;
  }
  if (a3 == 3)
  {
    -[TLVibrationManager currentVibrationIdentifierForAlertType:topic:](self, "currentVibrationIdentifierForAlertType:topic:", 2, v10);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isEqualToString:](v27, "isEqualToString:", CFSTR("<none>")))
    {
      v28 = v14;
      goto LABEL_53;
    }
    v28 = CFSTR("<none>");

    TLLogVibrationManagement();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(3uLL);
      v32 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v32;
      v41 = 2114;
      v42 = v28;
      _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected alert type for text message in conversation. vibrationIdentifier = %{public}@.", buf, 0x20u);

    }
    goto LABEL_51;
  }
  if (a3 == 2
    && -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("TLAlertTopicTextMessageInConversation"))&& (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
  {

    TLLogVibrationManagement();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("Text-Message-Alert-In-Conversation");
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
LABEL_53:

      v14 = v28;
      goto LABEL_54;
    }
    NSStringFromTLAlertType(2uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = self;
    v39 = 2114;
    v40 = v29;
    v41 = 2114;
    v42 = CFSTR("Text-Message-Alert-In-Conversation");
    _os_log_impl(&dword_1D33D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected topic for text message in conversation. vibrationIdentifier = %{public}@.", buf, 0x20u);
LABEL_51:

    goto LABEL_53;
  }
LABEL_54:
  TLLogVibrationManagement();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v34 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v38 = self;
    v39 = 2114;
    v40 = v34;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v11;
    v45 = 1024;
    v46 = v6;
    v47 = 2114;
    v48 = v14;
    _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@) allowsNoneDefaultToAnyActualVibrationSubstitution:(%{BOOL}u). Returning: %{public}@.", buf, 0x3Au);

  }
  return v14;
}

- (id)currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, a4, 0);
}

- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const void *v18;
  id v19;
  id value;

  value = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "length");
  -[TLVibrationManager _systemWideVibrationPatternPreferenceKeyForAlertType:](self, "_systemWideVibrationPatternPreferenceKeyForAlertType:", a4);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && v9)
  {
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("PerAccount"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v12;
  }
  v13 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  v14 = v13;
  if (v11 && v13)
  {
    v15 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v16 = (const __CFString *)*MEMORY[0x1E0C9B250];
    if (v9)
    {
      v17 = (void *)CFPreferencesCopyValue(v11, v13, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      if (v17)
      {
        v18 = v17;
        v19 = (id)objc_msgSend(v17, "mutableCopy");
        CFRelease(v18);
      }
      else if (objc_msgSend(value, "length"))
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      else
      {
        v19 = 0;
      }
      if (objc_msgSend(value, "length"))
      {
        objc_msgSend(v19, "setObject:forKey:", value, v8);
      }
      else
      {
        objc_msgSend(v19, "removeObjectForKey:", v8);
        if (!objc_msgSend(v19, "count"))
        {

          v19 = 0;
        }
      }
      CFPreferencesSetValue(v11, v19, v14, v15, v16);

    }
    else
    {
      CFPreferencesSetValue(v11, value, v13, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    }
    -[TLVibrationManager _didSetVibrationPreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:](self, "_didSetVibrationPreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", v11, +[TLPreferencesUtilities preferencesDomain](TLPreferencesUtilities, "preferencesDomain"), 1);
    if ((!value || (objc_msgSend(value, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
      && +[TLAlert _currentOverridePolicyForType:](TLAlert, "_currentOverridePolicyForType:", a4) == 1)
    {
      +[TLAlert _setCurrentOverridePolicy:forType:](TLAlert, "_setCurrentOverridePolicy:forType:", 0, a4);
    }
  }
  else if (!v13)
  {
    goto LABEL_25;
  }
  CFRelease(v14);
LABEL_25:

}

- (id)currentVibrationNameForAlertType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TLVibrationManager currentVibrationIdentifierForAlertType:](self, "currentVibrationIdentifierForAlertType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager nameOfVibrationWithIdentifier:](self, "nameOfVibrationWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentVibrationPatternForAlertType:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;

  v5 = a3 == 1 || a3 == 28;
  -[TLVibrationManager currentVibrationIdentifierForAlertType:](self, "currentVibrationIdentifierForAlertType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager patternForVibrationWithIdentifier:repeating:](self, "patternForVibrationWithIdentifier:repeating:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3
{
  return -[TLVibrationManager defaultVibrationIdentifierForAlertType:topic:](self, "defaultVibrationIdentifierForAlertType:topic:", a3, 0);
}

- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLVibrationManager _defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, a4, 0);
}

- (id)_defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  id v8;
  __CFString *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t (*__ptr32 *v12)();
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString **v29;
  __CFString *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  void *v35;
  void *v36;
  uint8_t buf[4];
  TLVibrationManager *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = -[TLVibrationManager _areSynchronizedVibrationsAllowedForAlertType:topic:](self, "_areSynchronizedVibrationsAllowedForAlertType:topic:", a3, v8);
  TLLogVibrationManagement();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = &off_1D341A000;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v38 = self;
    v39 = 2114;
    v40 = v13;
    v41 = 2114;
    v42 = v8;
    v43 = 2114;
    v44 = v9;
    v45 = 1024;
    LODWORD(v46) = v10;
    _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). areSynchronizedVibrationsAllowed = %{BOOL}u.", buf, 0x30u);

  }
  if (v10)
  {
    v14 = v9;
    if (!-[__CFString length](v9, "length"))
    {
      +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentToneIdentifierForAlertType:topic:", a3, v8);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    -[TLVibrationManager _synchronizedVibrationIdentifierForToneIdentifier:targetDevice:](self, "_synchronizedVibrationIdentifierForToneIdentifier:targetDevice:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TLLogVibrationManagement();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = self;
      v39 = 2114;
      v40 = v18;
      v41 = 2114;
      v42 = v8;
      v43 = 2114;
      v44 = v9;
      v45 = 2114;
      v46 = v14;
      v47 = 2114;
      v48 = v16;
      _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). resolvedCorrespondingToneIdentifier = \"%{public}@\"; synchronizedVibrationIdentifier = \"%{public}@\".",
        buf,
        0x3Eu);

    }
  }
  else
  {
    v16 = 0;
    v14 = v9;
  }
  v19 = objc_msgSend(0, "length");
  v20 = 0;
  if (a3 && !v19)
  {
    if ((unint64_t)a3 > 0x1D)
    {
      v20 = 0;
    }
    else
    {
      v20 = _TLVibrationManagerDefaultIdentifiers[a3 - 1];
      if ((-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("Built-In-System-Sound-ID-Vibration")) & 1) == 0
        && (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("Corresponding-Synchronized-Vibration")) & 1) == 0)
      {
        -[TLVibrationManager _patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:](self, "_patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:", v20, v14, 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          objc_msgSend(CFSTR("UserSelectable"), "stringByAppendingPathComponent:", CFSTR("Classic"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[TLVibrationManager _systemVibrationIdentifiersForSubdirectory:](self, "_systemVibrationIdentifiersForSubdirectory:", v35);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v22;
          if ((objc_msgSend(v22, "containsObject:", v20) & 1) != 0)
          {
            v12 = &off_1D341A000;
            v23 = v36;
          }
          else
          {
            v24 = *(&_TLVibrationManagerClassicFallbackDefaultIdentifiers + a3 - 1);
            if (-[__CFString length](v24, "length"))
            {
              v25 = v24;

              v20 = v25;
            }
            v23 = v36;

            v12 = &off_1D341A000;
          }

          v21 = 0;
        }

      }
      if (!-[__CFString length](v20, "length"))
      {
        v26 = CFSTR("<none>");

        v20 = v26;
      }
    }
  }
  if (!-[__CFString length](v20, "length"))
  {
    v27 = CFSTR("<none>");

    v20 = v27;
  }
  if (objc_msgSend(v16, "length")
    && (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
  {
    v28 = v16;

    v20 = v28;
  }
  switch(a3)
  {
    case 1:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) != 0)
        goto LABEL_63;
      v29 = TLAlertTopicIncomingCallFaceTimeParticipantJoined;
      goto LABEL_58;
    case 2:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHeart")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsUp")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsDown")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHaHa")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentExclamation")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentQuestionMark")) & 1) == 0)
      {
        goto LABEL_65;
      }
      v30 = CFSTR("Text-Message-Acknowledgement");
      goto LABEL_64;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 21:
      goto LABEL_65;
    case 5:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.VIP")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.ThreadNotify")) & 1) == 0)
      {
        goto LABEL_65;
      }
      v30 = CFSTR("Quick");
      goto LABEL_64;
    case 9:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationSharingPost")) & 1) != 0)
        goto LABEL_52;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationMemory")) & 1) == 0)
        goto LABEL_65;
      v30 = CFSTR("PhotosMemoriesNotification");
      goto LABEL_64;
    case 13:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")) & 1) != 0)
        goto LABEL_63;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAlarmWakeUp")) & 1) == 0)
        goto LABEL_65;
LABEL_52:
      v30 = CFSTR("<none>");
      goto LABEL_64;
    case 16:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationBackgroundMicUsage")) & 1) != 0)
      {
        v30 = CFSTR("Background-Mic-Usage");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationElevationAlert")) & 1) == 0)
      {
        v29 = TLAlertTopicSystemNotificationHeadphoneAudioExposure;
LABEL_58:
        if ((objc_msgSend(v8, "isEqualToString:", *v29) & 1) == 0)
          goto LABEL_65;
      }
LABEL_63:
      v30 = CFSTR("Built-In-System-Sound-ID-Vibration");
      goto LABEL_64;
    case 17:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) & 1) == 0)
        goto LABEL_65;
      v30 = CFSTR("App-Notification-Critical-Alert");
      goto LABEL_64;
    case 20:
      v29 = TLAlertTopicPassbookNFCScanComplete;
      goto LABEL_58;
    case 22:
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownTick")) & 1) != 0)
      {
        v30 = CFSTR("SOS-Countdown-Tick");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSOSDialStart")) & 1) != 0)
      {
        v30 = CFSTR("SOS-Dial-Start");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSOSButtonChordingTimeout")) & 1) != 0)
      {
        v30 = CFSTR("SOS-Button-Chording-Timeout");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownPreannounce")) & 1) == 0)
        goto LABEL_65;
      v30 = CFSTR("SOS-Countdown-Preannounce");
      goto LABEL_64;
    default:
      if (a3 != 27)
        goto LABEL_65;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicHandwashingReminder")) & 1) != 0)
      {
        v30 = CFSTR("Handwashing-Reminder");
LABEL_64:

        v20 = v30;
        goto LABEL_65;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionStart")) & 1) != 0)
      {
        v30 = CFSTR("Handwashing-Session-Start");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionProgressTapHaptics")) & 1) != 0)
      {
        v30 = CFSTR("Handwashing-Session-Progress-Tap-Haptics");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionProgressVibeHaptics")) & 1) != 0)
      {
        v30 = CFSTR("Handwashing-Session-Progress-Vibe-Haptics");
        goto LABEL_64;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionEnd")) & 1) != 0)
      {
        v30 = CFSTR("Handwashing-Session-End");
        goto LABEL_64;
      }
LABEL_65:
      TLLogVibrationManagement();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = *((_QWORD *)v12 + 233);
        v38 = self;
        v39 = 2114;
        v40 = v32;
        v41 = 2114;
        v42 = v8;
        v43 = 2114;
        v44 = v9;
        v45 = 2114;
        v46 = v20;
        _os_log_impl(&dword_1D33D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). Returning: %{public}@.", buf, 0x34u);

      }
      v33 = v20;

      return v33;
  }
}

- (id)defaultVibrationNameForAlertType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TLVibrationManager defaultVibrationIdentifierForAlertType:](self, "defaultVibrationIdentifierForAlertType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager nameOfVibrationWithIdentifier:](self, "nameOfVibrationWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultVibrationPatternForAlertType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TLVibrationManager defaultVibrationIdentifierForAlertType:](self, "defaultVibrationIdentifierForAlertType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager _patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:](self, "_patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:", v4, 0, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultPreferablyNonSilentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  void *v7;
  int v8;
  uint64_t v9;

  -[TLVibrationManager _defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("<none>"));
  if (a3 == 5 && v8)
  {
    -[TLVibrationManager defaultVibrationIdentifierForAlertType:topic:](self, "defaultVibrationIdentifierForAlertType:topic:", 5, CFSTR("com.apple.mobilemail.bulletin-subsection.VIP"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (BOOL)hasSpecificDefaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[TLVibrationManager defaultVibrationIdentifierForAlertType:](self, "defaultVibrationIdentifierForAlertType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager defaultVibrationIdentifierForAlertType:topic:](self, "defaultVibrationIdentifierForAlertType:topic:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v7) & 1) != 0)
    {
      LOBYTE(v9) = 0;
    }
    else if (objc_msgSend(v7, "hasPrefix:", CFSTR("synchronizedvibration:")))
    {
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("synchronizedvibration:")) ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)noneVibrationName
{
  return -[TLVibrationManager nameOfVibrationWithIdentifier:](self, "nameOfVibrationWithIdentifier:", CFSTR("<none>"));
}

- (id)noneVibrationPattern
{
  void *v2;
  void *v3;

  +[TLVibrationPattern noneVibrationPattern](TLVibrationPattern, "noneVibrationPattern");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyListRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isUnitTestingModeEnabled
{
  return (LOBYTE(self->_specialBehaviors) >> 1) & 1;
}

- (id)_completeSystemVibrationsSubdirectoryForSubdirectory:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__TLVibrationManager__completeSystemVibrationsSubdirectoryForSubdirectory___block_invoke;
  v8[3] = &unk_1E952A770;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__TLVibrationManager__completeSystemVibrationsSubdirectoryForSubdirectory___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(CFSTR("Vibrations"), "stringByAppendingPathComponent:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "deviceCodeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && objc_msgSend(v10, "length"))
    {
      objc_msgSend(v5, "stringByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = 0;
      objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v13, &v36);

      if (v14 && (_BYTE)v36)
      {
        v15 = objc_msgSend(v12, "copy");
        v16 = *(_QWORD *)(a1[6] + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v18)
      goto LABEL_17;
    objc_msgSend(v7, "simplifiedDeviceCodeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length") && (objc_msgSend(v11, "isEqualToString:", v19) & 1) == 0)
    {
      objc_msgSend(v5, "stringByAppendingPathComponent:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = 0;
      objc_msgSend(v9, "stringByAppendingPathComponent:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v21, &v36);

      if (v22 && (_BYTE)v36)
      {
        v23 = objc_msgSend(v20, "copy");
        v24 = *(_QWORD *)(a1[6] + 8);
        v25 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;

      }
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v18
      || (v26 = objc_msgSend(v5, "copy"),
          v27 = *(_QWORD *)(a1[6] + 8),
          v28 = *(void **)(v27 + 40),
          *(_QWORD *)(v27 + 40) = v26,
          v28,
          (v18 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)) != 0))
    {
LABEL_17:
      v29 = *(void **)(a1[4] + 32);
      if (!v29)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v31 = a1[4];
        v32 = *(void **)(v31 + 32);
        *(_QWORD *)(v31 + 32) = v30;

        v29 = *(void **)(a1[4] + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      }
      objc_msgSend(v29, "setObject:forKey:", v18, a1[5]);
      TLLogVibrationManagement();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = a1[5];
        objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v34;
        v38 = 2114;
        v39 = v35;
        _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "Looking up system vibrations for subdirectory %{public}@ at absolute path: %{public}@.", (uint8_t *)&v36, 0x16u);

      }
    }

  }
}

- (id)_systemVibrationIdentifiersForSubdirectory:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__TLVibrationManager__systemVibrationIdentifiersForSubdirectory___block_invoke;
  v8[3] = &unk_1E952A770;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __65__TLVibrationManager__systemVibrationIdentifiersForSubdirectory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_completeSystemVibrationsSubdirectoryForSubdirectory:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathsForResourcesOfType:inDirectory:", CFSTR("plist"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v22 = v5;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByDeletingPathExtension");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "length"))
          {
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v10, "addObject:", v14);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
      if (v10)
      {
        v15 = objc_msgSend(v10, "copy");
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        v5 = v22;
        if (!v18)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v20 = *(_QWORD *)(a1 + 32);
          v21 = *(void **)(v20 + 24);
          *(_QWORD *)(v20 + 24) = v19;

          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        }
        objc_msgSend(v18, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
      }
      else
      {
        v5 = v22;
      }
    }
    else
    {
      v10 = 0;
    }

  }
}

- (id)_patternForSystemVibrationWithIdentifier:(id)a3 correspondingToneIdentifier:(id)a4 targetDevice:(int64_t)a5 shouldLogAssetPath:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  uint64_t v36;
  uint64_t v37;
  id (*v38)(uint64_t, void *, uint64_t);
  void *v39;
  NSObject *v40;
  TLVibrationManager *v41;
  id v42;
  BOOL v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v6 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("<none>")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __123__TLVibrationManager__patternForSystemVibrationWithIdentifier_correspondingToneIdentifier_targetDevice_shouldLogAssetPath___block_invoke;
    v39 = &unk_1E952B338;
    v13 = v14;
    v40 = v13;
    v41 = self;
    v43 = v6;
    v15 = v10;
    v42 = v15;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D824F08C](&v36);
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager", v36, v37, v38, v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasSynchronizedVibrationsCapability");

    if (!v18)
      goto LABEL_21;
    if (!objc_msgSend(v15, "hasPrefix:", CFSTR("synchronizedvibration:")))
      goto LABEL_34;
    objc_msgSend(v15, "substringFromIndex:", objc_msgSend(CFSTR("synchronizedvibration:"), "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, const __CFString *))v16)[2](v16, v20, CFSTR("Synchronized"));
    v21 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v21;
    if (a5 == 1 && !v21)
    {
      TLLogVibrationManagement();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        _TLAlertTargetDeviceGetHumanReadableDescription(1uLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v15;
        v46 = 2114;
        v47 = v23;
        _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "Making assumption that \"%{public}@\" is a valid synchronized vibration for target device: %{public}@.", buf, 0x16u);

      }
      +[TLVibrationPattern simpleVibrationPatternWithVibrationDuration:pauseDuration:](TLVibrationPattern, "simpleVibrationPatternWithVibrationDuration:pauseDuration:", 0.1, 0.1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "propertyListRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (_os_feature_enabled_impl())
    {
      if (v12)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v20, "stringByAppendingString:", CFSTR("-EncoreInfinitum"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, const __CFString *))v16)[2](v16, v25, CFSTR("Synchronized"));
      v26 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v26;
      if (v11 && !v26)
      {
        +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "filePathForToneIdentifier:", v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsString:", CFSTR("-EncoreInfinitum"));

        if (v30)
        {
          +[TLVibrationPattern simpleVibrationPatternWithVibrationDuration:pauseDuration:](TLVibrationPattern, "simpleVibrationPatternWithVibrationDuration:pauseDuration:", 0.1, 0.1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "propertyListRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v25 = v20;
    }

    if (!v12)
    {
LABEL_34:
      objc_msgSend(CFSTR("UserSelectable"), "stringByAppendingPathComponent:", CFSTR("Modern"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v16)[2](v16, v15, v32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_21:
        objc_msgSend(CFSTR("UserSelectable"), "stringByAppendingPathComponent:", CFSTR("Classic"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *))v16)[2](v16, v15, v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          if (v18)
            v34 = CFSTR("Modern");
          else
            v34 = CFSTR("Classic");
          objc_msgSend(CFSTR("Other"), "stringByAppendingPathComponent:", v34);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, void *))v16)[2](v16, v15, v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
      }
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  -[TLVibrationManager noneVibrationPattern](self, "noneVibrationPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    TLLogVibrationManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v10;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "Using \"none\" vibration pattern for vibration identifier \"%{public}@\", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:

  return v12;
}

id __123__TLVibrationManager__patternForSystemVibrationWithIdentifier_correspondingToneIdentifier_targetDevice_shouldLogAssetPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "_completeSystemVibrationsSubdirectoryForSubdirectory:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", v7, CFSTR("plist"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && *(_BYTE *)(a1 + 56))
    {
      TLLogVibrationManagement();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v12;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "Vibration pattern for identifier \"%{public}@\" found at path: %{public}@.", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_localizedNameForVibrationWithIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<none>")) & 1) != 0)
  {
    v4 = CFSTR("VIBRATION_PICKER_NONE");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("synchronizedvibration:")) & 1) != 0)
  {
    v4 = CFSTR("SYNCHRONIZED_VIBRATION_NAME");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("vibration:"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  TLLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v4))
  {

    v5 = 0;
  }

  return v5;
}

- (id)_nameOfVibrationWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  TLVibrationManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__TLVibrationManager__nameOfVibrationWithIdentifier___block_invoke;
  v8[3] = &unk_1E952A888;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __53__TLVibrationManager__nameOfVibrationWithIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("usergeneratedvibration:"));
  v3 = *(void **)(a1 + 40);
  if (!v2)
  {
    objc_msgSend(v3, "_localizedNameForVibrationWithIdentifier:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    goto LABEL_5;
  }
  objc_msgSend(v3, "_userGeneratedVibrationPatterns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("Pattern"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

LABEL_5:
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "patternForVibrationWithIdentifier:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
}

- (id)nameOfVibrationWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TLVibrationManager _nameOfVibrationWithIdentifier:](self, "_nameOfVibrationWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      TLLocalizedString(CFSTR("VIBRATION_UNKNOWN_NAME"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)patternForVibrationWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  TLVibrationManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__TLVibrationManager_patternForVibrationWithIdentifier___block_invoke;
  v8[3] = &unk_1E952B360;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __56__TLVibrationManager_patternForVibrationWithIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("usergeneratedvibration:"));
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "_userGeneratedVibrationPatterns");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("Pattern"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = v11;
  }
  else
  {
    objc_msgSend(v3, "_patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:", *(_QWORD *)(a1 + 32), 0, 0, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

}

- (id)patternForVibrationWithIdentifier:(id)a3 repeating:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  TLVibrationPattern *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  -[TLVibrationManager patternForVibrationWithIdentifier:](self, "patternForVibrationWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v6, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
  {
    v8 = -[TLVibrationPattern initWithPropertyListRepresentation:]([TLVibrationPattern alloc], "initWithPropertyListRepresentation:", v7);
    -[TLVibrationPattern _artificiallyRepeatingPropertyListRepresentation](v8, "_artificiallyRepeatingPropertyListRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)allUserSelectableSystemVibrationIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(CFSTR("UserSelectable"), "stringByAppendingPathComponent:", CFSTR("Classic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager _systemVibrationIdentifiersForSubdirectory:](self, "_systemVibrationIdentifiersForSubdirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSynchronizedVibrationsCapability");

  if (v6)
  {
    objc_msgSend(CFSTR("UserSelectable"), "stringByAppendingPathComponent:", CFSTR("Modern"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager _systemVibrationIdentifiersForSubdirectory:](self, "_systemVibrationIdentifiersForSubdirectory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "setByAddingObjectsFromSet:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }

  }
  objc_msgSend(v4, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allUserGeneratedVibrationIdentifiers
{
  void *v2;
  void *v3;

  -[TLVibrationManager _userGeneratedVibrationPatterns](self, "_userGeneratedVibrationPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)vibrationWithIdentifierIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TLVibrationManager _nameOfVibrationWithIdentifier:](self, "_nameOfVibrationWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_systemWideVibrationPatternPreferenceKeyForAlertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1C)
    return 0;
  else
    return _TLVibrationManagerSystemWideVibrationPatternPreferenceKeys[a3 - 1];
}

- (BOOL)_vibrationIsSettableForAlertType:(int64_t)a3
{
  void *v3;
  BOOL v4;

  -[TLVibrationManager _systemWideVibrationPatternPreferenceKeyForAlertType:](self, "_systemWideVibrationPatternPreferenceKeyForAlertType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)_handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:(unint64_t)a3 atInitiativeOfVibrationManager:(id)a4
{
  char v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  objc_class *NPSDomainAccessorClass_0;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _BYTE *v30;
  uint8_t v31[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v4 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (_TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification == 1)
  {
    _TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification = 0;
    TLLogVibrationManagement();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Ignoring notification.", buf, 0xCu);
    }
  }
  else
  {
    TLLogVibrationManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…", buf, 0xCu);
    }

    if ((v4 & 1) != 0)
    {
      v9 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
      v10 = v9;
      if (v9)
      {
        CFPreferencesSynchronize(v9, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
        TLLogVibrationManagement();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Synchronized CFPreferences domain %{public}@.", buf, 0x16u);
        }

        CFRelease(v10);
      }
    }
    if ((v4 & 2) != 0)
    {
      if (+[TLPreferencesUtilities canAccessNanoRegistry](TLPreferencesUtilities, "canAccessNanoRegistry")&& (NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0()) != 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v36 = __Block_byref_object_copy__1;
        v37 = __Block_byref_object_dispose__1;
        v38 = 0;
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke;
        v28 = &unk_1E952A6F8;
        v30 = buf;
        v29 = v6;
        objc_msgSend(v29, "_performBlockInAccessQueue:", &v25);
        v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (!v13)
        {
          v14 = [NPSDomainAccessorClass_0 alloc];
          +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain", v25, v26, v27, v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "initWithDomain:", v15);
          v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v16;

          TLLogVibrationManagement();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v31 = 138543618;
            v32 = a1;
            v33 = 2114;
            v34 = v19;
            _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Instantiated domain accessor %{public}@.", v31, 0x16u);
          }

          v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
        }
        v20 = (id)objc_msgSend(v13, "synchronize", v25, v26, v27, v28);
        TLLogVibrationManagement();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v31 = 138543618;
          v32 = a1;
          v33 = 2114;
          v34 = v22;
          _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Synchronized domain accessor %{public}@.", v31, 0x16u);
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        TLLogVibrationManagement();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = +[TLPreferencesUtilities canAccessNanoRegistry](TLPreferencesUtilities, "canAccessNanoRegistry");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v24;
          _os_log_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Skipping synchronizing the domain accessor. canAccessNanoRegistry = %{BOOL}u.", buf, 0x12u);
        }

      }
    }
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, &__block_literal_global_171);
  }

}

void __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke_170()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("TLVibrationPreferencesDidChangeNotification"), 0);

}

+ (void)_handleVibrateOnRingOrSilentDidChangeNotification
{
  __CFString *v2;
  __CFString *v3;

  v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  if (v2)
  {
    v3 = v2;
    CFPreferencesSynchronize(v2, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFRelease(v3);
  }
}

- (void)_didSetVibrationPreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  objc_class *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  TLLogVibrationManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v24 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfullyWithKey:(%{public}@) inDomain:(%{public}@)…", buf, 0x20u);
  }

  objc_msgSend((id)objc_opt_class(), "_handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:atInitiativeOfVibrationManager:", a5, self);
  _TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_TLVibrationPreferencesDidChangeNotification"), 0, 0, 1u);
  if (a5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v12 = (void *)getNPSManagerClass_softClass_0;
    v22 = getNPSManagerClass_softClass_0;
    if (!getNPSManagerClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNPSManagerClass_block_invoke_0;
      v24 = &unk_1E952AB10;
      v25[0] = &v19;
      __getNPSManagerClass_block_invoke_0((uint64_t)buf);
      v12 = (void *)v20[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v19, 8);
    if (v13)
    {
      v14 = objc_alloc_init(v13);
      TLLogVibrationManagement();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Instantiated preferences sync manager %{public}@.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a5 & 1) != 0)
      {
        objc_msgSend(v14, "synchronizeUserDefaultsDomain:keys:", v9, v16);
        TLLogVibrationManagement();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          v24 = v14;
          LOWORD(v25[0]) = 2114;
          *(_QWORD *)((char *)v25 + 2) = v16;
          _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Did synchronize user defaults domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }

      }
      if ((a5 & 2) != 0)
      {
        objc_msgSend(v14, "synchronizeNanoDomain:keys:", v9, v16);
        TLLogVibrationManagement();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          v24 = v14;
          LOWORD(v25[0]) = 2114;
          *(_QWORD *)((char *)v25 + 2) = v16;
          _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Did synchronize nano domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }

      }
    }
  }

}

- (BOOL)_areSynchronizedVibrationsAllowedForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  char v8;

  v5 = a4;
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "hasSynchronizedVibrationsCapability"))
    goto LABEL_6;
  v7 = +[TLAlertController _playbackBackEndForAlertType:topic:](TLAlertController, "_playbackBackEndForAlertType:topic:", a3, v5);
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (!v7)
    {
      v8 = objc_msgSend(v6, "hasSynchronizedEmbeddedVibrationsCapability");
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (id)_synchronizedVibrationIdentifierForToneIdentifier:(id)a3 targetDevice:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int64_t v14;
  void *v15;
  int v16;
  TLVibrationManager *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  __CFString *v23;
  TLVibrationManager *v25;

  v6 = a3;
  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_aliasForToneIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("<default>"));
  v10 = objc_msgSend(v8, "hasPrefix:", CFSTR("system:"));
  v11 = objc_msgSend(v8, "hasPrefix:", CFSTR("texttone:"));
  v12 = objc_msgSend(v8, "hasPrefix:", CFSTR("alarmWakeUp:"));
  v13 = v12;
  if ((v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0 && !v12)
    goto LABEL_17;
  v25 = self;
  v14 = a4;
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasSynchronizedVibrationsCapability");

  if (!v16)
    goto LABEL_17;
  v17 = v25;
  -[NSDictionary objectForKey:](v25->_synchronizedVibrationPatternFromToneIdentifierMapping, "objectForKey:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18
    || (v10 | v11 | v13) == 1
    && (!v11 ? (v22 = CFSTR("alarmWakeUp:")) : (v22 = CFSTR("texttone:")),
        !v10 ? (v23 = (__CFString *)v22) : (v23 = CFSTR("system:")),
        objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v23, "length")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = v25,
        v18))
  {
    objc_msgSend(CFSTR("synchronizedvibration:"), "stringByAppendingString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager _patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:](v17, "_patternForSystemVibrationWithIdentifier:correspondingToneIdentifier:targetDevice:shouldLogAssetPath:", v19, v6, v14, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      v21 = v19;
    else
      v21 = 0;

  }
  else
  {
LABEL_17:
    v21 = 0;
  }

  return v21;
}

- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 didFallbackToCurrentVibrationIdentifier:(BOOL *)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return -[TLVibrationManager _sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:useDefaultVibrationAsFallback:allowsNoneDefaultToAnyActualVibrationSubstitution:didFallback:](self, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:useDefaultVibrationAsFallback:allowsNoneDefaultToAnyActualVibrationSubstitution:didFallback:", a3, a4, a5, a6, a7, 0, v9, a8);
}

- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 useDefaultVibrationAsFallback:(BOOL)a8 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a9 didFallback:(BOOL *)a10
{
  _BOOL4 v10;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  __CFString *v22;
  int v23;
  BOOL v24;
  __CFString *v25;
  uint64_t v27;

  v10 = a8;
  v16 = a9;
  v17 = a3;
  v18 = a5;
  v19 = a7;
  if (!objc_msgSend(v17, "length"))
  {
    v22 = 0;
LABEL_8:
    v23 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(v17, "hasPrefix:", CFSTR("synchronizedvibration:")))
  {
    v22 = (__CFString *)v17;
    goto LABEL_8;
  }
  v20 = v19;
  if (!objc_msgSend(v20, "length"))
  {
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentToneIdentifierForAlertType:topic:", a4, v18);
    v27 = objc_claimAutoreleasedReturnValue();

    v16 = a9;
    v20 = (id)v27;
  }
  -[TLVibrationManager _synchronizedVibrationIdentifierForToneIdentifier:targetDevice:](self, "_synchronizedVibrationIdentifierForToneIdentifier:targetDevice:", v20, a6, v27);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
LABEL_9:
  if (-[__CFString length](v22, "length"))
  {
    v24 = 0;
  }
  else
  {
    if (v10)
      -[TLVibrationManager _defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:](self, "_defaultVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:", a4, v18, v19);
    else
      -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:allowsNoneDefaultToAnyActualVibrationSubstitution:](self, "_currentVibrationIdentifierForAlertType:topic:correspondingToneIdentifier:allowsNoneDefaultToAnyActualVibrationSubstitution:", a4, v18, v19, 0);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (((v23 | !v16) & 1) != 0
      || !-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("<none>")))
    {
      v24 = 1;
      v22 = v25;
    }
    else
    {

      v24 = 0;
      v22 = CFSTR("Quick");
    }
  }
  if (a10)
    *a10 = v24;

  return v22;
}

- (void)_handleUserGeneratedVibrationsDidChangeNotification
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73__TLVibrationManager__handleUserGeneratedVibrationsDidChangeNotification__block_invoke;
  v2[3] = &unk_1E952A748;
  v2[4] = self;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v2);
}

uint64_t __73__TLVibrationManager__handleUserGeneratedVibrationsDidChangeNotification__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 1;
  return result;
}

- (id)_userGeneratedVibrationPatterns
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__TLVibrationManager__userGeneratedVibrationPatterns__block_invoke;
  v4[3] = &unk_1E952A860;
  v4[4] = self;
  v4[5] = &v5;
  -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__TLVibrationManager__userGeneratedVibrationPatterns__block_invoke(uint64_t a1)
{
  id v2;
  _BYTE *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[65])
    v4 = 1;
  else
    v4 = v2 == 0;
  if (v4)
  {
    if (v3[65] && v3[64])
    {

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
      v3 = *(_BYTE **)(a1 + 32);
    }
    else if (v2)
    {
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "_isUnitTestingModeEnabled") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_retrieveUserGeneratedVibrationPatternsUsingService");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C99D80];
      +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL](TLVibrationPersistenceUtilities, "userGeneratedVibrationStoreFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionaryWithContentsOfURL:", v6);
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v2);
  }
LABEL_14:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v2;

}

- (void)_didChangeUserGeneratedVibrationPatterns
{
  __CFNotificationCenter *LocalCenter;

  if (-[TLVibrationManager _isUnitTestingModeEnabled](self, "_isUnitTestingModeEnabled"))
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, CFSTR("TLVibrationManagerUserGeneratedVibrationsDidChange"), 0, 0, 1u);
  }
  else
  {
    -[TLVibrationManager _handleUserGeneratedVibrationsDidChangeNotification](self, "_handleUserGeneratedVibrationsDidChangeNotification");
  }
}

- (BOOL)_saveUserGeneratedVibrationPatterns:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[TLVibrationManager _setUserGeneratedVibrationPatternsUsingService:error:](self, "_setUserGeneratedVibrationPatternsUsingService:error:", v6, a4))
  {
    -[TLVibrationManager _didChangeUserGeneratedVibrationPatterns](self, "_didChangeUserGeneratedVibrationPatterns");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)addUserGeneratedVibrationPattern:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("usergeneratedvibration:"), v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[TLVibrationManager _userGeneratedVibrationPatterns](self, "_userGeneratedVibrationPatterns");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {

          v11 = 0;
        }
        else
        {
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v14);
          if (!v16)
            v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v19[0] = CFSTR("Name");
          v19[1] = CFSTR("Pattern");
          v20[0] = v10;
          v20[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, v11);
          if (!-[TLVibrationManager _saveUserGeneratedVibrationPatterns:error:](self, "_saveUserGeneratedVibrationPatterns:error:", v16, a5))
          {

            v11 = 0;
          }

        }
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)setName:(id)a3 forUserGeneratedVibrationWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  -[TLVibrationManager _userGeneratedVibrationPatterns](self, "_userGeneratedVibrationPatterns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
      objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("Name"));
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
      objc_msgSend(v14, "setObject:forKey:", v13, v9);
      v15 = -[TLVibrationManager _saveUserGeneratedVibrationPatterns:error:](self, "_saveUserGeneratedVibrationPatterns:error:", v14, a5);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)deleteUserGeneratedVibrationPatternWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[TLVibrationManager _userGeneratedVibrationPatterns](self, "_userGeneratedVibrationPatterns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v7);
    objc_msgSend(v9, "removeObjectForKey:", v6);
    v10 = -[TLVibrationManager _saveUserGeneratedVibrationPatterns:error:](self, "_saveUserGeneratedVibrationPatterns:error:", v9, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_numberOfUserGeneratedVibrations
{
  void *v2;
  unint64_t v3;

  -[TLVibrationManager _userGeneratedVibrationPatterns](self, "_userGeneratedVibrationPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_removeAllUserGeneratedVibrationsWithError:(id *)a3
{
  _BOOL4 v4;

  v4 = -[TLVibrationManager _removeAllUserGeneratedVibrationPatternsUsingServiceWithError:](self, "_removeAllUserGeneratedVibrationPatternsUsingServiceWithError:", a3);
  if (v4)
    -[TLVibrationManager _didChangeUserGeneratedVibrationPatterns](self, "_didChangeUserGeneratedVibrationPatterns");
  return v4;
}

- (id)_newServiceConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.tonelibraryd"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCD7010);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

- (id)_retrieveUserGeneratedVibrationPatternsUsingService
{
  id v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v2 = -[TLVibrationManager _newServiceConnection](self, "_newServiceConnection");
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke;
  v13[3] = &unk_1E952A8B0;
  v5 = v3;
  v14 = v5;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_242;
  v10[3] = &unk_1E952A8D8;
  v12 = &v15;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "retrieveUserGeneratedVibrationPatternsWithCompletionHandler:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v2, "invalidate");
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TLLogVibrationManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_cold_1(v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else if (v7)
  {
    TLLogVibrationManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_242_cold_1(v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_setUserGeneratedVibrationPatternsUsingService:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v7 = -[TLVibrationManager _newServiceConnection](self, "_newServiceConnection");
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke;
  v19[3] = &unk_1E952B3A8;
  v21 = &v22;
  v10 = v8;
  v20 = v10;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_244;
  v15[3] = &unk_1E952B3D0;
  v17 = &v28;
  v18 = &v22;
  v12 = v10;
  v16 = v12;
  objc_msgSend(v11, "setUserGeneratedVibrationPatterns:withCompletionHandler:", v6, v15);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v7, "invalidate");
  if (a4)
    *a4 = objc_retainAutorelease((id)v23[5]);
  v13 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  TLLogVibrationManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_244(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    TLLogVibrationManagement();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_244_cold_1(v6);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_removeAllUserGeneratedVibrationPatternsUsingServiceWithError:(id *)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v4 = -[TLVibrationManager _newServiceConnection](self, "_newServiceConnection");
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke;
  v16[3] = &unk_1E952B3A8;
  v18 = &v19;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_246;
  v12[3] = &unk_1E952B3D0;
  v14 = &v25;
  v15 = &v19;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "removeAllUserGeneratedVibrationPatternsWithCompletionHandler:", v12);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "invalidate");
  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v10 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v10;
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  TLLogVibrationManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_246(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    TLLogVibrationManagement();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_246_cold_1(v6);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_BOOLeanPreferenceForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  __CFString *v6;
  __CFString *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;

  v6 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFBoolean *)CFPreferencesCopyValue(a3, v6, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFBooleanGetTypeID())
        a4 = CFBooleanGetValue(v9) != 0;
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  return a4;
}

- (BOOL)shouldVibrateForCurrentRingerSwitchState
{
  void *v3;
  uint64_t v4;

  +[TLSilentModeController sharedSilentModeController](TLSilentModeController, "sharedSilentModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "silentModeStatus");

  if (v4 == 1)
    return -[TLVibrationManager shouldVibrateOnSilent](self, "shouldVibrateOnSilent");
  else
    return -[TLVibrationManager shouldVibrateOnRing](self, "shouldVibrateOnRing");
}

- (BOOL)shouldVibrateOnRing
{
  return -[TLVibrationManager _BOOLeanPreferenceForKey:defaultValue:](self, "_BOOLeanPreferenceForKey:defaultValue:", CFSTR("ring-vibrate"), 1);
}

- (BOOL)shouldVibrateOnSilent
{
  return -[TLVibrationManager _BOOLeanPreferenceForKey:defaultValue:](self, "_BOOLeanPreferenceForKey:defaultValue:", CFSTR("silent-vibrate"), 1);
}

- (BOOL)_migrateLegacySettings
{
  unint64_t v3;
  TLToneManager *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v3 = -[TLVibrationManager _storedSystemVibrationDataMigrationVersion](self, "_storedSystemVibrationDataMigrationVersion");
  if (!v3)
  {
    v4 = objc_alloc_init(TLToneManager);
    for (i = 0; i != 10; ++i)
    {
      v6 = qword_1D341A858[i];
      -[TLToneManager currentToneIdentifierForAlertType:](v4, "currentToneIdentifierForAlertType:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("<none>")))
      {
        -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:](self, "_currentVibrationIdentifierForAlertType:topic:", v6, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {

        }
        else
        {
          -[TLVibrationManager defaultVibrationIdentifierForAlertType:](self, "defaultVibrationIdentifierForAlertType:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("<none>"));

          if ((v10 & 1) == 0)
            -[TLVibrationManager setCurrentVibrationIdentifier:forAlertType:](self, "setCurrentVibrationIdentifier:forAlertType:", CFSTR("<none>"), v6);
        }
      }

    }
    v3 = 0;
  }
  if (v3 > 1)
  {
    if (v3 != 2)
      goto LABEL_17;
  }
  else
  {
    v11 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
    if (v11)
    {
      v12 = v11;
      +[TLPreferencesUtilities migratePerTopicPreferencesInDomain:withRegularPreferenceKeys:regularPreferenceKeysCount:intoSinglePerTopicPreferenceWithSuffix:usingPreferencesScope:](TLPreferencesUtilities, "migratePerTopicPreferencesInDomain:withRegularPreferenceKeys:regularPreferenceKeysCount:intoSinglePerTopicPreferenceWithSuffix:usingPreferencesScope:", v11, _TLVibrationManagerSystemWideVibrationPatternPreferenceKeys, 29, CFSTR("PerAccount"), 1);
      CFRelease(v12);
    }
  }
  -[TLVibrationManager _currentVibrationIdentifierForAlertType:topic:](self, "_currentVibrationIdentifierForAlertType:topic:", 5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("<none>")))
    -[TLVibrationManager setCurrentVibrationIdentifier:forAlertType:](self, "setCurrentVibrationIdentifier:forAlertType:", 0, 5);

LABEL_17:
  -[TLVibrationManager _makeSystemVibrationDataMigrationVersionCurrentIfNecessary](self, "_makeSystemVibrationDataMigrationVersionCurrentIfNecessary");
  return 1;
}

- (unint64_t)_storedSystemVibrationDataMigrationVersion
{
  __CFString *v2;
  void *v3;
  CFTypeID v4;

  v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyValue(CFSTR("SystemVibrationDataMigrationVersion"), v2, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFRelease(v2);
    if (v3)
    {
      v4 = CFGetTypeID(v3);
      if (v4 == CFNumberGetTypeID())
        v2 = (__CFString *)objc_msgSend(v3, "unsignedIntegerValue");
      else
        v2 = 0;
      CFRelease(v3);
    }
    else
    {
      return 0;
    }
  }
  return (unint64_t)v2;
}

- (void)_makeSystemVibrationDataMigrationVersionCurrentIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TLVibrationManager__makeSystemVibrationDataMigrationVersionCurrentIfNecessary__block_invoke;
  block[3] = &unk_1E952A748;
  block[4] = self;
  if (_makeSystemVibrationDataMigrationVersionCurrentIfNecessary__TLVibrationManagerMakeSystemVibrationDataMigrationVersionCurrentOnceToken != -1)
    dispatch_once(&_makeSystemVibrationDataMigrationVersionCurrentIfNecessary__TLVibrationManagerMakeSystemVibrationDataMigrationVersionCurrentOnceToken, block);
}

void __80__TLVibrationManager__makeSystemVibrationDataMigrationVersionCurrentIfNecessary__block_invoke(uint64_t a1)
{
  __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "_storedSystemVibrationDataMigrationVersion") <= 2)
  {
    v1 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
    if (v1)
    {
      v2 = v1;
      v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
      CFPreferencesSetValue(CFSTR("SystemVibrationDataMigrationVersion"), &unk_1E9538198, v1, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      CFPreferencesSynchronize(v2, v3, v4);
      CFRelease(v2);
    }
  }
}

- (id)_currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  -[TLVibrationManager _systemWideVibrationPatternPreferenceKeyForAlertType:](self, "_systemWideVibrationPatternPreferenceKeyForAlertType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("VibrationIdentifier"), CFSTR("Vibration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingString:", CFSTR("WatchAlertPolicy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "length");
  if (v10)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("PerAccount"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  return v9;
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3
{
  return -[TLVibrationManager _currentVibrationWatchAlertPolicyForAlertType:topic:](self, "_currentVibrationWatchAlertPolicyForAlertType:topic:", a3, 0);
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLVibrationManager _currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a3, a4, 0);
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5
{
  id v8;
  int64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *NPSDomainAccessorClass_0;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  char isKindOfClass;
  BOOL *v23;
  uint8_t buf[4];
  TLVibrationManager *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((unint64_t)(a3 - 13) >= 2)
  {
    if (a3 == 17)
    {
      +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsNanoEncore");

      v9 = v11 ^ 1u;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }
  v12 = objc_msgSend(v8, "length");
  +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationManager _currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:topic:](self, "_currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:topic:", a3, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0()) == 0)
  {
    isKindOfClass = 0;
LABEL_21:
    if (v12)
      v9 = -[TLVibrationManager _currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a3, 0, 0);
    goto LABEL_23;
  }
  v23 = a5;
  v16 = (void *)objc_msgSend([NPSDomainAccessorClass_0 alloc], "initWithDomain:", v13);
  TLLogVibrationManagement();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v16;
    _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationWatchAlertPolicy…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  objc_msgSend(v16, "objectForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogVibrationManagement();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2114;
    v27 = v14;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "objectForKey:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

    v18 = (void *)v20;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = TLWatchAlertPolicyFromString(v18);

  a5 = v23;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_21;
LABEL_23:
  if (a5)
    *a5 = isKindOfClass & 1;

  return v9;
}

- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
  -[TLVibrationManager _setCurrentVibrationWatchAlertPolicy:forAlertType:topic:](self, "_setCurrentVibrationWatchAlertPolicy:forAlertType:topic:", a3, a4, 0);
}

- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8;
  void *v9;
  int64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v8 = a5;
  if (a3 == 3)
  {
    -[TLVibrationManager currentVibrationIdentifierForAlertType:topic:](self, "currentVibrationIdentifierForAlertType:topic:", a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("<none>")))
      a3 = 2;
    else
      a3 = 1;

  }
  v21 = 0;
  v10 = -[TLVibrationManager _currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentVibrationWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a4, v8, &v21);
  if (v21)
    v11 = v10 == a3;
  else
    v11 = 0;
  if (!v11)
  {
    +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLVibrationManager _currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:topic:](self, "_currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:topic:", a4, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      NSStringFromTLWatchAlertPolicy(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __78__TLVibrationManager__setCurrentVibrationWatchAlertPolicy_forAlertType_topic___block_invoke;
      v16[3] = &unk_1E952AA30;
      v16[4] = self;
      v17 = v12;
      v18 = v8;
      v19 = v13;
      v20 = v14;
      v15 = v14;
      -[TLVibrationManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v16);

    }
    else
    {
      TLLogVibrationManagement();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TLToneManager _setCurrentToneWatchAlertPolicy:forAlertType:topic:].cold.1(a4);
    }

  }
}

void __78__TLVibrationManager__setCurrentVibrationWatchAlertPolicy_forAlertType_topic___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  objc_class *NPSDomainAccessorClass_0;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0();
  if (!NPSDomainAccessorClass_0)
  {
    v3 = 0;
    goto LABEL_3;
  }
  v3 = (void *)objc_msgSend([NPSDomainAccessorClass_0 alloc], "initWithDomain:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v3);
  TLLogVibrationManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v25 = 138543618;
    v26 = v7;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v25, 0x16u);
  }

  v4 = 1;
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 56));
    v8 = objc_claimAutoreleasedReturnValue();
    TLLogVibrationManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 56);
      v25 = 138544130;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v3;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = -[NSObject mutableCopy](v8, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    -[NSObject setObject:forKey:](v12, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setObject:forKey:", v13, *(_QWORD *)(a1 + 56));
    TLLogVibrationManagement();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 56);
      v25 = 138544130;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      v29 = 2114;
      v30 = v3;
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    TLLogVibrationManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 56);
      v16 = *(NSObject **)(a1 + 64);
      v25 = 138544130;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      v29 = 2114;
      v30 = v3;
      v31 = 2114;
      v32 = v16;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }
  }

  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 56);
  +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_didSetVibrationPreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", v21, v22, 2);

  if (v4)
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 56);
    *(_QWORD *)(v23 + 56) = 0;

  }
}

- (void)_performBlockInAccessQueue:(id)a3
{
  -[TLAccessQueue performSynchronousBlock:](self->_accessQueue, "performSynchronousBlock:", a3);
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (BOOL)allowsAutoRefresh
{
  return self->_allowsAutoRefresh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientNanoPreferencesDomainAccessor, 0);
  objc_storeStrong((id *)&self->_synchronizedVibrationPatternFromToneIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_cachedUserGeneratedVibrationPatterns, 0);
  objc_storeStrong((id *)&self->_cachedSystemVibrationCompleteSubdirectories, 0);
  objc_storeStrong((id *)&self->_cachedSystemVibrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Unexpected error while retrieving user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_242_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed retrieving user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Unexpected error while setting user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_244_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed setting user generated vibration patterns with error: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Unexpected error while removing user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_246_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed removing user generated vibration patterns with error: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
