@implementation TLCapabilitiesManager

+ (TLCapabilitiesManager)sharedCapabilitiesManager
{
  if (sharedCapabilitiesManager__TLCapabilitiesManagerOnceToken != -1)
    dispatch_once(&sharedCapabilitiesManager__TLCapabilitiesManagerOnceToken, &__block_literal_global_9);
  return (TLCapabilitiesManager *)(id)sharedCapabilitiesManager__TLCapabilitiesSharedManager;
}

void __50__TLCapabilitiesManager_sharedCapabilitiesManager__block_invoke()
{
  TLCapabilitiesManager *v0;
  void *v1;

  v0 = objc_alloc_init(TLCapabilitiesManager);
  v1 = (void *)sharedCapabilitiesManager__TLCapabilitiesSharedManager;
  sharedCapabilitiesManager__TLCapabilitiesSharedManager = (uint64_t)v0;

}

- (TLCapabilitiesManager)init
{
  char *v2;
  TLCapabilitiesManager *v3;
  void *v4;
  void *v5;
  NSDictionary *deviceCodeNameSimplicationMapping;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLCapabilitiesManager;
  v2 = -[TLCapabilitiesManager init](&v8, sel_init);
  v3 = (TLCapabilitiesManager *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 9) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getSSDeviceAvailableItemKindsChangedNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleStoreAvailableItemKindsChangedNotification_, v5, 0);

    -[TLCapabilitiesManager _checkRingtoneStoreAvailability](v3, "_checkRingtoneStoreAvailability");
    deviceCodeNameSimplicationMapping = v3->_deviceCodeNameSimplicationMapping;
    v3->_deviceCodeNameSimplicationMapping = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v3->_isInternalInstall = MGGetBoolAnswer();
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getSSDeviceAvailableItemKindsChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)TLCapabilitiesManager;
  -[TLCapabilitiesManager dealloc](&v5, sel_dealloc);
}

- (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (void)_checkRingtoneStoreAvailability
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (-[TLCapabilitiesManager _hasTelephonyCapability](self, "_hasTelephonyCapability"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getSSDeviceClass_softClass;
    v12 = getSSDeviceClass_softClass;
    v4 = MEMORY[0x1E0C809B0];
    if (!getSSDeviceClass_softClass)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __getSSDeviceClass_block_invoke;
      v8[3] = &unk_1E952AB10;
      v8[4] = &v9;
      __getSSDeviceClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    objc_msgSend(v5, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __56__TLCapabilitiesManager__checkRingtoneStoreAvailability__block_invoke;
    v7[3] = &unk_1E952B6D8;
    v7[4] = self;
    objc_msgSend(v6, "getAvailableItemKindsWithBlock:", v7);

  }
}

uint64_t __56__TLCapabilitiesManager__checkRingtoneStoreAvailability__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRingtoneStoreAvailabilityWithAvailableKinds:error:", a2, a3);
}

- (void)_updateRingtoneStoreAvailabilityWithAvailableKinds:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v8 = (_QWORD *)getSSItemKindRingtoneSymbolLoc_ptr_0;
    v16 = getSSItemKindRingtoneSymbolLoc_ptr_0;
    if (!getSSItemKindRingtoneSymbolLoc_ptr_0)
    {
      v9 = (void *)StoreServicesLibrary_0();
      v8 = dlsym(v9, "SSItemKindRingtone");
      v14[3] = (uint64_t)v8;
      getSSItemKindRingtoneSymbolLoc_ptr_0 = (uint64_t)v8;
    }
    _Block_object_dispose(&v13, 8);
    if (v8)
    {
      self->_isRingtoneStoreAvailable = objc_msgSend(v6, "containsObject:", *v8, v13);
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v10 = (_QWORD *)getSSItemKindToneSymbolLoc_ptr_0;
      v16 = getSSItemKindToneSymbolLoc_ptr_0;
      if (!getSSItemKindToneSymbolLoc_ptr_0)
      {
        v11 = (void *)StoreServicesLibrary_0();
        v10 = dlsym(v11, "SSItemKindTone");
        v14[3] = (uint64_t)v10;
        getSSItemKindToneSymbolLoc_ptr_0 = (uint64_t)v10;
      }
      _Block_object_dispose(&v13, 8);
      if (v10)
      {
        self->_isAlertToneStoreAvailable = objc_msgSend(v6, "containsObject:", *v10, v13);
        goto LABEL_10;
      }
    }
    else
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    }
    v12 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  *(_WORD *)&self->_isRingtoneStoreAvailable = 0;
LABEL_10:

}

- (BOOL)isRingtoneStoreAvailable
{
  return self->_isRingtoneStoreAvailable;
}

- (BOOL)isAlertToneStoreAvailable
{
  return self->_isAlertToneStoreAvailable;
}

- (BOOL)wantsModernDefaultRingtone
{
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (BOOL)supportsNanoEncore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getNRPairedDeviceRegistryClass(), "activePairedDeviceSelectorBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v6 = (_QWORD *)getNRDevicePropertyNameSymbolLoc_ptr;
    v21 = getNRDevicePropertyNameSymbolLoc_ptr;
    if (!getNRDevicePropertyNameSymbolLoc_ptr)
    {
      v7 = (void *)NanoRegistryLibrary();
      v6 = dlsym(v7, "NRDevicePropertyName");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v6;
      getNRDevicePropertyNameSymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&buf, 8);
    if (!v6)
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    objc_msgSend(v5, "valueForProperty:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\">"), v11, v5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"));
  v14 = objc_msgSend(v5, "supportsCapability:", v13);

  TLLogToneManagement();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      v17 = "Active paired watch %{public}@ supports NanoEncore.";
LABEL_12:
      _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v16)
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    v17 = "Active paired watch %{public}@ does NOT support NanoEncore.";
    goto LABEL_12;
  }

  return v14;
}

- (BOOL)hasVibratorCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasSynchronizedVibrationsCapability
{
  int v3;
  NSObject *v4;
  int v6;
  TLCapabilitiesManager *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[TLCapabilitiesManager hasVibratorCapability](self, "hasVibratorCapability"))
  {
    v3 = MGGetBoolAnswer();
    TLLogVibrationManagement();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -hasSynchronizedVibrationsCapability. MobileGestalt returned %{BOOL}u for the deviceSupportsHaptics capability.", (uint8_t *)&v6, 0x12u);
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSynchronizedEmbeddedVibrationsCapability
{
  int v3;
  int v4;
  char v5;
  NSObject *v6;
  int v8;
  TLCapabilitiesManager *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[TLCapabilitiesManager hasVibratorCapability](self, "hasVibratorCapability"))
    return 0;
  v3 = MGGetBoolAnswer();
  v4 = MGGetBoolAnswer();
  v5 = v3 & v4;
  TLLogVibrationManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138544130;
    v9 = self;
    v10 = 1024;
    v11 = v3;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v3 & v4;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -hasSynchronizedVibrationsCapability. MobileGestalt returned %{BOOL}u for the deviceSupportsHaptics capability, and %{BOOL}u for the deviceSupportsClosedLoopHaptics capability; hasSynchronizedEmbeddedVibrationsCapabi"
      "lity = %{BOOL}u.",
      (uint8_t *)&v8,
      0x1Eu);
  }

  return v5;
}

- (BOOL)hasCellularTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (NSString)deviceCodeName
{
  void *v2;
  void *v3;
  CFTypeID v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
    {
      v5 = v3;
      if (objc_msgSend(v5, "hasSuffix:", CFSTR("AP")))
      {
        objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(CFSTR("AP"), "length"));
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v6;
      }
      v7 = (void *)objc_msgSend(v5, "copy");

    }
    else
    {
      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)simplifiedDeviceCodeName
{
  void *v3;
  id v4;

  -[TLCapabilitiesManager deviceCodeName](self, "deviceCodeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSDictionary objectForKey:](self->_deviceCodeNameSimplicationMapping, "objectForKey:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isHomePod
{
  return MGGetSInt32Answer() == 7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCodeNameSimplicationMapping, 0);
}

@end
