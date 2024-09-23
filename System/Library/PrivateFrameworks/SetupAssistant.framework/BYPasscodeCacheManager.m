@implementation BYPasscodeCacheManager

- (BYPasscodeCacheManager)initWithFeatureFlags:(id)a3
{
  id v5;
  BYPasscodeCacheManager *v6;
  BYPasscodeCacheManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYPasscodeCacheManager;
  v6 = -[BYPasscodeCacheManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_stashedFd = -1;
    objc_storeStrong((id *)&v6->_featureFlags, a3);
  }

  return v7;
}

- (void)cachePasscode:(id)a3
{
  -[BYPasscodeCacheManager cachePasscode:retrievable:](self, "cachePasscode:retrievable:", a3, 0);
}

- (void)cachePasscode:(id)a3 retrievable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[2];

  v4 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_isCached && objc_msgSend(v6, "length"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_buddyFinished, CFSTR("com.apple.purplebuddy.setupdone"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v9 = objc_alloc_init((Class)getSecureBackupClass());
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v10 = (id *)getkSecureBackupPassphraseKeySymbolLoc_ptr;
    v30 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
    if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
    {
      v11 = (void *)CloudServicesLibrary_0();
      v10 = (id *)dlsym(v11, "kSecureBackupPassphraseKey");
      v28[3] = (uint64_t)v10;
      getkSecureBackupPassphraseKeySymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&v27, 8);
    if (!v10)
    {
      +[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
      __break(1u);
    }
    v31 = *v10;
    v32[0] = v7;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v31;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v32, &v31, 1, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (id)objc_msgSend(v9, "cachePassphraseWithInfo:", v14);
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v16 = MKBKeyBagKeyStashCreateWithMode();
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((_DWORD)v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[BYPasscodeCacheManager cachePasscode:retrievable:].cold.2(v16, v18, v19, v20, v21, v22, v23, v24);
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1A4E92000, v18, OS_LOG_TYPE_DEFAULT, "Keybag stash created successfully", (uint8_t *)&v27, 2u);
    }

    if (v4)
      self->_retrievable = -[BYPasscodeCacheManager storePasscode:](self, "storePasscode:", v7);
    -[BYPasscodeCacheManager featureFlags](self, "featureFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

    if (v26)
      -[BYPasscodeCacheManager _updateCachedLocalSecret:](self, "_updateCachedLocalSecret:", v7);
    self->_isCached = 1;

  }
}

- (void)uncachePasscode
{
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, a2, a3, "Failed to clear keybag stash with error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (BOOL)storePasscode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  ssize_t v16;
  ssize_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int *v21;
  char *v22;
  const char *v23;
  BOOL v24;
  NSObject *v25;
  int *v26;
  char *v27;
  NSObject *v28;
  int v29;
  char *v30;
  NSObject *v31;
  int *v32;
  char *v33;
  int *v34;
  char *v35;
  NSObject *v36;
  int *v37;
  char *v38;
  void *v39;
  int *v40;
  char *v41;
  id v43;
  uint8_t buf[4];
  char *v45;
  __int16 v46;
  uint64_t v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");

  v10 = open_dprotected_np(v9, 1794, 1, 0, 384);
  if (v10 < 0)
  {
    _BYLoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:
      v24 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 136315138;
    v45 = v22;
    v23 = "Failed to open temporary file for caching: %s";
LABEL_14:
    _os_log_impl(&dword_1A4E92000, v14, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    goto LABEL_15;
  }
  v11 = v10;
  if ((unlink(v9) & 0x80000000) == 0)
  {
    v48 = CFSTR("passcode");
    v49[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, &v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v43;
    if (v13)
    {
      if (ftruncate(v11, objc_msgSend(v13, "length")) < 0)
      {
        _BYLoggingFacility();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = __error();
          v33 = strerror(*v32);
          *(_DWORD *)buf = 136315138;
          v45 = v33;
          _os_log_impl(&dword_1A4E92000, v31, OS_LOG_TYPE_DEFAULT, "Unable to truncate cache file: %s", buf, 0xCu);
        }

        if ((close(v11) & 0x80000000) == 0)
          goto LABEL_45;
        _BYLoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
      }
      else
      {
        v15 = objc_retainAutorelease(v13);
        v16 = pwrite(v11, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0);
        if (v16 < 0)
        {
          _BYLoggingFacility();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = __error();
            v38 = strerror(*v37);
            *(_DWORD *)buf = 136315138;
            v45 = v38;
            _os_log_impl(&dword_1A4E92000, v36, OS_LOG_TYPE_DEFAULT, "Unable to write cache file: %s", buf, 0xCu);
          }

          if ((close(v11) & 0x80000000) == 0)
            goto LABEL_45;
          _BYLoggingFacility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            goto LABEL_44;
        }
        else
        {
          v17 = v16;
          if (v16 >= objc_msgSend(v15, "length"))
          {
            self->_stashedFd = v11;
            v24 = 1;
LABEL_46:

            goto LABEL_47;
          }
          _BYLoggingFacility();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(v15, "length");
            *(_DWORD *)buf = 134218240;
            v45 = (char *)v17;
            v46 = 2048;
            v47 = v19;
            _os_log_impl(&dword_1A4E92000, v18, OS_LOG_TYPE_DEFAULT, "Incomplete data written to cache file: read %ld, expected %lu", buf, 0x16u);
          }

          if ((close(v11) & 0x80000000) == 0)
          {
LABEL_45:
            v24 = 0;
            goto LABEL_46;
          }
          _BYLoggingFacility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            goto LABEL_45;
          }
        }
      }
    }
    else
    {
      _BYLoggingFacility();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v29 = 0;
          v30 = (char *)v14;
        }
        else if (v14)
        {
          v39 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject domain](v14, "domain");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v8, -[NSObject code](v14, "code"));
          v30 = (char *)objc_claimAutoreleasedReturnValue();
          v29 = 1;
        }
        else
        {
          v29 = 0;
          v30 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v45 = v30;
        _os_log_impl(&dword_1A4E92000, v28, OS_LOG_TYPE_DEFAULT, "Unable to serialize cache data: %{public}@", buf, 0xCu);
        if (v29)
        {

        }
      }

      if ((close(v11) & 0x80000000) == 0)
        goto LABEL_45;
      _BYLoggingFacility();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_44;
    }
    v40 = __error();
    v41 = strerror(*v40);
    *(_DWORD *)buf = 136315138;
    v45 = v41;
    _os_log_impl(&dword_1A4E92000, v20, OS_LOG_TYPE_DEFAULT, "Failed closing temporary file: %s", buf, 0xCu);
    goto LABEL_44;
  }
  _BYLoggingFacility();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = __error();
    v27 = strerror(*v26);
    *(_DWORD *)buf = 136315138;
    v45 = v27;
    _os_log_impl(&dword_1A4E92000, v25, OS_LOG_TYPE_DEFAULT, "Failed to unlink temporary file for caching: %s", buf, 0xCu);
  }

  if (close(v11) < 0)
  {
    _BYLoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v34 = __error();
    v35 = strerror(*v34);
    *(_DWORD *)buf = 136315138;
    v45 = v35;
    v23 = "Failed closing temporary file: %s";
    goto LABEL_14;
  }
  v24 = 0;
LABEL_48:

  return v24;
}

- (id)cachedPasscode
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int stashedFd;
  id v11;
  void *v12;
  int v13;
  void *v14;
  ssize_t v15;
  ssize_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v22;
  int *v23;
  char *v24;
  int *v25;
  char *v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t v33[4];
  _BYTE v34[18];
  stat buf;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[BYPasscodeCacheManager featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUseCDPContextSecretInsteadOfSBDSecretEnabled") & 1) != 0)
  {
    -[BYPasscodeCacheManager cachedLocalSecret](self, "cachedLocalSecret");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validatedSecret");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _BYLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        buf.st_dev = 136315138;
        *(_QWORD *)&buf.st_mode = "-[BYPasscodeCacheManager cachedPasscode]";
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "%s: Returning property value.", (uint8_t *)&buf, 0xCu);
      }

      -[BYPasscodeCacheManager cachedLocalSecret](self, "cachedLocalSecret");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject validatedSecret](v8, "validatedSecret");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
  }
  else
  {

  }
  stashedFd = self->_stashedFd;
  if (stashedFd < 0)
    return 0;
  memset(&buf, 0, sizeof(buf));
  if (fstat(stashedFd, &buf) < 0)
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_stashedFd;
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)v33 = 67109378;
      *(_DWORD *)v34 = v22;
      *(_WORD *)&v34[4] = 2080;
      *(_QWORD *)&v34[6] = v24;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to stat file (%d): %s", v33, 0x12u);
    }
    v9 = 0;
    goto LABEL_36;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v12 = (void *)objc_msgSend(v11, "initWithLength:", buf.st_size);
  v13 = self->_stashedFd;
  v8 = objc_retainAutorelease(v12);
  v14 = (void *)-[NSObject mutableBytes](v8, "mutableBytes");
  v15 = pread(v13, v14, buf.st_size, 0);
  if (v15 < 0)
  {
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)v33 = 136315138;
      *(_QWORD *)v34 = v26;
      v18 = "Unable to read secure file: %s";
      v19 = v17;
      v20 = 12;
      goto LABEL_19;
    }
  }
  else
  {
    v16 = v15;
    if (v15 >= buf.st_size)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v32;
      if (v27)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("passcode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[NSObject length](v8, "length"))
        {
          _BYLoggingFacility();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v29 = 0;
              v30 = v17;
            }
            else if (v17)
            {
              v31 = (void *)MEMORY[0x1E0CB3940];
              -[NSObject domain](v17, "domain");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, -[NSObject code](v17, "code"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 1;
            }
            else
            {
              v29 = 0;
              v30 = 0;
            }
            *(_DWORD *)v33 = 138543362;
            *(_QWORD *)v34 = v30;
            _os_log_impl(&dword_1A4E92000, v28, OS_LOG_TYPE_DEFAULT, "Unable to decode secure file: %{public}@", v33, 0xCu);
            if (v29)
            {

            }
          }

        }
        v9 = 0;
      }

      goto LABEL_35;
    }
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218240;
      *(_QWORD *)v34 = v16;
      *(_WORD *)&v34[8] = 2048;
      *(_QWORD *)&v34[10] = buf.st_size;
      v18 = "Unable to read secure file; read %ld, expected %lld";
      v19 = v17;
      v20 = 22;
LABEL_19:
      _os_log_impl(&dword_1A4E92000, v19, OS_LOG_TYPE_DEFAULT, v18, v33, v20);
    }
  }
  v9 = 0;
LABEL_35:

LABEL_36:
  return v9;
}

- (void)persistPasscodeStash
{
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, a2, a3, "Failed to persist keybag stash with error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_updateCachedLocalSecret:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  CDPLocalSecret *v8;
  CDPLocalSecret *cachedLocalSecret;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:](self, "_secretTypeCorrespondingToPasscodeType:", -[BYPasscodeCacheManager _passcodeType](self, "_passcodeType"));
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v10 = 136315138;
      v11 = "-[BYPasscodeCacheManager _updateCachedLocalSecret:]";
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%s: Caching secret", (uint8_t *)&v10, 0xCu);
    }

    v8 = (CDPLocalSecret *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15778]), "initWithValidatedSecret:secretType:", v4, v5);
    cachedLocalSecret = self->_cachedLocalSecret;
    self->_cachedLocalSecret = v8;
  }
  else
  {
    if (v7)
    {
      v10 = 136315138;
      v11 = "-[BYPasscodeCacheManager _updateCachedLocalSecret:]";
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "%s: Removing saved CDP local secret", (uint8_t *)&v10, 0xCu);
    }

    cachedLocalSecret = self->_cachedLocalSecret;
    self->_cachedLocalSecret = 0;
  }

}

- (int)_passcodeType
{
  void *v2;
  int v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockScreenTypeWithOutSimplePasscodeType:", &v4);

  return v4;
}

- (unint64_t)_secretTypeCorrespondingToPasscodeType:(int)a3
{
  NSObject *v4;
  _BOOL4 v5;
  unint64_t v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a3 == -1)
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:]";
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "%s: Saving complex device secret type", (uint8_t *)&v8, 0xCu);
    }
    v6 = 3;
  }
  else
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:]";
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "%s: Saving simple device secret type", (uint8_t *)&v8, 0xCu);
    }
    v6 = 2;
  }

  return v6;
}

- (void)updateCoreCDPStateControllerWithPasscode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Updating CDP StateController", (uint8_t *)&v15, 2u);
  }

  -[BYPasscodeCacheManager featureFlags](self, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if (v7)
  {
    v8 = -[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:](self, "_secretTypeCorrespondingToPasscodeType:", -[BYPasscodeCacheManager _passcodeType](self, "_passcodeType"));
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v9 = (void *)getCDPContextClass_softClass_0;
    v23 = getCDPContextClass_softClass_0;
    if (!getCDPContextClass_softClass_0)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getCDPContextClass_block_invoke_0;
      v18 = &unk_1E4E26900;
      v19 = &v20;
      __getCDPContextClass_block_invoke_0((uint64_t)&v15);
      v9 = (void *)v21[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v20, 8);
    v11 = objc_alloc_init(v10);
    objc_msgSend(v11, "setType:", 6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v12 = (void *)getCDPStateControllerClass_softClass_0;
    v23 = getCDPStateControllerClass_softClass_0;
    if (!getCDPStateControllerClass_softClass_0)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getCDPStateControllerClass_block_invoke_0;
      v18 = &unk_1E4E26900;
      v19 = &v20;
      __getCDPStateControllerClass_block_invoke_0((uint64_t)&v15);
      v12 = (void *)v21[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v20, 8);
    v14 = (void *)objc_msgSend([v13 alloc], "initWithContext:", v11);
    objc_msgSend(v14, "localSecretChangedTo:secretType:completion:", v4, v8, &__block_literal_global_26);

  }
}

void __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke_cold_1(v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Updated local secret: %d", (uint8_t *)v7, 8u);
  }

}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
}

- (void)cachePasscode:(uint64_t)a3 retrievable:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, a2, a3, "Failed to create keybag stash with error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v2;
  int v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_DWORD *)buf = 138412290;
  v8 = a1;
  _os_log_error_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_ERROR, "Failed to update local secret: %@", buf, 0xCu);
  if (!v5)
  {

  }
}

@end
