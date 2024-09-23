@implementation PLCPLSettings

- (PLCPLSettings)initWithLibraryBundle:(id)a3
{
  id v5;
  PLCPLSettings *v6;
  PLCPLSettings *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PLAppPrivateData *appPrivateData;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLCPLSettings;
  v6 = -[PLCPLSettings init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    v8 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(v5, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appPrivateDataForLibraryURL:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    appPrivateData = v7->_appPrivateData;
    v7->_appPrivateData = (PLAppPrivateData *)v10;

    -[PLCPLSettings _readSettingsPayload](v7, "_readSettingsPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("iCPLEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_iCPLEnabled = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LibraryType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_libraryType = objc_msgSend(v14, "integerValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PrefetchMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_prefetchMode = objc_msgSend(v15, "integerValue");

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_libraryType, CFSTR("LibraryType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_iCPLEnabled, CFSTR("iCPLEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_prefetchMode, CFSTR("PrefetchMode"));

  os_unfair_lock_unlock(p_lock);
}

- (PLCPLSettings)initWithCoder:(id)a3
{
  id v4;
  PLCPLSettings *v5;
  PLCPLSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLCPLSettings;
  v5 = -[PLCPLSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_iCPLEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iCPLEnabled"));
    v6->_libraryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LibraryType"));
    v6->_prefetchMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PrefetchMode"));
  }

  return v6;
}

- (id)debugDescription
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLCPLSettings;
  -[PLCPLSettings description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("yes");
  if (-[PLCPLSettings isICPLEnabled](self, "isICPLEnabled"))
    v5 = CFSTR("yes");
  else
    v5 = CFSTR("no");
  if (!-[PLCPLSettings isAppLibrary](self, "isAppLibrary"))
    v4 = CFSTR("no");
  +[PLCloudResourcePrefetchManager descriptionForPrefetchMode:](PLCloudResourcePrefetchManager, "descriptionForPrefetchMode:", -[PLCPLSettings prefetchMode](self, "prefetchMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": isICPLEnabled: %@, isAppLibary: %@, prefetchMode: %@"), v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAppLibrary
{
  return PLBoolResultWithUnfairLock();
}

- (BOOL)setAppLibrary:(BOOL)a3 error:(id *)a4
{
  unsigned int v5;
  os_unfair_lock_s *p_lock;
  BOOL v8;
  void *v9;
  _QWORD v11[6];

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_appPrivateData && self->_libraryType != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__PLCPLSettings_setAppLibrary_error___block_invoke;
    v11[3] = &unk_1E3674C18;
    v11[4] = self;
    v11[5] = v5;
    v8 = -[PLCPLSettings _writeSettingsValue:forKey:notify:error:didWriteValueBlock:](self, "_writeSettingsValue:forKey:notify:error:didWriteValueBlock:", v9, CFSTR("LibraryType"), 1, a4, v11);

  }
  else
  {
    v8 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isICPLEnabled
{
  return PLBoolResultWithUnfairLock();
}

- (BOOL)setICPLEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  os_unfair_lock_s *p_lock;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  BOOL v12;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_appPrivateData && self->_iCPLEnabled != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__PLCPLSettings_setICPLEnabled_error___block_invoke;
    v11[3] = &unk_1E36762F8;
    v11[4] = self;
    v12 = v5;
    v8 = -[PLCPLSettings _writeSettingsValue:forKey:notify:error:didWriteValueBlock:](self, "_writeSettingsValue:forKey:notify:error:didWriteValueBlock:", v9, CFSTR("iCPLEnabled"), 1, a4, v11);

  }
  else
  {
    v8 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (int64_t)prefetchMode
{
  return PLIntegerResultWithUnfairLock();
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  BOOL v8;
  void *v9;
  _QWORD v11[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_appPrivateData && self->_prefetchMode != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__PLCPLSettings_setPrefetchMode_error___block_invoke;
    v11[3] = &unk_1E3674C18;
    v11[4] = self;
    v11[5] = a3;
    v8 = -[PLCPLSettings _writeSettingsValue:forKey:notify:error:didWriteValueBlock:](self, "_writeSettingsValue:forKey:notify:error:didWriteValueBlock:", v9, CFSTR("PrefetchMode"), 1, a4, v11);

  }
  else
  {
    v8 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isKeepOriginalsEnabled
{
  return -[PLCPLSettings prefetchMode](self, "prefetchMode") == 1;
}

- (unint64_t)runOnceFlags
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PLCPLSettings _readSettingsPayload](self, "_readSettingsPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RunOnceFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)runOnceFlagIsSet:(unint64_t)a3
{
  return PLBoolResultWithUnfairLock();
}

- (BOOL)setRunOnceFlag:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[PLCPLSettings runOnceFlags](self, "runOnceFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 | a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PLCPLSettings _writeSettingsValue:forKey:notify:error:didWriteValueBlock:](self, "_writeSettingsValue:forKey:notify:error:didWriteValueBlock:", v9, CFSTR("RunOnceFlags"), 0, a4, 0);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)clearRunOnceFlag:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[PLCPLSettings runOnceFlags](self, "runOnceFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 & ~a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PLCPLSettings _writeSettingsValue:forKey:notify:error:didWriteValueBlock:](self, "_writeSettingsValue:forKey:notify:error:didWriteValueBlock:", v9, CFSTR("RunOnceFlags"), 0, a4, 0);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (id)deriveMainScopeIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[PLCPLSettings isAppLibrary](self, "isAppLibrary"))
  {
    -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PLPhotoLibraryBundle libraryURL](self->_libraryBundle, "libraryURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v4, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PLPhotoLibraryBundle assetsdClient](self->_libraryBundle, "assetsdClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "libraryManagementClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPhotoLibraryBundle libraryURL](self->_libraryBundle, "libraryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "photoLibraryIdentifierForPhotoLibraryURL:error:", v8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CPLMainScopeIdentifierForApp();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_readSettingsPayload
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PLAppPrivateData valueForKeyPath:](self->_appPrivateData, "valueForKeyPath:", CFSTR("Library.CPL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;

  return v5;
}

- (BOOL)_writeSettingsValue:(id)a3 forKey:(id)a4 notify:(BOOL)a5 error:(id *)a6 didWriteValueBlock:(id)a7
{
  _BOOL8 v8;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v8 = a5;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a7;
  v14 = a4;
  v15 = a3;
  v16 = [v12 alloc];
  -[PLCPLSettings _readSettingsPayload](self, "_readSettingsPayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithDictionary:", v17);

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v14);
  LOBYTE(a6) = -[PLCPLSettings _writeSettingsPayload:notify:error:didWriteValueBlock:](self, "_writeSettingsPayload:notify:error:didWriteValueBlock:", v18, v8, a6, v13);

  return (char)a6;
}

- (BOOL)_writeSettingsPayload:(id)a3 notify:(BOOL)a4 error:(id *)a5 didWriteValueBlock:(id)a6
{
  _BOOL4 v7;
  void (**v10)(_QWORD);
  int v11;
  __CFNotificationCenter *DarwinNotifyCenter;

  v7 = a4;
  v10 = (void (**)(_QWORD))a6;
  v11 = -[PLAppPrivateData setValue:forKeyPath:error:](self->_appPrivateData, "setValue:forKeyPath:error:", a3, CFSTR("Library.CPL"), a5);
  if (v11)
  {
    if (v10)
      v10[2](v10);
    if (v7)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PLCPLSettingsDidChangeNotification"), 0, 0, 0);
    }
  }

  return v11;
}

- (BOOL)migrateSettings:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  os_unfair_lock_s *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  _QWORD v35[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  PLReadCloudPhotoLibraryKeepOriginalsEnabled_Legacy();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("keepOriginals"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("handleOptimizeModeChange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = v8;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("sendOptimizeSettingFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    v9 |= 2uLL;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("markPurgeableResources"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
    v9 |= 4uLL;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("clearPurgeableResources"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
    v9 |= 8uLL;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("repushVideoAssetsMetadata"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    v9 |= 0x10uLL;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("repushMasterMissingMetadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
    v9 |= 0x20uLL;
  -[PLCPLSettings _readLegacyBoolDefaultForKey:](self, "_readLegacyBoolDefaultForKey:", CFSTR("repushAssetsWithImportedByBundleIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v21)
    v22 = v9 | 0x40;
  else
    v22 = v9;
  v23 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PLCPLSettings _readSettingsPayload](self, "_readSettingsPayload");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

  if (!v6)
  {
    v26 = 0;
    if (!v22)
      goto LABEL_19;
    goto LABEL_18;
  }
  v26 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("PrefetchMode"));

  if (v22)
  {
LABEL_18:
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("RunOnceFlags"));
    v28 = p_lock;
    v29 = a3;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31 | v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, CFSTR("RunOnceFlags"));

    a3 = v29;
    p_lock = v28;
  }
LABEL_19:
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __33__PLCPLSettings_migrateSettings___block_invoke;
  v35[3] = &unk_1E3674C18;
  v35[4] = self;
  v35[5] = v26;
  v33 = -[PLCPLSettings _writeSettingsPayload:notify:error:didWriteValueBlock:](self, "_writeSettingsPayload:notify:error:didWriteValueBlock:", v25, 0, a3, v35);
  os_unfair_lock_unlock(p_lock);

  return v33;
}

- (id)_readLegacyBoolDefaultForKey:(id)a3
{
  uint64_t AppBooleanValue;
  void *v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", AppBooleanValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPrivateData, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

uint64_t __33__PLCPLSettings_migrateSettings___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

BOOL __34__PLCPLSettings_runOnceFlagIsSet___block_invoke(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 40) & objc_msgSend(*(id *)(a1 + 32), "runOnceFlags")) != 0;
}

void __39__PLCPLSettings_setPrefetchMode_error___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(a1 + 40);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.PLNotificationKeepOriginalsChanged"), 0, 0, 1u);
}

uint64_t __29__PLCPLSettings_prefetchMode__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

uint64_t __38__PLCPLSettings_setICPLEnabled_error___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __30__PLCPLSettings_isICPLEnabled__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __37__PLCPLSettings_setAppLibrary_error___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(result + 40);
  return result;
}

BOOL __29__PLCPLSettings_isAppLibrary__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1;
}

+ (PLCPLSettings)settingsWithPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "openBundleAtLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "settingsWithLibraryBundle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLCPLSettings *)v8;
}

+ (PLCPLSettings)settingsWithLibraryBundle:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCPLSettings.m"), 63, CFSTR("Missing library bundle"));

  }
  objc_msgSend(v6, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cplSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "assetsdClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cloudInternalClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCPLSettings.m"), 68, CFSTR("No cloudInternalClient"));

    }
    objc_msgSend(v8, "getCPLSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v11;
    if (v11)
      objc_storeStrong((id *)(v11 + 16), a3);
  }

  return (PLCPLSettings *)v9;
}

+ (BOOL)setPrefetchMode:(int64_t)a3 withLibraryBundle:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cloudPhotoLibraryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41022, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a5)
        *a5 = objc_retainAutorelease(v11);
LABEL_10:

      v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v7, "assetsdClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cloudInternalClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D74498];
      v20 = *MEMORY[0x1E0CB2938];
      v21[0] = CFSTR("no cloud internal client");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 44001, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5)
        *a5 = objc_retainAutorelease(v17);

      goto LABEL_10;
    }
  }
  v14 = objc_msgSend(v10, "setPrefetchMode:error:", a3, a5);
LABEL_11:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
