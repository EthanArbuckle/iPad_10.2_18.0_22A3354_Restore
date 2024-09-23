@implementation SUCoreDevice

- (NSString)splatSystemVersionPlistPath
{
  return self->_splatSystemVersionPlistPath;
}

- (NSDictionary)splatSystemVersionPlistContents
{
  return self->_splatSystemVersionPlistContents;
}

- (NSString)splatRestoreVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRestoreVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 23);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 23);
  splatRestoreVersion = v2->_splatRestoreVersion;
  v2->_splatRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRestoreVersion;
}

- (NSString)splatRestoreVersionPlistPath
{
  return self->_splatRestoreVersionPlistPath;
}

- (NSDictionary)splatRestoreVersionPlistContents
{
  return self->_splatRestoreVersionPlistContents;
}

- (NSString)splatProductVersionExtra
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatProductVersionExtra;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 27);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 27);
  splatProductVersionExtra = v2->_splatProductVersionExtra;
  v2->_splatProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatProductVersionExtra;
}

- (NSString)splatCryptex1SystemVersionPlistPath
{
  return self->_splatCryptex1SystemVersionPlistPath;
}

- (NSDictionary)splatCryptex1SystemVersionPlistContents
{
  SUCoreDevice *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSDictionary *splatCryptex1SystemVersionPlistContents;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[SUCoreDevice splatCryptex1SystemVersionPlistPath](v2, "splatCryptex1SystemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithContentsOfFile:", v4);
  splatCryptex1SystemVersionPlistContents = v2->_splatCryptex1SystemVersionPlistContents;
  v2->_splatCryptex1SystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatCryptex1SystemVersionPlistContents;
}

- (NSString)splatCryptex1RestoreVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1RestoreVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 33);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 33);
  splatCryptex1RestoreVersion = v2->_splatCryptex1RestoreVersion;
  v2->_splatCryptex1RestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1RestoreVersion;
}

- (NSString)splatCryptex1RestoreVersionPlistPath
{
  return self->_splatCryptex1RestoreVersionPlistPath;
}

- (NSDictionary)splatCryptex1RestoreVersionPlistContents
{
  SUCoreDevice *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSDictionary *splatCryptex1RestoreVersionPlistContents;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](v2, "splatCryptex1RestoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithContentsOfFile:", v4);
  splatCryptex1RestoreVersionPlistContents = v2->_splatCryptex1RestoreVersionPlistContents;
  v2->_splatCryptex1RestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatCryptex1RestoreVersionPlistContents;
}

- (NSString)splatCryptex1ReleaseType
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1ReleaseType;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 38);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 38);
  splatCryptex1ReleaseType = v2->_splatCryptex1ReleaseType;
  v2->_splatCryptex1ReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ReleaseType;
}

- (NSString)splatCryptex1ProductVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1ProductVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 34);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 34);
  splatCryptex1ProductVersion = v2->_splatCryptex1ProductVersion;
  v2->_splatCryptex1ProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ProductVersion;
}

- (NSString)splatCryptex1ProductVersionExtra
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1ProductVersionExtra;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 35);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 35);
  splatCryptex1ProductVersionExtra = v2->_splatCryptex1ProductVersionExtra;
  v2->_splatCryptex1ProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ProductVersionExtra;
}

- (NSString)splatCryptex1BuildVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1BuildVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 36);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 36);
  splatCryptex1BuildVersion = v2->_splatCryptex1BuildVersion;
  v2->_splatCryptex1BuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1BuildVersion;
}

- (void)setSplatSystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatSystemVersionPlistContents, a3);
}

- (void)setSplatRestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistContents, a3);
}

- (void)setSplatCryptex1SystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistContents, a3);
}

- (void)setSplatCryptex1RestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistContents, a3);
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (BOOL)hasSplat
{
  return self->_hasSplat;
}

- (BOOL)hasSemiSplatActive
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[SUCoreDevice hasSplat](self, "hasSplat"))
  {
    v20 = 0;
    v19 = CFSTR("Splat is not supported on this platform; semi-splat is not possible");
    goto LABEL_17;
  }
  -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  v4 = (void *)v3;
  -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

LABEL_9:
    -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21
      || (v22 = (void *)v21,
          -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          !v23))
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (__CFString *)objc_msgSend(v25, "initWithFormat:", CFSTR("One of Splat RestoreVersion (%@) or Cryptex1 RestoreVersion (%@) are not present"), v14, v15);
      goto LABEL_13;
    }
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (__CFString *)objc_msgSend(v24, "initWithFormat:", CFSTR("Splat RestoreVersion (%@) and Cryptex1 RestoreVersion (%@) are not equal"), v14, v15);
LABEL_15:
    v20 = 1;
    goto LABEL_16;
  }
  v6 = (void *)v5;
  -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v7, v8);

  if (!v9)
    goto LABEL_9;
  -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v10, v11);

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v12)
  {
    v19 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("Splat ProductVersionExtra (%@; %@) and Cryptex1 ProductVersionExtra (%@; %@) are not equal"),
                          v14,
                          v15,
                          v16,
                          v17);

    goto LABEL_15;
  }
  v19 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("Splat RestoreVersion (%@; %@) and Cryptex1 RestoreVersion (%@; %@) are equal"),
                        v14,
                        v15,
                        v16,
                        v17);

LABEL_13:
  v20 = 0;
LABEL_16:

LABEL_17:
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "oslog");
  v27 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = CFSTR("NO");
    if (v20)
      v28 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v31 = v28;
    v32 = 2114;
    v33 = v19;
    _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Semi-splat active: %{public}@ (%{public}@)", buf, 0x16u);
  }

  return v20;
}

- (BOOL)hasEligibleRollback
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  char v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDevice _copySplatRollbackObjectsPath](self, "_copySplatRollbackObjectsPath");
  if (v2)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v12);
    if (v12)
      LODWORD(v5) = v4;
    else
      LODWORD(v5) = 0;

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if ((_DWORD)v5)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v14 = v2;
      v15 = 2114;
      if (v12)
        v8 = CFSTR("YES");
      v16 = v9;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Checking if rollback objects are present in preboot at path: %{public}@, exists: %{public}@, isDir: %{public}@", buf, 0x20u);
    }

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice hasEligibleRollback].cold.1();

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (id)_splatVersionPlistContentsForKey:(int64_t)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  if ((unint64_t)(a3 - 24) >= 4)
  {
    if (a3 == 23)
    {
      -[SUCoreDevice splatRestoreVersionPlistContents](self, "splatRestoreVersionPlistContents");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oslog");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _splatVersionPlistContentsForKey:].cold.1();

      v3 = 0;
    }
  }
  else
  {
    -[SUCoreDevice splatSystemVersionPlistContents](self, "splatSystemVersionPlistContents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_splatVersionKeyForQueryKey:(int64_t)a3
{
  void *v4;
  NSObject *v5;

  if ((unint64_t)(a3 - 23) < 0x10)
    return off_1E611CDB0[a3 - 23];
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _splatVersionKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_splatCryptex1VersionPlistContentsForKey:(int64_t)a3
{
  void *v3;
  void *v5;
  NSObject *v6;

  if ((unint64_t)(a3 - 34) >= 5)
  {
    if (a3 == 33)
    {
      -[SUCoreDevice splatCryptex1RestoreVersionPlistContents](self, "splatCryptex1RestoreVersionPlistContents");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _splatCryptex1VersionPlistContentsForKey:].cold.1();

      v3 = 0;
    }
  }
  else
  {
    -[SUCoreDevice splatCryptex1SystemVersionPlistContents](self, "splatCryptex1SystemVersionPlistContents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_reloadPlistContentsForKey:(int64_t)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  switch(a3)
  {
    case 23:
      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v10, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", v5);
      goto LABEL_11;
    case 24:
    case 25:
    case 26:
    case 27:
      v6 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", v5);
      goto LABEL_11;
    case 28:
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v11, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:](self, "setSplatRollbackRestoreVersionPlistContents:", v5);
      goto LABEL_11;
    case 29:
    case 30:
    case 31:
    case 32:
      v7 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v7, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:](self, "setSplatRollbackSystemVersionPlistContents:", v5);
      goto LABEL_11;
    case 33:
      v12 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v12, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:](self, "setSplatCryptex1RestoreVersionPlistContents:", v5);
      goto LABEL_11;
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
      v4 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "initWithContentsOfFile:", v13);
      -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:](self, "setSplatCryptex1SystemVersionPlistContents:", v5);
LABEL_11:

      break;
    default:
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _reloadPlistContentsForKey:].cold.1();

      break;
  }
}

- (int64_t)_queryMethodForKey:(int64_t)a3
{
  int64_t v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
    case 2:
      if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot"))
        v3 = 2;
      else
        v3 = 1;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      v3 = 1;
      break;
    case 4:
      v3 = 5;
      break;
    case 8:
      if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot"))
        v3 = 3;
      else
        v3 = 1;
      break;
    case 9:
    case 10:
      v3 = 4;
      break;
    case 11:
    case 12:
    case 13:
      v3 = 6;
      break;
    case 14:
    case 15:
      v3 = 7;
      break;
    case 16:
    case 17:
    case 18:
      v3 = 8;
      break;
    case 19:
    case 20:
      v3 = 9;
      break;
    case 21:
    case 22:
      v3 = 10;
      break;
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      v3 = 11;
      break;
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      v3 = 12;
      break;
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
      v3 = 13;
      break;
    default:
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oslog");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _queryMethodForKey:].cold.1();

      v3 = 0;
      break;
  }
  return v3;
}

- (BOOL)_hasSplatOnlyUpdateInstalled
{
  void *v3;
  BOOL v4;
  SUCoreRestoreVersion *v5;
  void *v6;
  SUCoreRestoreVersion *v7;
  SUCoreRestoreVersion *v8;
  void *v9;
  SUCoreRestoreVersion *v10;

  -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v5 = [SUCoreRestoreVersion alloc];
  -[SUCoreDevice restoreVersion](self, "restoreVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreRestoreVersion initWithRestoreVersion:](v5, "initWithRestoreVersion:", v6);

  v8 = [SUCoreRestoreVersion alloc];
  -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUCoreRestoreVersion initWithRestoreVersion:](v8, "initWithRestoreVersion:", v9);

  v4 = -[SUCoreRestoreVersion isComparable:](v7, "isComparable:", v10)
    && -[SUCoreRestoreVersion compare:](v7, "compare:", v10) == -1;

  return v4;
}

- (id)_copyStringValueForKey:(int64_t)a3
{
  int64_t v5;
  id result;
  int64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[SUCoreDevice _queryMethodForKey:](self, "_queryMethodForKey:");
  switch(v5)
  {
    case 1:
      result = -[SUCoreDevice _copyGestaltValueForKey:](self, "_copyGestaltValueForKey:", a3);
      break;
    case 2:
      result = -[SUCoreDevice _copyCoreServicesValueForKey:](self, "_copyCoreServicesValueForKey:", a3);
      break;
    case 3:
      result = -[SUCoreDevice _copyCoreServicesAppleInternalValue](self, "_copyCoreServicesAppleInternalValue");
      break;
    case 4:
      result = -[SUCoreDevice _copyRestoreVersionValueForKey:](self, "_copyRestoreVersionValueForKey:", a3);
      break;
    case 5:
      result = -[SUCoreDevice _copySysCtlValueForKey:](self, "_copySysCtlValueForKey:", a3);
      break;
    case 6:
      result = -[SUCoreDevice _copySFRSystemVersionValueForKey:](self, "_copySFRSystemVersionValueForKey:", a3);
      break;
    case 7:
      result = -[SUCoreDevice _copySFRRestoreVersionValueForKey:](self, "_copySFRRestoreVersionValueForKey:", a3);
      break;
    case 8:
      result = -[SUCoreDevice _copyRecoveryOSSystemVersionValueForKey:](self, "_copyRecoveryOSSystemVersionValueForKey:", a3);
      break;
    case 9:
      result = -[SUCoreDevice _copyRecoveryOSRestoreVersionValueForKey:](self, "_copyRecoveryOSRestoreVersionValueForKey:", a3);
      break;
    case 10:
      result = -[SUCoreDevice _copyFactoryVersionValueForKey:](self, "_copyFactoryVersionValueForKey:", a3);
      break;
    case 11:
      result = -[SUCoreDevice _copySplatValueForKey:](self, "_copySplatValueForKey:", a3);
      break;
    case 12:
      result = -[SUCoreDevice _copySplatRollbackValueForKey:](self, "_copySplatRollbackValueForKey:", a3);
      break;
    case 13:
      result = -[SUCoreDevice _copySplatCryptex1ValueForKey:](self, "_copySplatCryptex1ValueForKey:", a3);
      break;
    default:
      v7 = v5;
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[SUCoreDevice _nameForQueryMethod:](self, "_nameForQueryMethod:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice _nameForQueryKey:](self, "_nameForQueryKey:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2114;
        v15 = v11;
        _os_log_error_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_ERROR, "[SUCoreDevice] Unsupported query method %{public}@ attempted for key %{public}@", (uint8_t *)&v12, 0x16u);

      }
      result = 0;
      break;
  }
  return result;
}

- (id)_copySplatValueForKey:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatVersionPlistContentsForKey:](self, "_splatVersionPlistContentsForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (id)_copySplatRollbackObjectsPath
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0D46978], "sharedDataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = (void *)objc_msgSend(v2, "copyPathForPersistentData:error:", 112, &v9);
  v4 = v9;

  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _copySplatRollbackObjectsPath].cold.1();

  }
  return v3;
}

- (id)_copySplatCryptex1ValueForKey:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatCryptex1VersionPlistContentsForKey:](self, "_splatCryptex1VersionPlistContentsForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (id)sharedDevice
{
  if (sharedDevice_onceToken != -1)
    dispatch_once(&sharedDevice_onceToken, &__block_literal_global_5);
  return (id)sharedDevice___sharedDevice;
}

void __28__SUCoreDevice_sharedDevice__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SUCoreDevice initTargetingSystemVolume:]([SUCoreDevice alloc], "initTargetingSystemVolume:", CFSTR("/"));
  v1 = (void *)sharedDevice___sharedDevice;
  sharedDevice___sharedDevice = (uint64_t)v0;

}

- (id)initTargetingSystemVolume:(id)a3
{
  id v4;
  SUCoreDevice *v5;
  SUCoreDevice *v6;
  SUCoreDevice *v7;
  void *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCoreDevice;
  v5 = -[SUCoreDevice init](&v11, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  if (v4)
  {
    -[SUCoreDevice adjustTargetingSystemVolume:](v5, "adjustTargetingSystemVolume:", v4);
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice initTargetingSystemVolume:].cold.1();

  v7 = 0;
LABEL_8:

  return v7;
}

- (void)adjustTargetingSystemVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  NSObject *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  void *v145;
  NSObject *v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  void *v169;
  NSObject *v170;
  id v171;
  uint8_t buf[4];
  id v173;
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SUCoreDevice setTargetedSystemVolume:](self, "setTargetedSystemVolume:", v4);
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("SystemVersion.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSystemVersionPlistPath:](self, "setSystemVersionPlistPath:", v6);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("RestoreVersion.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setRestoreVersionPlistPath:](self, "setRestoreVersionPlistPath:", v8);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("AppleInternalVariant.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setAppleInternalVariantPlistPath:](self, "setAppleInternalVariantPlistPath:", v10);

    objc_msgSend(CFSTR("/System/Volumes/iSCPreboot/SFR/current/"), "stringByAppendingPathComponent:", CFSTR("SystemVersion.plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSfrSystemVersionPlistPath:](self, "setSfrSystemVersionPlistPath:", v11);

    objc_msgSend(CFSTR("/System/Volumes/iSCPreboot/SFR/current/"), "stringByAppendingPathComponent:", CFSTR("RestoreVersion.plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSfrRestoreVersionPlistPath:](self, "setSfrRestoreVersionPlistPath:", v12);

    -[SUCoreDevice getSystemRecoveryNSIHDirectory](self, "getSystemRecoveryNSIHDirectory");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("/System/Volumes/iSCPreboot/SystemRecovery/current/");
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", CFSTR("SystemVersion.plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setRecoveryOSSystemVersionPlistPath:](self, "setRecoveryOSSystemVersionPlistPath:", v17);

    -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", CFSTR("RestoreVersion.plist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setRecoveryOSRestoreVersionPlistPath:](self, "setRecoveryOSRestoreVersionPlistPath:", v18);

    objc_msgSend(CFSTR("/System/Volumes/Hardware/"), "stringByAppendingPathComponent:", CFSTR("FactoryVersion.plist"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setFactoryVersionPlistPath:](self, "setFactoryVersionPlistPath:", v19);

    objc_msgSend(CFSTR("/System/Volumes/Hardware/"), "stringByAppendingPathComponent:", CFSTR("PreservedFactoryVersion.plist"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setPreservedFactoryVersionPlistPath:](self, "setPreservedFactoryVersionPlistPath:", v20);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Cryptexes/OS/System/Library/CoreServices/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("RestoreVersion.plist"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSplatRestoreVersionPlistPath:](self, "setSplatRestoreVersionPlistPath:", v22);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Cryptexes/OS/System/Library/CoreServices/"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("SystemVersion.plist"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSplatSystemVersionPlistPath:](self, "setSplatSystemVersionPlistPath:", v24);

    v25 = -[SUCoreDevice _copySplatRollbackRestoreVersionPath](self, "_copySplatRollbackRestoreVersionPath");
    -[SUCoreDevice setSplatRollbackRestoreVersionPlistPath:](self, "setSplatRollbackRestoreVersionPlistPath:", v25);

    v26 = -[SUCoreDevice _copySplatRollbackSystemVersionPath](self, "_copySplatRollbackSystemVersionPath");
    -[SUCoreDevice setSplatRollbackSystemVersionPlistPath:](self, "setSplatRollbackSystemVersionPlistPath:", v26);

    v27 = -[SUCoreDevice _copySplatCryptex1RestoreVersionPath](self, "_copySplatCryptex1RestoreVersionPath");
    -[SUCoreDevice setSplatCryptex1RestoreVersionPlistPath:](self, "setSplatCryptex1RestoreVersionPlistPath:", v27);

    v28 = -[SUCoreDevice _copySplatCryptex1SystemVersionPath](self, "_copySplatCryptex1SystemVersionPath");
    -[SUCoreDevice setSplatCryptex1SystemVersionPlistPath:](self, "setSplatCryptex1SystemVersionPlistPath:", v28);

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "oslog");
    v30 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v31;
      _os_log_impl(&dword_1B05B8000, v30, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using systemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "oslog");
    v33 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v34;
      _os_log_impl(&dword_1B05B8000, v33, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using restoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "oslog");
    v36 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v37;
      _os_log_impl(&dword_1B05B8000, v36, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using appleInternalVariantPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "oslog");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v40;
      _os_log_impl(&dword_1B05B8000, v39, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using sfrSystemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "oslog");
    v42 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v43;
      _os_log_impl(&dword_1B05B8000, v42, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using sfrRestoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "oslog");
    v45 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v46;
      _os_log_impl(&dword_1B05B8000, v45, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using recoveryOSSystemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "oslog");
    v48 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v49;
      _os_log_impl(&dword_1B05B8000, v48, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using recoveryOSRestoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "oslog");
    v51 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v52;
      _os_log_impl(&dword_1B05B8000, v51, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using factoryVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "oslog");
    v54 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v55;
      _os_log_impl(&dword_1B05B8000, v54, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using preservedFactoryVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "oslog");
    v57 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v58;
      _os_log_impl(&dword_1B05B8000, v57, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRestoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "oslog");
    v60 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v61;
      _os_log_impl(&dword_1B05B8000, v60, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatSystemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "oslog");
    v63 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v64;
      _os_log_impl(&dword_1B05B8000, v63, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRollbackRestoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "oslog");
    v66 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v67;
      _os_log_impl(&dword_1B05B8000, v66, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRollbackSystemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "oslog");
    v69 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v70;
      _os_log_impl(&dword_1B05B8000, v69, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatCryptex1RestoreVersionPlistPath: %{public}@", buf, 0xCu);

    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "oslog");
    v72 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v73;
      _os_log_impl(&dword_1B05B8000, v72, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatCryptex1SystemVersionPlistPath: %{public}@", buf, 0xCu);

    }
    -[SUCoreDevice setDeviceSupportsMobileGestalt:](self, "setDeviceSupportsMobileGestalt:", -[SUCoreDevice _supportsMobileGestalt](self, "_supportsMobileGestalt"));
    -[SUCoreDevice setDeviceSupportsCoreServices:](self, "setDeviceSupportsCoreServices:", -[SUCoreDevice _supportsCoreServices](self, "_supportsCoreServices"));
    -[SUCoreDevice setDeviceSupportsAppleInternalVariant:](self, "setDeviceSupportsAppleInternalVariant:", -[SUCoreDevice _supportsAppleInternalVariant](self, "_supportsAppleInternalVariant"));
    -[SUCoreDevice setDeviceSupportsRestoreVersion:](self, "setDeviceSupportsRestoreVersion:", -[SUCoreDevice _supportsRestoreVersion](self, "_supportsRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsSFRSystemVersion:](self, "setDeviceSupportsSFRSystemVersion:", -[SUCoreDevice _supportsSFRSystemVersion](self, "_supportsSFRSystemVersion"));
    -[SUCoreDevice setDeviceSupportsSFRRestoreVersion:](self, "setDeviceSupportsSFRRestoreVersion:", -[SUCoreDevice _supportsSFRRestoreVersion](self, "_supportsSFRRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsRecoveryOSSystemVersion:](self, "setDeviceSupportsRecoveryOSSystemVersion:", -[SUCoreDevice _supportsRecoveryOSSystemVersion](self, "_supportsRecoveryOSSystemVersion"));
    -[SUCoreDevice setDeviceSupportsRecoveryOSRestoreVersion:](self, "setDeviceSupportsRecoveryOSRestoreVersion:", -[SUCoreDevice _supportsRecoveryOSRestoreVersion](self, "_supportsRecoveryOSRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsFactoryVersion:](self, "setDeviceSupportsFactoryVersion:", -[SUCoreDevice _supportsFactoryVersion](self, "_supportsFactoryVersion"));
    -[SUCoreDevice setDeviceSupportsPreservedFactoryVersion:](self, "setDeviceSupportsPreservedFactoryVersion:", -[SUCoreDevice _supportsPreservedFactoryVersion](self, "_supportsPreservedFactoryVersion"));
    -[SUCoreDevice setDeviceSupportsSplatRestoreVersion:](self, "setDeviceSupportsSplatRestoreVersion:", -[SUCoreDevice _supportsSplatRestoreVersion](self, "_supportsSplatRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsSplatSystemVersion:](self, "setDeviceSupportsSplatSystemVersion:", -[SUCoreDevice _supportsSplatSystemVersion](self, "_supportsSplatSystemVersion"));
    -[SUCoreDevice setDeviceSupportsMultiVolumeBoot:](self, "setDeviceSupportsMultiVolumeBoot:", 0);
    -[SUCoreDevice setSystemVersionPlistContents:](self, "setSystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices"))
    {
      v74 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)objc_msgSend(v74, "initWithContentsOfFile:", v75);
      -[SUCoreDevice setSystemVersionPlistContents:](self, "setSystemVersionPlistContents:", v76);

    }
    -[SUCoreDevice setRestoreVersionPlistContents:](self, "setRestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion"))
    {
      v77 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v77, "initWithContentsOfFile:", v78);
      -[SUCoreDevice setRestoreVersionPlistContents:](self, "setRestoreVersionPlistContents:", v79);

    }
    -[SUCoreDevice setSfrSystemVersionPlistContents:](self, "setSfrSystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSFRSystemVersion](self, "deviceSupportsSFRSystemVersion"))
    {
      v80 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v80, "initWithContentsOfFile:", v81);
      -[SUCoreDevice setSfrSystemVersionPlistContents:](self, "setSfrSystemVersionPlistContents:", v82);

    }
    -[SUCoreDevice setSfrRestoreVersionPlistContents:](self, "setSfrRestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSFRRestoreVersion](self, "deviceSupportsSFRRestoreVersion"))
    {
      v83 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)objc_msgSend(v83, "initWithContentsOfFile:", v84);
      -[SUCoreDevice setSfrRestoreVersionPlistContents:](self, "setSfrRestoreVersionPlistContents:", v85);

    }
    -[SUCoreDevice setRecoveryOSSystemVersionPlistContents:](self, "setRecoveryOSSystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsRecoveryOSRestoreVersion](self, "deviceSupportsRecoveryOSRestoreVersion"))
    {
      v86 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v86, "initWithContentsOfFile:", v87);
      -[SUCoreDevice setRecoveryOSSystemVersionPlistContents:](self, "setRecoveryOSSystemVersionPlistContents:", v88);

    }
    -[SUCoreDevice setRecoveryOSRestoreVersionPlistContents:](self, "setRecoveryOSRestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsRecoveryOSRestoreVersion](self, "deviceSupportsRecoveryOSRestoreVersion"))
    {
      v89 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)objc_msgSend(v89, "initWithContentsOfFile:", v90);
      -[SUCoreDevice setRecoveryOSRestoreVersionPlistContents:](self, "setRecoveryOSRestoreVersionPlistContents:", v91);

    }
    -[SUCoreDevice setFactoryVersionPlistContents:](self, "setFactoryVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion"))
    {
      v92 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)objc_msgSend(v92, "initWithContentsOfFile:", v93);
      -[SUCoreDevice setFactoryVersionPlistContents:](self, "setFactoryVersionPlistContents:", v94);

    }
    -[SUCoreDevice setPreservedFactoryVersionPlistContents:](self, "setPreservedFactoryVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
    {
      v95 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (void *)objc_msgSend(v95, "initWithContentsOfFile:", v96);
      -[SUCoreDevice setPreservedFactoryVersionPlistContents:](self, "setPreservedFactoryVersionPlistContents:", v97);

    }
    -[SUCoreDevice setAppleInternalVariantPlistContents:](self, "setAppleInternalVariantPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices"))
    {
      v98 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = (void *)objc_msgSend(v98, "initWithContentsOfFile:", v99);
      -[SUCoreDevice setAppleInternalVariantPlistContents:](self, "setAppleInternalVariantPlistContents:", v100);

    }
    -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatRestoreVersion](self, "deviceSupportsSplatRestoreVersion"))
    {
      v101 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v101, "initWithContentsOfFile:", v102);
      -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", v103);

    }
    -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatSystemVersion](self, "deviceSupportsSplatSystemVersion"))
    {
      v104 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)objc_msgSend(v104, "initWithContentsOfFile:", v105);
      -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", v106);

    }
    -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:](self, "setSplatRollbackRestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatRollbackRestoreVersion](self, "deviceSupportsSplatRollbackRestoreVersion"))
    {
      v107 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend(v107, "initWithContentsOfFile:", v108);
      -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:](self, "setSplatRollbackRestoreVersionPlistContents:", v109);

    }
    -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:](self, "setSplatRollbackSystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatRollbackSystemVersion](self, "deviceSupportsSplatRollbackSystemVersion"))
    {
      v110 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = (void *)objc_msgSend(v110, "initWithContentsOfFile:", v111);
      -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:](self, "setSplatRollbackSystemVersionPlistContents:", v112);

    }
    -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:](self, "setSplatCryptex1RestoreVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatCryptex1RestoreVersion](self, "deviceSupportsSplatCryptex1RestoreVersion"))
    {
      v113 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = (void *)objc_msgSend(v113, "initWithContentsOfFile:", v114);
      -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:](self, "setSplatCryptex1RestoreVersionPlistContents:", v115);

    }
    -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:](self, "setSplatCryptex1SystemVersionPlistContents:", 0);
    if (-[SUCoreDevice deviceSupportsSplatCryptex1SystemVersion](self, "deviceSupportsSplatCryptex1SystemVersion"))
    {
      v116 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = (void *)objc_msgSend(v116, "initWithContentsOfFile:", v117);
      -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:](self, "setSplatCryptex1SystemVersionPlistContents:", v118);

    }
    v119 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 1);
    -[SUCoreDevice setBuildVersion:](self, "setBuildVersion:", v119);

    v120 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 2);
    -[SUCoreDevice setProductVersion:](self, "setProductVersion:", v120);

    v121 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 3);
    -[SUCoreDevice setHwModelString:](self, "setHwModelString:", v121);

    v122 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 5);
    -[SUCoreDevice setDeviceClass:](self, "setDeviceClass:", v122);

    v123 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 6);
    -[SUCoreDevice setMarketingProductName:](self, "setMarketingProductName:", v123);

    v124 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 7);
    -[SUCoreDevice setProductType:](self, "setProductType:", v124);

    v125 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 8);
    -[SUCoreDevice setReleaseType:](self, "setReleaseType:", v125);

    v126 = -[SUCoreDevice _copyDeviceBoardID](self, "_copyDeviceBoardID");
    -[SUCoreDevice setDeviceBoardID:](self, "setDeviceBoardID:", v126);

    v127 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 4);
    -[SUCoreDevice setHwTarget:](self, "setHwTarget:", v127);

    -[SUCoreDevice setRestoreVersion:](self, "setRestoreVersion:", 0);
    if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion"))
    {
      v128 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 9);
      v129 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 10);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDevice setRestoreVersion:](self, "setRestoreVersion:", v130);

    }
    -[SUCoreDevice releaseType](self, "releaseType");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setIsInternal:](self, "setIsInternal:", objc_msgSend(v131, "isEqualToString:", CFSTR("Internal")));

    +[SUCore sharedCore](SUCore, "sharedCore");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "commonDomain");
    v133 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v133, "UTF8String");
    -[SUCoreDevice setIsBootedOSSecureInternal:](self, "setIsBootedOSSecureInternal:", os_variant_has_internal_content());

    -[SUCoreDevice setHasEmbeddedOS:](self, "setHasEmbeddedOS:", 0);
    -[SUCoreDevice setHasBridgeOS:](self, "setHasBridgeOS:", 0);
    -[SUCoreDevice setBridgeRestoreVersion:](self, "setBridgeRestoreVersion:", 0);
    -[SUCoreDevice setBridgeBuildVersion:](self, "setBridgeBuildVersion:", 0);
    -[SUCoreDevice setIsBridgeInternal:](self, "setIsBridgeInternal:", 0);
    -[SUCoreDevice setHasSFR:](self, "setHasSFR:", -[SUCoreDevice _supportsSFR](self, "_supportsSFR"));
    -[SUCoreDevice setSfrRestoreVersion:](self, "setSfrRestoreVersion:", 0);
    -[SUCoreDevice setSfrBuildVersion:](self, "setSfrBuildVersion:", 0);
    -[SUCoreDevice setSfrProductVersion:](self, "setSfrProductVersion:", 0);
    -[SUCoreDevice setSfrReleaseType:](self, "setSfrReleaseType:", 0);
    if (-[SUCoreDevice hasSFR](self, "hasSFR"))
    {
      v134 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 14);
      v135 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 15);
      v136 = v135;
      if (v134 && v135)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v134, v135);
        v137 = objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice setSfrRestoreVersion:](self, "setSfrRestoreVersion:", v137);
      }
      else
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "oslog");
        v137 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          -[SUCoreDevice adjustTargetingSystemVolume:].cold.3();
      }

      v140 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 11);
      -[SUCoreDevice setSfrBuildVersion:](self, "setSfrBuildVersion:", v140);

      v141 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 12);
      -[SUCoreDevice setSfrProductVersion:](self, "setSfrProductVersion:", v141);

      v142 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 13);
      -[SUCoreDevice setSfrReleaseType:](self, "setSfrReleaseType:", v142);

    }
    -[SUCoreDevice setHasRecoveryOS:](self, "setHasRecoveryOS:", -[SUCoreDevice _supportsRecoveryOS](self, "_supportsRecoveryOS"));
    -[SUCoreDevice setRecoveryOSBuildVersion:](self, "setRecoveryOSBuildVersion:", 0);
    -[SUCoreDevice setRecoveryOSProductVersion:](self, "setRecoveryOSProductVersion:", 0);
    -[SUCoreDevice setRecoveryOSRestoreVersion:](self, "setRecoveryOSRestoreVersion:", 0);
    -[SUCoreDevice setRecoveryOSReleaseType:](self, "setRecoveryOSReleaseType:", 0);
    if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS"))
    {
      v143 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 19);
      v144 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 20);
      v145 = v144;
      if (v143 && v144)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v143, v144);
        v146 = objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice setRecoveryOSRestoreVersion:](self, "setRecoveryOSRestoreVersion:", v146);
      }
      else
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "oslog");
        v146 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
          -[SUCoreDevice adjustTargetingSystemVolume:].cold.2();
      }

      v148 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 16);
      -[SUCoreDevice setRecoveryOSBuildVersion:](self, "setRecoveryOSBuildVersion:", v148);

      v149 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 17);
      -[SUCoreDevice setRecoveryOSProductVersion:](self, "setRecoveryOSProductVersion:", v149);

      v150 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 18);
      -[SUCoreDevice setRecoveryOSReleaseType:](self, "setRecoveryOSReleaseType:", v150);

    }
    -[SUCoreDevice setFactoryRestoreVersion:](self, "setFactoryRestoreVersion:", 0);
    if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion"))
    {
      v151 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 21);
      -[SUCoreDevice setFactoryRestoreVersion:](self, "setFactoryRestoreVersion:", v151);

    }
    -[SUCoreDevice setPreservedFactoryRestoreVersion:](self, "setPreservedFactoryRestoreVersion:", 0);
    if (-[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
    {
      v152 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 22);
      -[SUCoreDevice setPreservedFactoryRestoreVersion:](self, "setPreservedFactoryRestoreVersion:", v152);

    }
    -[SUCoreDevice setHasSplat:](self, "setHasSplat:", -[SUCoreDevice _supportsSplat](self, "_supportsSplat"));
    -[SUCoreDevice setSplatRestoreVersion:](self, "setSplatRestoreVersion:", 0);
    -[SUCoreDevice setSplatProductVersion:](self, "setSplatProductVersion:", 0);
    -[SUCoreDevice setSplatBuildVersion:](self, "setSplatBuildVersion:", 0);
    -[SUCoreDevice setSplatReleaseType:](self, "setSplatReleaseType:", 0);
    -[SUCoreDevice setSplatProductVersionExtra:](self, "setSplatProductVersionExtra:", 0);
    -[SUCoreDevice setSplatRollbackRestoreVersion:](self, "setSplatRollbackRestoreVersion:", 0);
    -[SUCoreDevice setSplatRollbackProductVersion:](self, "setSplatRollbackProductVersion:", 0);
    -[SUCoreDevice setSplatRollbackBuildVersion:](self, "setSplatRollbackBuildVersion:", 0);
    -[SUCoreDevice setSplatRollbackReleaseType:](self, "setSplatRollbackReleaseType:", 0);
    -[SUCoreDevice setSplatRollbackProductVersionExtra:](self, "setSplatRollbackProductVersionExtra:", 0);
    -[SUCoreDevice setSplatCryptex1RestoreVersion:](self, "setSplatCryptex1RestoreVersion:", 0);
    -[SUCoreDevice setSplatCryptex1ProductVersion:](self, "setSplatCryptex1ProductVersion:", 0);
    -[SUCoreDevice setSplatCryptex1BuildVersion:](self, "setSplatCryptex1BuildVersion:", 0);
    -[SUCoreDevice setSplatCryptex1BuildVersionOverride:](self, "setSplatCryptex1BuildVersionOverride:", 0);
    -[SUCoreDevice setSplatCryptex1ReleaseType:](self, "setSplatCryptex1ReleaseType:", 0);
    -[SUCoreDevice setSplatCryptex1ProductVersionExtra:](self, "setSplatCryptex1ProductVersionExtra:", 0);
    -[SUCoreDevice setHasSplatOnlyUpdateInstalled:](self, "setHasSplatOnlyUpdateInstalled:", 0);
    if (-[SUCoreDevice hasSplat](self, "hasSplat"))
    {
      v153 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 23);
      -[SUCoreDevice setSplatRestoreVersion:](self, "setSplatRestoreVersion:", v153);

      v154 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 24);
      -[SUCoreDevice setSplatProductVersion:](self, "setSplatProductVersion:", v154);

      v155 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 25);
      -[SUCoreDevice setSplatBuildVersion:](self, "setSplatBuildVersion:", v155);

      v156 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 26);
      -[SUCoreDevice setSplatReleaseType:](self, "setSplatReleaseType:", v156);

      v157 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 27);
      -[SUCoreDevice setSplatProductVersionExtra:](self, "setSplatProductVersionExtra:", v157);

      v158 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 28);
      -[SUCoreDevice setSplatRollbackRestoreVersion:](self, "setSplatRollbackRestoreVersion:", v158);

      v159 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 29);
      -[SUCoreDevice setSplatRollbackProductVersion:](self, "setSplatRollbackProductVersion:", v159);

      v160 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 31);
      -[SUCoreDevice setSplatRollbackBuildVersion:](self, "setSplatRollbackBuildVersion:", v160);

      v161 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 32);
      -[SUCoreDevice setSplatRollbackReleaseType:](self, "setSplatRollbackReleaseType:", v161);

      v162 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 30);
      -[SUCoreDevice setSplatRollbackProductVersionExtra:](self, "setSplatRollbackProductVersionExtra:", v162);

      v163 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 33);
      -[SUCoreDevice setSplatCryptex1RestoreVersion:](self, "setSplatCryptex1RestoreVersion:", v163);

      v164 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 34);
      -[SUCoreDevice setSplatCryptex1ProductVersion:](self, "setSplatCryptex1ProductVersion:", v164);

      v165 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 36);
      -[SUCoreDevice setSplatCryptex1BuildVersion:](self, "setSplatCryptex1BuildVersion:", v165);

      v166 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 37);
      -[SUCoreDevice setSplatCryptex1BuildVersionOverride:](self, "setSplatCryptex1BuildVersionOverride:", v166);

      v167 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 38);
      -[SUCoreDevice setSplatCryptex1ReleaseType:](self, "setSplatCryptex1ReleaseType:", v167);

      v168 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 35);
      -[SUCoreDevice setSplatCryptex1ProductVersionExtra:](self, "setSplatCryptex1ProductVersionExtra:", v168);

      -[SUCoreDevice setHasSplatOnlyUpdateInstalled:](self, "setHasSplatOnlyUpdateInstalled:", -[SUCoreDevice _hasSplatOnlyUpdateInstalled](self, "_hasSplatOnlyUpdateInstalled"));
    }
    -[SUCoreDevice _adjustValuesForMacOS](self, "_adjustValuesForMacOS");
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "oslog");
    v170 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice description](self, "description");
      v171 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v173 = v171;
      _os_log_impl(&dword_1B05B8000, v170, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Initialized new device: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice adjustTargetingSystemVolume:].cold.1();
  }

}

- (NSDictionary)splatRollbackRestoreVersionPlistContents
{
  SUCoreDevice *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSDictionary *splatRollbackRestoreVersionPlistContents;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[SUCoreDevice splatRollbackRestoreVersionPlistPath](v2, "splatRollbackRestoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithContentsOfFile:", v4);
  splatRollbackRestoreVersionPlistContents = v2->_splatRollbackRestoreVersionPlistContents;
  v2->_splatRollbackRestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatRollbackRestoreVersionPlistContents;
}

- (NSDictionary)splatRollbackSystemVersionPlistContents
{
  SUCoreDevice *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSDictionary *splatRollbackSystemVersionPlistContents;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[SUCoreDevice splatRollbackSystemVersionPlistPath](v2, "splatRollbackSystemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithContentsOfFile:", v4);
  splatRollbackSystemVersionPlistContents = v2->_splatRollbackSystemVersionPlistContents;
  v2->_splatRollbackSystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatRollbackSystemVersionPlistContents;
}

- (NSString)splatProductVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatProductVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 24);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 24);
  splatProductVersion = v2->_splatProductVersion;
  v2->_splatProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatProductVersion;
}

- (NSString)splatBuildVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatBuildVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 25);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 25);
  splatBuildVersion = v2->_splatBuildVersion;
  v2->_splatBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatBuildVersion;
}

- (NSString)splatReleaseType
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatReleaseType;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 26);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 26);
  splatReleaseType = v2->_splatReleaseType;
  v2->_splatReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatReleaseType;
}

- (void)reloadDevice
{
  id v3;

  -[SUCoreDevice targetedSystemVolume](self, "targetedSystemVolume");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice adjustTargetingSystemVolume:](self, "adjustTargetingSystemVolume:", v3);

}

- (BOOL)isCorrectlyFormattedBuildVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB38E8];
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+)[a-zA-Z]([0-9]+)[a-z]?$"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  return v7;
}

- (BOOL)isCorrectlyFormattedProductVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB38E8];
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+).([0-9]+)(.[0-9]+)?$"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  return v7;
}

- (BOOL)isMinorOSUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const __CFString *v14;
  BOOL v15;
  int v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreDevice buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "intValue");
    v11 = objc_msgSend(v7, "intValue");
    v12 = objc_msgSend(v6, "intValue");
    v13 = objc_msgSend(v7, "intValue");
    v14 = CFSTR("NO");
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 == v13)
      v14 = CFSTR("YES");
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMinorOSUpdate: %{public}@", (uint8_t *)v18, 0x18u);
  }

  v15 = 0;
  if (v6 && v7)
  {
    v16 = objc_msgSend(v6, "intValue");
    v15 = v16 == objc_msgSend(v7, "intValue");
  }

  return v15;
}

- (BOOL)isMajorOSUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const __CFString *v14;
  BOOL v15;
  int v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreDevice buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "intValue");
    v11 = objc_msgSend(v7, "intValue");
    v12 = objc_msgSend(v6, "intValue");
    v13 = objc_msgSend(v7, "intValue");
    v14 = CFSTR("NO");
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 < v13)
      v14 = CFSTR("YES");
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMajorOSUpdate: %{public}@", (uint8_t *)v18, 0x18u);
  }

  v15 = 0;
  if (v6 && v7)
  {
    v16 = objc_msgSend(v6, "intValue");
    v15 = v16 < (int)objc_msgSend(v7, "intValue");
  }

  return v15;
}

- (id)_getMajorVersionFromBuildVersion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+).*"), 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstMatchInString:options:range:](v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "numberOfRanges"))
    {
      v7 = objc_msgSend(v6, "rangeAtIndex:", 1);
      objc_msgSend(v3, "substringWithRange:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _getMajorVersionFromBuildVersion:].cold.2();

      v9 = 0;
    }

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _getMajorVersionFromBuildVersion:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (id)_copySplatCryptex1SystemVersionPath
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0D46978], "sharedDataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = (void *)objc_msgSend(v2, "copyPathForPersistentData:error:", 115, &v9);
  v4 = v9;

  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _copySplatCryptex1SystemVersionPath].cold.1();

  }
  return v3;
}

- (id)_copySplatCryptex1RestoreVersionPath
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0D46978], "sharedDataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = (void *)objc_msgSend(v2, "copyPathForPersistentData:error:", 116, &v9);
  v4 = v9;

  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _copySplatCryptex1RestoreVersionPath].cold.1();

  }
  return v3;
}

- (id)_copySplatRollbackSystemVersionPath
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[SUCoreDevice _copySplatRollbackObjectsPath](self, "_copySplatRollbackObjectsPath");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SystemVersion.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_copySplatRollbackRestoreVersionPath
{
  id v2;
  void *v3;

  v2 = -[SUCoreDevice _copySplatRollbackObjectsPath](self, "_copySplatRollbackObjectsPath");
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v2, CFSTR("RestoreVersion.plist"));
  else
    v3 = 0;

  return v3;
}

- (NSString)splatRollbackRestoreVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRollbackRestoreVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 28);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 28);
  splatRollbackRestoreVersion = v2->_splatRollbackRestoreVersion;
  v2->_splatRollbackRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackRestoreVersion;
}

- (NSString)splatRollbackProductVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRollbackProductVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 29);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 29);
  splatRollbackProductVersion = v2->_splatRollbackProductVersion;
  v2->_splatRollbackProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackProductVersion;
}

- (NSString)splatRollbackProductVersionExtra
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRollbackProductVersionExtra;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 30);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 30);
  splatRollbackProductVersionExtra = v2->_splatRollbackProductVersionExtra;
  v2->_splatRollbackProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackProductVersionExtra;
}

- (NSString)splatRollbackBuildVersion
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRollbackBuildVersion;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 31);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 31);
  splatRollbackBuildVersion = v2->_splatRollbackBuildVersion;
  v2->_splatRollbackBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackBuildVersion;
}

- (NSString)splatRollbackReleaseType
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatRollbackReleaseType;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 32);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 32);
  splatRollbackReleaseType = v2->_splatRollbackReleaseType;
  v2->_splatRollbackReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackReleaseType;
}

- (NSString)splatCryptex1BuildVersionOverride
{
  SUCoreDevice *v2;
  uint64_t v3;
  NSString *splatCryptex1BuildVersionOverride;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 37);
  v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 37);
  splatCryptex1BuildVersionOverride = v2->_splatCryptex1BuildVersionOverride;
  v2->_splatCryptex1BuildVersionOverride = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1BuildVersionOverride;
}

- (BOOL)_supportsMobileGestalt
{
  return 1;
}

- (BOOL)_supportsCoreServices
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsAppleInternalVariant
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsRestoreVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsSFRSystemVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsSFRRestoreVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsSFR
{
  return 0;
}

- (BOOL)_supportsRecoveryOSSystemVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsRecoveryOSRestoreVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsFactoryVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsPreservedFactoryVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsSplatRestoreVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsSplatSystemVersion
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_supportsRecoveryOS
{
  return 0;
}

- (BOOL)_supportsSplat
{
  return 1;
}

- (BOOL)requiresDocAssetForUpdate
{
  void *v2;
  char v3;

  -[SUCoreDevice deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AppleTV"));

  return v3 ^ 1;
}

- (id)_copyDeviceBoardID
{
  BIDeviceInfoGetMacBoardID();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_initializeBridgeOSProperties
{
  BOOL v2;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (MEMORY[0x1E0D87010])
    v2 = MEMORY[0x1E0D87018] == 0;
  else
    v2 = 1;
  if (v2 || MEMORY[0x1E0D87000] == 0 || MEMORY[0x1E0D87048] == 0)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery methods are not available on this platform (initializeBridgeOSProperties)", buf, 2u);
    }
  }
  else
  {
    v7 = remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      v8 = remote_device_copy_unique_of_type();

      v7 = v8;
    }
    if (v7)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T2 bridgeOS device via REMOTE_DEVICE_TYPE_BRIDGE_COPROC (initializeBridgeOSProperties)", v17, 2u);
      }

      -[SUCoreDevice setHasBridgeOS:](self, "setHasBridgeOS:", 1);
LABEL_26:
      -[SUCoreDevice _parseBridgeOSBuildInformationFromDevice:](self, "_parseBridgeOSBuildInformationFromDevice:", v7);
      goto LABEL_27;
    }
    v7 = remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      v11 = remote_device_copy_unique_of_type();

      v7 = v11;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T1 bridgeOS device via REMOTE_DEVICE_TYPE_EOS (initializeBridgeOSProperties)", v16, 2u);
      }

      -[SUCoreDevice setHasEmbeddedOS:](self, "setHasEmbeddedOS:", 1);
      goto LABEL_26;
    }
    if (v14)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is not a bridgeOS device (initializeBridgeOSProperties)", v15, 2u);
    }
    v7 = v13;
  }
LABEL_27:

}

- (void)_parseBridgeOSBuildInformationFromDevice:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = remote_device_copy_bridge_version_string();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
    -[SUCoreDevice setBridgeRestoreVersion:](self, "setBridgeRestoreVersion:", v6);

    free(v5);
  }
  v7 = remote_device_copy_os_build();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7);
    -[SUCoreDevice setBridgeBuildVersion:](self, "setBridgeBuildVersion:", v9);

    free(v8);
  }
  -[SUCoreDevice setIsBridgeInternal:](self, "setIsBridgeInternal:", remote_device_copy_internal_build());

}

- (id)getSystemRecoveryNSIHDirectory
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B05B8000, v3, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] SystemRecoveryNSIH: Device does not support variable boot policy", v5, 2u);
  }

  return 0;
}

- (id)_copyGestaltValueForKey:(int64_t)a3
{
  -[SUCoreDevice _gestaltKeyForQueryKey:](self, "_gestaltKeyForQueryKey:", a3);
  return (id)MGCopyAnswer();
}

- (id)_copyCoreServicesValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _coreServicesKeyForQueryKey:](self, "_coreServicesKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice systemVersionPlistContents](self, "systemVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copyRestoreVersionValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _restoreVersionKeyForQueryKey:](self, "_restoreVersionKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice restoreVersionPlistContents](self, "restoreVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copyCoreServicesAppleInternalValue
{
  void *v2;
  uint64_t v3;

  -[SUCoreDevice appleInternalVariantPlistContents](self, "appleInternalVariantPlistContents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeULLForKey:", CFSTR("AppleInternal"));

  if (v3 == 1)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("Internal"));
  else
    return 0;
}

- (id)_copySysCtlValueForKey:(int64_t)a3
{
  id v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  size_t v12;

  -[SUCoreDevice _sysCtlKeyForQueryKey:](self, "_sysCtlKeyForQueryKey:", a3);
  v12 = 0;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (sysctlbyname((const char *)objc_msgSend(v3, "UTF8String"), 0, &v12, 0, 0))
    v4 = 1;
  else
    v4 = v12 == 0;
  if (v4)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _copySysCtlValueForKey:].cold.2();

    v7 = 0;
  }
  else
  {
    v8 = malloc_type_calloc(v12 + 1, 1uLL, 0x2685F0D0uLL);
    if (sysctlbyname((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), v8, &v12, 0, 0))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _copySysCtlValueForKey:].cold.1();

      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    free(v8);
  }

  return v7;
}

- (id)_copySFRSystemVersionValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _coreServicesKeyForQueryKey:](self, "_coreServicesKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrSystemVersionPlistContents](self, "sfrSystemVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copySFRRestoreVersionValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _restoreVersionKeyForQueryKey:](self, "_restoreVersionKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrRestoreVersionPlistContents](self, "sfrRestoreVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copyRecoveryOSSystemVersionValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _coreServicesKeyForQueryKey:](self, "_coreServicesKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSSystemVersionPlistContents](self, "recoveryOSSystemVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copyFactoryVersionValueForKey:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUCoreDevice _factoryVersionKeyForQueryKey:](self, "_factoryVersionKeyForQueryKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _factoryVersionPlistContentsForKey:](self, "_factoryVersionPlistContentsForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (id)_copyRecoveryOSRestoreVersionValueForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUCoreDevice _restoreVersionKeyForQueryKey:](self, "_restoreVersionKeyForQueryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSRestoreVersionPlistContents](self, "recoveryOSRestoreVersionPlistContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)_copySplatRollbackValueForKey:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatRollbackVersionPlistContentsForKey:](self, "_splatRollbackVersionPlistContentsForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (__CFString)_gestaltKeyForQueryKey:(int64_t)a3
{
  int64_t v3;
  void *v4;
  NSObject *v5;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 8 && ((0xF7u >> v3) & 1) != 0)
    return off_1E611CC80[v3];
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _gestaltKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_coreServicesKeyForQueryKey:(int64_t)a3
{
  int64_t v3;
  void *v4;
  NSObject *v5;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 0x12 && ((0x39C03u >> v3) & 1) != 0)
    return off_1E611CCC0[v3];
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _coreServicesKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_restoreVersionKeyForQueryKey:(int64_t)a3
{
  int64_t v3;
  void *v4;
  NSObject *v5;

  v3 = a3 - 9;
  if ((unint64_t)(a3 - 9) < 0xC && ((0xC63u >> v3) & 1) != 0)
    return off_1E611CD50[v3];
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _restoreVersionKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_factoryVersionKeyForQueryKey:(int64_t)a3
{
  void *v4;
  NSObject *v5;

  if ((unint64_t)(a3 - 21) < 2)
    return CFSTR("RestoreLongVersion");
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _factoryVersionKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_factoryVersionPlistContentsForKey:(int64_t)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (a3 == 22)
  {
    -[SUCoreDevice preservedFactoryVersionPlistContents](self, "preservedFactoryVersionPlistContents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 21)
  {
    -[SUCoreDevice factoryVersionPlistContents](self, "factoryVersionPlistContents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice _factoryVersionPlistContentsForKey:].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)_sysCtlKeyForQueryKey:(int64_t)a3
{
  void *v4;
  NSObject *v5;

  switch(a3)
  {
    case 3:
      return CFSTR("hw.model");
    case 7:
      return CFSTR("hw.product");
    case 4:
      return CFSTR("hw.target");
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice _sysCtlKeyForQueryKey:].cold.1();

  return 0;
}

- (id)_splatRollbackVersionPlistContentsForKey:(int64_t)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  if ((unint64_t)(a3 - 29) >= 4)
  {
    if (a3 == 28)
    {
      -[SUCoreDevice splatRollbackRestoreVersionPlistContents](self, "splatRollbackRestoreVersionPlistContents");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oslog");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SUCoreDevice _splatRollbackVersionPlistContentsForKey:].cold.1();

      v3 = 0;
    }
  }
  else
  {
    -[SUCoreDevice splatRollbackSystemVersionPlistContents](self, "splatRollbackSystemVersionPlistContents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_nameForQueryMethod:(int64_t)a3
{
  if ((unint64_t)a3 < 0xE)
    return off_1E611CE30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownQueryMethod(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_nameForQueryKey:(int64_t)a3
{
  if ((unint64_t)a3 < 0x27)
    return off_1E611CEA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownQueryKey(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  v60 = (id)MEMORY[0x1E0CB3940];
  -[SUCoreDevice targetedSystemVolume](self, "targetedSystemVolume");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice deviceSupportsMobileGestalt](self, "deviceSupportsMobileGestalt"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v59 = v3;
  if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v58 = v4;
  if (-[SUCoreDevice deviceSupportsAppleInternalVariant](self, "deviceSupportsAppleInternalVariant"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v57 = v5;
  if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v56 = v6;
  if (-[SUCoreDevice deviceSupportsSFRSystemVersion](self, "deviceSupportsSFRSystemVersion"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v55 = v7;
  if (-[SUCoreDevice deviceSupportsSFRRestoreVersion](self, "deviceSupportsSFRRestoreVersion"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v54 = v8;
  if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v53 = v9;
  if (-[SUCoreDevice deviceSupportsSplatRestoreVersion](self, "deviceSupportsSplatRestoreVersion"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v52 = v10;
  if (-[SUCoreDevice deviceSupportsSplatSystemVersion](self, "deviceSupportsSplatSystemVersion"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v51 = v11;
  -[SUCoreDevice buildVersion](self, "buildVersion");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice productVersion](self, "productVersion");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice hwModelString](self, "hwModelString");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice deviceClass](self, "deviceClass");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice marketingProductName](self, "marketingProductName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice productType](self, "productType");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice releaseType](self, "releaseType");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice deviceBoardID](self, "deviceBoardID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice hwTarget](self, "hwTarget");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice isInternal](self, "isInternal"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v50 = v12;
  if (-[SUCoreDevice isBootedOSSecureInternal](self, "isBootedOSSecureInternal"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v49 = v13;
  -[SUCoreDevice restoreVersion](self, "restoreVersion");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasEmbeddedOS](self, "hasEmbeddedOS"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v48 = v14;
  if (-[SUCoreDevice hasBridgeOS](self, "hasBridgeOS"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v47 = v15;
  -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v45 = v16;
  if (-[SUCoreDevice hasSFR](self, "hasSFR"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v46 = v17;
  -[SUCoreDevice sfrProductVersion](self, "sfrProductVersion");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrBuildVersion](self, "sfrBuildVersion");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrRestoreVersion](self, "sfrRestoreVersion");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrReleaseType](self, "sfrReleaseType");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v41 = v18;
  -[SUCoreDevice recoveryOSProductVersion](self, "recoveryOSProductVersion");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSBuildVersion](self, "recoveryOSBuildVersion");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSRestoreVersion](self, "recoveryOSRestoreVersion");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSReleaseType](self, "recoveryOSReleaseType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice factoryRestoreVersion](self, "factoryRestoreVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasSplat](self, "hasSplat"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v36 = v19;
  if (-[SUCoreDevice hasSplatOnlyUpdateInstalled](self, "hasSplatOnlyUpdateInstalled"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v33 = v20;
  -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatProductVersion](self, "splatProductVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatBuildVersion](self, "splatBuildVersion");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatReleaseType](self, "splatReleaseType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasEligibleRollback](self, "hasEligibleRollback"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  -[SUCoreDevice splatRollbackRestoreVersion](self, "splatRollbackRestoreVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRollbackProductVersion](self, "splatRollbackProductVersion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRollbackProductVersionExtra](self, "splatRollbackProductVersionExtra");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRollbackBuildVersion](self, "splatRollbackBuildVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRollbackReleaseType](self, "splatRollbackReleaseType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasSemiSplatActive](self, "hasSemiSplatActive"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ProductVersion](self, "splatCryptex1ProductVersion");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1BuildVersion](self, "splatCryptex1BuildVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1BuildVersionOverride](self, "splatCryptex1BuildVersionOverride");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ReleaseType](self, "splatCryptex1ReleaseType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringWithFormat:", CFSTR("\n[>>>\n               targetedSystemVolume: %@\n        deviceSupportsMobileGestalt: %@\n         deviceSupportsCoreServices: %@\n deviceSupportsAppleInternalVariant: %@\n       deviceSupportsRestoreVersion: %@\n     deviceSupportsSFRSystemVersion: %@\n    deviceSupportsSFRRestoreVersion: %@\n      deviceSupportsMultiVolumeBoot: %@\n  deviceSupportsSplatRestoreVersion: %@\n   deviceSupportsSplatSystemVersion: %@\n                       buildVersion: %@\n                     productVersion: %@\n                      hwModelString: %@\n                        deviceClass: %@\n               marketingProductName: %@\n                        productType: %@\n                        releaseType: %@\n                      deviceBoardID: %@\n                           hwTarget: %@\n                         isInternal: %@\n           isBootedOSSecureInternal: %@\n                     restoreVersion: %@\n                      hasEmbeddedOS: %@\n                        hasBridgeOS: %@\n                 bridgeBuildVersion: %@\n               bridgeRestoreVersion: %@\n                   isBridgeInternal: %@\n                             hasSFR: %@\n                  sfrProductVersion: %@\n                    sfrBuildVersion: %@\n                  sfrRestoreVersion: %@\n                     sfrReleaseType: %@\n                      hasRecoveryOS: %@\n           recoveryOSProductVersion: %@\n             recoveryOSBuildVersion: %@\n           recoveryOSRestoreVersion: %@\n              recoveryOSReleaseType: %@\n              factoryRestoreVersion: %@\n     preservedFactoryRestoreVersion: %@\n                           hasSplat: %@\n        hasSplatOnlyUpdateInstalled: %@\n                splatRestoreVersion: %@\n                splatProductVersion: %@\n           splatProductVersionExtra: %@\n                  splatBuildVersion: %@\n                   splatReleaseType: %@\n                hasEligibleRollback: %@\n        splatRollbackRestoreVersion: %@\n        splatRollbackProductVersion: %@\n   splatRollbackProductVersionExtra: %@\n          splatRollbackBuildVersion: %@\n           splatRollbackReleaseType: %@\n                 hasSemiSplatActive: %@\n        splatCryptex1RestoreVersion: %@\n        splatCryptex1ProductVersion: %@\n   splatCryptex1ProductVersionExtra: %@\n          splatCryptex1BuildVersion: %@\n  splatCryptex1BuildVersionOverride: %@\n           splatCryptex1ReleaseType: %@\n<<<]"), v82, v59, v58, v57, v56, v55, v54, v53, v52, v51, v81, v80, v78, v79, v77, v76,
    v74,
    v75,
    v73,
    v50,
    v49,
    v72,
    v48,
    v47,
    v71,
    v70,
    v45,
    v46,
    v69,
    v66,
    v68,
    v67,
    v41,
    v63,
    v65,
    v64,
    v44,
    v43,
    v42,
    v36,
    v33,
    v62,
    v40,
    v39,
    v38,
    v37,
    v21,
    v22,
    v35,
    v34,
    v32,
    v23,
    v24,
    v31,
    v30,
    v29,
    v28,
    v27,
    v26);
  v61 = (id)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)summary
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[SUCoreDevice targetedSystemVolume](self, "targetedSystemVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("SystemVolume(TargetedSystemVolume:%@)"), v4);

  v5 = -[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion");
  -[SUCoreDevice buildVersion](self, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice productVersion](self, "productVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
  {
    -[SUCoreDevice restoreVersion](self, "restoreVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" Build(BuildVersion:%@|ProductVersion:%@|RestoreVersion:%@)"), v6, v8, v9);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" Build(BuildVersion:%@|ProductVersion:%@)"), v6, v7);
  }

  -[SUCoreDevice deviceClass](self, "deviceClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice marketingProductName](self, "marketingProductName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice productType](self, "productType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice hwModelString](self, "hwModelString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Device(DeviceClass:%@|MarketingProductName:%@|ProductType:%@|HWModelStr:%@)"), v10, v11, v12, v13);

  -[SUCoreDevice releaseType](self, "releaseType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice isInternal](self, "isInternal"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[SUCoreDevice isBootedOSSecureInternal](self, "isBootedOSSecureInternal"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" ReleaseType(ReleaseType:%@|Internal:%@|BootedOSSecureInternal:%@)"), v14, v15, v16);

  if (-[SUCoreDevice hasEmbeddedOS](self, "hasEmbeddedOS"))
  {
    -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal"))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" EmbeddedOS(Build:%@|RestoreVersion:%@|Internal:%@)"), v17, v18, v19);

  }
  if (-[SUCoreDevice hasBridgeOS](self, "hasBridgeOS"))
  {
    -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" BridgeOS(Build:%@|RestoreVersion:%@|Internal:%@)"), v20, v21, v22);

  }
  if (-[SUCoreDevice hasSFR](self, "hasSFR"))
  {
    -[SUCoreDevice sfrBuildVersion](self, "sfrBuildVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice sfrProductVersion](self, "sfrProductVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice sfrRestoreVersion](self, "sfrRestoreVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice sfrReleaseType](self, "sfrReleaseType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" SFR(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)"), v23, v24, v25, v26);

  }
  if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS"))
  {
    -[SUCoreDevice recoveryOSBuildVersion](self, "recoveryOSBuildVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice recoveryOSProductVersion](self, "recoveryOSProductVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice recoveryOSRestoreVersion](self, "recoveryOSRestoreVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice recoveryOSReleaseType](self, "recoveryOSReleaseType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" RecoveryOS(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)"), v27, v28, v29, v30);

  }
  if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion")
    || -[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
  {
    -[SUCoreDevice factoryRestoreVersion](self, "factoryRestoreVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;

    -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      v36 = CFSTR("YES");
    else
      v36 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" FactoryVersion(Version:%@|Preserved:%@)"), v34, v36);

  }
  if (-[SUCoreDevice hasSplat](self, "hasSplat"))
  {
    -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatProductVersion](self, "splatProductVersion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatBuildVersion](self, "splatBuildVersion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatReleaseType](self, "splatReleaseType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice hasSplatOnlyUpdateInstalled](self, "hasSplatOnlyUpdateInstalled"))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" Splat(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasSplatOnlyUpdateInstalled:%@)"), v37, v38, v39, v40, v41, v42);

    -[SUCoreDevice splatRollbackRestoreVersion](self, "splatRollbackRestoreVersion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatRollbackProductVersion](self, "splatRollbackProductVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatRollbackProductVersionExtra](self, "splatRollbackProductVersionExtra");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatRollbackBuildVersion](self, "splatRollbackBuildVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatRollbackReleaseType](self, "splatRollbackReleaseType");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice hasEligibleRollback](self, "hasEligibleRollback"))
      v48 = CFSTR("YES");
    else
      v48 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" SplatRollback(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasEligibleRollback:%@)"), v43, v44, v45, v46, v47, v48);

    -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1ProductVersion](self, "splatCryptex1ProductVersion");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1BuildVersion](self, "splatCryptex1BuildVersion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1BuildVersionOverride](self, "splatCryptex1BuildVersionOverride");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice splatCryptex1ReleaseType](self, "splatCryptex1ReleaseType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice hasSemiSplatActive](self, "hasSemiSplatActive"))
      v55 = CFSTR("YES");
    else
      v55 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR(" SplatCryptex1(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|BuildVersionOverride:%@|ReleaseType:%@|HasSemiSplatActive:%@)"), v49, v50, v51, v52, v53, v54, v55);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (NSString)targetedSystemVolume
{
  return self->_targetedSystemVolume;
}

- (void)setTargetedSystemVolume:(id)a3
{
  objc_storeStrong((id *)&self->_targetedSystemVolume, a3);
}

- (NSString)systemVersionPlistPath
{
  return self->_systemVersionPlistPath;
}

- (void)setSystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_systemVersionPlistPath, a3);
}

- (NSDictionary)systemVersionPlistContents
{
  return self->_systemVersionPlistContents;
}

- (void)setSystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_systemVersionPlistContents, a3);
}

- (NSString)restoreVersionPlistPath
{
  return self->_restoreVersionPlistPath;
}

- (void)setRestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersionPlistPath, a3);
}

- (NSDictionary)restoreVersionPlistContents
{
  return self->_restoreVersionPlistContents;
}

- (void)setRestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersionPlistContents, a3);
}

- (NSString)appleInternalVariantPlistPath
{
  return self->_appleInternalVariantPlistPath;
}

- (void)setAppleInternalVariantPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_appleInternalVariantPlistPath, a3);
}

- (NSDictionary)appleInternalVariantPlistContents
{
  return self->_appleInternalVariantPlistContents;
}

- (void)setAppleInternalVariantPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_appleInternalVariantPlistContents, a3);
}

- (NSString)sfrSystemVersionPlistPath
{
  return self->_sfrSystemVersionPlistPath;
}

- (void)setSfrSystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistPath, a3);
}

- (NSDictionary)sfrSystemVersionPlistContents
{
  return self->_sfrSystemVersionPlistContents;
}

- (void)setSfrSystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistContents, a3);
}

- (NSString)sfrRestoreVersionPlistPath
{
  return self->_sfrRestoreVersionPlistPath;
}

- (void)setSfrRestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistPath, a3);
}

- (NSDictionary)sfrRestoreVersionPlistContents
{
  return self->_sfrRestoreVersionPlistContents;
}

- (void)setSfrRestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistContents, a3);
}

- (NSString)recoveryOSSystemVersionPlistPath
{
  return self->_recoveryOSSystemVersionPlistPath;
}

- (void)setRecoveryOSSystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistPath, a3);
}

- (NSDictionary)recoveryOSSystemVersionPlistContents
{
  return self->_recoveryOSSystemVersionPlistContents;
}

- (void)setRecoveryOSSystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistContents, a3);
}

- (NSString)recoveryOSRestoreVersionPlistPath
{
  return self->_recoveryOSRestoreVersionPlistPath;
}

- (void)setRecoveryOSRestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistPath, a3);
}

- (NSDictionary)recoveryOSRestoreVersionPlistContents
{
  return self->_recoveryOSRestoreVersionPlistContents;
}

- (void)setRecoveryOSRestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistContents, a3);
}

- (NSString)factoryVersionPlistPath
{
  return self->_factoryVersionPlistPath;
}

- (void)setFactoryVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_factoryVersionPlistPath, a3);
}

- (NSDictionary)factoryVersionPlistContents
{
  return self->_factoryVersionPlistContents;
}

- (void)setFactoryVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_factoryVersionPlistContents, a3);
}

- (NSString)preservedFactoryVersionPlistPath
{
  return self->_preservedFactoryVersionPlistPath;
}

- (void)setPreservedFactoryVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistPath, a3);
}

- (NSDictionary)preservedFactoryVersionPlistContents
{
  return self->_preservedFactoryVersionPlistContents;
}

- (void)setPreservedFactoryVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistContents, a3);
}

- (void)setSplatRestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistPath, a3);
}

- (void)setSplatSystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatSystemVersionPlistPath, a3);
}

- (NSString)splatRollbackRestoreVersionPlistPath
{
  return self->_splatRollbackRestoreVersionPlistPath;
}

- (void)setSplatRollbackRestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistPath, a3);
}

- (void)setSplatRollbackRestoreVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistContents, a3);
}

- (NSString)splatRollbackSystemVersionPlistPath
{
  return self->_splatRollbackSystemVersionPlistPath;
}

- (void)setSplatRollbackSystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistPath, a3);
}

- (void)setSplatRollbackSystemVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistContents, a3);
}

- (void)setSplatCryptex1RestoreVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistPath, a3);
}

- (void)setSplatCryptex1SystemVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistPath, a3);
}

- (BOOL)deviceSupportsMobileGestalt
{
  return self->_deviceSupportsMobileGestalt;
}

- (void)setDeviceSupportsMobileGestalt:(BOOL)a3
{
  self->_deviceSupportsMobileGestalt = a3;
}

- (BOOL)deviceSupportsCoreServices
{
  return self->_deviceSupportsCoreServices;
}

- (void)setDeviceSupportsCoreServices:(BOOL)a3
{
  self->_deviceSupportsCoreServices = a3;
}

- (BOOL)deviceSupportsAppleInternalVariant
{
  return self->_deviceSupportsAppleInternalVariant;
}

- (void)setDeviceSupportsAppleInternalVariant:(BOOL)a3
{
  self->_deviceSupportsAppleInternalVariant = a3;
}

- (BOOL)deviceSupportsSFRSystemVersion
{
  return self->_deviceSupportsSFRSystemVersion;
}

- (void)setDeviceSupportsSFRSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSFRSystemVersion = a3;
}

- (BOOL)deviceSupportsSFRRestoreVersion
{
  return self->_deviceSupportsSFRRestoreVersion;
}

- (void)setDeviceSupportsSFRRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSFRRestoreVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSSystemVersion
{
  return self->_deviceSupportsRecoveryOSSystemVersion;
}

- (void)setDeviceSupportsRecoveryOSSystemVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSSystemVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSRestoreVersion
{
  return self->_deviceSupportsRecoveryOSRestoreVersion;
}

- (void)setDeviceSupportsRecoveryOSRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSRestoreVersion = a3;
}

- (BOOL)deviceSupportsFactoryVersion
{
  return self->_deviceSupportsFactoryVersion;
}

- (void)setDeviceSupportsFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsFactoryVersion = a3;
}

- (BOOL)deviceSupportsPreservedFactoryVersion
{
  return self->_deviceSupportsPreservedFactoryVersion;
}

- (void)setDeviceSupportsPreservedFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsPreservedFactoryVersion = a3;
}

- (BOOL)deviceSupportsRestoreVersion
{
  return self->_deviceSupportsRestoreVersion;
}

- (void)setDeviceSupportsRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRestoreVersion = a3;
}

- (BOOL)deviceSupportsMultiVolumeBoot
{
  return self->_deviceSupportsMultiVolumeBoot;
}

- (void)setDeviceSupportsMultiVolumeBoot:(BOOL)a3
{
  self->_deviceSupportsMultiVolumeBoot = a3;
}

- (BOOL)deviceSupportsSplatRestoreVersion
{
  return self->_deviceSupportsSplatRestoreVersion;
}

- (void)setDeviceSupportsSplatRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatSystemVersion
{
  return self->_deviceSupportsSplatSystemVersion;
}

- (void)setDeviceSupportsSplatSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackRestoreVersion
{
  return self->_deviceSupportsSplatRollbackRestoreVersion;
}

- (void)setDeviceSupportsSplatRollbackRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackSystemVersion
{
  return self->_deviceSupportsSplatRollbackSystemVersion;
}

- (void)setDeviceSupportsSplatRollbackSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1RestoreVersion
{
  return self->_deviceSupportsSplatCryptex1RestoreVersion;
}

- (void)setDeviceSupportsSplatCryptex1RestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1RestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1SystemVersion
{
  return self->_deviceSupportsSplatCryptex1SystemVersion;
}

- (void)setDeviceSupportsSplatCryptex1SystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1SystemVersion = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)hwModelString
{
  return self->_hwModelString;
}

- (void)setHwModelString:(id)a3
{
  objc_storeStrong((id *)&self->_hwModelString, a3);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (NSString)marketingProductName
{
  return self->_marketingProductName;
}

- (void)setMarketingProductName:(id)a3
{
  objc_storeStrong((id *)&self->_marketingProductName, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (NSString)deviceBoardID
{
  return self->_deviceBoardID;
}

- (void)setDeviceBoardID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceBoardID, a3);
}

- (NSString)hwTarget
{
  return self->_hwTarget;
}

- (void)setHwTarget:(id)a3
{
  objc_storeStrong((id *)&self->_hwTarget, a3);
}

- (void)setRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersion, a3);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isBootedOSSecureInternal
{
  return self->_isBootedOSSecureInternal;
}

- (void)setIsBootedOSSecureInternal:(BOOL)a3
{
  self->_isBootedOSSecureInternal = a3;
}

- (BOOL)hasEmbeddedOS
{
  return self->_hasEmbeddedOS;
}

- (void)setHasEmbeddedOS:(BOOL)a3
{
  self->_hasEmbeddedOS = a3;
}

- (BOOL)hasBridgeOS
{
  return self->_hasBridgeOS;
}

- (void)setHasBridgeOS:(BOOL)a3
{
  self->_hasBridgeOS = a3;
}

- (NSString)bridgeBuildVersion
{
  return self->_bridgeBuildVersion;
}

- (void)setBridgeBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeBuildVersion, a3);
}

- (NSString)bridgeRestoreVersion
{
  return self->_bridgeRestoreVersion;
}

- (void)setBridgeRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeRestoreVersion, a3);
}

- (BOOL)isBridgeInternal
{
  return self->_isBridgeInternal;
}

- (void)setIsBridgeInternal:(BOOL)a3
{
  self->_isBridgeInternal = a3;
}

- (BOOL)hasSFR
{
  return self->_hasSFR;
}

- (void)setHasSFR:(BOOL)a3
{
  self->_hasSFR = a3;
}

- (NSString)sfrBuildVersion
{
  return self->_sfrBuildVersion;
}

- (void)setSfrBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sfrBuildVersion, a3);
}

- (NSString)sfrProductVersion
{
  return self->_sfrProductVersion;
}

- (void)setSfrProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sfrProductVersion, a3);
}

- (NSString)sfrRestoreVersion
{
  return self->_sfrRestoreVersion;
}

- (void)setSfrRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sfrRestoreVersion, a3);
}

- (NSString)sfrReleaseType
{
  return self->_sfrReleaseType;
}

- (void)setSfrReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_sfrReleaseType, a3);
}

- (BOOL)hasRecoveryOS
{
  return self->_hasRecoveryOS;
}

- (void)setHasRecoveryOS:(BOOL)a3
{
  self->_hasRecoveryOS = a3;
}

- (NSString)recoveryOSBuildVersion
{
  return self->_recoveryOSBuildVersion;
}

- (void)setRecoveryOSBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSBuildVersion, a3);
}

- (NSString)recoveryOSProductVersion
{
  return self->_recoveryOSProductVersion;
}

- (void)setRecoveryOSProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSProductVersion, a3);
}

- (NSString)recoveryOSRestoreVersion
{
  return self->_recoveryOSRestoreVersion;
}

- (void)setRecoveryOSRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersion, a3);
}

- (NSString)recoveryOSReleaseType
{
  return self->_recoveryOSReleaseType;
}

- (void)setRecoveryOSReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryOSReleaseType, a3);
}

- (NSString)factoryRestoreVersion
{
  return self->_factoryRestoreVersion;
}

- (void)setFactoryRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_factoryRestoreVersion, a3);
}

- (NSString)preservedFactoryRestoreVersion
{
  return self->_preservedFactoryRestoreVersion;
}

- (void)setPreservedFactoryRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_preservedFactoryRestoreVersion, a3);
}

- (void)setHasSplat:(BOOL)a3
{
  self->_hasSplat = a3;
}

- (void)setSplatRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatRestoreVersion, a3);
}

- (void)setSplatProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatProductVersion, a3);
}

- (void)setSplatProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_splatProductVersionExtra, a3);
}

- (void)setSplatBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatBuildVersion, a3);
}

- (void)setSplatReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_splatReleaseType, a3);
}

- (void)setHasSplatOnlyUpdateInstalled:(BOOL)a3
{
  self->_hasSplatOnlyUpdateInstalled = a3;
}

- (void)setSplatRollbackRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersion, a3);
}

- (void)setSplatRollbackProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackProductVersion, a3);
}

- (void)setSplatRollbackProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackProductVersionExtra, a3);
}

- (void)setSplatRollbackBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackBuildVersion, a3);
}

- (void)setSplatRollbackReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_splatRollbackReleaseType, a3);
}

- (void)setSplatCryptex1RestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersion, a3);
}

- (void)setSplatCryptex1ProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersion, a3);
}

- (void)setSplatCryptex1ProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersionExtra, a3);
}

- (void)setSplatCryptex1BuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersion, a3);
}

- (void)setSplatCryptex1BuildVersionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersionOverride, a3);
}

- (void)setSplatCryptex1ReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_splatCryptex1ReleaseType, a3);
}

- (NSString)bridgeVersionPlistPath
{
  return self->_bridgeVersionPlistPath;
}

- (void)setBridgeVersionPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeVersionPlistPath, a3);
}

- (NSDictionary)bridgeVersionPlistContents
{
  return self->_bridgeVersionPlistContents;
}

- (void)setBridgeVersionPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeVersionPlistContents, a3);
}

- (NSString)bridgeVersion
{
  return self->_bridgeVersion;
}

- (void)setBridgeVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeVersion, 0);
  objc_storeStrong((id *)&self->_bridgeVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_bridgeVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ReleaseType, 0);
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersionOverride, 0);
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackReleaseType, 0);
  objc_storeStrong((id *)&self->_splatRollbackBuildVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatRollbackProductVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersion, 0);
  objc_storeStrong((id *)&self->_splatReleaseType, 0);
  objc_storeStrong((id *)&self->_splatBuildVersion, 0);
  objc_storeStrong((id *)&self->_splatProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatProductVersion, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_preservedFactoryRestoreVersion, 0);
  objc_storeStrong((id *)&self->_factoryRestoreVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSReleaseType, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSProductVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSBuildVersion, 0);
  objc_storeStrong((id *)&self->_sfrReleaseType, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersion, 0);
  objc_storeStrong((id *)&self->_sfrProductVersion, 0);
  objc_storeStrong((id *)&self->_sfrBuildVersion, 0);
  objc_storeStrong((id *)&self->_bridgeRestoreVersion, 0);
  objc_storeStrong((id *)&self->_bridgeBuildVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
  objc_storeStrong((id *)&self->_hwTarget, 0);
  objc_storeStrong((id *)&self->_deviceBoardID, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_marketingProductName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_hwModelString, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_factoryVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_factoryVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_appleInternalVariantPlistContents, 0);
  objc_storeStrong((id *)&self->_appleInternalVariantPlistPath, 0);
  objc_storeStrong((id *)&self->_restoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_restoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_systemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_systemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_targetedSystemVolume, 0);
}

- (void)initTargetingSystemVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(&dword_1B05B8000, v0, v1, "[SUCoreDevice] No system volume provided, returning no initialized device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)adjustTargetingSystemVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(&dword_1B05B8000, v0, v1, "[SUCoreDevice] No system volume provided, returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)adjustTargetingSystemVolume:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Unable to determine RecoveryOS restore version (recoveryOSRestoreVersion=%{public}@, recoveryOSRestoreBuildGroup=%{public}@)");
  OUTLINED_FUNCTION_7();
}

- (void)adjustTargetingSystemVolume:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Unable to determine SFR restore version (sfrRestoreVersion=%{public}@, sfrRestoreBuildGroup=%{public}@)");
  OUTLINED_FUNCTION_7();
}

- (void)_getMajorVersionFromBuildVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Build version comparison was not provided a build version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_getMajorVersionFromBuildVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Build version comparison was unable to find a build regex match for %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_copySplatCryptex1SystemVersionPath
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Failed to get path to cryptex1 SystemVersion: %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_copySplatCryptex1RestoreVersionPath
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Failed to get path to cryptex1 RestoreVersion: %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_copySplatRollbackObjectsPath
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Failed to get path to rollback objects: %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)hasEligibleRollback
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5(&dword_1B05B8000, v0, v1, "[SUCoreDevice] Failed to get path to rollback assets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_reloadPlistContentsForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to reload plist contents", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_queryMethodForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_copySysCtlValueForKey:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1B05B8000, v1, v2, "[SUCoreDevice] sysctlbyname failed to set buffer for key %{public}@ with code %d (%s) buffer size %ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

- (void)_copySysCtlValueForKey:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1B05B8000, v1, v2, "[SUCoreDevice] sysctlbyname failed for key %{public}@ with code %d (%s) buffer size %ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

- (void)_gestaltKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a gestalt key", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_coreServicesKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a core services key", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_restoreVersionKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a restore version key", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_factoryVersionKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a factory version key.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_factoryVersionPlistContentsForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain factory version plist contents.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_sysCtlKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a sysctl value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatVersionKeyForQueryKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion/SplatRollbackVersion/SplatCryptex1Version value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatVersionPlistContentsForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatRollbackVersionPlistContentsForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatRollback value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatCryptex1VersionPlistContentsForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "_nameForQueryKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatCryptex1 value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
