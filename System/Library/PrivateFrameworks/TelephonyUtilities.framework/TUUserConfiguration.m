@implementation TUUserConfiguration

+ (id)registeredDefaults
{
  if (registeredDefaults_onceToken != -1)
    dispatch_once(&registeredDefaults_onceToken, &__block_literal_global_32);
  return (id)registeredDefaults_sRegisteredDefaults;
}

void __41__TUUserConfiguration_registeredDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("announceCalls");
  v2[1] = CFSTR("simulateFatalPersistentStoreError");
  v3[0] = &unk_1E38E90E8;
  v3[1] = MEMORY[0x1E0C9AAA0];
  v2[2] = CFSTR("simulateInternationalCall");
  v3[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)registeredDefaults_sRegisteredDefaults;
  registeredDefaults_sRegisteredDefaults = v0;

}

+ (id)userDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__TUUserConfiguration_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken != -1)
    dispatch_once(&userDefaults_onceToken, block);
  return (id)userDefaults_sUserDefaults;
}

void __35__TUUserConfiguration_userDefaults__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.TelephonyUtilities"));
  }
  v6 = (void *)userDefaults_sUserDefaults;
  userDefaults_sUserDefaults = v5;

  v7 = (void *)userDefaults_sUserDefaults;
  objc_msgSend(*(id *)(a1 + 32), "registeredDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerDefaults:", v8);

}

- (TUUserConfiguration)init
{
  void *v3;
  TUUserConfiguration *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  uint64_t v7;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v10;

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)TUUserConfiguration;
  v4 = -[TUConfiguration initWithDataSource:](&v10, sel_initWithDataSource_, v3);
  if (v4)
  {
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v4, CFSTR("announceCalls"), 0, &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v4, CFSTR("conversationLinkBaseURL"), 0, &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v4, CFSTR("simulateFatalPersistentStoreError"), 0, &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v4, CFSTR("simulateInternationalCall"), 0, &TUUserConfigurationKeyValueObserverContext);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("TUConfigurationProviderQueue", v5);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v6);
    coreTelephonyClient = v4->_coreTelephonyClient;
    v4->_coreTelephonyClient = (CoreTelephonyClient *)v7;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TUConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("announceCalls"), &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("conversationLinkBaseURL"), &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("simulateFatalPersistentStoreError"), &TUUserConfigurationKeyValueObserverContext);
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("simulateInternationalCall"), &TUUserConfigurationKeyValueObserverContext);
  }

  v4.receiver = self;
  v4.super_class = (Class)TUUserConfiguration;
  -[TUUserConfiguration dealloc](&v4, sel_dealloc);
}

- (void)synchronize
{
  void *v2;
  NSObject *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 buf;
  Class (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("announceCalls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.TelephonyUtilities");
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing user configuration for %@ to Apple Watch", (uint8_t *)&buf, 0xCu);
  }

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getNPSManagerClass_softClass;
  v10 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v12 = __getNPSManagerClass_block_invoke;
    v13 = &unk_1E38A1710;
    v14 = &v7;
    __getNPSManagerClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.TelephonyUtilities"), v2, v7);

}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[TUConfiguration dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = v6;
  v11 = v10;

  return v11;
}

- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConfiguration dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%@) object (%@).", buf, 0x16u);
  }

  if (a6 == &TUUserConfigurationKeyValueObserverContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_msgSend(v9, "isEqualToString:", CFSTR("announceCalls")) & 1) != 0
       || (objc_msgSend(v9, "isEqualToString:", CFSTR("conversationLinkBaseURL")) & 1) != 0
       || (objc_msgSend(v9, "isEqualToString:", CFSTR("simulateFatalPersistentStoreError")) & 1) != 0
       || objc_msgSend(v9, "isEqualToString:", CFSTR("simulateInternationalCall"))))
    {
      -[TUConfiguration delegateController](self, "delegateController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v13[3] = &unk_1E38A3028;
      v13[4] = self;
      objc_msgSend(v12, "enumerateDelegatesUsingBlock:", v13);

    }
  }

}

void __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3E70A0))
  {
    v7 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v10[3] = &unk_1E38A1388;
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 32);
      v11 = v8;
      v12 = v9;
      dispatch_async(v6, v10);

    }
  }

}

uint64_t __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "propertiesDidChangeForConfiguration:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isCallScreeningEnabled
{
  NSObject *v3;
  id v4;
  void *v5;
  char v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ isCallScreeningEnabled called", (uint8_t *)&v8, 0xCu);

  }
  -[TUUserConfiguration getBooleanFromUserDefaults:default:](self, "getBooleanFromUserDefaults:default:", CFSTR("CallScreeningDisabled"), &unk_1E38E9100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6 ^ 1;
}

- (void)setCallScreeningEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = (id)objc_opt_class();
    v10 = 1024;
    v11 = v3;
    v6 = v9;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@ setCallScreeningEnabled called %d", (uint8_t *)&v8, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration setValueInUserDefaults:forKey:](self, "setValueInUserDefaults:forKey:", v7, CFSTR("CallScreeningDisabled"));

  -[TUUserConfiguration synchronize](self, "synchronize");
}

- (BOOL)isSilenceUnknownCallersEnabledForFaceTime
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownCallersEnabledForFaceTime called", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", TUSilenceUnknownFaceTimeCallersDefaultValue());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration getBooleanFromUserDefaults:default:](self, "getBooleanFromUserDefaults:default:", CFSTR("silenceUnknownFaceTimeCallers"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isSilenceUnknownCallersEnabledForPhone
{
  NSObject *v3;
  id v4;
  void *v5;
  char v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownCallersEnabledForPhone called", (uint8_t *)&v8, 0xCu);

  }
  -[TUUserConfiguration getBooleanFromUserDefaults:default:](self, "getBooleanFromUserDefaults:default:", CFSTR("allowContactsOnly"), &unk_1E38E9100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceUnknownCallersEnabledForFaceTime called", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration setValueInUserDefaults:forKey:](self, "setValueInUserDefaults:forKey:", v7, CFSTR("silenceUnknownFaceTimeCallers"));

}

- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceUnknownCallersEnabledForPhone called", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration setValueInUserDefaults:forKey:](self, "setValueInUserDefaults:forKey:", v7, CFSTR("allowContactsOnly"));

}

- (BOOL)isBrandedCallingEnabled:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  const __CFString *v18;
  id v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  coreTelephonyClient = self->_coreTelephonyClient;
  v6 = *MEMORY[0x1E0CA7180];
  v20 = 0;
  -[CoreTelephonyClient context:getCapability:status:with:](coreTelephonyClient, "context:getCapability:status:with:", v4, v6, &v21, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TUUserConfiguration isBrandedCallingEnabled:].cold.1((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);

    v17 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("On");
      if (!v21)
        v18 = CFSTR("Off");
      *(_DWORD *)buf = 138412546;
      v23 = v4;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Fetched state of branded calling for context: %@, state: %@", buf, 0x16u);
    }

    v17 = v21 != 0;
  }

  return v17;
}

- (void)setBrandedCallingEnabled:(BOOL)a3 subscription:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CoreTelephonyClient context:setCapability:enabled:with:](self->_coreTelephonyClient, "context:setCapability:enabled:with:", v6, *MEMORY[0x1E0CA7180], v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TUUserConfiguration setBrandedCallingEnabled:subscription:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("Off");
    if (v4)
      v16 = CFSTR("On");
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Set state of branded calling for context: %@, state: %@", (uint8_t *)&v17, 0x16u);
  }

}

- (BOOL)isSilenceJunkCallingEnabled
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138412290;
    *(_QWORD *)&v10[4] = objc_opt_class();
    v4 = *(id *)&v10[4];
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ getSilenceJunkCallingEnabled called", v10, 0xCu);

  }
  v5 = +[TUCall acceptableJunkConfidence](TUCall, "acceptableJunkConfidence");
  -[TUConfiguration dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("maxJunkLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v7, "integerValue");
  v8 = +[TUCall isJunkConfidenceLevelJunk:](TUCall, "isJunkConfidenceLevelJunk:", v5, *(_OWORD *)v10);

  return !v8;
}

- (void)setSilenceJunkCallingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  int64_t v7;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 138412546;
    *(_QWORD *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = v3;
    v6 = *(id *)&v9[4];
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceJunkCallingEnabled called %d", v9, 0x12u);

  }
  v7 = +[TUCall maxJunkConfidence](TUCall, "maxJunkConfidence");
  if (v3)
    v7 = +[TUCall acceptableJunkConfidence](TUCall, "acceptableJunkConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration setValueInUserDefaults:forKey:](self, "setValueInUserDefaults:forKey:", v8, CFSTR("maxJunkLevel"));

}

- (BOOL)isBusinessConnectCallingEnabled
{
  NSObject *v3;
  id v4;
  void *v5;
  char v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ getBusinessConnectCallingEnabled called", (uint8_t *)&v8, 0xCu);

  }
  -[TUUserConfiguration getBooleanFromUserDefaults:default:](self, "getBooleanFromUserDefaults:default:", CFSTR("BusinessConnectCallingDisabled"), &unk_1E38E9100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6 ^ 1;
}

- (void)setBusinessConnectCallingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = (id)objc_opt_class();
    v10 = 1024;
    v11 = v3;
    v6 = v9;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@ setBusinessConnectCallingEnabled called %d", (uint8_t *)&v8, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUUserConfiguration setValueInUserDefaults:forKey:](self, "setValueInUserDefaults:forKey:", v7, CFSTR("BusinessConnectCallingDisabled"));

}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)isBrandedCallingEnabled:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Failed to fetch state of branded calling for context: %@", a5, a6, a7, a8, 2u);
}

- (void)setBrandedCallingEnabled:(uint64_t)a3 subscription:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Failed to set state of branded calling for context: %@", a5, a6, a7, a8, 2u);
}

@end
