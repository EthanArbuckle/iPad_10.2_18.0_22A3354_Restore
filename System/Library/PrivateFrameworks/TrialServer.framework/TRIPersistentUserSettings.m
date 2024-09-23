@implementation TRIPersistentUserSettings

- (TRIPersistentUserSettings)initWithKeyValueStore:(id)a3
{
  id v5;
  TRIPersistentUserSettings *v6;
  TRIPersistentUserSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPersistentUserSettings;
  v6 = -[TRIPersistentUserSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyValueStore, a3);

  return v7;
}

+ (id)settingsWithKeyValueStore:(id)a3
{
  id v3;
  TRIPersistentUserSettings *v4;

  v3 = a3;
  v4 = -[TRIPersistentUserSettings initWithKeyValueStore:]([TRIPersistentUserSettings alloc], "initWithKeyValueStore:", v3);

  return v4;
}

- (unsigned)persistedOptOutStatus
{
  void *v3;
  void *v4;
  NSObject *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blobForKey:usingTransaction:", CFSTR("com.apple.triald.optout.experiment"), 0);
  v5 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject length](v5, "length"))
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "No persisted opt-out state found", v9, 2u);
    }

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v5 = objc_retainAutorelease(v5);
  v6 = *(_BYTE *)-[NSObject bytes](v5, "bytes");
LABEL_10:

  return v6;
}

- (void)persistOptOutStatus:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[15];
  unsigned __int8 v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setBlob:forKey:usingTransaction:](v6, "setBlob:forKey:usingTransaction:", v4, CFSTR("com.apple.triald.optout.experiment"), 0);
      goto LABEL_9;
    }
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4)
      goto LABEL_3;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for opt-out status was nil", v8, 2u);
  }
LABEL_9:

}

- (unsigned)persistedIsSiriEnabled
{
  void *v3;
  void *v4;
  NSObject *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blobForKey:usingTransaction:", CFSTR("com.apple.triald.persisted.userSettingsIsSiriEnabled"), 0);
  v5 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject length](v5, "length"))
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "No persisted siri enablement state found", v9, 2u);
    }

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v5 = objc_retainAutorelease(v5);
  v6 = *(_BYTE *)-[NSObject bytes](v5, "bytes");
LABEL_10:

  return v6;
}

- (void)persistIsSiriEnabled:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[15];
  unsigned __int8 v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setBlob:forKey:usingTransaction:](v6, "setBlob:forKey:usingTransaction:", v4, CFSTR("com.apple.triald.persisted.userSettingsIsSiriEnabled"), 0);
      goto LABEL_9;
    }
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4)
      goto LABEL_3;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for siri enablement was nil", v8, 2u);
  }
LABEL_9:

}

- (id)persistedSiriLocale
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blobForKey:usingTransaction:", CFSTR("com.apple.triald.persisted.userSettingsSiriLocale"), 0);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5 && -[NSObject length](v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3710];
      v7 = (void *)MEMORY[0x1D8232A5C]();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
      objc_autoreleasePoolPop(v7);
      v15 = 0;
      objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v15);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v15;

      if (v10)
      {
        TRILogCategory_Server();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to unarchive siri locale from Trial persisted storage, encountered: %@", buf, 0xCu);
        }

        v12 = &stru_1E9336E60;
      }
      else
      {
        v13 = &stru_1E9336E60;
        if (v9)
          v13 = v9;
        v12 = v13;
      }

    }
    else
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "No persisted siri locale found", buf, 2u);
      }
      v12 = &stru_1E9336E60;
    }

  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    v12 = &stru_1E9336E60;
  }

  return v12;
}

- (void)persistSiriLocale:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPersistentUserSettings.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("siriLocale"));

  }
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v9)
  {
    if (v8)
    {
      -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject setBlob:forKey:usingTransaction:](v10, "setBlob:forKey:usingTransaction:", v8, CFSTR("com.apple.triald.persisted.userSettingsSiriLocale"), 0);
      goto LABEL_14;
    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v11 = "Data to be persisted for siri locale was nil";
    v12 = v10;
    v13 = 2;
    goto LABEL_10;
  }
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    v11 = "Unable to archive siri locale from Trial persisted storage, encountered: %@";
    v12 = v10;
    v13 = 12;
LABEL_10:
    _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
  }
LABEL_14:

}

- (unsigned)persistedDiagnosticsUsageEnabled
{
  void *v3;
  void *v4;
  NSObject *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blobForKey:usingTransaction:", CFSTR("com.apple.triald.persisted.diagnosticsUsageEnabled"), 0);
  v5 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject length](v5, "length"))
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "No persisted diagnostics and usage state found", v9, 2u);
    }

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v5 = objc_retainAutorelease(v5);
  v6 = *(_BYTE *)-[NSObject bytes](v5, "bytes");
LABEL_10:

  return v6;
}

- (void)persistDiagnosticsUsageEnabled:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[15];
  unsigned __int8 v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      -[TRIPersistentUserSettings keyValueStore](self, "keyValueStore");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setBlob:forKey:usingTransaction:](v6, "setBlob:forKey:usingTransaction:", v4, CFSTR("com.apple.triald.persisted.diagnosticsUsageEnabled"), 0);
      goto LABEL_9;
    }
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4)
      goto LABEL_3;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for diagnostics and usage was nil", v8, 2u);
  }
LABEL_9:

}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

@end
