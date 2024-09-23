@implementation TRISystemConfiguration

- (TRISystemConfiguration)initWithPaths:(id)a3
{
  id v4;
  TRISystemConfiguration *v5;
  uint64_t v6;
  NSString *persistentDeviceIdentifierPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISystemConfiguration;
  v5 = -[TRISystemConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "deviceIdentifierFile");
    v6 = objc_claimAutoreleasedReturnValue();
    persistentDeviceIdentifierPath = v5->_persistentDeviceIdentifierPath;
    v5->_persistentDeviceIdentifierPath = (NSString *)v6;

  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1ECED7EF0 != -1)
    dispatch_once(&qword_1ECED7EF0, &__block_literal_global_22);
  return (id)_MergedGlobals_18;
}

void __40__TRISystemConfiguration_sharedInstance__block_invoke()
{
  void *v0;
  TRISystemConfiguration *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = [TRISystemConfiguration alloc];
  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[TRISystemConfiguration initWithPaths:](v1, "initWithPaths:", v2);
  v4 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v3;

  objc_autoreleasePoolPop(v0);
}

+ (id)_sharedSystemInfo
{
  if (qword_1ECED7F00 != -1)
    dispatch_once(&qword_1ECED7F00, &__block_literal_global_21);
  return (id)qword_1ECED7EF8;
}

void __43__TRISystemConfiguration__sharedSystemInfo__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = objc_opt_new();
  *(_BYTE *)(v1 + 8) = 1;
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v1);
  v4 = (void *)qword_1ECED7EF8;
  qword_1ECED7EF8 = v3;

  objc_autoreleasePoolPop(v0);
}

- (int)populationType
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = +[TRICKServerEnvironmentReader currentPopulation](TRICKServerEnvironmentReader, "currentPopulation");
  if (v3)
  {
    v4 = v3;
    TRILogCategory_ClientFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_19B89C000, v5, OS_LOG_TYPE_DEFAULT, "Using population override: %d", (uint8_t *)v7, 8u);
    }

  }
  else if (-[TRISystemConfiguration isInternalBuild](self, "isInternalBuild"))
  {
    return 3;
  }
  else if (-[TRISystemConfiguration isBetaUserWithIsStale:](self, "isBetaUserWithIsStale:", 0))
  {
    return 4;
  }
  else
  {
    return 5;
  }
  return v4;
}

- (id)systemInfo
{
  return -[TRISystemConfiguration _systemInfoWithIsStale:](self, "_systemInfoWithIsStale:", 0);
}

- (id)_systemInfoWithIsStale:(BOOL *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_sharedSystemInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__TRISystemConfiguration__systemInfoWithIsStale___block_invoke;
  v7[3] = &unk_1E3BFFE98;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "runWithLockAcquired:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__TRISystemConfiguration__systemInfoWithIsStale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  _QWORD *v7;

  v3 = a2;
  v7 = v3;
  if (!*((_QWORD *)v3 + 2))
  {
    +[TRISystemInfo info](TRISystemInfo, "info");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v7[2];
    v7[2] = v4;

    v3 = v7;
  }
  v6 = *(_BYTE **)(a1 + 40);
  if (v6)
    *v6 = *((_BYTE *)v3 + 8);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *((id *)v3 + 2));

}

- (BOOL)_updateSystemInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_sharedSystemInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__TRISystemConfiguration__updateSystemInfo___block_invoke;
  v7[3] = &unk_1E3BFFEC0;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "runWithLockAcquired:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

void __44__TRISystemConfiguration__updateSystemInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 0;
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)reloadSystemInfo
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "_sharedSystemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TRISystemConfiguration_reloadSystemInfo__block_invoke;
  v5[3] = &unk_1E3BFFEE8;
  v5[4] = &v6;
  objc_msgSend(v2, "runWithLockAcquired:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__TRISystemConfiguration_reloadSystemInfo__block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  a2[8] = 0;
  v5 = a2;
  +[TRISystemInfo info](TRISystemInfo, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[2];
  v5[2] = (id)v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5[2]);
}

- (id)trialVersionTag
{
  return CFSTR("TrialXP-429");
}

- (id)_trialVersion
{
  void *v2;
  void *v3;

  -[TRISystemConfiguration trialVersionTag](self, "trialVersionTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIVersion parseVersionFromString:withPrefix:](TRIVersion, "parseVersionFromString:withPrefix:", v2, CFSTR("TrialXP-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)trialVersionMajor
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TRISystemConfiguration _trialVersion](self, "_trialVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "majorVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)trialVersionMinor
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TRISystemConfiguration _trialVersion](self, "_trialVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minorVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)isBetaUserWithIsStale:(BOOL *)a3
{
  char v5;
  void *v6;
  void *v7;

  if (-[TRISystemConfiguration isInternalBuild](self, "isInternalBuild"))
  {
    v5 = 0;
    if (a3)
      *a3 = 0;
  }
  else
  {
    -[TRISystemConfiguration _systemInfoWithIsStale:](self, "_systemInfoWithIsStale:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!a3 || v6)
    {
      if (v6)
        v5 = objc_msgSend(v6, "isEnrolledInBetaProgram");
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
      *a3 = 1;
    }

  }
  return v5;
}

- (BOOL)isInternalBuild
{
  return objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
}

- (BOOL)isBetaBuild
{
  return objc_msgSend(MEMORY[0x1E0D81588], "isBetaBuild");
}

- (id)readDeviceIdentifierWithPath:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", a3, 4, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    TRILogCategory_ClientFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Persistent identifier file read error: %@", buf, 0xCu);

    }
  }

  return v3;
}

- (BOOL)resetDeviceIdentifier
{
  void *v3;
  BOOL v4;

  if (!-[TRISystemConfiguration deleteDeviceIdentifier](self, "deleteDeviceIdentifier"))
    return 0;
  -[TRISystemConfiguration createPersistentDeviceIdentifier](self, "createPersistentDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)deleteDeviceIdentifier
{
  return -[TRISystemConfiguration deleteDeviceIdentifierWithPath:](self, "deleteDeviceIdentifierWithPath:", self->_persistentDeviceIdentifierPath);
}

- (BOOL)deleteDeviceIdentifierWithPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "fileExistsAtPath:", v3)
    || ((v13 = 0, v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v13), v6 = v13, v5)
      ? (v7 = v6 == 0)
      : (v7 = 0),
        v7))
  {
    v10 = 1;
  }
  else
  {
    v8 = v6;
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Error deleting persistent identifier file: %@", buf, 0xCu);

    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)setDeviceIdentifier:(id)a3
{
  return -[TRISystemConfiguration setDeviceIdentifier:path:](self, "setDeviceIdentifier:path:", a3, self->_persistentDeviceIdentifierPath);
}

- (BOOL)setDeviceIdentifier:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  TRISystemConfiguration *v10;
  TRISystemConfiguration *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  TRISystemConfiguration *v15;
  BOOL v16;
  NSString *cachedDeviceIdentifier;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v9 = (id)objc_msgSend(v8, "triCreateDirectoryForPath:isDirectory:error:", v7, 0, &v20);
  v10 = (TRISystemConfiguration *)v20;
  if (v10)
  {
    v11 = v10;
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[TRISystemConfiguration description](v11, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v14 = "Error creating persistent identifier folder: %@";
LABEL_10:
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

    }
  }
  else
  {
    v19 = 0;
    objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v7, 1, 4, &v19);
    v15 = (TRISystemConfiguration *)v19;
    if (!v15)
    {
      v11 = self;
      objc_sync_enter(v11);
      cachedDeviceIdentifier = v11->_cachedDeviceIdentifier;
      v11->_cachedDeviceIdentifier = 0;

      objc_sync_exit(v11);
      v16 = 1;
      goto LABEL_7;
    }
    v11 = v15;
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[TRISystemConfiguration description](v11, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v14 = "Error writing persistent identifier: %@";
      goto LABEL_10;
    }
  }

  v16 = 0;
LABEL_7:

  return v16;
}

- (id)createDeviceIdentifierWithPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TRISystemConfiguration readDeviceIdentifierWithPath:](self, "readDeviceIdentifierWithPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TRISystemConfiguration setDeviceIdentifier:path:](self, "setDeviceIdentifier:path:", v7, v4))
      v5 = v7;
    else
      v5 = 0;

  }
  return v5;
}

- (id)storedDeviceIdentifier
{
  return -[TRISystemConfiguration readDeviceIdentifierWithPath:](self, "readDeviceIdentifierWithPath:", self->_persistentDeviceIdentifierPath);
}

- (id)createPersistentDeviceIdentifier
{
  return -[TRISystemConfiguration createDeviceIdentifierWithPath:](self, "createDeviceIdentifierWithPath:", self->_persistentDeviceIdentifierPath);
}

- (id)deviceInfoForQuestion:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)MGCopyAnswer();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

- (id)reloadDeviceId
{
  TRISystemConfiguration *v2;
  NSString *cachedDeviceIdentifier;

  v2 = self;
  objc_sync_enter(v2);
  cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  v2->_cachedDeviceIdentifier = 0;

  objc_sync_exit(v2);
  return -[TRISystemConfiguration deviceId](v2, "deviceId");
}

- (id)deviceId
{
  TRISystemConfiguration *v2;
  NSString *cachedDeviceIdentifier;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  v2 = self;
  objc_sync_enter(v2);
  cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  if (!cachedDeviceIdentifier)
  {
    -[TRISystemConfiguration storedDeviceIdentifier](v2, "storedDeviceIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_cachedDeviceIdentifier;
    v2->_cachedDeviceIdentifier = (NSString *)v4;

    cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  }
  v6 = cachedDeviceIdentifier;
  objc_sync_exit(v2);

  return v6;
}

- (id)iCloudId
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iCloudIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E3C00710;
  v5 = v3;

  return v5;
}

- (id)deviceClass
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TRISystemConfiguration_deviceClass__block_invoke;
  block[3] = &unk_1E3BFE828;
  block[4] = self;
  if (qword_1ECED7F10 != -1)
    dispatch_once(&qword_1ECED7F10, block);
  return (id)qword_1ECED7F08;
}

void __37__TRISystemConfiguration_deviceClass__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceInfoForQuestion:", CFSTR("DeviceClass"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED7F08;
  qword_1ECED7F08 = v1;

}

- (id)deviceModelCode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TRISystemConfiguration_deviceModelCode__block_invoke;
  block[3] = &unk_1E3BFE828;
  block[4] = self;
  if (qword_1ECED7F20 != -1)
    dispatch_once(&qword_1ECED7F20, block);
  return (id)qword_1ECED7F18;
}

void __41__TRISystemConfiguration_deviceModelCode__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceInfoForQuestion:", CFSTR("ProductType"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED7F18;
  qword_1ECED7F18 = v1;

}

- (id)osType
{
  return CFSTR("iOS");
}

- (id)osBuild
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__TRISystemConfiguration_osBuild__block_invoke;
  block[3] = &unk_1E3BFE828;
  block[4] = self;
  if (qword_1ECED7F30 != -1)
    dispatch_once(&qword_1ECED7F30, block);
  return (id)qword_1ECED7F28;
}

void __33__TRISystemConfiguration_osBuild__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceInfoForQuestion:", CFSTR("BuildVersion"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED7F28;
  qword_1ECED7F28 = v1;

}

- (id)userSettingsLanguageCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userSettingsRegionCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userSettingsBCP47DeviceLocale
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = &stru_1E3C00710;
  if (v5)
    v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dispatchQueueForCarrierInfoGathering
{
  if (qword_1ECED7F40 != -1)
    dispatch_once(&qword_1ECED7F40, &__block_literal_global_49);
  return (id)qword_1ECED7F38;
}

void __63__TRISystemConfiguration__dispatchQueueForCarrierInfoGathering__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.system-config.carrier", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED7F38;
  qword_1ECED7F38 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)carrierBundleIdentifier
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierBundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E3C00710;
  v5 = v3;

  return v5;
}

- (id)carrierCountryIsoCode
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierCountryIsoCode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E3C00710;
  v5 = v3;

  return v5;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  void *v2;
  char v3;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticsAndUsageEnabled");

  return v3;
}

- (BOOL)hasAne
{
  void *v2;
  char v3;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAne");

  return v3;
}

- (id)aneVersion
{
  void *v2;
  void *v3;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aneVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)marketingOSVersion
{
  void *v4;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "operatingSystemVersion");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (id)enabledInputModeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)isAutomatedTestDevice
{
  void *v2;
  char v3;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomatedTestDevice");

  return v3;
}

- (id)siriUserActivitySegment
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriUserActivitySegment");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

- (id)siriDeviceAggregationIdRotationDate
{
  void *v2;
  void *v3;

  -[TRISystemConfiguration systemInfo](self, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriDeviceAggregationIdRotationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentDeviceIdentifierPath, 0);
}

@end
