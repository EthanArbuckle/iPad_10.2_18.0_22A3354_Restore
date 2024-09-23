@implementation OSASystemConfiguration

void __40__OSASystemConfiguration_sysVersionData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;

  v34 = (id)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v8;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(const __CFString **)(v11 + 32);
  if (!v12)
    v12 = CFSTR("???");
  v13 = *(const __CFString **)(v11 + 48);
  if (!v13)
    v13 = CFSTR("???");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 64);
  *(_QWORD *)(v15 + 64) = v14;

  v17 = *(_QWORD **)(a1 + 32);
  v18 = (const __CFString *)v17[9];
  if (!v18)
    v18 = CFSTR("???");
  v19 = (const __CFString *)v17[4];
  if (!v19)
    v19 = CFSTR("???");
  v20 = (const __CFString *)v17[6];
  if (!v20)
    v20 = CFSTR("???");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@)"), v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 80);
  *(_QWORD *)(v22 + 80) = v21;

  v24 = *(_QWORD **)(a1 + 32);
  if (!v24[4])
  {
    v24[4] = CFSTR("<unknown>");

    v24 = *(_QWORD **)(a1 + 32);
  }
  if (!v24[6])
  {
    v24[6] = CFSTR("<unknown>");

    v24 = *(_QWORD **)(a1 + 32);
  }
  if (!v24[9])
  {
    v24[9] = CFSTR("<unknown>");

    v24 = *(_QWORD **)(a1 + 32);
  }
  if (objc_msgSend(v24, "appleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-internal"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 88);
    *(_QWORD *)(v26 + 88) = v25;

    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 40);
    v30 = CFSTR("Internal");
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(*(_QWORD *)(a1 + 32) + 32));
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 40);
    v30 = CFSTR("GM");
  }
  *(_QWORD *)(v28 + 40) = v30;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 56);
  *(_QWORD *)(v32 + 56) = v31;

}

+ (id)ensureUsablePath:(id)a3 component:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int *v20;
  char *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  OSASafeCreateDirectoryOptions *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  char v37;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  OSASafeCreateDirectoryOptions *v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  char *v54;
  uint8_t v55[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  v11 = v10;
  v12 = v10;
  if (v8)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", kPathOptionUntrusted);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathSubmission");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("ProxiedDevice-"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v12);
    if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v12, "UTF8String"), (char *)v55) || *__error() == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "containsString:", CFSTR("..")) & 1) == 0
        && v18
        && (objc_msgSend(v18, "hasPrefix:", v17) & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v12, "containsString:", CFSTR(".."));
      v18 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = *__error();
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 138544386;
      v46 = v12;
      v47 = 2114;
      v48 = v18;
      v49 = 2114;
      v50 = v17;
      v51 = 1024;
      v52 = v19;
      v53 = 2080;
      v54 = v21;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FAILED untrusted path validation '%{public}@' -> '%{public}@' [%{public}@]. Error: %d %s", buf, 0x30u);
    }

    v12 = 0;
    goto LABEL_14;
  }
LABEL_15:
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "fileExistsAtPath:", v12))
    {
      v23 = objc_retainAutorelease(v12);
      v24 = objc_msgSend(v23, "fileSystemRepresentation");
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke;
      v42[3] = &unk_1E4DEDD18;
      v43 = (OSASafeCreateDirectoryOptions *)v9;
      v12 = v23;
      v44 = v12;
      OSASafeOpenReadOnly(v24, v42);

      v25 = 0;
      v26 = v43;
    }
    else
    {
      v26 = objc_alloc_init(OSASafeCreateDirectoryOptions);
      -[OSASafeCreateDirectoryOptions setCreateIntermediates:](v26, "setCreateIntermediates:", 1);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("file-owner-uid"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSASafeCreateDirectoryOptions setUserID:](v26, "setUserID:", v27);

      -[OSASafeCreateDirectoryOptions setGroupID:](v26, "setGroupID:", &unk_1E4DFD9C0);
      -[OSASafeCreateDirectoryOptions setFileProtectionNone:](v26, "setFileProtectionNone:", 1);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v29 = OSASafeCreateDirectory(v28, 504, v26, &v41);
      v25 = v41;

      v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543362;
          v56 = v12;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "created directory '%{public}@'", v55, 0xCu);
        }
      }
      else
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543618;
          v56 = v12;
          v57 = 2114;
          v58 = v25;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to create directory '%{public}@': %{public}@", v55, 0x16u);
        }

        v12 = 0;
      }
    }

    if (v12)
    {
      if (objc_msgSend(v22, "isWritableFileAtPath:", v12))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", kPathOptionNoBackup);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "BOOLValue");

        if (v32)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v34 = *MEMORY[0x1E0C999D8];
          objc_msgSend(v33, "getResourceValue:forKey:error:", &v40, *MEMORY[0x1E0C999D8], 0);
          v35 = v40;
          if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
          {
            v36 = v25;
          }
          else
          {
            v39 = v25;
            v37 = objc_msgSend(v33, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v34, &v39);
            v36 = v39;

            if ((v37 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 138543618;
              v56 = v12;
              v57 = 2114;
              v58 = v36;
              _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to set NSURLIsExcludedFromBackupKey '%{public}@': %{public}@", v55, 0x16u);
            }
          }

          v25 = v36;
        }
      }
    }

  }
  return v12;
}

- (id)getPrefsKey:(id)a3 forDomain:(id)a4 withOptions:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *UserIdentifierForUID;
  CFPropertyListRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v24;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (-[OSASystemConfiguration pathPreferences](self, "pathPreferences"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (void *)_CFPreferencesCopyAppValueWithContainer(),
        v10,
        !v11))
  {
    if (xpc_user_sessions_enabled())
    {
      v24 = 0;
      if (!xpc_user_sessions_get_foreground_uid())
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.4((uint64_t)v7, &v24);
        goto LABEL_15;
      }
      UserIdentifierForUID = (__CFString *)_CFPreferencesGetUserIdentifierForUID();
      if (!UserIdentifierForUID)
      {
LABEL_15:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.2((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
        UserIdentifierForUID = 0;
        goto LABEL_18;
      }
    }
    else
    {
      UserIdentifierForUID = CFSTR("mobile");
    }
    v13 = CFPreferencesCopyValue(v7, v8, UserIdentifierForUID, (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (v13)
    {
      v11 = (void *)v13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.3();
      goto LABEL_21;
    }
LABEL_18:

    -[__CFString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", CFSTR("plist"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/Library/Managed Preferences/mobile/"), "stringByAppendingPathComponent:", v21);
    UserIdentifierForUID = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", UserIdentifierForUID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.1();
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.5(self);
LABEL_22:

  return v11;
}

- (NSString)pathPreferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_pathPreferences__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathPreferences_onceToken != -1)
    dispatch_once(&pathPreferences_onceToken, block);
  return self->_pathContainerRoot;
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke(uint64_t a1, int a2)
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  gid_t st_gid;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  int st_mode;
  int *v25;
  char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  id v40;
  stat v41;
  stat buf;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "setUsesSignificantDigits:", 1);
  objc_msgSend(v4, "setMaximumSignificantDigits:", 2);
  memset(&v41, 0, sizeof(v41));
  if (!fstat(a2, &v41) && (v41.st_mode & 0xF000) == 0x4000)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("file-owner-uid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v41;
    v6 = OSASetOwnership(a2, (uint64_t)&buf, v5, &unk_1E4DFD9C0);

    if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2();
    if (v41.st_gid == 250)
    {
      if ((v41.st_mode & 0x1FF) == 0x1F8)
        goto LABEL_12;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        st_gid = v41.st_gid;
        if (v6)
        {
          v11 = "";
        }
        else
        {
          v19 = __error();
          v11 = strerror(*v19);
        }
        buf.st_dev = 138544386;
        *(_QWORD *)&buf.st_mode = v9;
        WORD2(buf.st_ino) = 1024;
        *(_DWORD *)((char *)&buf.st_ino + 6) = st_gid;
        HIWORD(buf.st_uid) = 1024;
        buf.st_gid = 250;
        LOWORD(buf.st_rdev) = 1024;
        *(dev_t *)((char *)&buf.st_rdev + 2) = v6;
        *((_WORD *)&buf.st_rdev + 3) = 2082;
        buf.st_atimespec.tv_sec = (__darwin_time_t)v11;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "=== Attempted change gid on existing path: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s", (uint8_t *)&buf, 0x28u);
      }

      if ((v41.st_mode & 0x1FF) == 0x1F8)
        goto LABEL_27;
    }
    v20 = fchmod(a2, 0x1F8u);
    if (v20 == -1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1();
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 40);
      st_mode = v41.st_mode;
      if (v20)
      {
        v25 = __error();
        v26 = strerror(*v25);
      }
      else
      {
        v26 = "";
      }
      buf.st_dev = 138544386;
      *(_QWORD *)&buf.st_mode = v23;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
      HIWORD(buf.st_uid) = 1024;
      buf.st_gid = 504;
      LOWORD(buf.st_rdev) = 1024;
      *(dev_t *)((char *)&buf.st_rdev + 2) = v20 == 0;
      *((_WORD *)&buf.st_rdev + 3) = 2082;
      buf.st_atimespec.tv_sec = (__darwin_time_t)v26;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "=== Attempted change perms on existing path: %{public}@ from 0x%X to 0x%X with result %d %{public}s", (uint8_t *)&buf, 0x28u);
    }

LABEL_27:
    getprogname();
    OSAGetBootTime();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v27);
      objc_msgSend(v28, "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringForObjectValue:", v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = CFSTR("-1");
    }
    OSAGetProcessUptime();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v32);
      objc_msgSend(v33, "numberWithDouble:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringForObjectValue:", v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = CFSTR("-1");
    }
    v40 = *(id *)(a1 + 40);
    v37 = v36;
    v38 = v31;
    v39 = v40;
    AnalyticsSendEventLazy();

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3(a1, v12, v13, v14, v15, v16, v17, v18);
LABEL_12:

}

- (id)getTaskingKey:(id)a3
{
  return -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:](self, "getPrefsKey:forDomain:withOptions:", a3, CFSTR("com.apple.da"), 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance__sharedInstance;
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (id)logExt:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ext"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("routing"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subrouting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v6;
  if (v6)
  {
LABEL_7:
    v13 = v11;
    goto LABEL_8;
  }
  if (!v8 || !v10)
  {
    v11 = CFSTR("ips");
    if (v8)
      v11 = v8;
    goto LABEL_7;
  }
  v15[0] = v10;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

- (id)getPropsForLogType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    -[NSString objectForKeyedSubscript:](self->_pairedWatchOS, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)onceConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__OSASystemConfiguration_onceConfig__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (onceConfig_pred != -1)
    dispatch_once(&onceConfig_pred, block);
}

uint64_t __39__OSASystemConfiguration_appleInternal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 194) = result;
  return result;
}

- (BOOL)appleInternal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_appleInternal__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (appleInternal_pred != -1)
    dispatch_once(&appleInternal_pred, block);
  return *(&self->super._isComputeNode + 1);
}

- (id)logPathForType:(id)a3 at:(double)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v34;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-fileName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-fileName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (logPathForType_at_options__lastAbsoluteTimeSeconds == (unint64_t)a4)
      v12 = 4;
    else
      v12 = 3;
    OSADateFormat(v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (logPathForType_at_options__lastAbsoluteTimeSeconds == (unint64_t)a4)
      v14 = logPathForType_at_options__collisionCount + 1;
    else
      v14 = 0;
    logPathForType_at_options__collisionCount = v14;
    logPathForType_at_options__lastAbsoluteTimeSeconds = (unint64_t)a4;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-fileExt"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v16 = (void *)v15,
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-fileExt")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !v17))
    {
      -[OSASystemConfiguration logExt:](self, "logExt:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-filePrefix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-filePrefix"));
    else
      -[OSASystemConfiguration logPrefix:](self, "logPrefix:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "length"))
    {
      v20 = v8;

      v19 = v20;
    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = logPathForType_at_options__collisionCount;
    if ((unint64_t)logPathForType_at_options__collisionCount < 2)
    {
      v23 = &stru_1E4DEECB8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", logPathForType_at_options__collisionCount);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@%@"), v19, v13, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathExtension:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 >= 2)
  }
  objc_msgSend(v11, "stringByStandardizingPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pathComponents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-filePath"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("override-filePath"));
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_27:
    v31 = (void *)v28;
    goto LABEL_28;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("datavault-filePath"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "BOOLValue");

  if (v30)
  {
    -[OSASystemConfiguration pathSubmissionDataVault](self, "pathSubmissionDataVault");
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("file-owner"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSASystemConfiguration pathSubmissionForOwner:](self, "pathSubmissionForOwner:", v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  if (objc_msgSend(v26, "count") == 1)
  {
    objc_msgSend(v31, "stringByAppendingPathComponent:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)pathSubmission
{
  void *v3;
  const __CFString *v4;
  void *v5;

  -[OSASystemConfiguration pathRoot](self, "pathRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[OSASystemConfiguration multiUserMode](self, "multiUserMode"))
    v4 = CFSTR("Library/Logs/DiagnosticReports");
  else
    v4 = CFSTR("Logs/CrashReporter");
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)pathRoot
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__OSASystemConfiguration_pathRoot__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathRoot_onceToken != -1)
    dispatch_once(&pathRoot_onceToken, block);
  return (NSString *)self->_whitelistedDomains;
}

- (BOOL)multiUserMode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_multiUserMode__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (multiUserMode_pred != -1)
    dispatch_once(&multiUserMode_pred, block);
  return *(&self->super._isComputeNode + 3);
}

- (id)logPrefix:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("Unknown");
  }

  return v6;
}

- (id)createReportMetadata:(id)a3 with:(id)a4 at:(double)a5 usingOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
  else
    v13 = (void *)objc_opt_new();
  v14 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("os_version"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[OSASystemConfiguration productNameVersionBuildString](self, "productNameVersionBuildString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("os_version"));

  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("bug_type"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("211")))
    a5 = OSATimeIntervalApproximate(a5);
  OSADateFormat(1u, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("timestamp"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("incident_id"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("incident_id"));

  }
  return v14;
}

- (id)productNameVersionBuildString
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._productNameVersionBuildString;
}

- (id)targetAudience
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._targetAudience;
}

- (void)sysVersionData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_sysVersionData__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (sysVersionData_pred != -1)
    dispatch_once(&sysVersionData_pred, block);
}

+ (void)ensureConformanceOfFile:(int)a3 options:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uid_t st_uid;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  gid_t st_gid;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int st_mode;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  stat v35;

  memset(&v35, 0, sizeof(v35));
  v5 = a4;
  fstat(a3, &v35);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.7();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("file-owner-uid"), *(_OWORD *)&v35.st_dev);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "intValue");
  if (!geteuid() && (_DWORD)v7)
  {
    st_uid = v35.st_uid;
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (st_uid == (_DWORD)v7)
    {
      if (v9)
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.5(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      if (v9)
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.6(v7, v10, v11, v12, v13, v14, v15, v16);
      fchown(a3, v7, 0xFFFFFFFF);
    }
  }
  st_gid = v35.st_gid;
  v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (st_gid == 250)
  {
    if (v18)
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    if (v18)
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
    fchown(a3, 0xFFFFFFFF, 0xFAu);
  }
  st_mode = v35.st_mode;
  v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (st_mode == 432)
  {
    if (v27)
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  else
  {
    if (v27)
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
    fchmod(a3, 0x1B0u);
  }
}

void __41__OSASystemConfiguration_pathPreferences__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "multiUserMode"))
    v3 = CFSTR("Preferences");
  else
    v3 = CFSTR("OSAnalytics/Preferences");
  v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v5;

}

void __40__OSASystemConfiguration_sharedInstance__block_invoke()
{
  OSASystemConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(OSASystemConfiguration);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

void __39__OSASystemConfiguration_multiUserMode__block_invoke(uint64_t a1)
{
  uint32_t v2[4];
  stat v3;

  memset(&v3, 0, sizeof(v3));
  if (objc_msgSend(*(id *)(a1 + 32), "appleInternal") && !stat("/var/db/forceMultiUserMode", &v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2[0]) = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Forcing Multi User Mode behavior due to the presence of /var/db/forceMultiUserMode", (uint8_t *)v2, 2u);
    }
    goto LABEL_8;
  }
  v2[0] = 0;
  if (!host_check_multiuser_mode(0, v2) && v2[0])
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 196) = 1;
}

void __34__OSASystemConfiguration_pathRoot__block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "multiUserMode");
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "pathContainerRoot");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 248);
    *(_QWORD *)(v5 + 248) = v4;
  }
  else
  {
    v6 = (void *)v3[31];
    v3[31] = CFSTR("/private/var/mobile/Library");
  }

}

- (id)modelCode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_modelCode__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (modelCode_pred != -1)
    dispatch_once(&modelCode_pred, block);
  return self->super._modelCode;
}

- (id)crashReporterKey
{
  void *v3;
  NSString *v4;
  NSString *crashReporterKey;

  objc_msgSend(MEMORY[0x1E0D64EB0], "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crashreporterKey");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  crashReporterKey = self->super._crashReporterKey;
  self->super._crashReporterKey = v4;

  return self->super._crashReporterKey;
}

- (id)buildVersion
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._buildVersion;
}

+ (id)automatedDeviceGroup
{
  void *v2;
  void *v3;

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automatedDeviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setAutomatedDeviceGroup:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomatedDeviceGroup:", v3);

}

- (BOOL)isProxy
{
  return 0;
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSASystemConfiguration;
  -[OSAProxyConfiguration assembleMetadataAt:withOptions:](&v10, sel_assembleMetadataAt_withOptions_, *(_QWORD *)&a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSASystemConfiguration pairedWatchOS](self, "pairedWatchOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("pairedWatchOS"));

  if (-[OSASystemConfiguration multiUserMode](self, "multiUserMode"))
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = 0;
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("multi_user_mode"));
  -[OSASystemConfiguration submissionMetadata](self, "submissionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  return v5;
}

- (NSMutableDictionary)submissionMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__OSASystemConfiguration_submissionMetadata__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (submissionMetadata_pred != -1)
    dispatch_once(&submissionMetadata_pred, block);
  return (NSMutableDictionary *)*(id *)&self->_appleInternal;
}

void __44__OSASystemConfiguration_submissionMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

- (id)identifier
{
  return CFSTR("Primary");
}

- (BOOL)carrierInstall
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_carrierInstall__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (carrierInstall_pred != -1)
    dispatch_once(&carrierInstall_pred, block);
  return *(&self->super._isComputeNode + 2);
}

uint64_t __40__OSASystemConfiguration_carrierInstall__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 195) = result;
  return result;
}

- (id)pairedWatchOS
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_pairedWatchOS__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pairedWatchOS_pred != -1)
    dispatch_once(&pairedWatchOS_pred, block);
  return self->_submissionMetadata;
}

void __39__OSASystemConfiguration_pairedWatchOS__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  Class Class;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (MGGetBoolAnswer())
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 4);
    if (v2)
    {
      v3 = v2;
      Class = objc_getClass("NRPairedDeviceRegistry");
      if (Class)
      {
        -[objc_class sharedInstance](Class, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "isPaired"))
        {
          objc_msgSend(v5, "getActivePairedDevice");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForProperty:", CFSTR("systemBuildVersion"));
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(void **)(v8 + 208);
          *(_QWORD *)(v8 + 208) = v7;

        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NRPairedDeviceRegistry from NanoRegistry", buf, 2u);
      }
      dlclose(v3);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to dynamically load NanoRegistry framework", v10, 2u);
    }
  }
}

void __35__OSASystemConfiguration_modelCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  size_t v5;
  _OWORD v6[4];
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v7 = 0x100000006;
  memset(v6, 0, sizeof(v6));
  v5 = 64;
  sysctl(v7, 2u, v6, &v5, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (id)productVersion
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._productVersion;
}

- (id)productBuildString
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._productBuildString;
}

- (id)productName
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._productName;
}

- (id)productReleaseString
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._productReleaseString;
}

- (id)osTrain
{
  -[OSASystemConfiguration sysVersionData](self, "sysVersionData");
  return self->super._osTrain;
}

- (id)uiCountryCode
{
  __CFString *uiCountryCode;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_uiCountryCode__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (uiCountryCode_onceToken != -1)
    dispatch_once(&uiCountryCode_onceToken, block);
  if (self->super._uiCountryCode)
    uiCountryCode = (__CFString *)self->super._uiCountryCode;
  else
    uiCountryCode = CFSTR("en");
  return uiCountryCode;
}

void __39__OSASystemConfiguration_uiCountryCode__block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("en");
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v3);
  v4 = v5;
  if (v5)
  {

    v4 = v5;
  }

}

- (id)systemId
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__OSASystemConfiguration_systemId__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (systemId_pred != -1)
    dispatch_once(&systemId_pred, block);
  return self->super._systemId;
}

void __34__OSASystemConfiguration_systemId__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "appleInternal");
  if (v2)
    v3 = (void *)MGCopyAnswer();
  else
    v3 = 0;
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v3);
  if (v2)

}

- (id)serialNumber
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__OSASystemConfiguration_serialNumber__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (serialNumber_pred != -1)
    dispatch_once(&serialNumber_pred, block);
  return self->super._serialNumber;
}

void __38__OSASystemConfiguration_serialNumber__block_invoke(uint64_t a1)
{
  int v2;
  __CFString *v3;
  __CFString *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "appleInternal");
  if (v2)
    v3 = (__CFString *)MGCopyAnswer();
  else
    v3 = &stru_1E4DEECB8;
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v3);
  if (v2)

}

- (id)awdReporterKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_awdReporterKey__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (awdReporterKey_pred != -1)
    dispatch_once(&awdReporterKey_pred, block);
  return self->super._awdReporterKey;
}

void __40__OSASystemConfiguration_awdReporterKey__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MGCopyAnswer();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

- (BOOL)setPrefsKey:(id)a3 value:(id)a4 forDomain:(id)a5 withSync:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  int *v26;
  char *v27;
  void *v28;
  void *v29;
  BOOL v30;
  _BOOL4 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  char *v40;
  uint64_t v41;
  _QWORD v42[2];

  v6 = a6;
  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.OTACrashCopier.plist"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_retainAutorelease(v14);
  v16 = open_dprotected_np((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0, 0, 1);
  if (v16 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.3();
LABEL_11:
    v32 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "setPrefs: delete old prefs and create placeholder", buf, 2u);
    }
    v19 = objc_retainAutorelease(v15);
    unlink((const char *)objc_msgSend(v19, "fileSystemRepresentation"));
    -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = kPathOptionNoBackup;
    v42[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v20, CFSTR("/Library/Preferences"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_retainAutorelease(v19);
      v24 = open_dprotected_np((const char *)objc_msgSend(v23, "UTF8String"), 2561, 4, 0, 432);
      if ((v24 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v25 = *__error();
          v26 = __error();
          v27 = strerror(*v26);
          *(_DWORD *)buf = 138413058;
          v34 = v23;
          v35 = 1024;
          v36 = v24;
          v37 = 1024;
          v38 = v25;
          v39 = 2080;
          v40 = v27;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "setPrefs: not created '%@' returned %d: %d %s", buf, 0x22u);
        }
      }
      else
      {
        +[OSASystemConfiguration ensureConformanceOfFile:options:](OSASystemConfiguration, "ensureConformanceOfFile:options:", v24, 0);
        close(v24);
      }
    }

    v6 = v32;
    goto LABEL_19;
  }
  v17 = v16;
  if (fcntl(v16, 63) == 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.1();
    close(v17);
    goto LABEL_19;
  }
  v18 = fcntl(v17, 64, 4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.2();
  close(v17);
  if (v18 == -1)
    goto LABEL_11;
LABEL_19:
  -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _CFPreferencesSetAppValueWithContainer();

  if (v6)
  {
    -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = _CFPreferencesAppSynchronizeWithContainer() != 0;

  }
  else
  {
    v30 = 1;
  }

  return v30;
}

+ (int64_t)fastLane
{
  void *v2;
  void *v3;
  int64_t v4;

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getTaskingKey:", CFSTR("fastLane"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        +[OSASystemConfiguration fastLane].cold.1((uint64_t)v3);
      goto LABEL_7;
    }
  }
  v4 = objc_msgSend(v3, "integerValue");
LABEL_8:

  return v4;
}

- (id)experimentGroup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_experimentGroup__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (experimentGroup_onceToken != -1)
    dispatch_once(&experimentGroup_onceToken, block);
  return self->super._experimentGroup;
}

void __41__OSASystemConfiguration_experimentGroup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "getPrefsKey:forDomain:withOptions:", CFSTR("ExperimentGroup"), CFSTR("com.apple.da"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v3;
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v2);

}

- (NSString)automatedDeviceGroup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (automatedDeviceGroup_onceToken != -1)
    dispatch_once(&automatedDeviceGroup_onceToken, block);
  return self->super._automatedDeviceGroup;
}

void __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  +[OSADefaults objectForKey:](OSADefaults, "objectForKey:", CFSTR("AutomatedDeviceGroup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getPrefsKey:forDomain:withOptions:", CFSTR("AutomatedDeviceGroup"), CFSTR("com.apple.da"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v6;
  else
    v5 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), v5);

}

- (void)setAutomatedDeviceGroup:(id)a3
{
  NSString *v4;
  NSString *automatedDeviceGroup;

  v4 = (NSString *)a3;
  +[OSADefaults setObject:forKey:](OSADefaults, "setObject:forKey:", v4, CFSTR("AutomatedDeviceGroup"));
  automatedDeviceGroup = self->super._automatedDeviceGroup;
  self->super._automatedDeviceGroup = v4;

}

- (id)automatedContextURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__OSASystemConfiguration_automatedContextURL__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (automatedContextURL_onceToken != -1)
    dispatch_once(&automatedContextURL_onceToken, block);
  return self->super._automatedContextURL;
}

void __45__OSASystemConfiguration_automatedContextURL__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "getPrefsKey:forDomain:withOptions:", CFSTR("AutomatedContextURL"), CFSTR("com.apple.da"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v3;
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), v2);

}

- (id)releaseType
{
  __CFString *releaseType;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__OSASystemConfiguration_releaseType__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (releaseType_pred != -1)
    dispatch_once(&releaseType_pred, block);
  if (self->super._releaseType)
    releaseType = (__CFString *)self->super._releaseType;
  else
    releaseType = CFSTR("User");
  return releaseType;
}

void __37__OSASystemConfiguration_releaseType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MGCopyAnswer();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (id)seedGroup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_seedGroup__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (seedGroup_pred != -1)
    dispatch_once(&seedGroup_pred, block);
  return self->super._seedGroup;
}

void __35__OSASystemConfiguration_seedGroup__block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;

  v2 = CFPreferencesCopyAppValue(CFSTR("SeedGroup"), CFSTR(".GlobalPreferences"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (id)currentTaskingIDByRouting
{
  return +[OSATasking getInstalledTaskIds](OSATasking, "getInstalledTaskIds");
}

- (id)internalKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__OSASystemConfiguration_internalKey__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (internalKey_pred != -1)
    dispatch_once(&internalKey_pred, block);
  return self->super._internalKey;
}

void __37__OSASystemConfiguration_internalKey__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  __int128 v40;
  uint64_t v41;
  void *v42;
  uint64_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "appleInternal"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    if (!AccountsLibraryCore_frameworkLibrary)
    {
      v40 = xmmword_1E4DEDD60;
      v41 = 0;
      AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AccountsLibraryCore_frameworkLibrary)
    {
      v2 = dispatch_semaphore_create(0);
      v35 = 0;
      v36 = &v35;
      v37 = 0x2050000000;
      v3 = (void *)getACAccountStoreClass_softClass;
      v38 = getACAccountStoreClass_softClass;
      v4 = MEMORY[0x1E0C809B0];
      if (!getACAccountStoreClass_softClass)
      {
        *(_QWORD *)&v40 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v40 + 1) = 3221225472;
        v41 = (uint64_t)__getACAccountStoreClass_block_invoke;
        v42 = &unk_1E4DEDA88;
        v43 = &v35;
        __getACAccountStoreClass_block_invoke((uint64_t)&v40);
        v3 = (void *)v36[3];
      }
      v5 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v35, 8);
      v6 = objc_alloc_init(v5);
      *(_QWORD *)&v40 = 0;
      *((_QWORD *)&v40 + 1) = &v40;
      v41 = 0x2020000000;
      v7 = (id *)getACAccountTypeIdentifierIMAPSymbolLoc_ptr;
      v42 = (void *)getACAccountTypeIdentifierIMAPSymbolLoc_ptr;
      if (!getACAccountTypeIdentifierIMAPSymbolLoc_ptr)
      {
        v8 = (void *)AccountsLibrary();
        v7 = (id *)dlsym(v8, "ACAccountTypeIdentifierIMAP");
        *(_QWORD *)(*((_QWORD *)&v40 + 1) + 24) = v7;
        getACAccountTypeIdentifierIMAPSymbolLoc_ptr = (uint64_t)v7;
      }
      _Block_object_dispose(&v40, 8);
      if (!v7)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v9 = *v7;
      v39[0] = v9;
      getACAccountTypeIdentifierExchange();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v4;
      v24 = 3221225472;
      v25 = __37__OSASystemConfiguration_internalKey__block_invoke_267;
      v26 = &unk_1E4DEDCC8;
      v28 = &v29;
      v12 = v2;
      v27 = v12;
      objc_msgSend(v6, "visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:", v11, &v23);

      v13 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v12, v13);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __37__OSASystemConfiguration_internalKey__block_invoke_cold_1();
    }
    objc_msgSend(*(id *)(a1 + 32), "serialNumber");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (const __CFString *)v30[5];
    v17 = -[__CFString length](v14, "length");
    v18 = &stru_1E4DEECB8;
    if (v16)
      v18 = v16;
    v19 = CFSTR("<no_sn>");
    if (v17)
      v19 = v14;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@;%@"), v18, v19, v23, v24, v25, v26);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 136);
    *(_QWORD *)(v21 + 136) = v20;

    _Block_object_dispose(&v29, 8);
  }
}

void __37__OSASystemConfiguration_internalKey__block_invoke_267(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  _BOOL4 v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint8_t v47[128];
  uint8_t buf[16];
  uint64_t v49;
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v26 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v35;
    v6 = 0x1EE789000uLL;
LABEL_3:
    v7 = 0;
    while (1)
    {
      v8 = v6;
      if (*(_QWORD *)v35 != v28)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
      v10 = v8;
      if (!*(_QWORD *)(v8 + 2200))
      {
        *(_OWORD *)buf = xmmword_1E4DEDD78;
        v49 = 0;
        v11 = _sl_dlopen();
        v10 = v8;
        *(_QWORD *)(v8 + 2200) = v11;
      }
      if (!*(_QWORD *)(v10 + 2200))
        goto LABEL_50;
      objc_msgSend(v9, "accountType", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      getACAccountTypeIdentifierExchange();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using kDAAccountEmailAddress to fetch Exchange email addresses.", buf, 2u);
        }
        v38 = 0;
        v39 = &v38;
        v40 = 0x2020000000;
        v16 = (_QWORD *)getkDAAccountEmailAddressSymbolLoc_ptr;
        v41 = getkDAAccountEmailAddressSymbolLoc_ptr;
        if (!getkDAAccountEmailAddressSymbolLoc_ptr)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          v49 = (uint64_t)__getkDAAccountEmailAddressSymbolLoc_block_invoke;
          v50 = &unk_1E4DEDA88;
          v51 = &v38;
          __getkDAAccountEmailAddressSymbolLoc_block_invoke((uint64_t)buf);
          v16 = (_QWORD *)v39[3];
        }
        _Block_object_dispose(&v38, 8);
        if (!v16)
          goto LABEL_47;
      }
      else
      {
LABEL_50:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using ACAccountPropertyIdentityEmailAddress to fetch email addresses.", buf, 2u);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        v49 = 0x2020000000;
        v16 = (_QWORD *)getACEmailAliasKeyEmailAddressesSymbolLoc_ptr;
        v50 = (void *)getACEmailAliasKeyEmailAddressesSymbolLoc_ptr;
        if (!getACEmailAliasKeyEmailAddressesSymbolLoc_ptr)
        {
          v17 = (void *)AccountsLibrary();
          v16 = dlsym(v17, "ACEmailAliasKeyEmailAddresses");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v16;
          getACEmailAliasKeyEmailAddressesSymbolLoc_ptr = (uint64_t)v16;
        }
        _Block_object_dispose(buf, 8);
        if (!v16)
        {
LABEL_47:
          getACAccountTypeIdentifierExchange_cold_1();
          __break(1u);
        }
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", *v16, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __37__OSASystemConfiguration_internalKey__block_invoke_267_cold_3(&v45, v18, &v46);
      if (!v18)
      {
        objc_msgSend(v9, "username");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          __37__OSASystemConfiguration_internalKey__block_invoke_267_cold_2(&v43, v18, &v44);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "allKeys");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = 0;
          }
        }
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v24, "hasSuffix:", CFSTR("@apple.com")))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v24);
              goto LABEL_43;
            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v21)
            continue;
          break;
        }
      }
LABEL_43:

      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0;
      if (!v25)
        break;
      v6 = v8;
      if (++v7 == v29)
      {
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        v6 = v8;
        if (v29)
          goto LABEL_3;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isComputeController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__OSASystemConfiguration_isComputeController__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (isComputeController_onceToken != -1)
    dispatch_once(&isComputeController_onceToken, block);
  return self->super._isComputeController;
}

uint64_t __45__OSASystemConfiguration_isComputeController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MGCopyAnswer();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = result == *MEMORY[0x1E0C9AE50];
  return result;
}

- (BOOL)isComputeNode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_isComputeNode__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (isComputeNode_onceToken != -1)
    dispatch_once(&isComputeNode_onceToken, block);
  return self->super._isComputeNode;
}

uint64_t __39__OSASystemConfiguration_isComputeNode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MGCopyAnswer();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 193) = result == *MEMORY[0x1E0C9AE50];
  return result;
}

- (void)saveToPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[OSAProxyConfiguration metadata](self, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("deviceMetadata.proxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeToFile:atomically:", v5, 1);
}

void __36__OSASystemConfiguration_onceConfig__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  const char *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("submissionConfig"), CFSTR("plist"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("/System/Library/PrivateFrameworks/OSAnalytics.framework/submissionConfig.plist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("log_types"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 216);
    *(_QWORD *)(v8 + 216) = v7;

    if (objc_msgSend(*(id *)(a1 + 32), "multiUserMode")
      && (getpid(), v25 = "/private/var/mobile/Library/OSAnalytics/Preferences", sandbox_check()))
    {
      v10 = 0;
    }
    else
    {
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getTaskingKey:", CFSTR("disabledLogs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            v13 = MEMORY[0x1E0C81028];
            v14 = "tasked blacklist: %@";
            v15 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
            _os_log_impl(&dword_1A4D21000, v13, v15, v14, buf, 0xCu);

          }
LABEL_15:
          v16 = objc_msgSend(v10, "copy", v25);
          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(void **)(v17 + 224);
          *(_QWORD *)(v17 + 224) = v16;

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("submission_params"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(a1 + 32);
          v21 = *(void **)(v20 + 232);
          *(_QWORD *)(v20 + 232) = v19;

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("whitelisted_domains"));
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(v23 + 240);
          *(_QWORD *)(v23 + 240) = v22;

          goto LABEL_18;
        }
      }
    }

    v10 = &unk_1E4DFEE88;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(&unk_1E4DFEE88, "componentsJoinedByString:", CFSTR(", "));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      v13 = MEMORY[0x1E0C81028];
      v14 = "no blacklist tasking: applying default: %@";
      v15 = OS_LOG_TYPE_INFO;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to load %@", buf, 0xCu);
  }
LABEL_18:

}

- (id)getLogBlacklist
{
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  return self->_logConfig;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eOS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

id __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_327(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[14];
  _QWORD v15[15];

  v15[14] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("progname");
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("<unknown>");
  }
  v15[0] = v3;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v14[1] = CFSTR("create_dir");
  v14[2] = CFSTR("path");
  v4 = *(const __CFString **)(a1 + 32);
  if (!v4)
    v4 = CFSTR("path sanitize failed");
  v15[2] = v4;
  v14[3] = CFSTR("original_perms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 68));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = CFSTR("modify_perms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 208));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  v14[5] = CFSTR("modify_perms_success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 209));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v7;
  v15[6] = &unk_1E4DFD9D8;
  v14[6] = CFSTR("modify_perms_value");
  v14[7] = CFSTR("original_gid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v8;
  v14[8] = CFSTR("modify_gid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 210));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v9;
  v14[9] = CFSTR("modify_gid_success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 211));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v10;
  v15[10] = &unk_1E4DFD9C0;
  v14[10] = CFSTR("modify_gid_value");
  v14[11] = CFSTR("boot_time_appx");
  v11 = *(_QWORD *)(a1 + 48);
  v15[11] = *(_QWORD *)(a1 + 40);
  v15[12] = v11;
  v14[12] = CFSTR("proc_uptime_appx");
  v14[13] = CFSTR("framework");
  v15[13] = CFSTR("OSAnalytics");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  return v12;
}

- (void)setPathRoot:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__OSASystemConfiguration_setPathRoot___block_invoke;
  block[3] = &unk_1E4DEDD40;
  block[4] = self;
  v8 = v4;
  v5 = setPathRoot__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&setPathRoot__onceToken, block);

}

void __38__OSASystemConfiguration_setPathRoot___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "appleInternal") || (v2 = *(_QWORD **)(a1 + 32), v2[31]))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
    v8 = 138412290;
    v9 = v3;
    v4 = MEMORY[0x1E0C81028];
    v5 = "unable to override default log root location because already set as %@";
    goto LABEL_5;
  }
  v6 = (id)objc_msgSend(v2, "pathRoot");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
    v8 = 138412290;
    v9 = v7;
    v4 = MEMORY[0x1E0C81028];
    v5 = "overriding default log root location to %@";
LABEL_5:
    _os_log_impl(&dword_1A4D21000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
  }
}

- (NSString)pathContainerRoot
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__OSASystemConfiguration_pathContainerRoot__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathContainerRoot_onceToken != -1)
    dispatch_once(&pathContainerRoot_onceToken, block);
  return self->_pathRoot;
}

void __43__OSASystemConfiguration_pathContainerRoot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    v3 = (char *)v2;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", v3, strlen(v3));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 256);
    *(_QWORD *)(v6 + 256) = v5;

    free(v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = 1;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error getting system group container: %llu", buf, 0xCu);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 256))
  {
    *(_QWORD *)(v8 + 256) = CFSTR("/tmp");

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256);
    *(_DWORD *)buf = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using system group container: '%{public}@'", buf, 0xCu);
  }
}

- (id)pathSubmissionDataVault
{
  void *v2;
  void *v3;

  -[OSASystemConfiguration pathContainerRoot](self, "pathContainerRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v2, CFSTR("DiagnosticReports"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pathSubmissionWithHomeDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[OSASystemConfiguration pathSubmission](self, "pathSubmission");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringByStandardizingPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSASystemConfiguration pathSubmission](self, "pathSubmission");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)uidForUser:(id)a3
{
  id v3;
  passwd *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = getpwnam((const char *)objc_msgSend(v3, "UTF8String"));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4->pw_uid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to fetch UID from unknown user '%@'", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (NSString)pathDiagnostics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_pathDiagnostics__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathDiagnostics_onceToken != -1)
    dispatch_once(&pathDiagnostics_onceToken, block);
  return self->_pathPreferences;
}

void __41__OSASystemConfiguration_pathDiagnostics__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "multiUserMode"))
    v3 = CFSTR("Diagnostics");
  else
    v3 = CFSTR("OSAnalytics/Diagnostics");
  v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v5;

}

- (NSString)pathCATasking
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_pathCATasking__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathCATasking_onceToken != -1)
    dispatch_once(&pathCATasking_onceToken, block);
  return self->_pathDiagnostics;
}

void __39__OSASystemConfiguration_pathCATasking__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathContainerRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v2, CFSTR("/Library/CoreAnalytics"), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v4;

}

- (NSString)pathAWDTasking
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_pathAWDTasking__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (pathAWDTasking_onceToken != -1)
    dispatch_once(&pathAWDTasking_onceToken, block);
  return self->_pathCATasking;
}

void __40__OSASystemConfiguration_pathAWDTasking__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", v2, CFSTR("/Library/AWD"), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v4;

}

- (id)submissionParam:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[NSSet objectForKeyedSubscript:](self->_logBlacklist, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isWhitelisted:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  if (-[OSASystemConfiguration appleInternal](self, "appleInternal"))
  {
    v8 = 1;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_submissionParams, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v6);

  }
  return v8;
}

- (BOOL)isAllowed:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[NSDictionary objectForKeyedSubscript:](self->_submissionParams, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v7);
  return (char)v6;
}

- ($5EB7FB09C4CBC8B8D7E1908D52AD28E2)logDomain
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_logDomain__block_invoke;
  block[3] = &unk_1E4DED7B8;
  block[4] = self;
  if (logDomain_onceToken != -1)
    dispatch_once(&logDomain_onceToken, block);
  return ($5EB7FB09C4CBC8B8D7E1908D52AD28E2)self->_pathAWDTasking;
}

void __35__OSASystemConfiguration_logDomain__block_invoke(uint64_t a1)
{
  os_log_t v2;
  uint64_t v3;
  void *v4;

  v2 = os_log_create("com.apple.osanalytics.daFlow", "reports");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 296);
  *(_QWORD *)(v3 + 296) = v2;

}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_pathCATasking, 0);
  objc_storeStrong((id *)&self->_pathDiagnostics, 0);
  objc_storeStrong((id *)&self->_pathPreferences, 0);
  objc_storeStrong((id *)&self->_pathContainerRoot, 0);
  objc_storeStrong((id *)&self->_pathRoot, 0);
  objc_storeStrong((id *)&self->_whitelistedDomains, 0);
  objc_storeStrong((id *)&self->_submissionParams, 0);
  objc_storeStrong((id *)&self->_logBlacklist, 0);
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_pairedWatchOS, 0);
  objc_storeStrong((id *)&self->_submissionMetadata, 0);
  objc_storeStrong((id *)&self->_appleInternal, 0);
}

- (BOOL)optInApple
{
  return checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &optInApple_featureDiagnosticsSubmissionAllowed);
}

- (BOOL)optIn3rdParty
{
  return checkMCFeature("MCFeatureAppAnalyticsAllowed", &optIn3rdParty_featureAppAnalyticsAllowed);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.2()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x22u);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.3()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
  OUTLINED_FUNCTION_15();
}

- (void)getPrefsKey:forDomain:withOptions:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "found ManagedPreferences pref %@: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)getPrefsKey:(uint64_t)a3 forDomain:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Failed to retrieve a valid user to access preferences container for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPrefsKey:forDomain:withOptions:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "found fallback user defaults %@: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)getPrefsKey:(uint64_t)a1 forDomain:(int *)a2 withOptions:.cold.4(uint64_t a1, int *a2)
{
  int v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *a2;
  v3 = 138543874;
  v4 = a1;
  v5 = 1026;
  v6 = v2;
  v7 = 2082;
  v8 = xpc_strerror();
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted xpc_user_sessions_get_foreground_uid() while fetching preferences for key %{public}@ but failed with error %{public}d - %{public}s", (uint8_t *)&v3, 0x1Cu);
  OUTLINED_FUNCTION_15();
}

- (void)getPrefsKey:(void *)a1 forDomain:withOptions:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "pathPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v2, "found containerized defaults from %@: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)fastLane
{
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a1;
  _os_log_fault_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unexpected tasking value type for key 'fastLane' (type: %{public}@, value: %{public}@) encountered", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

void __37__OSASystemConfiguration_internalKey__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to load Accounts framework", v0, 2u);
  OUTLINED_FUNCTION_4();
}

void __37__OSASystemConfiguration_internalKey__block_invoke_267_cold_2(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_6(&dword_1A4D21000, MEMORY[0x1E0C81028], v6, "No addresses fetched. So using username. %@");

  OUTLINED_FUNCTION_14();
}

void __37__OSASystemConfiguration_internalKey__block_invoke_267_cold_3(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_6(&dword_1A4D21000, MEMORY[0x1E0C81028], v6, "Fetched addresses: %@");

  OUTLINED_FUNCTION_14();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "failed to modify permissions of %@: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "failed to modify ownership of %@: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "%@ is valid but couldn't stat or it's not a directory", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "mode ok", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "chmod(%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "group ok", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "chown(-1, %d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "owner ok", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "chown(%d, -1)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)ensureConformanceOfFile:options:.cold.7()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x14u);
  OUTLINED_FUNCTION_1();
}

@end
