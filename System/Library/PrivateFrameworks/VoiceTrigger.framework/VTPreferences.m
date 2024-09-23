@implementation VTPreferences

- (BOOL)voiceTriggerEnabled
{
  return -[VTPreferences voiceTriggerEnabledForEndpointId:](self, "voiceTriggerEnabledForEndpointId:", 0);
}

- (BOOL)voiceTriggerEnabledForEndpointId:(id)a3
{
  id v3;

  v3 = a3;
  if (a3)
    a3 = (id)2;
  return -[VTPreferences voiceTriggerEnabledWithDeviceType:endpointId:](self, "voiceTriggerEnabledWithDeviceType:endpointId:", a3, v3);
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_3159);
  return (id)sharedPreferences_sSharedPreferences;
}

void __34__VTPreferences_sharedPreferences__block_invoke()
{
  VTPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(VTPreferences);
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;

}

- (VTPreferences)init
{
  VTPreferences *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTPreferences;
  v2 = -[VTPreferences init](&v4, sel_init);
  if (v2 && VTLogInitIfNeeded_once != -1)
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_21_6307);
  return v2;
}

- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3 endpointId:(id)a4
{
  id v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[VTPreferences _isNonEndpointDeviceType:](self, "_isNonEndpointDeviceType:", a3);
  if (!v6 && v7)
  {
    v8 = -[VTPreferences _voiceTriggerEnabledWithDeviceType:](self, "_voiceTriggerEnabledWithDeviceType:", a3);
    goto LABEL_13;
  }
  if (a3 != 2 || !v6)
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543618;
      v16 = v6;
      v17 = 2050;
      v18 = a3;
      _os_log_error_impl(&dword_20D965000, v13, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_12;
  }
  if (-[VTPreferences _storeModeEnabled](self, "_storeModeEnabled"))
  {
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  -[VTPreferences getPreferencesForEndpoint:fromPreferenceDomain:error:](self, "getPreferencesForEndpoint:fromPreferenceDomain:error:", v6, CFSTR("com.apple.voicetrigger"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VoiceTrigger Enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v8 = objc_msgSend(v11, "BOOLValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;

  }
LABEL_13:

  return v8;
}

- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  char v7;

  -[VTPreferences _getVoiceTriggerEnabledKeyWithDeviceType:](self, "_getVoiceTriggerEnabledKeyWithDeviceType:", a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.voicetrigger"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    -[VTPreferences _storeModeEnabled](self, "_storeModeEnabled");
    v7 = 0;
  }

  return v7;
}

- (BOOL)_storeModeEnabled
{
  void *v2;
  void *v3;
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.demo-settings"));
  CFPreferencesCopyAppValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isNonEndpointDeviceType:(unint64_t)a3
{
  return a3 == 3 || a3 < 2;
}

- (id)_getVoiceTriggerEnabledKeyWithDeviceType:(unint64_t)a3
{
  if (a3 == 3)
    return CFSTR("Remote Darwin VoiceTrigger Enabled");
  else
    return CFSTR("VoiceTrigger Enabled");
}

- (id)_VTSATBasePath
{
  void *v2;
  void *v3;

  CPSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/VoiceTrigger/SAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_VTSATCachePath
{
  void *v2;
  void *v3;

  CPSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Caches/VoiceTrigger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)voiceTriggerWasEverUsed
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTriggerEverUsed"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)remoteDarwinWasEverConnected
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Remote Darwin Ever Connected"), CFSTR("com.apple.voicetrigger.notbackedup"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)canUseVoiceTriggerDuringPhoneCall
{
  char v2;
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Can Use VoiceTrigger During Phone Call"), CFSTR("com.apple.voicetrigger"));
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (unint64_t)canUseVoiceTriggerDuringPhoneCallWithState
{
  void *v2;
  void *v3;
  unint64_t v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Can Use VoiceTrigger During Phone Call"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "BOOLValue"))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3
{
  -[VTPreferences _setCanUseVoiceTriggerDuringPhoneCall:sender:](self, "_setCanUseVoiceTriggerDuringPhoneCall:sender:", a3, 0);
}

- (void)_setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3 sender:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id object;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  object = a4;
  objc_msgSend(v5, "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Can Use VoiceTrigger During Phone Call"), v6, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification"), object, 0, 1u);

}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  -[VTPreferences setVoiceTriggerEnabled:sender:](self, "setVoiceTriggerEnabled:sender:", a3, 0);
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4
{
  -[VTPreferences setVoiceTriggerEnabled:sender:endpointId:](self, "setVoiceTriggerEnabled:sender:endpointId:", a3, a4, 0);
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 endpointId:(id)a5
{
  id v5;

  v5 = a5;
  if (a5)
    a5 = (id)2;
  -[VTPreferences setVoiceTriggerEnabled:sender:deviceType:endpointId:](self, "setVoiceTriggerEnabled:sender:deviceType:endpointId:", a3, a4, a5, v5);
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  void *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v8 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v11, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 67240706;
    v15[1] = v8;
    v16 = 2114;
    v17 = v14;
    v18 = 2050;
    v19 = a5;
    _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "setVoiceTriggerEnabled : %{public}d, endpoint : %{public}@, deviceType : %{public}lu", (uint8_t *)v15, 0x1Cu);

  }
  -[VTPreferences _setVoiceTriggerEnabled:sender:deviceType:endpointId:](self, "_setVoiceTriggerEnabled:sender:deviceType:endpointId:", v8, v10, a5, v11);

}

- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v25[2];
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[VTPreferences _getVoiceTriggerEnabledKeyWithDeviceType:](self, "_getVoiceTriggerEnabledKeyWithDeviceType:", a5);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[VTPreferences _getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:](self, "_getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:", a5);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v9, v11, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v12 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.voicetrigger"));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "BOOLValue") == v6)
    goto LABEL_13;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v9, v14, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v15 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.voicetrigger"));
  v13 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "BOOLValue") == v6)
      goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v9, v16, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v17 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.voicetrigger"));
  v13 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "BOOLValue") == v6)
      goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v9, v18, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v19 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.voicetrigger"));
  v13 = v19;
  if (v19)
  {
    if (objc_msgSend(v19, "BOOLValue") == v6)
      goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v9, v20, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v21 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.voicetrigger"));
  v13 = v21;
  if (!v21)
    goto LABEL_11;
  if (objc_msgSend(v21, "BOOLValue") == v6)
  {
LABEL_13:

  }
  else
  {
LABEL_11:

    v22 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 67240192;
      v25[1] = v6;
      _os_log_error_impl(&dword_20D965000, v22, OS_LOG_TYPE_ERROR, "Voice trigger state incorrect, expected %{public}d", (uint8_t *)v25, 8u);
    }
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v23 = dispatch_time(0, 50000000);
  dispatch_after(v23, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v10, v8, 0, 1u);

  -[VTPreferences _logMetadataForVTEnabled:](self, "_logMetadataForVTEnabled:", v6);
}

- (void)_logMetadataForVTEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
  {
    -[VTPreferences _getVTEnableLoggingMetadata](self, "_getVTEnableLoggingMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("Disabled");
    if (v3)
      v6 = CFSTR("Enabled");
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)CFPreferencesCopyAppValue(CFSTR("VT Enabled Metadata"), CFSTR("com.apple.voicetrigger.notbackedup"));
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "mutableCopy");

      v8 = (void *)v11;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v7);
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "Writing metadata into plist: %@", (uint8_t *)&v13, 0xCu);
    }
    CFPreferencesSetAppValue(CFSTR("VT Enabled Metadata"), v8, CFSTR("com.apple.voicetrigger.notbackedup"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));

  }
}

- (id)_getVTEnableLoggingMetadata
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyyMMdd-HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && v7)
  {
    v13[0] = CFSTR("processName");
    v13[1] = CFSTR("timestamp");
    v14[0] = v3;
    v14[1] = v7;
    v13[2] = CFSTR("buildVersion");
    +[VTUtilities deviceSoftwareVersion](VTUtilities, "deviceSoftwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_20D965000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch processName or timestamp", v12, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:(unint64_t)a3
{
  if (a3 == 3)
    return CFSTR("kVTPreferencesRemoteDarwinVoiceTriggerEnabledDidChangeDarwinNotification");
  else
    return CFSTR("kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification");
}

- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  dispatch_time_t v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v8 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = -[VTPreferences _isNonEndpointDeviceType:](self, "_isNonEndpointDeviceType:", a5);
  if (v11 || !v12)
  {
    if (a5 == 2 && v11)
    {
      -[VTPreferences getPreferencesForEndpoint:fromPreferenceDomain:error:](self, "getPreferencesForEndpoint:fromPreferenceDomain:error:", v11, CFSTR("com.apple.voicetrigger"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v15;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("VoiceTrigger Enabled"));

      v19 = -[VTPreferences setPreferences:forEndpoint:inPreferenceDomain:](self, "setPreferences:forEndpoint:inPreferenceDomain:", v17, v11, CFSTR("com.apple.voicetrigger"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
      v20 = dispatch_time(0, 50000000);
      dispatch_after(v20, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kVTPreferencesRemoraVoiceTriggerEnabledDidChangeDarwinNotification"), v10, 0, 1u);

    }
    else
    {
      v16 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        v22 = 138543618;
        v23 = v11;
        v24 = 2050;
        v25 = a5;
        _os_log_error_impl(&dword_20D965000, v16, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    -[VTPreferences _setVoiceTriggerEnabled:sender:deviceType:](self, "_setVoiceTriggerEnabled:sender:deviceType:", v8, v10, a5);
  }

}

- (id)setUserPreferredVoiceTriggerPhraseType:(unint64_t)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218499;
    v26 = a3;
    v27 = 2049;
    v28 = a5;
    v29 = 2113;
    v30 = v11;
    _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "phraseType: %lu, deviceType: %{private}lu, endpointId :%{private}@", buf, 0x20u);
  }
  v13 = -[VTPreferences _isNonEndpointDeviceType:](self, "_isNonEndpointDeviceType:", a5);
  if (!v11 && v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("UserPreferredVoiceTriggerPhraseType"), v14, CFSTR("com.apple.voicetrigger"));
LABEL_6:

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("VT Phrase Type changed"), v10, 0, 1u);
    v16 = 0;
    goto LABEL_14;
  }
  if (a5 == 2 && v11)
  {
    v24 = 0;
    -[VTPreferences getPreferencesForEndpoint:fromPreferenceDomain:error:](self, "getPreferencesForEndpoint:fromPreferenceDomain:error:", v11, CFSTR("com.apple.voicetrigger"), &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;
    if (v17)
    {
      v16 = v17;

      goto LABEL_14;
    }
    if (v14)
    {
      v20 = objc_msgSend(v14, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("UserPreferredVoiceTriggerPhraseType"));

    v23 = -[VTPreferences setPreferences:forEndpoint:inPreferenceDomain:](self, "setPreferences:forEndpoint:inPreferenceDomain:", v21, v11, CFSTR("com.apple.voicetrigger"));
    goto LABEL_6;
  }
  v18 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v26 = (unint64_t)v11;
    v27 = 2050;
    v28 = a5;
    _os_log_error_impl(&dword_20D965000, v18, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", VTErrorDomain, 51, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

- (unint64_t)getUserPreferredVoiceTriggerPhraseTypeForDeviceType:(unint64_t)a3 endpointId:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134283779;
    v18 = a3;
    v19 = 2113;
    v20 = (unint64_t)v8;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "deviceType: %{private}lu, endpointId :%{private}@", (uint8_t *)&v17, 0x16u);
  }
  v10 = -[VTPreferences _isNonEndpointDeviceType:](self, "_isNonEndpointDeviceType:", a3);
  if (v8 || !v10)
  {
    if (a3 != 2 || !v8)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", VTErrorDomain, 51, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        v17 = 138543618;
        v18 = (unint64_t)v8;
        v19 = 2050;
        v20 = a3;
        _os_log_error_impl(&dword_20D965000, v14, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v17, 0x16u);
      }
      v11 = 0;
      goto LABEL_20;
    }
    -[VTPreferences getPreferencesForEndpoint:fromPreferenceDomain:error:](self, "getPreferencesForEndpoint:fromPreferenceDomain:error:", v8, CFSTR("com.apple.voicetrigger"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      v11 = 0;

LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v12, "objectForKey:", CFSTR("UserPreferredVoiceTriggerPhraseType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_20;
  }
  else
  {
    v11 = (void *)CFPreferencesCopyAppValue(CFSTR("UserPreferredVoiceTriggerPhraseType"), CFSTR("com.apple.voicetrigger"));
    if (!v11)
      goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  v15 = objc_msgSend(v11, "unsignedIntegerValue");
LABEL_21:

  return v15;
}

- (BOOL)hasExplicitlySetVoiceTriggerEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)phraseSpotterEnabled
{
  void *v3;
  void *v4;
  int v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Phrase Detector Enabled"), CFSTR("com.apple.voicetrigger"));
  v4 = v3;
  if (v3)
    LOBYTE(v5) = objc_msgSend(v3, "BOOLValue");
  else
    v5 = !-[VTPreferences _storeModeEnabled](self, "_storeModeEnabled");

  return v5;
}

- (void)setPhraseSpotterEnabled:(BOOL)a3
{
  -[VTPreferences setPhraseSpotterEnabled:sender:](self, "setPhraseSpotterEnabled:sender:", a3, 0);
}

- (void)setPhraseSpotterEnabled:(BOOL)a3 sender:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  dispatch_time_t v9;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Phrase Detector Enabled"), v8, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v9 = dispatch_time(0, 50000000);
  dispatch_after(v9, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification"), v7, 0, 1u);

  -[VTPreferences _logMetadataForVTEnabled:](self, "_logMetadataForVTEnabled:", v4);
}

- (BOOL)voiceTriggerEnabledWhenChargerDisconnected
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Battery Power Allowed"), CFSTR("com.apple.voicetrigger"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setVoiceTriggerEnabledWhenChargerDisconnected:(BOOL)a3
{
  void *v3;
  dispatch_time_t v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Battery Power Allowed"), v3, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v4 = dispatch_time(0, 50000000);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
}

- (BOOL)voiceTriggerEnabledWhenChargerConnected
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Enabled On Charger"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setVoiceTriggerEnabledWhenChargerConnected:(BOOL)a3
{
  void *v3;
  dispatch_time_t v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Enabled On Charger"), v3, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v4 = dispatch_time(0, 50000000);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
}

- (id)_languageCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE09278], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localeIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedTriggerPhrase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  -[VTPreferences _languageCode](self, "_languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[VTPreferences localizedTriggerPhraseForLanguageCode:](self, "localizedTriggerPhraseForLanguageCode:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedCompactTriggerPhraseForLanguageCode:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (a3)
  {
    objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_24C803060, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (__CFString *)v5;
    }
    else
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(&unk_24C803060, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v6 = (__CFString *)v9;
        v4 = v8;
      }
      else
      {
        -[VTPreferences _localeIdentifier](self, "_localeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(&unk_24C803060, "objectForKey:", v4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          v6 = (__CFString *)v13;
        else
          v6 = CFSTR("Siri");
      }
    }

  }
  else
  {
    v6 = CFSTR("Siri");
  }
  return v6;
}

- (id)localizedTriggerPhraseForLanguageCode:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24C803088, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (__CFString *)v5;
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_24C803088, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v6 = (__CFString *)v9;
      v4 = v8;
    }
    else
    {
      -[VTPreferences _localeIdentifier](self, "_localeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(&unk_24C803088, "objectForKey:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
        v6 = (__CFString *)v13;
      else
        v6 = CFSTR("Hey Siri");
    }
  }

  return v6;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &unk_24C803000;
  else
    v3 = 0;
  -[VTPreferences setFileLoggingLevel:](self, "setFileLoggingLevel:", v3);
}

- (BOOL)fileLoggingIsEnabled
{
  void *v3;
  BOOL v4;

  if (!+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
    return 0;
  -[VTPreferences fileLoggingLevel](self, "fileLoggingLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue") > 0;

  return v4;
}

- (id)fileLoggingLevel
{
  if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
    return (id)(id)CFPreferencesCopyAppValue(CFSTR("File Logging Level"), CFSTR("com.apple.voicetrigger"));
  else
    return 0;
}

- (void)setFileLoggingLevel:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("File Logging Level"), a3, CFSTR("com.apple.voicetrigger"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (BOOL)secondPassAudioLoggingEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (!+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Second Pass Audio Logging Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setSecondPassAudioLoggingEnabled:(BOOL)a3
{
  void *v3;
  dispatch_time_t v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Second Pass Audio Logging Enabled"), v3, CFSTR("com.apple.voicetrigger"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v4 = dispatch_time(0, 50000000);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_66);
}

- (BOOL)onetimeRemoteAssetQueryRanSuccessfully
{
  void *v2;
  void *v3;
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("One Time Remote Assets Query Succeed"), CFSTR("com.apple.voicetrigger.notbackedup"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setOnetimeRemoteAssetQueryRanSuccessfully:(BOOL)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("One Time Remote Assets Query Succeed"), v3, CFSTR("com.apple.voicetrigger.notbackedup"));

}

- (void)synchronize
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (BOOL)isSATEnrolledForLanguageCode:(id)a3
{
  return -[VTPreferences _isSATMarkedForMarker:languageCode:](self, "_isSATMarkedForMarker:languageCode:", CFSTR("enrollment_completed"), a3);
}

- (BOOL)isSATEnrollmentMigratedForLanguageCode:(id)a3
{
  return -[VTPreferences _isSATMarkedForMarker:languageCode:](self, "_isSATMarkedForMarker:languageCode:", CFSTR("enrollment_migrated"), a3);
}

- (BOOL)_isSATMarkedForMarker:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_20D965000, v19, OS_LOG_TYPE_ERROR, "Language Code is nil!", (uint8_t *)&v23, 2u);
    }
    goto LABEL_20;
  }
  +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForLanguageCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, 0))
  {
    v20 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v8;
      _os_log_error_impl(&dword_20D965000, v20, OS_LOG_TYPE_ERROR, "SAT path doesnt exist - %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_19;
  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:](VTVoiceProfileMigration, "getCurrentVoiceProfileVersionForLanguageCode:", v7))
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "Found voice profile with compatibility version 0", (uint8_t *)&v23, 2u);
    }
    -[VTPreferences _getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:](self, "_getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByAppendingPathComponent:", v6);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = v13;
    v10 = (void *)v14;
  }
  if (!objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, 0))
  {
LABEL_18:

LABEL_19:
LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.wav'"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || !objc_msgSend(v17, "count"))
  {
    v21 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_20D965000, v21, OS_LOG_TYPE_ERROR, "No Audio file exists when enrollment marker is set, remove marker", (uint8_t *)&v23, 2u);
    }
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

    goto LABEL_18;
  }

  v18 = 1;
LABEL_21:

  return v18;
}

- (void)discardSATEnrollmentForLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v4 = a3;
    -[VTPreferences _VTSATBasePath](self, "_VTSATBasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, 0))
    {
      v11 = 0;
      objc_msgSend(v7, "removeItemAtPath:error:", v6, &v11);
      v8 = v11;
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Couldn't delete SAT data at path %@ %@"), v6, v10);

      }
    }

  }
}

- (void)discardAllSATEnrollment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[VTPreferences _VTSATBasePath](self, "_VTSATBasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0))
  {
    v13 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v3, &v13);
    v5 = v13;
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Couldn't delete SAT directory at path %@ %@"), v3, v7);

    }
  }
  -[VTPreferences _VTSATCachePath](self, "_VTSATCachePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v8, 0))
  {
    v12 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v8, &v12);
    v9 = v12;
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Couldn't delete SAT cache directory at path %@ %@"), v8, v11);

    }
  }

}

- (id)_getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[VTPreferences _VTSATBasePath](self, "_VTSATBasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("audio"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)markSATEnrollmentSuccessForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = v3;
    +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForLanguageCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0))
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("enrollment_completed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "createFileAtPath:contents:attributes:", v6, 0, 0) & 1) == 0)
        NSLog(CFSTR("Coudn't mark SAT success at path %@"), v6);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[VTUtteranceMetadataManager saveMetaVersionFileAtSATAudioDirectory:](VTUtteranceMetadataManager, "saveMetaVersionFileAtSATAudioDirectory:", v7);
      +[VTVoiceProfileMigration updateVoiceProfileVersionFileForLanguageCode:](VTVoiceProfileMigration, "updateVoiceProfileVersionFileForLanguageCode:", v8);
      notify_post("com.apple.voicetrigger.PHSProfileModified");

    }
    else
    {
      NSLog(CFSTR("We can't mark SAT success when there is no audio directory"));
    }

    v3 = v8;
  }

}

- (id)getMD5HashForSATEnrollmentAudioForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  NSLog(CFSTR("%@"), v3);
  if (v3)
  {
    +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v4);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0))
    {
      objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.wav' OR self ENDSWITH '.json'"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", &stru_24C7F6FB8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "MD5HashString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getSATEnrollmentPath
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPreferences _VTSATBasePath](self, "_VTSATBasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  v6 = 0;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    -[VTPreferences _VTSATBasePath](self, "_VTSATBasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)voiceTriggerInCoreSpeech
{
  char v2;
  void *v3;
  void *v4;

  v2 = +[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman");
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger CoreSpeech Enabled"), CFSTR("com.apple.voicetrigger"));
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");

  return v2;
}

- (BOOL)gestureSubscriptionEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Gesture Subscription Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isVoiceTriggerAvailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__VTPreferences_isVoiceTriggerAvailable__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  if (isVoiceTriggerAvailable_onceToken != -1)
    dispatch_once(&isVoiceTriggerAvailable_onceToken, block);
  return isVoiceTriggerAvailable_retValue;
}

- (BOOL)_isLocalVoiceTriggerAvailable
{
  return +[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman")
      || +[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn")
      || +[VTUtilities isIOS](VTUtilities, "isIOS")
      || +[VTUtilities isNano](VTUtilities, "isNano");
}

- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[objc_class supportsMphForLanguageCode:](getCSUtilsClass(), "supportsMphForLanguageCode:", v3);
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Language code %@ supportsMph:%d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3 forPhraseDeviceType:(unint64_t)a4
{
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[objc_class supportsMphForLanguageCode:forDeviceType:](getCSUtilsClass(), "supportsMphForLanguageCode:forDeviceType:", v6, -[VTPreferences _getCSDeviceTypeWithPhraseDeviceType:](self, "_getCSDeviceTypeWithPhraseDeviceType:", a4));
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[VTPreferences _preferencesPhraseDeviceStringWithPhraseDeviceType:](self, "_preferencesPhraseDeviceStringWithPhraseDeviceType:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v10;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Language code %@, device Type: %@, supportsMph:%d", (uint8_t *)&v12, 0x1Cu);

  }
  return v7;
}

- (unint64_t)_getCSDeviceTypeWithPhraseDeviceType:(unint64_t)a3
{
  if (a3 - 1 >= 9)
    return 0;
  else
    return a3;
}

- (id)_preferencesPhraseDeviceStringWithPhraseDeviceType:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return CFSTR("Default Device");
  else
    return off_24C7F4130[a3 - 1];
}

- (BOOL)isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)isSATAvailable
{
  return !+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman");
}

- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  dispatch_time_t v8;
  id v9;
  NSObject *v10;
  intptr_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  id v16;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  __int128 *p_buf;
  uint8_t v22[4];
  double v23;
  __int16 v24;
  int v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "\nlanguageCode: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE092C0]);
  v7 = dispatch_semaphore_create(0);
  v8 = dispatch_time(0, 5000000000);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3086;
  v29 = __Block_byref_object_dispose__3087;
  v30 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__VTPreferences_devicesWithVoiceProfileIniCloudForLanguage___block_invoke;
  v18[3] = &unk_24C7F4050;
  v9 = v3;
  v19 = v9;
  p_buf = &buf;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v6, "getDevicesWithAvailablePHSAssetsForLanguage:completion:", v9, v18);
  v11 = dispatch_semaphore_wait(v10, v8);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = VTLogContextFacilityVoiceTrigger;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 134349312;
      v23 = *(double *)&v11;
      v24 = 1026;
      v25 = 5000;
      _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "Timedout waiting for AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage: %{public}ld, waitedFor: %{public}d, Returning nil", v22, 0x12u);
    }
  }
  else
  {
    v14 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "timeIntervalSinceDate:", v5);
      *(_DWORD *)v22 = 134349056;
      v23 = v15 * 1000.0;
      _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "timeToRet(AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage:): %{public}fms", v22, 0xCu);
    }

  }
  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v16;
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  char *v4;
  char *v5;
  void **p_cache;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void **v19;
  NSObject *v20;
  char *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v26;
  char *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint64_t v31;
  uint32_t v32;
  char *v34;
  uint64_t v35;
  const char *v36;
  id obj;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v28 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v4;
      v29 = "ERR: Unknown device. Returning false, language: %{public}@";
      v30 = v28;
LABEL_30:
      v32 = 12;
      goto LABEL_31;
    }
LABEL_32:
    v25 = 0;
    goto LABEL_33;
  }
  v38 = +[VTUtilities deviceCategoryForDeviceProductType:](VTUtilities, "deviceCategoryForDeviceProductType:", v5);
  if (!v38)
  {
    v31 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v5;
      v45 = 2114;
      v46 = v4;
      v29 = "ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
      v30 = v31;
      v32 = 22;
LABEL_31:
      _os_log_error_impl(&dword_20D965000, v30, OS_LOG_TYPE_ERROR, v29, buf, v32);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  p_cache = &OBJC_METACLASS___VTSiriNotifications.cache;
  v7 = VTLogContextFacilityVoiceTrigger;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v44 = "-[VTPreferences hasVoiceProfileIniCloudForLanguageCode:]";
      v29 = "ERR: %{public}s: Bailing out as language is nil!";
      v30 = v7;
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    +[VTPreferences deviceCategoryStringRepresentationForCategoryType:](VTPreferences, "deviceCategoryStringRepresentationForCategoryType:", v38);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v5;
    v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Searching for synced-VoiceProfile for CurrDevice: %{public}@{%{public}@}", buf, 0x16u);

  }
  v36 = v5;
  v34 = v4;
  -[VTPreferences devicesWithVoiceProfileIniCloudForLanguage:](self, "devicesWithVoiceProfileIniCloudForLanguage:", v4);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  v11 = v38;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v40;
    while (2)
    {
      v14 = 0;
      v35 = v12;
      do
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v14);
        v16 = +[VTUtilities deviceCategoryForDeviceProductType:](VTUtilities, "deviceCategoryForDeviceProductType:", v15);
        v17 = p_cache[343];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v13;
          v19 = p_cache;
          v20 = v17;
          +[VTPreferences deviceCategoryStringRepresentationForCategoryType:](VTPreferences, "deviceCategoryStringRepresentationForCategoryType:", v11);
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          +[VTPreferences deviceCategoryStringRepresentationForCategoryType:](VTPreferences, "deviceCategoryStringRepresentationForCategoryType:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v44 = v36;
          v45 = 2114;
          v46 = v21;
          v47 = 2114;
          v48 = v15;
          v49 = 2114;
          v50 = v22;
          _os_log_impl(&dword_20D965000, v20, OS_LOG_TYPE_DEFAULT, "currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
            buf,
            0x2Au);

          v11 = v38;
          p_cache = v19;
          v13 = v18;
          v12 = v35;

          v17 = p_cache[343];
        }
        v23 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16 == v11)
        {
          if (v23)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "VoiceProfile MATCH", buf, 2u);
          }

          v25 = 1;
          v4 = v34;
          v5 = (char *)v36;
          goto LABEL_27;
        }
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "VoiceProfile MIS-MATCH", buf, 2u);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v12)
        continue;
      break;
    }
  }

  v24 = p_cache[343];
  v25 = 0;
  v4 = v34;
  v5 = (char *)v36;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v24;
    +[VTPreferences deviceCategoryStringRepresentationForCategoryType:](VTPreferences, "deviceCategoryStringRepresentationForCategoryType:", v38);
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v36;
    v45 = 2114;
    v46 = v27;
    _os_log_impl(&dword_20D965000, v26, OS_LOG_TYPE_DEFAULT, "CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x16u);

    v25 = 0;
  }
LABEL_27:

LABEL_33:
  return v25;
}

- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3
{
  char *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)a3;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Will Enable VoiceTrigger after VoiceProfile sync for language: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    CFPreferencesSetAppValue(CFSTR("Enable VoiceTrigger Upon VoiceProfile Sync For Language"), v3, CFSTR("com.apple.voicetrigger.notbackedup"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446210;
    v6 = "-[VTPreferences enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    _os_log_error_impl(&dword_20D965000, v4, OS_LOG_TYPE_ERROR, "ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)_gibraltarHasBuiltInMic
{
  return 0;
}

- (id)audioInjectionFilePath
{
  id v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  char v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
    goto LABEL_16;
  v2 = (id)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Audio Injection"), CFSTR("com.apple.voicetrigger"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "kVTAudioInjectionKey is not array type", buf, 2u);
    }
    goto LABEL_15;
  }
  v2 = v2;
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v2, "count");
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "kVTAudioInjectionKey array size = %d", buf, 8u);

  }
  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__VTPreferences_audioInjectionFilePath__block_invoke;
  v9[3] = &unk_24C7F4078;
  v9[4] = buf;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  if (v11[24])
    v5 = v2 == 0;
  else
    v5 = 1;
  v6 = v5;
  _Block_object_dispose(buf, 8);

  if ((v6 & 1) != 0)
  {
LABEL_15:

LABEL_16:
    v2 = 0;
  }
  return v2;
}

- (BOOL)useSiriActivationSPIForiOS
{
  if (useSiriActivationSPIForiOS_onceToken != -1)
    dispatch_once(&useSiriActivationSPIForiOS_onceToken, &__block_literal_global_262);
  return useSiriActivationSPIForiOS_ret;
}

- (BOOL)useSiriActivationSPIForwatchOS
{
  if (useSiriActivationSPIForwatchOS_onceToken != -1)
    dispatch_once(&useSiriActivationSPIForwatchOS_onceToken, &__block_literal_global_263);
  return useSiriActivationSPIForwatchOS_ret;
}

- (BOOL)corespeechDaemonEnabled
{
  if (corespeechDaemonEnabled_onceToken != -1)
    dispatch_once(&corespeechDaemonEnabled_onceToken, &__block_literal_global_264);
  return corespeechDaemonEnabled_defaultValue;
}

- (BOOL)isMphVTEnabled
{
  if (isMphVTEnabled_onceToken != -1)
    dispatch_once(&isMphVTEnabled_onceToken, &__block_literal_global_265);
  return isMphVTEnabled_mphVTEnabled;
}

- (BOOL)everNotifyUserCompactTrigger
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("EverNotifyCompactTrigger"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setEverNotifyUserCompactTrigger
{
  CFPreferencesSetAppValue(CFSTR("EverNotifyCompactTrigger"), MEMORY[0x24BDBD1C8], CFSTR("com.apple.voicetrigger"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (BOOL)shouldOverwriteVoiceTriggerMLock
{
  if (shouldOverwriteVoiceTriggerMLock_onceToken != -1)
    dispatch_once(&shouldOverwriteVoiceTriggerMLock_onceToken, &__block_literal_global_266);
  return shouldOverwriteVoiceTriggerMLock_shouldOverwrite;
}

- (BOOL)overwritingVoiceTriggerMLock
{
  if (overwritingVoiceTriggerMLock_onceToken != -1)
    dispatch_once(&overwritingVoiceTriggerMLock_onceToken, &__block_literal_global_267);
  return overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled;
}

void __45__VTPreferences_overwritingVoiceTriggerMLock__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  char v3;
  void *v4;

  if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("Enable VoiceTrigger Mlock"), CFSTR("com.apple.voicetrigger.notbackedup"));
    v1 = (void *)v0;
    if (v0)
    {
      v4 = (void *)v0;
      v2 = objc_opt_respondsToSelector();
      v1 = v4;
      if ((v2 & 1) != 0)
      {
        v3 = objc_msgSend(v4, "BOOLValue");
        v1 = v4;
        overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled = v3;
      }
    }

  }
}

void __49__VTPreferences_shouldOverwriteVoiceTriggerMLock__block_invoke()
{
  void *v0;

  if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable VoiceTrigger Mlock"), CFSTR("com.apple.voicetrigger.notbackedup"));
    if (v0)
      shouldOverwriteVoiceTriggerMLock_shouldOverwrite = 1;

  }
}

void __31__VTPreferences_isMphVTEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("MultiPhraseVTEnabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isMphVTEnabled_mphVTEnabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __40__VTPreferences_corespeechDaemonEnabled__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  char v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  corespeechDaemonEnabled_defaultValue = !+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman");
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("CoreSpeech Daemon Enabled"), CFSTR("com.apple.voicetrigger"));
  v1 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v2 = v1;
    v4[0] = 67240192;
    v4[1] = objc_msgSend(v0, "BOOLValue");
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "value = %{public}d", (uint8_t *)v4, 8u);

  }
  if (v0)
    v3 = objc_msgSend(v0, "BOOLValue");
  else
    v3 = corespeechDaemonEnabled_defaultValue != 0;
  corespeechDaemonEnabled_defaultValue = v3;

}

void __47__VTPreferences_useSiriActivationSPIForwatchOS__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable SiriActivation watchOS"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    useSiriActivationSPIForwatchOS_ret = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __43__VTPreferences_useSiriActivationSPIForiOS__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable SiriActivation iOS"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    useSiriActivationSPIForiOS_ret = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __39__VTPreferences_audioInjectionFilePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_20D965000, v8, OS_LOG_TYPE_ERROR, "kVTAudioInjectionKey doesn't have NSString as an array entry", v9, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __60__VTPreferences_devicesWithVoiceProfileIniCloudForLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Devices with VoiceProfile in iCloud for language: %{public}@:%{public}@", (uint8_t *)&v9, 0x16u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __40__VTPreferences_isVoiceTriggerAvailable__block_invoke(uint64_t a1)
{
  char v2;
  char v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isLocalVoiceTriggerAvailable") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isRemoteVoiceTriggerAvailable");
    v4 = objc_msgSend(*(id *)(a1 + 32), "_gibraltarHasBuiltInMic");
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("isn't");
      if (v4)
        v6 = CFSTR("is");
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "VoiceTrigger %{public}@ available", (uint8_t *)&v7, 0xCu);
    }
    v2 = v3 & v4;
  }
  isVoiceTriggerAvailable_retValue = v2;
}

+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("kVTDeviceCategory_Unknown");
  else
    return off_24C7F4178[a3 - 1];
}

- (id)getPreferencesForEndpoint:(id)a3 fromPreferenceDomain:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v8);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "dictionaryForKey:", CFSTR("RemoraDevices"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      if (v13)
      {
        objc_msgSend(v7, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v18 = (void *)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            objc_msgSend(v7, "UUIDString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138477827;
            v26 = v20;
            _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_INFO, "Saved voice trigger preferences for endpoint %{private}@ is nil", (uint8_t *)&v25, 0xCu);

          }
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
LABEL_13:

LABEL_19:
          goto LABEL_22;
        }
        v21 = (void *)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          v23 = v21;
          objc_msgSend(v7, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138477827;
          v26 = v24;
          _os_log_error_impl(&dword_20D965000, v23, OS_LOG_TYPE_ERROR, "Saved voice trigger preferences for endpoint %{private}@ is not a dictionary.", (uint8_t *)&v25, 0xCu);

        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", VTErrorDomain, objc_msgSend(&unk_24C803018, "unsignedIntegerValue"), 0);
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
    }
    v15 = 0;
    goto LABEL_19;
  }
  v17 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v25 = 138478083;
    v26 = v7;
    v27 = 2113;
    v28 = v9;
    _os_log_error_impl(&dword_20D965000, v17, OS_LOG_TYPE_ERROR, "Unexpected Input (endpointId: %{private}@ preferenceDomain: %{private}@).", (uint8_t *)&v25, 0x16u);
    if (a5)
      goto LABEL_10;
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  if (!a5)
    goto LABEL_21;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", VTErrorDomain, 1, 0);
  v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v15;
}

- (id)setPreferences:(id)a3 forEndpoint:(id)a4 inPreferenceDomain:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v9);
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "dictionaryForKey:", CFSTR("RemoraDevices"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v7, v15);

      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("RemoraDevices"));
    }

    v16 = 0;
  }
  else
  {
    v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v19 = 138478339;
      v20 = v7;
      v21 = 2113;
      v22 = v8;
      v23 = 2113;
      v24 = v10;
      _os_log_error_impl(&dword_20D965000, v17, OS_LOG_TYPE_ERROR, "Unexpected Input (pref: %{private}@ endpointId: %{private}@ preferenceDomain: %{private}@).", (uint8_t *)&v19, 0x20u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", VTErrorDomain, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end
