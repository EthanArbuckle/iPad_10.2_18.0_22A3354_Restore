@implementation TIPreferencesController

- (id)valueForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  TIPreferencesController *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *configuredDomains;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  NSMutableDictionary *configuredPreferences;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!isManagedPreferenceKey(v4)
    || -[TIPreferencesController MCValueForManagedPreferenceKey:](self, "MCValueForManagedPreferenceKey:", v4) != 2)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[NSMutableDictionary objectForKey:](v6->_configuredPreferences, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v5 = 0;
      goto LABEL_18;
    }
    configuredDomains = v6->_configuredDomains;
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](configuredDomains, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIPreferencesController synchronizeDomainIfNeedsGet:](v6, "synchronizeDomainIfNeedsGet:", v11);
    v30[0] = CFSTR("TypologyEnabledByProfile");
    v30[1] = CFSTR("CustomerTypologyEnabledByDiagnosticExtension");
    v30[2] = CFSTR("KeyboardTransformerLMForAutocorrection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.keyboard"))
      && !-[TIPreferencesController isInternalInstall](v6, "isInternalInstall"))
    {
      objc_msgSend(v8, "key");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v12, "containsObject:", v28);

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v8, "defaultValue");
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "currentValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v8, "key");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "domain");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)CFPreferencesCopyAppValue(v15, v16);

      objc_msgSend(v8, "setCurrentValue:", v17);
    }
    objc_msgSend(v8, "currentValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else
    {
      objc_msgSend(v8, "fallbackKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        configuredPreferences = v6->_configuredPreferences;
        objc_msgSend(v8, "fallbackKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](configuredPreferences, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v26, "key");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIPreferencesController valueForPreferenceKey:](v6, "valueForPreferenceKey:", v27);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
      }
    }
    objc_msgSend(v8, "currentValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v8, "defaultValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentValue:", v20);

    }
    objc_msgSend(v8, "currentValue");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v5 = (void *)v21;
LABEL_16:

LABEL_18:
    objc_sync_exit(v6);

    goto LABEL_19;
  }
  v5 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_19:

  return v5;
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:isWatchSync:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:isWatchSync:", a3, a4, a5, a6, a7, a8, v8);
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8 isWatchSync:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *configuredPreferences;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v9 = a8;
  v10 = a7;
  v30 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[NSMutableDictionary objectForKey:](self->_configuredPreferences, "objectForKey:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v18, "defaultValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v19, "defaultValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "isEqual:", v16);

    }
  }
  else
  {
    if (!self->_configuredPreferences)
    {
      v22 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1000);
      configuredPreferences = self->_configuredPreferences;
      self->_configuredPreferences = v22;

    }
    +[_TIPreference preferenceWithKey:domain:defaultValue:fallbackKey:isAnalyzed:](_TIPreference, "preferenceWithKey:domain:defaultValue:fallbackKey:isAnalyzed:", v30, v15, v16, v17, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsCloudSetting:", v9);
    objc_msgSend(v19, "setIsWatchSync:", a9);
    -[NSMutableDictionary setObject:forKey:](self->_configuredPreferences, "setObject:forKey:", v19, v30);
    if (v10)
    {
      objc_msgSend(v19, "changedAtKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v24, v15, 0, 0, 0);

      objc_msgSend(v19, "analyzedAtKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v25, v15, 0, 0, 0);

      objc_msgSend(v19, "previousValueKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v26, v15, 0, 0, 0);

      objc_msgSend(v19, "buildAtChangeKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v27, v15, 0, 0, 0);

      objc_msgSend(v19, "approxDateOfBuildInstall");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v28, v15, 0, 0, 0);

      objc_msgSend(v19, "buildAtLastAnalysis");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", v29, v15, 0, 0, 0);

    }
    -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", v15, 0);
  }

}

- (void)_configureDomain:(id)a3 notification:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *configuredDomains;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v13;

  v13 = a3;
  v6 = (__CFString *)a4;
  -[NSMutableDictionary objectForKey:](self->_configuredDomains, "objectForKey:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "notification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v9)
    {
      objc_msgSend(v8, "setNotification:", v6);
LABEL_8:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  else
  {
    if (!self->_configuredDomains)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
      configuredDomains = self->_configuredDomains;
      self->_configuredDomains = v10;

    }
    +[_TIPreferenceDomain domainWithName:notification:](_TIPreferenceDomain, "domainWithName:notification:", v13, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_configuredDomains, "setObject:forKey:", v8, v13);
    if (v6)
      goto LABEL_8;
  }

}

- (void)synchronizeDomainIfNeedsGet:(id)a3
{
  TIPreferencesController *v4;
  __CFString *v5;
  NSMutableDictionary *configuredPreferences;
  id v7;
  _QWORD v8[4];
  id v9;
  TIPreferencesController *v10;

  v7 = a3;
  if (objc_msgSend(v7, "needsGetSync"))
  {
    v4 = self;
    objc_sync_enter(v4);
    objc_msgSend(v7, "setNeedsGetSync:", 0);
    objc_msgSend(v7, "domain");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);

    configuredPreferences = v4->_configuredPreferences;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__TIPreferencesController_synchronizeDomainIfNeedsGet___block_invoke;
    v8[3] = &unk_1E243AE20;
    v9 = v7;
    v10 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](configuredPreferences, "enumerateKeysAndObjectsUsingBlock:", v8);

    objc_sync_exit(v4);
  }

}

- (BOOL)isInternalInstall
{
  return self->isInternalInstall;
}

- (int)MCValueForManagedPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  NSCache *cachedMCRestrictedValue;
  NSCache *v7;
  NSCache *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSCache *v13;
  void *v14;
  void *v15;

  v4 = a3;
  managedConfigurationFeatureForPreferenceKey(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    cachedMCRestrictedValue = self->_cachedMCRestrictedValue;
    if (!cachedMCRestrictedValue)
    {
      v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      v8 = self->_cachedMCRestrictedValue;
      self->_cachedMCRestrictedValue = v7;

      cachedMCRestrictedValue = self->_cachedMCRestrictedValue;
    }
    -[NSCache objectForKey:](cachedMCRestrictedValue, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      LODWORD(v11) = objc_msgSend(v9, "intValue");
    }
    else
    {
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "effectiveBoolValueForSetting:", v5);

      v13 = self->_cachedMCRestrictedValue;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v4, "copy");
      -[NSCache setObject:forKey:](v13, "setObject:forKey:", v14, v15);

    }
  }
  else
  {
    LODWORD(v11) = 0;
  }

  return v11;
}

+ (id)sharedPreferencesController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__TIPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once != -1)
    dispatch_once(&sharedPreferencesController_once, block);
  return (id)sharedPreferencesController_sharedController;
}

- (BOOL)BOOLForKey:(int)a3
{
  void *v3;
  char v4;

  -[TIPreferencesController valueForKey:](self, "valueForKey:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)valueForKey:(int)a3
{
  void *v4;
  void *v5;

  preferenceKeyForEnumKey(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  void *v3;
  char v4;

  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)idleInit
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  v12 = getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
  {
    v5 = (void *)ManagedConfigurationLibrary();
    v4 = dlsym(v5, "MCKeyboardSettingsChangedNotification");
    v10[3] = (uint64_t)v4;
    getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_managedKeyboardSettingDidChange_, *v4, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v7 = (_QWORD *)getMCProfileListChangedNotificationSymbolLoc_ptr;
  v12 = getMCProfileListChangedNotificationSymbolLoc_ptr;
  if (!getMCProfileListChangedNotificationSymbolLoc_ptr)
  {
    v8 = (void *)ManagedConfigurationLibrary();
    v7 = dlsym(v8, "MCProfileListChangedNotification");
    v10[3] = (uint64_t)v7;
    getMCProfileListChangedNotificationSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v9, 8);
  if (v7)
  {
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_profileSettingDidChange_, *v7, 0);

  }
  else
  {
LABEL_8:
    dlerror();
    abort_report_np();
    ManagedConfigurationLibrary();
  }
}

void __54__TIPreferencesController_sharedPreferencesController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPreferencesController_sharedController;
  sharedPreferencesController_sharedController = v0;

}

- (TIPreferencesController)init
{
  TIPreferencesController *v2;
  TIPreferencesController *v3;
  void *v4;
  TIPreferencesController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIPreferencesController;
  v2 = -[TIPreferencesController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TIPreferencesController _configureDomains](v2, "_configureDomains");
    -[TIPreferencesController _configurePreferences](v3, "_configurePreferences");
    -[TIPreferencesController setIsInternalInstall:](v3, "setIsInternalInstall:", MGGetBoolAnswer());
    if (_tiShouldSkipMCObservation_onceToken != -1)
      dispatch_once(&_tiShouldSkipMCObservation_onceToken, &__block_literal_global_639);
    if (!_tiShouldSkipMCObservation__result)
    {
      +[TIActionWhenIdle actionWhenIdleWithTarget:selector:object:](TIActionWhenIdle, "actionWhenIdleWithTarget:selector:object:", v3, sel_idleInit, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIPreferencesController setActionWhenIdle:](v3, "setActionWhenIdle:", v4);

    }
    v5 = v3;
  }

  return v3;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->isInternalInstall = a3;
}

- (void)setActionWhenIdle:(id)a3
{
  objc_storeStrong((id *)&self->_actionWhenIdle, a3);
}

- (void)_configurePreferences
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AppleKeyboards"), CFSTR(".GlobalPreferences"), 0);
  v3 = MEMORY[0x1E0C9AAA0];
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AppleKeyboardsExpanded"), CFSTR(".GlobalPreferences"), MEMORY[0x1E0C9AAA0]);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AppleKeyboardsIncludeIntl"), CFSTR(".GlobalPreferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ApplePasscodeKeyboards"), CFSTR(".GlobalPreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AppleLocale"), CFSTR(".GlobalPreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AppleLanguages"), CFSTR(".GlobalPreferences"), 0);
  v4 = MEMORY[0x1E0C9AAB0];
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardAssistant"), CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAB0]);
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:", CFSTR("KeyboardAutocorrection"), CFSTR("com.apple.keyboard.preferences"), v4, 0, 1, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardAutocapitalization"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardCheckSpelling"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardInlineCompletion"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardMathExpressionCompletion"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("SmartQuotesEnabled"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("SmartDashesEnabled"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardPeriodShortcut"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardCapsLock"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("SmartInsertDeleteEnabled"), CFSTR("com.apple.keyboard.preferences"), v4);
  -[TIPreferencesController _configureKey:domain:fallbackKey:isCloudSetting:](self, "_configureKey:domain:fallbackKey:isCloudSetting:", CFSTR("HWKeyboardAutocorrection"), CFSTR("com.apple.keyboard.preferences"), CFSTR("KeyboardAutocorrection"), 1);
  -[TIPreferencesController _configureKey:domain:fallbackKey:isCloudSetting:](self, "_configureKey:domain:fallbackKey:isCloudSetting:", CFSTR("HWKeyboardAutocapitalization"), CFSTR("com.apple.keyboard.preferences"), CFSTR("KeyboardAutocapitalization"), 1);
  -[TIPreferencesController _configureKey:domain:fallbackKey:isCloudSetting:](self, "_configureKey:domain:fallbackKey:isCloudSetting:", CFSTR("HWKeyboardPeriodShortcut"), CFSTR("com.apple.keyboard.preferences"), CFSTR("KeyboardPeriodShortcut"), 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("HWKeyboardGlobeAsEmojiKey"), CFSTR("com.apple.keyboard.preferences"), 0, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("HWKeyboardCapsLockRomanSwitch"), CFSTR("com.apple.keyboard.preferences"), 0, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("HWKeyboardDictationShortcut"), CFSTR("com.apple.keyboard.preferences"), 0, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardLastUsed"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardsCurrentAndNext"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardLastUsedForLanguage"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardLayoutLastUsedForKeyboard"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardLastChosen"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardInputModeUpdateDate"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSecondLanguage"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardAdditionalLanguages"), CFSTR("com.apple.keyboard.preferences"), 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetSInt32Answer() == 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardLanguageIndicatorEnabled"), CFSTR("com.apple.keyboard.preferences"), v5);

  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("UIKeyboardDidShowInternationalInfoIntroduction"), CFSTR("com.apple.keyboard.preferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardDidShowProductivityTutorial"), CFSTR("com.apple.keyboard.preferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationLanguagesLastUsed"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationLanguagesEnabled"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardHardwareKeyboardsSeen"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("HardwareKeyboardLastSeen"), CFSTR("com.apple.keyboard.preferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("SoftwareKeyboardShownByTouch"), CFSTR("com.apple.keyboard.preferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("AutomaticMinimizationEnabled"), CFSTR("com.apple.keyboard.preferences"), v4);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("SuppressAutomaticMinimization"), CFSTR("com.apple.keyboard.preferences"), v3);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardPredictionHelpMessageCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardShowPredictionBar"), CFSTR("com.apple.keyboard.preferences"), v4);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardPrediction"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardBias"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardAllowPaddle"), CFSTR("com.apple.keyboard.preferences"), v4, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardReachableFirstInteraction"), CFSTR("com.apple.keyboard.preferences"), v4);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  if (IsLargeIPad_onceToken != -1)
    dispatch_once(&IsLargeIPad_onceToken, &__block_literal_global_651);
  objc_msgSend(v6, "numberWithBool:", IsLargeIPad_isLarge);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardUseProLayout"), CFSTR("com.apple.keyboard.preferences"), v7);

  v8 = MEMORY[0x1E0C9AAB0];
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ShowMemoji"), CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAB0]);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ShowStickers"), CFSTR("com.apple.keyboard.preferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFloatingPersistentVerticalOffset"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFloatingPersistentHorizontalOffset"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFloatingDockedEdge"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardVisceral"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFeedbackIdleTimeout"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0EF8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("CompactAssistantBarPersistentLocation"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("RivenKeyboard"), CFSTR("com.apple.keyboard.preferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("UIKeyboardPersistentVerticalOffset"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("UIKeyboardPersistentHorizontalOffset"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("UIKeyboardPersistentSplitProgress"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  v9 = MEMORY[0x1E0C9AAA0];
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("UIKeyboardPersistentSplitLock"), CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAA0]);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardIsFloating"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("RivenLayoutSize"), CFSTR("com.apple.keyboard"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFloatingEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DidShowGestureKeyboardIntroduction"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DidShowContinuousPathIntroduction"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", *MEMORY[0x1E0D00B60], CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardPerformanceLogging"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("TypologyEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("CustomerTypologyEnabledByDiagnosticExtension"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardAssetDownloadInFive"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardGlobeKeyExperiments"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardMultilingualEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardContinuousPathEnabled"), CFSTR("com.apple.keyboard.ContinuousPath"), v8, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathProgressiveCandidatesEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathCompletesWords"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("KeyboardContinuousPathDeleteWholeWord"), CFSTR("com.apple.keyboard.ContinuousPath"), v8, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathDetectPause"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardInsertsSpaceAfterPredictiveInput"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathLanguageWeight"), CFSTR("com.apple.keyboard"), &unk_1E24C0F08);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathEnabledAlgorithmTypes"), CFSTR("com.apple.keyboard"), v10);

  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCPCandidateCount"), CFSTR("com.apple.keyboard"), &unk_1E24C0538);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardContinuousPathRetrocorrection"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardIgnoreCPConfigRequirements"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardDODMLLoggingEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSensorKitEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSensorKitAggregatedWordsThreshold"), CFSTR("com.apple.keyboard"), &unk_1E24C0550);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardUserModelLoggingEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSimulateAutofillCandidates"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardAllowRelaxedOVSPolicy"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSkipCandidateQualityFilter"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCJContinuousPathEnabled"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCPUIColorfulEffect"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCPUISpotlightEffect"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCPUIModalPunctuationPlane"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCPConfidenceModel"), CFSTR("com.apple.keyboard"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("FuzzyPinyin"), CFSTR("com.apple.InputModePreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("SuchengCangjie"), CFSTR("com.apple.InputModePreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("FuzzyPinyinPairs"), CFSTR("com.apple.InputModePreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:isCloudSetting:](self, "_configureKey:domain:defaultValue:isCloudSetting:", CFSTR("SpaceConfirmation"), CFSTR("com.apple.InputModePreferences"), v8, 1);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ShuangpinType"), CFSTR("com.apple.InputModePreferences"), &unk_1E24C0568);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("PinyinDialect"), CFSTR("com.apple.InputModePreferences"), &unk_1E24C0580);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("WubiStandard"), CFSTR("com.apple.InputModePreferences"), &unk_1E24C0520);
  LOBYTE(v12) = 1;
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:isWatchSync:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:isWatchSync:", CFSTR("SmartFullwidthSpace"), CFSTR("com.apple.InputModePreferences"), v8, 0, 0, 0, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetSInt32Answer() == 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("LiveConversion"), CFSTR("com.apple.InputModePreferences"), v11);

  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("SoftwareLiveConversion"), CFSTR("com.apple.InputModePreferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("PredictionTime"), CFSTR("com.apple.InputModePreferences"), &unk_1E24C0F18);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ConversionOnSearchField"), CFSTR("com.apple.InputModePreferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("EmojiDefaultsKey"), CFSTR("com.apple.EmojiPreferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationKeyAlwaysEnabled"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationLogging"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("TypoTrackerButton"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("HandwritingCaptureEnabled"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardCachingDisabled"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardSwipeToTab"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ShowExtraLayouts"), CFSTR("com.apple.keyboard"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationLanguagesLastUsed"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationLanguagesEnabled"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("Dictation Enabled"), CFSTR("com.apple.assistant.support"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("Dictation Auto Punctuation Enabled"), CFSTR("com.apple.assistant.support"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationReplacementCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationDeletionCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationInsertionCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationEmojiCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationSelectionCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationStopCommandTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationTipLastShownDate"), CFSTR("com.apple.keyboard.preferences"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationTipContextual"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationCommandTipsEnabled"), CFSTR("com.apple.keyboard.preferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationOneTipPerDayEnabled"), CFSTR("com.apple.keyboard.preferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationTipsDisplayCountLimit"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0598);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationReplacementCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationDeletionCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationInsertionCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationEmojiCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationSelectionCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationStopCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationModelessInputTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationSendMessageCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationClearAllCommandTipShownCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationWordwiseBackspaceEnabled"), CFSTR("com.apple.keyboard.preferences"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("ModelessInputTipShown"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationDisableInlinePopoverUI"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DictationDisableTapAnywhereToDisable"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("keyboard-audio"), CFSTR("com.apple.preferences.sounds"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardTransformerLMForAutocorrection"), CFSTR("com.apple.keyboard"), &unk_1E24C05B0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardInlineCompletionsOpenEnded"), CFSTR("com.apple.keyboard"), v8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardInlineCompletionsPrefixLength"), CFSTR("com.apple.keyboard"), &unk_1E24C05B0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardInlineCompletionsProbThreshold"), CFSTR("com.apple.keyboard"), &unk_1E24C05C8);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("DidShowInlineCompletionEducationTip"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("InlineCompletionAcceptedBySpaceEventCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E24C0520);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("KeyboardFlushDynamicCachePeriod"), CFSTR("com.apple.keyboard"), 0);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("MultilingualKeyboardTip"), CFSTR("com.apple.keyboard.preferences"), v9);
  -[TIPreferencesController _configureKey:domain:defaultValue:](self, "_configureKey:domain:defaultValue:", CFSTR("MultilingualSettingTip"), CFSTR("com.apple.keyboard.preferences"), v9);
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:", a3, a4, a5, a6, a7, 0);
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", a3, a4, a5, a6, 0);
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:](self, "_configureKey:domain:defaultValue:fallbackKey:", a3, a4, a5, 0);
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 isCloudSetting:(BOOL)a6
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:", a3, a4, a5, 0, 0, a6);
}

- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5 isCloudSetting:(BOOL)a6
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:isCloudSetting:", a3, a4, 0, a5, 0, a6);
}

- (void)_configureDomains
{
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR(".GlobalPreferences"), CFSTR("AppleKeyboardsPreferencesChangedNotification"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.keyboard.preferences"), CFSTR("AppleKeyboardsSettingsChangedNotification"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.keyboard"), CFSTR("AppleKeyboardsInternalSettingsChangedNotification"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.InputModePreferences"), CFSTR("AppleKeyboardsInputModeChangedNotification"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.keyboard.ContinuousPath"), CFSTR("AppleKeyboardsContinuousPathSettingsChangedNotification"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.preferences.sounds"), CFSTR("com.apple.preferences.sounds.keyboard-audio.changed"));
  -[TIPreferencesController _configureDomain:notification:](self, "_configureDomain:notification:", CFSTR("com.apple.assistant.support"), CFSTR("kAFPreferencesDidChangeDarwinNotification"));
}

- (BOOL)predictionEnabled
{
  return -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("KeyboardPrediction"));
}

- (BOOL)oneTimeActionCompleted:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[TIPreferencesController _isOneTimeAction:](self, "_isOneTimeAction:", v4))
    v5 = -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)automaticMinimizationEnabled
{
  return !-[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("SuppressAutomaticMinimization"))&& -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("AutomaticMinimizationEnabled"));
}

- (BOOL)_isOneTimeAction:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UIKeyboardDidShowInternationalInfoIntroduction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DidShowGestureKeyboardIntroduction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DidShowContinuousPathIntroduction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("KeyboardDidShowProductivityTutorial")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HardwareKeyboardLastSeen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationReplacementCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationDeletionCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationInsertionCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationEmojiCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationSelectionCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DictationStopCommandTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DidShowInlineCompletionEducationTip")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ModelessInputTipShown")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MultilingualKeyboardTip")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MultilingualSettingTip"));
  }

  return v4;
}

- (NSArray)inputModeSelectionSequence
{
  return (NSArray *)-[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardsCurrentAndNext"));
}

- (void)preferencesChangedCallback:(id)a3
{
  id v4;
  double Current;
  double v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "notification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "-[TIPreferencesController preferencesChangedCallback:]";
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Triggering preferencesChangedCallback for domain %@ with notification %@", (uint8_t *)&v15, 0x20u);

  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "lastSynchronizedTime");
  if (Current - v6 > 1.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "-[TIPreferencesController preferencesChangedCallback:]";
      v17 = 2112;
      v18 = v4;
      _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: preferencesChangedCallback updating sync signal for domain %@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR(".GlobalPreferences"));

    if (v8)
    {
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_configuredDomains, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8149);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315394;
        v16 = "-[TIPreferencesController preferencesChangedCallback:]";
        v17 = 2112;
        v18 = v4;
        _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Marking domain %@ as needs to be synced.", (uint8_t *)&v15, 0x16u);
      }
      objc_msgSend(v4, "setNeedsGetSync:", 1);
    }
    if (-[TIPreferencesController ignoreNextSyncNotification](self, "ignoreNextSyncNotification"))
    {
      -[TIPreferencesController setIgnoreNextSyncNotification:](self, "setIgnoreNextSyncNotification:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("TIPreferencesControllerChangedNotification"), self);

    }
  }
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.keyboard"));

  if (v11)
    -[TIPreferencesController setIsInternalInstall:](self, "setIsInternalInstall:", MGGetBoolAnswer());
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", v13, 0);

}

- (void)managedKeyboardSettingDidChange:(id)a3
{
  _QWORD v4[5];

  -[NSCache removeAllObjects](self->_cachedMCRestrictedValue, "removeAllObjects", a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__TIPreferencesController_managedKeyboardSettingDidChange___block_invoke;
  v4[3] = &unk_1E243B440;
  v4[4] = self;
  TIDispatchAsync(MEMORY[0x1E0C80D38], v4);
}

- (void)profileSettingDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__TIPreferencesController_profileSettingDidChange___block_invoke;
  v3[3] = &unk_1E243B440;
  v3[4] = self;
  TIDispatchAsync(MEMORY[0x1E0C80D38], v3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSMutableDictionary *configuredDomains;
  objc_super v6;
  _QWORD v7[5];

  -[TIPreferencesController actionWhenIdle](self, "actionWhenIdle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  configuredDomains = self->_configuredDomains;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__TIPreferencesController_dealloc__block_invoke;
  v7[3] = &unk_1E243ACA8;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](configuredDomains, "enumerateKeysAndObjectsUsingBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)TIPreferencesController;
  -[TIPreferencesController dealloc](&v6, sel_dealloc);
}

- (void)_configureKeyForAnalytics:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:isAnalyzed:](self, "_configureKey:domain:defaultValue:fallbackKey:isAnalyzed:", a3, a4, a5, 0, 1);
}

- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5
{
  -[TIPreferencesController _configureKey:domain:defaultValue:fallbackKey:](self, "_configureKey:domain:defaultValue:fallbackKey:", a3, a4, 0, a5);
}

- (id)_configuredPreferencesForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_configuredPreferences, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          objc_msgSend(v11, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  TIPreferencesController *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  NSMutableDictionary *configuredDomains;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *configuredPreferences;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  Class (*v45)(uint64_t);
  void *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (isManagedPreferenceKey(v7))
    -[TIPreferencesController setValue:forManagedPreferenceKey:](self, "setValue:forManagedPreferenceKey:", v6, v7);
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](v8->_configuredPreferences, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[TIPreferencesController valueForPreferenceKey:](v8, "valueForPreferenceKey:", v7);
    if (v6)
    {
      objc_msgSend(v9, "currentValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqual:", v11);

      if ((v12 & 1) == 0)
      {
        configuredDomains = v8->_configuredDomains;
        objc_msgSend(v9, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](configuredDomains, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "currentValue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCurrentValue:", v6);
        -[TIPreferencesController _pushValue:toPreference:domain:](v8, "_pushValue:toPreference:domain:", v6, v9, v15);
        if (objc_msgSend(v9, "isCloudSetting"))
        {
          v48 = 0;
          v49 = &v48;
          v50 = 0x2050000000;
          v16 = (void *)getCloudSettingsManagerClass_softClass;
          v51 = getCloudSettingsManagerClass_softClass;
          if (!getCloudSettingsManagerClass_softClass)
          {
            v43 = MEMORY[0x1E0C809B0];
            v44 = 3221225472;
            v45 = __getCloudSettingsManagerClass_block_invoke;
            v46 = &unk_1E243AE68;
            v47 = &v48;
            __getCloudSettingsManagerClass_block_invoke((uint64_t)&v43);
            v16 = (void *)v49[3];
          }
          v17 = objc_retainAutorelease(v16);
          _Block_object_dispose(&v48, 8);
          objc_msgSend(v17, "sharedCloudSettingsManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "key");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "writeToCloudSettings:forStore:", v20, CFSTR("com.apple.cloudsettings.keyboard"));

        }
        if (objc_msgSend(v9, "isWatchSync"))
        {
          v48 = 0;
          v49 = &v48;
          v50 = 0x2050000000;
          v21 = (void *)getNPSManagerClass_softClass;
          v51 = getNPSManagerClass_softClass;
          if (!getNPSManagerClass_softClass)
          {
            v43 = MEMORY[0x1E0C809B0];
            v44 = 3221225472;
            v45 = __getNPSManagerClass_block_invoke;
            v46 = &unk_1E243AE68;
            v47 = &v48;
            __getNPSManagerClass_block_invoke((uint64_t)&v43);
            v21 = (void *)v49[3];
          }
          v22 = objc_retainAutorelease(v21);
          _Block_object_dispose(&v48, 8);
          v23 = (void *)objc_opt_new();
          objc_msgSend(v9, "domain");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0C99E60];
          v52 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setWithArray:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "synchronizeUserDefaultsDomain:keys:", v24, v27);

        }
        if (objc_msgSend(v9, "isAnalyzed"))
        {
          configuredPreferences = v8->_configuredPreferences;
          objc_msgSend(v9, "changedAtKey");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](configuredPreferences, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIPreferencesController _pushValue:toPreference:domain:](v8, "_pushValue:toPreference:domain:", v31, v30, v15);

          }
          v32 = v8->_configuredPreferences;
          objc_msgSend(v9, "buildAtChangeKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v32, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            v35 = (void *)MGGetStringAnswer();
            -[TIPreferencesController _pushValue:toPreference:domain:](v8, "_pushValue:toPreference:domain:", v35, v34, v15);

          }
          v36 = v8->_configuredPreferences;
          objc_msgSend(v9, "previousValueKey");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v36, "objectForKey:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            -[TIPreferencesController _pushValue:toPreference:domain:](v8, "_pushValue:toPreference:domain:", v42, v38, v15);
          v39 = v8->_configuredPreferences;
          objc_msgSend(v9, "analyzedAtKey");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v39, "objectForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            -[TIPreferencesController _pushValue:toPreference:domain:](v8, "_pushValue:toPreference:domain:", 0, v41, v15);

        }
      }
    }
  }

  objc_sync_exit(v8);
}

- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;

  if (a4)
  {
    if (a5)
    {
      v8 = a5;
      v9 = a3;
      objc_msgSend(a4, "key");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "domain");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(v10, v9, v11);

      objc_msgSend(v8, "setNeedsSetSync:", 1);
      -[TIPreferencesController touchSynchronizePreferencesTimer](self, "touchSynchronizePreferencesTimer");
    }
  }
}

- (void)performWithWriteability:(BOOL)a3 operations:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)clearSynchronizePreferencesTimer
{
  NSTimer *synchronizePreferencesTimer;

  -[NSTimer invalidate](self->_synchronizePreferencesTimer, "invalidate");
  synchronizePreferencesTimer = self->_synchronizePreferencesTimer;
  self->_synchronizePreferencesTimer = 0;

}

- (void)synchronizePreferences
{
  NSMutableDictionary *configuredDomains;
  _QWORD v4[5];

  -[TIPreferencesController clearSynchronizePreferencesTimer](self, "clearSynchronizePreferencesTimer");
  configuredDomains = self->_configuredDomains;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__TIPreferencesController_synchronizePreferences__block_invoke;
  v4[3] = &unk_1E243ACA8;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](configuredDomains, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)touchSynchronizePreferencesTimer
{
  NSTimer *synchronizePreferencesTimer;
  NSTimer *v4;
  NSTimer *v5;
  id v6;

  if (-[NSTimer isValid](self->_synchronizePreferencesTimer, "isValid"))
  {
    synchronizePreferencesTimer = self->_synchronizePreferencesTimer;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](synchronizePreferencesTimer, "setFireDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_synchronizePreferences, 0, 0, 0.5);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_synchronizePreferencesTimer;
    self->_synchronizePreferencesTimer = v4;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", self->_synchronizePreferencesTimer, *MEMORY[0x1E0C99748]);
  }

}

- (void)setValue:(id)a3 forKey:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  preferenceKeyForEnumKey(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, v7);

}

- (void)setValue:(id)a3 forManagedPreferenceKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("KeyboardAutocorrection")))
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoCorrectionAllowed:", objc_msgSend(v7, "BOOLValue"));
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("KeyboardPrediction")))
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredictiveKeyboardAllowed:", objc_msgSend(v7, "BOOLValue"));
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("KeyboardCheckSpelling")))
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSpellCheckAllowed:", objc_msgSend(v7, "BOOLValue"));
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SmartQuotesEnabled")))
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmartPunctuationAllowed:", objc_msgSend(v7, "BOOLValue"));
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("KeyboardContinuousPathEnabled")))
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContinuousPathKeyboardAllowed:", objc_msgSend(v7, "BOOLValue"));
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)isPreferenceKeyLockedDown:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  managedConfigurationFeatureForPreferenceKey(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSettingLockedDownByRestrictions:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isKeyLockedDown:(int)a3
{
  void *v4;

  preferenceKeyForEnumKey(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TIPreferencesController isPreferenceKeyLockedDown:](self, "isPreferenceKeyLockedDown:", v4);

  return (char)self;
}

- (void)updateInputModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TIPreferencesController *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    if (v4)
      goto LABEL_3;
LABEL_8:
    v10 = self;
    v9 = 0;
LABEL_9:
    -[TIPreferencesController setValue:forPreferenceKey:](v10, "setValue:forPreferenceKey:", v9, CFSTR("AppleKeyboardsExpanded"));
    goto LABEL_10;
  }
  v11 = 136315394;
  v12 = "-[TIPreferencesController updateInputModes:]";
  v13 = 2112;
  v14 = v4;
  _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  updateInputModes: Called with inputModes = %@", (uint8_t *)&v11, 0x16u);
  if (!v4)
    goto LABEL_8;
LABEL_3:
  if (!-[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("AppleKeyboardsExpanded")))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIGetDefaultInputModesForLanguage(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C05E0, CFSTR("AppleKeyboardsIncludeIntl"));
    v9 = &unk_1E24C05E0;
    v10 = self;
    goto LABEL_9;
  }
LABEL_10:
  -[TIPreferencesController setInputModes:](self, "setInputModes:", v4);

}

- (void)setInputModes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AppleKeyboards"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[TIPreferencesController setInputModes:]";
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  updateInputModes: oldInputModes = %@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend((id)objc_opt_class(), "registerPreferredLanguagesForInputModes:replacingInputModes:", v5, v6);
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("AppleKeyboards"));

}

- (BOOL)allEnabledInputModesAreValid
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("AppleKeyboardsExpanded")))
    return 1;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AppleKeyboards"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        +[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v9, "identifierIsValidSystemInputMode:", v8);

        if (!(_DWORD)v8)
        {
          v10 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_13:

  return v10;
}

- (void)didTriggerOneTimeAction:(id)a3
{
  id v4;

  v4 = a3;
  if (-[TIPreferencesController _isOneTimeAction:](self, "_isOneTimeAction:"))
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", MEMORY[0x1E0C9AAB0], v4);

}

- (void)updateLastUsedInputMode:(id)a3
{
  id v4;

  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("KeyboardLastUsed"));
  v4 = (id)objc_opt_new();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardInputModeUpdateDate"));

}

- (void)updateLastUsedLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledInputModeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        TIInputModeGetNormalizedIdentifier(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13, (_QWORD)v21);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardLayoutLastUsedForKeyboard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = objc_msgSend(v7, "count");

  if (v16 == v17)
  {
    if (v14)
      -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("KeyboardLayoutLastUsedForKeyboard"));
  }
  else
  {
    if (v14)
      v18 = objc_msgSend(v14, "mutableCopy");
    else
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v19 = (void *)v18;
    TIInputModeGetNormalizedIdentifier(v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v4, v20);

    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v19, CFSTR("KeyboardLayoutLastUsedForKeyboard"));
  }

}

- (void)updateLastUsedKeyboards:(id)a3
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("KeyboardLastUsedForLanguage"));
}

- (void)setInputModeSelectionSequence:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") <= 3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("KeyboardsCurrentAndNext"), v10);
  }
LABEL_12:

}

- (BOOL)autocorrectionEnabled
{
  return -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("KeyboardAutocorrection"));
}

- (void)setPredictionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("KeyboardPrediction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("KeyboardShowPredictionBar"));

}

- (void)setautocorrectionEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardAutocorrection"));

}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id v6;

  v3 = a3;
  v5 = -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("SuppressAutomaticMinimization"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 & ~v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("AutomaticMinimizationEnabled"));

}

- (BOOL)keyboardShownByTouch
{
  return -[TIPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("SoftwareKeyboardShownByTouch"));
}

- (void)setKeyboardShownByTouch:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SoftwareKeyboardShownByTouch"));

}

- (void)didSeeHardwareKeyboard:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardHardwareKeyboardsSeen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v6) & 1) == 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "arrayByAddingObject:", v6);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardHardwareKeyboardsSeen"));
  }

}

- (void)didUnseeHardwareKeyboard:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardHardwareKeyboardsSeen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v6))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v6);
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("KeyboardHardwareKeyboardsSeen"));

  }
}

- (CGPoint)keyboardPosition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("UIKeyboardPersistentHorizontalOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("UIKeyboardPersistentVerticalOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)setKeyboardPosition:(CGPoint)a3
{
  double y;
  void *v5;
  id v6;

  y = a3.y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("UIKeyboardPersistentHorizontalOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("UIKeyboardPersistentVerticalOffset"));

}

- (CGPoint)floatingKeyboardPosition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardFloatingPersistentHorizontalOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardFloatingPersistentVerticalOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)setFloatingKeyboardPosition:(CGPoint)a3
{
  double y;
  void *v5;
  void *v6;

  y = a3.y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("KeyboardFloatingPersistentHorizontalOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("KeyboardFloatingPersistentVerticalOffset"));

  -[TIPreferencesController synchronizePreferences](self, "synchronizePreferences");
}

- (unint64_t)floatingKeyboardDockedEdge
{
  void *v2;
  unint64_t v3;

  -[TIPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardFloatingDockedEdge"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setFloatingKeyboardDockedEdge:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardFloatingDockedEdge"));

}

- (void)updateKeyboardIsSplit:(BOOL)a3 locked:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("UIKeyboardPersistentSplitProgress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v7, CFSTR("UIKeyboardPersistentSplitLock"));

}

- (void)updateKeyboardIsFloating:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardIsFloating"));

}

- (void)updateCompactAssistantBarPersistentLocation:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("CompactAssistantBarPersistentLocation"));

}

- (void)updateKeyboardHandBias:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("None")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Left")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Right")))
  {
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardBias"));
  }

}

- (void)updateDidPerformFirstReachableKeyboardInteraction
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", MEMORY[0x1E0C9AAA0], CFSTR("KeyboardReachableFirstInteraction"));
}

- (void)updateVisceral:(id)a3
{
  id v4;

  v4 = a3;
  if (_os_feature_enabled_impl())
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardVisceral"));

}

- (void)updateEnableProKeyboard:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("KeyboardUseProLayout"));

}

- (void)updateEnabledDictationLanguages:(id)a3
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("DictationLanguagesEnabled"));
}

- (void)updateLastUsedDictationLanguages:(id)a3
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("DictationLanguagesLastUsed"));
}

- (void)updateDictationAutoPunctuation:(id)a3
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("Dictation Auto Punctuation Enabled"));
}

- (void)updateDictationTipLastShownDate:(id)a3
{
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("DictationTipLastShownDate"));
}

- (void)updateDictationTipDisplayCount:(id)a3 dictationTipKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DictationReplacementCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationDeletionCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationInsertionCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationEmojiCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationSelectionCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationStopCommandTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationModelessInputTipShownCount")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("DictationSendMessageCommandTipShownCount")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("DictationClearAllCommandTipShownCount")))
  {
    -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v7, v6);
  }

}

- (void)resetDictationTipsToDefaultSettings
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v3, CFSTR("DictationTipLastShownDate"));

  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0598, CFSTR("DictationTipsDisplayCountLimit"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationReplacementCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationReplacementCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationInsertionCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationEmojiCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationSelectionCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationStopCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationModelessInputTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationDeletionCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationSendMessageCommandTipShownCount"));
  -[TIPreferencesController setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", &unk_1E24C0520, CFSTR("DictationClearAllCommandTipShownCount"));
}

- (BOOL)inhibitGlobalNotification
{
  return self->_inhibitGlobalNotification;
}

- (void)setInhibitGlobalNotification:(BOOL)a3
{
  self->_inhibitGlobalNotification = a3;
}

- (TIActionWhenIdle)actionWhenIdle
{
  return self->_actionWhenIdle;
}

- (BOOL)ignoreNextSyncNotification
{
  return self->_ignoreNextSyncNotification;
}

- (void)setIgnoreNextSyncNotification:(BOOL)a3
{
  self->_ignoreNextSyncNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionWhenIdle, 0);
  objc_storeStrong((id *)&self->_synchronizePreferencesTimer, 0);
  objc_storeStrong((id *)&self->_cachedMCRestrictedValue, 0);
  objc_storeStrong((id *)&self->_configuredPreferences, 0);
  objc_storeStrong((id *)&self->_configuredDomains, 0);
}

void __49__TIPreferencesController_synchronizePreferences__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  void *v5;
  int v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "needsSetSync"))
  {
    objc_msgSend(v9, "setNeedsSetSync:", 0);
    objc_msgSend(v9, "domain");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);

    objc_msgSend(v9, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41);

      if (!v6)
      {
        objc_msgSend(v9, "setLastSynchronizedTime:", CFAbsoluteTimeGetCurrent());
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        objc_msgSend(v9, "notification");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 1u);

      }
    }
  }

}

void __55__TIPreferencesController_synchronizeDomainIfNeedsGet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    objc_msgSend(v5, "setCurrentValue:", 0);
  if (isManagedPreferenceKey(v9))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v9);

}

void __34__TIPreferencesController_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v6;
  __CFString *name;

  v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v6 = *(const void **)(a1 + 32);
  objc_msgSend(v4, "notification");
  name = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v6, name, 0);
}

uint64_t __51__TIPreferencesController_profileSettingDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__TIPreferencesController_profileSettingDidChange___block_invoke_2;
  v4[3] = &unk_1E243ACA8;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __51__TIPreferencesController_profileSettingDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferencesChangedCallback:");
}

void __59__TIPreferencesController_managedKeyboardSettingDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TIPreferencesControllerChangedNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AppleKeyboardsContinuousPathSettingsChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __54__TIPreferencesController_preferencesChangedCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[TIPreferencesController preferencesChangedCallback:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_debug_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Marking domain %@ as needs to be synced.", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(v3, "setNeedsGetSync:", 1);

}

+ (void)registerPreferredLanguagesForInputModes:(id)a3 replacingInputModes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  uint64_t v33;
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
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  __int128 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v50 = 0;
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    v55 = xmmword_1E243AFD8;
    v56 = 0;
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!IntlPreferencesLibraryCore_frameworkLibrary)
    {
      v33 = v50;
      v32 = (void *)abort_report_np();
      free(v32);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        TIInputModeGetLanguageWithRegion(*(void **)(*((_QWORD *)&v46 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        TIInputModeGetLanguageWithRegion(*(void **)(*((_QWORD *)&v42 + 1) + 8 * j));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v21, "intersectSet:", v7);
  objc_msgSend(v14, "minusSet:", v21);
  objc_msgSend(v7, "minusSet:", v21);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(MEMORY[0x1E0C99DC8], "registerPreferredLanguageForAddedKeyboardLanguage:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v24);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = v7;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(MEMORY[0x1E0C99DC8], "unregisterPreferredLanguageForKeyboardLanguage:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v29);
  }

}

+ (id)_chimePreferencesKeys
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8155;
  v9 = __Block_byref_object_dispose__8156;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__TIPreferencesController__chimePreferencesKeys__block_invoke;
  block[3] = &unk_1E243AE68;
  block[4] = &v5;
  if (_chimePreferencesKeys___onceToken != -1)
    dispatch_once(&_chimePreferencesKeys___onceToken, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__TIPreferencesController__chimePreferencesKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[14];

  v5[13] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("AppleKeyboards");
  v5[1] = CFSTR("KeyboardLastUsed");
  v5[2] = CFSTR("KeyboardsCurrentAndNext");
  v5[3] = CFSTR("KeyboardAutocapitalization");
  v5[4] = CFSTR("KeyboardAutocorrection");
  v5[5] = CFSTR("KeyboardPrediction");
  v5[6] = CFSTR("KeyboardInlineCompletion");
  v5[7] = CFSTR("KeyboardMathExpressionCompletion");
  v5[8] = CFSTR("SmartQuotesEnabled");
  v5[9] = CFSTR("SmartDashesEnabled");
  v5[10] = CFSTR("KeyboardCheckSpelling");
  v5[11] = CFSTR("KeyboardCapsLock");
  v5[12] = CFSTR("KeyboardPeriodShortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 13);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
