@implementation TITypologyPreferences

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_typologyProfileOptInManager);
}

- (BOOL)typologyLoggingEnabled
{
  return TI_DEVICE_UNLOCKED_SINCE_BOOT()
      && (-[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile")
       || -[TITypologyPreferences _typologyLoggingEnabledByInternalPreference](self, "_typologyLoggingEnabledByInternalPreference"));
}

- (BOOL)_typologyLoggingEnabledByProfile
{
  void *v2;
  void *v3;
  char v4;

  -[TITypologyPreferences typologyProfileOptInManager](self, "typologyProfileOptInManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isProfileInstalledAndUserEnabled");
  else
    v4 = 0;

  return v4;
}

- (TITypologyProfileOptInManaging)typologyProfileOptInManager
{
  return (TITypologyProfileOptInManaging *)objc_loadWeakRetained((id *)&self->_typologyProfileOptInManager);
}

- (BOOL)_typologyLoggingEnabledByInternalPreference
{
  void *v2;
  char v3;

  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (!TI_IS_INTERNAL_INSTALL::is_internal_install)
    return 0;
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", 53);

  return v3;
}

- (void)setTypologyProfileOptInManager:(id)a3
{
  objc_storeWeak((id *)&self->_typologyProfileOptInManager, a3);
}

- (BOOL)typologyLoggingEnabledByProfile
{
  unsigned int v3;

  v3 = TI_DEVICE_UNLOCKED_SINCE_BOOT();
  if (v3)
    LOBYTE(v3) = -[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile");
  return v3;
}

- (NSURL)typologyDirectoryURL
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  TI_KB_USER_DIRECTORY();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile");
  v5 = (void *)MEMORY[0x1E0C99E98];
  if (v4)
  {
    v12[0] = v3;
    v6 = CFSTR("TypologyVault");
    v7 = (void **)v12;
  }
  else
  {
    v11 = v3;
    v6 = CFSTR("Typology");
    v7 = &v11;
  }
  v7[1] = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v9;
}

- (int64_t)maxBytesPersistedTypologyRecords
{
  if (-[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0x80000;
}

- (int64_t)maxBytesPersistedTypologyTraceLogs
{
  if (-[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0x200000;
}

- (double)maxLifetimeInterval
{
  return 259200.0;
}

- (unint64_t)persistenceStrategy
{
  return -[TITypologyPreferences _typologyLoggingEnabledByProfile](self, "_typologyLoggingEnabledByProfile");
}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  return 0;
}

@end
