@implementation SLDCloudKitSyncReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_476 != -1)
    dispatch_once(&sharedInstance_onceToken_476, &__block_literal_global_478);
  return (id)sharedInstance_sharedInstance_477;
}

void __39__SLDCloudKitSyncReader_sharedInstance__block_invoke()
{
  void *v0;
  SLDCloudKitSyncReader *v1;
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.SocialLayer"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContainer:", v0);

  objc_msgSend(v3, "setName:", CFSTR("ckreader"));
  v1 = -[SLDCloudKitSyncBase initWithConfiguration:]([SLDCloudKitSyncReader alloc], "initWithConfiguration:", v3);
  v2 = (void *)sharedInstance_sharedInstance_477;
  sharedInstance_sharedInstance_477 = (uint64_t)v1;

}

- (void)initializeState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLDCloudKitSyncReader;
  -[SLDCloudKitSyncBase initializeState](&v3, sel_initializeState);
  *(&self->super._saltLocked + 1) = 0;
  -[SLDCloudKitSyncReader updateServerAppsIfNecessary](self, "updateServerAppsIfNecessary");
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncReader _syncDirectory](self, "_syncDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)SLDCloudKitSyncReader;
  -[SLDCloudKitSyncBase reset](&v5, sel_reset);
}

- (void)accountStatusChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLDCloudKitSyncReader;
  -[SLDCloudKitSyncBase accountStatusChanged](&v4, sel_accountStatusChanged);
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("appListLastUploaded"));

  -[SLDCloudKitSyncReader updateServerAppsIfNecessary](self, "updateServerAppsIfNecessary");
}

- (void)invalidateAppsInternal
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK invalidateApps...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)apps
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appListOnServer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_validateRecordIDString:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    while (2)
    {
      switch(objc_msgSend(v3, "characterAtIndex:", v4))
      {
        case '!':
        case '+':
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '=':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          if (++v4 >= (unint64_t)objc_msgSend(v3, "length"))
            goto LABEL_5;
          continue;
        default:
          SLDaemonLogHandle();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            -[SLDCloudKitSyncReader _validateRecordIDString:].cold.1(v3, v4, v7);

          v5 = 0;
          break;
      }
      break;
    }
  }
  else
  {
LABEL_5:
    v5 = 1;
  }

  return v5;
}

- (id)_syncDirectory
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (SLDStorageDirectory_onceToken != -1)
    dispatch_once(&SLDStorageDirectory_onceToken, &__block_literal_global_544);
  v4 = (id)SLDStorageDirectory_dirURL;
  -[SLDCloudKitSyncBase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_syncDirectoryForWriter:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "hasPrefix:", CFSTR("writer!"))
    && -[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v4))
  {
    -[SLDCloudKitSyncReader _syncDirectory](self, "_syncDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addApplicationIdentifierInternal:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncReader addApplicationIdentifierInternal:].cold.1();

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appIDToTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (void *)objc_msgSend(v8, "mutableCopy");

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v4);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("appIDToTimestamp"));

  -[SLDCloudKitSyncReader updateServerAppsIfNecessary](self, "updateServerAppsIfNecessary");
}

- (void)updateServerAppsIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK new app list %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)garbageCollect
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!*(&self->super._saltLocked + 1))
  {
    *(&self->super._saltLocked + 1) = 1;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 2000000000);
    -[SLDCloudKitSyncBase queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SLDCloudKitSyncReader_garbageCollect__block_invoke;
    v6[3] = &unk_1E3794220;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __39__SLDCloudKitSyncReader_garbageCollect__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[58] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "garbageCollectNow");
    WeakRetained = v2;
  }

}

- (void)garbageCollectNow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK garbage collect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)recordForDevice:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v6)
    && -[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v7))
  {
    -[SLDCloudKitSyncReader _syncDirectoryForWriter:](self, "_syncDirectoryForWriter:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v10, 1, 0);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)deleteFromDevice:(id)a3 fileName:(id)a4 overrideRetained:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v5 = a5;
  v38 = a3;
  v8 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (-[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v38)
    && -[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v8))
  {
    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("files"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (!v12)
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (!v14
      || (objc_msgSend(v14, "objectForKeyedSubscript:", v8),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
LABEL_23:

      goto LABEL_24;
    }
    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("retainUntilExpirationFiles"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (v18)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", v38);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v8);

      if (v20)
      {
        if (!v5)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v18, "objectForKeyedSubscript:", v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(v22, "removeObject:", v8);
        if (objc_msgSend(v22, "count"))
          v23 = v22;
        else
          v23 = 0;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, v38);
        -[SLDCloudKitSyncBase persistence](self, "persistence");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, CFSTR("retainUntilExpirationFiles"));

      }
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v8);
    if (objc_msgSend(v14, "count"))
      v25 = v14;
    else
      v25 = 0;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, v38);
    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, CFSTR("files"));

    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("rankings"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(v29, "objectForKeyedSubscript:", v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "objectForKeyedSubscript:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, v8);
      if (objc_msgSend(v31, "count"))
        v33 = v31;
      else
        v33 = 0;
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, v38);
      -[SLDCloudKitSyncBase persistence](self, "persistence");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v29, CFSTR("rankings"));

    }
    -[SLDCloudKitSyncReader _syncDirectoryForWriter:](self, "_syncDirectoryForWriter:", v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "URLByAppendingPathComponent:", v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeItemAtURL:error:", v36, 0);

    -[SLDCloudKitSyncReader notifyChangeCallback](self, "notifyChangeCallback");
    goto LABEL_22;
  }
LABEL_25:

}

- (id)_fetchAttributionInternal:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SLAttribution *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69[2];

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x19AEC48EC]();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!objc_msgSend(v8, "hasPrefix:", CFSTR("writer!")))
    {
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "hasPrefix:", CFSTR("attribution!")))
    {
      v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    -[SLDCloudKitSyncReader recordForDevice:fileName:](self, "recordForDevice:fileName:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v9 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v54 = v10;
    v65 = v8;
    v12 = objc_alloc(MEMORY[0x1E0D70C70]);
    objc_msgSend(v11, "encryptedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("handle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptedValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("displayName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v12, "initWithHandle:displayName:", v14, v16);

    objc_msgSend(v11, "encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupPhoto"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v6;
    if (v18
      && (objc_msgSend(v11, "encryptedValues"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("groupPhoto")),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = -[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v20),
          v20,
          v19,
          v21))
    {
      -[SLDCloudKitSyncReader _syncDirectoryForWriter:](self, "_syncDirectoryForWriter:", v65);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encryptedValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("groupPhoto"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLByAppendingPathComponent:", v24);
      v68 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v68 = 0;
    }
    v25 = objc_alloc(MEMORY[0x1E0D70C50]);
    objc_msgSend(v11, "encryptedValues");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptedValues");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("sourceAppDisplayName"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptedValues");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("groupDisplayName"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v11, "encryptedValues");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "doubleValue");
    objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptedValues");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("starred"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");
    v66 = v11;
    objc_msgSend(v11, "encryptedValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("fromMe"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v51) = objc_msgSend(v31, "BOOLValue");
    LOBYTE(v51) = v29;
    v32 = (void *)objc_msgSend(v25, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v26, v58, CFSTR("c"), v68, v57, MEMORY[0x1E0C9AA60], v67, v55, 0, v51);

    v33 = (void *)v68;
    if (!v32)
    {
      v9 = 0;
      v8 = v65;
      v6 = v53;
      v10 = v54;
      v11 = v66;
LABEL_29:

      goto LABEL_30;
    }
    v69[0] = 0;
    v9 = -[SLAttribution initWithPortraitAttribution:error:]([SLAttribution alloc], "initWithPortraitAttribution:error:", v32, v69);
    v64 = v69[0];
    v52 = v32;
    if (v9)
    {
      objc_msgSend(v66, "encryptedValues");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("shortDisplayName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v65;
      v10 = v54;
      if (v35)
      {
        objc_msgSend(v66, "encryptedValues");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("shortDisplayName"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLAttribution sender](v9, "sender");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setShortDisplayName:", v37);

      }
      objc_msgSend(v66, "encryptedValues");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("contactPhoto"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v66;
      v6 = v53;
      if (!v40)
        goto LABEL_28;
      objc_msgSend(v66, "encryptedValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("contactPhoto"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SLDCloudKitSyncReader _validateRecordIDString:](self, "_validateRecordIDString:", v42);

      v11 = v66;
      if (!v43)
        goto LABEL_28;
      -[SLDCloudKitSyncReader _syncDirectoryForWriter:](self, "_syncDirectoryForWriter:", v65);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "encryptedValues");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("contactPhoto"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByAppendingPathComponent:", v46);
      v47 = objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v47, 8, 0);
        if (v48)
        {
          -[SLAttribution sender](v9, "sender");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setThumbnailImageData:", v48);

        }
      }
      v11 = v66;
    }
    else
    {
      SLDaemonLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      v8 = v65;
      v10 = v54;
      v11 = v66;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        -[SLDCloudKitSyncReader _fetchAttributionInternal:].cold.1();
      v6 = v53;
    }

LABEL_28:
    v33 = (void *)v68;
    v32 = v52;
    goto LABEL_29;
  }
  v9 = 0;
LABEL_33:

  objc_autoreleasePoolPop(v6);
  return v9;
}

- (id)getHighlightsInternalForApplicationIdentifier:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  SLDCloudKitSyncReader *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  id obj;
  id v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  NSObject *v147;
  SLDCloudKitSyncReader *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  int v179;
  uint64_t v180;
  _QWORD v181[2];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  NSObject *v185;
  _QWORD v186[2];
  _QWORD v187[2];
  _BYTE v188[128];
  int v189;
  uint64_t v190;
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  v143 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("files"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = 0;
  v122 = v6;
  if (v6 && v8)
  {
    v151 = (void *)objc_opt_new();
    v126 = (id)objc_opt_new();
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    obj = v6;
    v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
    if (v130)
    {
      v129 = *(_QWORD *)v176;
      v148 = self;
      v128 = v8;
      do
      {
        for (i = 0; i != v130; ++i)
        {
          if (*(_QWORD *)v176 != v129)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v10);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          if (v153)
          {
            v132 = i;
            v173 = 0u;
            v174 = 0u;
            v171 = 0u;
            v172 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
            if (!v13)
            {
              v15 = v12;
LABEL_101:

              i = v132;
              goto LABEL_102;
            }
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v172;
            v145 = v11;
            v146 = *(_QWORD *)v172;
            v152 = v10;
            do
            {
              v17 = 0;
              v149 = v14;
              do
              {
                if (*(_QWORD *)v172 != v16)
                  objc_enumerationMutation(v12);
                v18 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v17);
                objc_msgSend(v153, "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "objectForKeyedSubscript:", v15);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "compare:", v19);

                if (v21 == 1)
                {
                  v22 = v152;
                }
                else
                {
                  v23 = v15;
                  v169 = 0u;
                  v170 = 0u;
                  v167 = 0u;
                  v168 = 0u;
                  v24 = v12;
                  objc_msgSend(v12, "objectForKeyedSubscript:", v18);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = *(_QWORD *)v168;
                    while (2)
                    {
                      for (j = 0; j != v27; ++j)
                      {
                        if (*(_QWORD *)v168 != v28)
                          objc_enumerationMutation(v25);
                        objc_msgSend(v153, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * j));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v30)
                        {
                          v15 = v23;
                          goto LABEL_26;
                        }
                      }
                      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
                      if (v27)
                        continue;
                      break;
                    }
                  }

                  v15 = v18;
                  v25 = v23;
LABEL_26:

                  v11 = v145;
                  v16 = v146;
                  v22 = v152;
                  v12 = v24;
                  v14 = v149;
                }

                ++v17;
              }
              while (v17 != v14);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
            }
            while (v14);

            v8 = v128;
            i = v132;
            if (v15)
            {
              v31 = objc_alloc(MEMORY[0x1E0C99D68]);
              objc_msgSend(v153, "objectForKeyedSubscript:", v15);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "doubleValue");
              v33 = (void *)objc_msgSend(v31, "initWithTimeIntervalSinceReferenceDate:");

              objc_msgSend(v33, "timeIntervalSinceNow");
              if (v34 >= -2592000.0)
              {
                objc_msgSend(v33, "timeIntervalSinceNow");
                if (v35 <= 86400.0)
                {
                  -[SLDCloudKitSyncReader recordForDevice:fileName:](v148, "recordForDevice:fileName:", v22, v15);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    v127 = v33;
                    v37 = v36;
                    -[SLDCloudKitSyncBase persistence](v148, "persistence");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("retainUntilExpirationFiles"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v39;
                    if (!v39)
                      v39 = (void *)MEMORY[0x1E0C9AA70];
                    v41 = (void *)objc_msgSend(v39, "mutableCopy");

                    v42 = (void *)objc_opt_new();
                    objc_msgSend(v41, "objectForKeyedSubscript:", v22);
                    v43 = objc_claimAutoreleasedReturnValue();
                    v44 = (void *)v43;
                    if (v43)
                      v45 = v43;
                    else
                      v45 = MEMORY[0x1E0C9AA60];
                    objc_msgSend(v42, "addObjectsFromArray:", v45);

                    v165 = 0u;
                    v166 = 0u;
                    v163 = 0u;
                    v164 = 0u;
                    v125 = v37;
                    objc_msgSend(v37, "encryptedValues");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("recordIDs"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v163, v192, 16);
                    if (v48)
                    {
                      v49 = v48;
                      v50 = *(_QWORD *)v164;
                      do
                      {
                        for (k = 0; k != v49; ++k)
                        {
                          if (*(_QWORD *)v164 != v50)
                            objc_enumerationMutation(v47);
                          objc_msgSend(v42, "addObject:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * k));
                        }
                        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v163, v192, 16);
                      }
                      while (v49);
                    }

                    v123 = v42;
                    if (objc_msgSend(v42, "count"))
                    {
                      objc_msgSend(v42, "allObjects");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "setObject:forKeyedSubscript:", v52, v22);

                    }
                    else
                    {
                      objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, v22);
                    }
                    v53 = v148;
                    -[SLDCloudKitSyncBase persistence](v148, "persistence");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v124 = v41;
                    objc_msgSend(v54, "setObject:forKeyedSubscript:", v41, CFSTR("retainUntilExpirationFiles"));

                    v161 = 0u;
                    v162 = 0u;
                    v159 = 0u;
                    v160 = 0u;
                    objc_msgSend(v125, "encryptedValues");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("highlights"));
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    v139 = v56;
                    v144 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v159, v191, 16);
                    if (v144)
                    {
                      v57 = *(_QWORD *)v160;
                      v134 = v15;
                      v135 = *(_QWORD *)v160;
                      do
                      {
                        for (m = 0; m != v144; ++m)
                        {
                          if (*(_QWORD *)v160 != v57)
                            objc_enumerationMutation(v139);
                          v59 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * m);
                          v60 = (void *)MEMORY[0x19AEC48EC]();
                          v141 = v59;
                          -[SLDCloudKitSyncReader recordForDevice:fileName:](v53, "recordForDevice:fileName:", v22, v59);
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          v62 = v61;
                          if (v61)
                          {
                            if (!v143)
                              goto LABEL_57;
                            objc_msgSend(v61, "encryptedValues");
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("applicationIdentifier"));
                            v64 = v62;
                            v65 = v60;
                            v66 = m;
                            v67 = (void *)objc_claimAutoreleasedReturnValue();

                            LODWORD(v63) = objc_msgSend(v67, "isEqual:", v143);
                            m = v66;
                            v60 = v65;
                            v62 = v64;
                            if ((_DWORD)v63)
                            {
LABEL_57:
                              v140 = m;
                              objc_msgSend(v62, "encryptedValues");
                              v68 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("entity"));
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SLDCloudKitSyncReader recordForDevice:fileName:](v53, "recordForDevice:fileName:", v22, v69);
                              v70 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v70)
                                goto LABEL_95;
                              objc_msgSend(v70, "encryptedValues");
                              v71 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("identifier"));
                              v72 = objc_claimAutoreleasedReturnValue();

                              v150 = (void *)v72;
                              if (!v72)
                              {
                                SLDaemonLogHandle();
                                v147 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT))
                                  -[SLDCloudKitSyncReader getHighlightsInternalForApplicationIdentifier:].cold.1(&v189, v70, &v190);
                                goto LABEL_94;
                              }
                              v136 = v70;
                              v137 = v60;
                              v73 = objc_alloc(MEMORY[0x1E0C99DE8]);
                              objc_msgSend(v62, "encryptedValues");
                              v74 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("attributions"));
                              v75 = v62;
                              v76 = (void *)objc_claimAutoreleasedReturnValue();
                              v147 = objc_msgSend(v73, "initWithCapacity:", objc_msgSend(v76, "count"));

                              v157 = 0u;
                              v158 = 0u;
                              v155 = 0u;
                              v156 = 0u;
                              v138 = v75;
                              objc_msgSend(v75, "encryptedValues");
                              v77 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("attributions"));
                              v78 = (void *)objc_claimAutoreleasedReturnValue();

                              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v155, v188, 16);
                              if (v79)
                              {
                                v80 = v79;
                                v81 = *(_QWORD *)v156;
                                do
                                {
                                  for (n = 0; n != v80; ++n)
                                  {
                                    if (*(_QWORD *)v156 != v81)
                                      objc_enumerationMutation(v78);
                                    v83 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * n);
                                    v84 = (void *)MEMORY[0x19AEC48EC]();
                                    v187[0] = v22;
                                    v187[1] = v83;
                                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
                                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v85, "componentsJoinedByString:", CFSTR("/"));
                                    v86 = (void *)objc_claimAutoreleasedReturnValue();

                                    -[SLDCloudKitSyncReader _fetchAttributionInternal:](v53, "_fetchAttributionInternal:", v86);
                                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                                    v88 = v87;
                                    if (v87)
                                    {
                                      objc_msgSend(v87, "sender");
                                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v89, "handle");
                                      v90 = (void *)objc_claimAutoreleasedReturnValue();

                                      if (v90)
                                      {
                                        v186[0] = v150;
                                        v186[1] = v90;
                                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 2);
                                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v91, "componentsJoinedByString:", CFSTR("\n"));
                                        v92 = (void *)objc_claimAutoreleasedReturnValue();

                                        if ((objc_msgSend(v151, "containsObject:", v92) & 1) == 0)
                                        {
                                          objc_msgSend(v151, "addObject:", v92);
                                          -[NSObject addObject:](v147, "addObject:", v86);
                                        }

                                        v53 = v148;
                                      }

                                      v22 = v152;
                                    }

                                    objc_autoreleasePoolPop(v84);
                                  }
                                  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v155, v188, 16);
                                }
                                while (v80);
                              }

                              SLDaemonLogHandle();
                              v93 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                              {
                                v181[0] = v22;
                                v181[1] = v141;
                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 2);
                                v120 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138412546;
                                v183 = v120;
                                v184 = 2112;
                                v185 = v147;
                                _os_log_debug_impl(&dword_199EFF000, v93, OS_LOG_TYPE_DEBUG, "#SLDCK %@ device scoped attributions: %@", buf, 0x16u);

                              }
                              v11 = v145;
                              v15 = v134;
                              v57 = v135;
                              v60 = v137;
                              v62 = v138;
                              v70 = v136;
                              if (!-[NSObject count](v147, "count"))
                              {
                                v53 = v148;
                                goto LABEL_94;
                              }
                              objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("version"));
                              v94 = (void *)objc_claimAutoreleasedReturnValue();
                              v95 = objc_msgSend(v94, "unsignedIntegerValue");

                              if (v95 <= 1)
                              {
                                objc_msgSend(v136, "encryptedValues");
                                v107 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("supplementaryData"));
                                v108 = (void *)objc_claimAutoreleasedReturnValue();
                                v109 = (void *)MEMORY[0x1E0C9AA70];
                                if (!v108)
                                  v109 = 0;
                                v103 = v109;

                                v53 = v148;
                                if (!v103)
                                  goto LABEL_89;
                              }
                              else
                              {
                                v96 = (void *)MEMORY[0x1E0CB3710];
                                v97 = (void *)MEMORY[0x1E0C99E60];
                                v98 = objc_opt_class();
                                v99 = objc_opt_class();
                                objc_msgSend(v97, "setWithObjects:", v98, v99, objc_opt_class(), 0);
                                v100 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v136, "encryptedValues");
                                v101 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("supplementaryData"));
                                v102 = (void *)objc_claimAutoreleasedReturnValue();
                                v154 = 0;
                                objc_msgSend(v96, "unarchivedObjectOfClasses:fromData:error:", v100, v102, &v154);
                                v103 = (id)objc_claimAutoreleasedReturnValue();
                                v104 = v154;

                                if (v104)
                                {
                                  SLDaemonLogHandle();
                                  v105 = objc_claimAutoreleasedReturnValue();
                                  v53 = v148;
                                  v22 = v152;
                                  if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
                                  {
                                    objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("version"));
                                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138412546;
                                    v183 = v106;
                                    v184 = 2112;
                                    v185 = v104;
                                    _os_log_fault_impl(&dword_199EFF000, v105, OS_LOG_TYPE_FAULT, "#SLDCK unable to decode supplementary data from record with version %@: %@", buf, 0x16u);

                                    v53 = v148;
                                  }
LABEL_87:

LABEL_92:
                                  v62 = v138;
LABEL_93:

                                  v57 = v135;
LABEL_94:

LABEL_95:
                                  m = v140;
                                  goto LABEL_96;
                                }
                                v53 = v148;
                                v22 = v152;
                                v62 = v138;
                                if (!v103)
                                {
LABEL_89:
                                  SLDaemonLogHandle();
                                  v104 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
                                    -[SLDCloudKitSyncReader getHighlightsInternalForApplicationIdentifier:].cold.2(&v179, v136, &v180);
                                  v103 = 0;
                                  goto LABEL_92;
                                }
                              }
                              if (SLDValidateSupplementaryData(v103))
                              {
                                v110 = v62;
                                v111 = objc_alloc(MEMORY[0x1E0D70C60]);
                                v112 = (void *)MEMORY[0x1E0C99E98];
                                objc_msgSend(v136, "encryptedValues");
                                v142 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("resourceURL"));
                                v131 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v112, "URLWithString:", v131);
                                v113 = (void *)objc_claimAutoreleasedReturnValue();
                                v114 = (void *)MEMORY[0x1E0C99D68];
                                objc_msgSend(v110, "encryptedValues");
                                v115 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("timestamp"));
                                v116 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v116, "doubleValue");
                                objc_msgSend(v114, "dateWithTimeIntervalSinceReferenceDate:");
                                v117 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v110, "encryptedValues");
                                v118 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("score"));
                                v119 = (void *)objc_claimAutoreleasedReturnValue();
                                v104 = objc_msgSend(v111, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:", v150, v113, v117, v147, v103, v119);

                                v70 = v136;
                                v53 = v148;

                                v22 = v152;
                                v60 = v137;

                                v105 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70CA0]), "initWithHighlight:rankingDate:originatingDeviceId:", v104, v127, v152);
                                objc_msgSend(v126, "addObject:", v105);
                                goto LABEL_87;
                              }
                              goto LABEL_93;
                            }
                          }
LABEL_96:

                          objc_autoreleasePoolPop(v60);
                        }
                        v144 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v159, v191, 16);
                      }
                      while (v144);
                    }

                    v33 = v127;
                    v36 = v125;
                  }

                }
              }

              v8 = v128;
              goto LABEL_101;
            }
          }
LABEL_102:

        }
        v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
      }
      while (v130);
    }

  }
  return v126;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncReader syncEngine:didSaveRecordZone:].cold.1(v4, v5);

}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a5;
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SLDCloudKitSyncReader syncEngine:failedToSaveRecordZone:error:].cold.1();

}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  SLDCloudKitSyncReader *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke;
  v13[3] = &unk_1E3795C70;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "zoneID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(CFSTR("readers"), "isEqual:", v5);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "persistence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("myAppsRecordID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("reader"), *(_QWORD *)(a1 + 48));
        v13 = *(_QWORD *)(a1 + 56);
        v12 = a1 + 56;
        v14 = *(_QWORD *)(v13 + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v11;

        objc_msgSend(*(id *)(v12 - 16), "addMetadataToRecord:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v12 + 8) + 40));
        objc_msgSend(*(id *)(v12 - 16), "apps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v12 + 8) + 40), "encryptedValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("applicationIdentifiers"));

        SLDaemonLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_1();
      }
      else
      {
        SLDaemonLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_2();
      }

    }
  }
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncReader syncEngine:didSaveRecord:].cold.1(v4);

}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncReader *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(CFSTR("readers"), "isEqual:", v6);

    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 40), "persistence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("myAppsRecordID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("appListLastUploaded"));

        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("appListOnServer"));

        objc_msgSend(*(id *)(a1 + 40), "checkForAccountChanges");
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_2();

    }
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncReader syncEngine:didDeleteRecordWithID:].cold.1();

}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  SLDCloudKitSyncReader *v11;

  v6 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SLDCloudKitSyncReader_syncEngine_recordWithIDWasDeleted_recordType___block_invoke;
  block[3] = &unk_1E37942C0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __70__SLDCloudKitSyncReader_syncEngine_recordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneName");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deleteFromDevice:fileName:overrideRetained:", v4, v3, 0);
  objc_msgSend(*(id *)(a1 + 40), "garbageCollect");

}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SLDCloudKitSyncReader *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SLDCloudKitSyncReader_syncEngine_shouldFetchChangesForZoneID___block_invoke;
  v12[3] = &unk_1E3795C98;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

void __64__SLDCloudKitSyncReader_syncEngine_shouldFetchChangesForZoneID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("writer!"));

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if ((v6 & 1) != 0)
    {
      *(_BYTE *)(v4 + 24) = 1;
      return;
    }
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v4 + 24) = 0;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLDCloudKitSyncReader *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke;
  block[3] = &unk_1E3795A70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  int v71;
  NSObject *v72;
  _BOOL4 v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  NSObject *v79;
  void *v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  id v86;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (id *)(a1 + 48);
    if ((objc_msgSend(*(id *)(a1 + 40), "recordSupportsOurVersion:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      SLDaemonLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_13(a1 + 48, v9);
      goto LABEL_55;
    }
    objc_msgSend(*v4, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("writer!"));

    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if ((v8 & 1) == 0)
    {
      if (v10)
        __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_12((id *)(a1 + 48));
      goto LABEL_55;
    }
    if (v10)
      __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_11(a1 + 48, v9);

    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "_validateRecordIDString:", v14);

    if ((_DWORD)v11)
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v15, "_validateRecordIDString:", v17);

      if ((_DWORD)v15)
      {
        v18 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "zoneID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "zoneName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_syncDirectoryForWriter:", v21);
        v9 = objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          SLDaemonLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_1();
          goto LABEL_54;
        }
        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("files"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = (void *)MEMORY[0x1E0C9AA70];
        if (!v23)
          v23 = (void *)MEMORY[0x1E0C9AA70];
        v26 = objc_msgSend(v23, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "zoneID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "zoneName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (!v30)
          v30 = v25;
        v32 = (void *)objc_msgSend(v30, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "recordName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          SLDaemonLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_10();
          goto LABEL_53;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0;
        v38 = objc_msgSend(v37, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v86);
        v36 = v86;

        if ((v38 & 1) == 0)
        {
          SLDaemonLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_9();
          goto LABEL_52;
        }
        objc_msgSend(*v4, "objectForKeyedSubscript:", CFSTR("recordTimestamp"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v4, "recordID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "recordName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, v41);

        objc_msgSend(*v4, "recordType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v40) = objc_msgSend(CFSTR("index"), "isEqual:", v42);

        if ((_DWORD)v40)
        {
          v82 = v36;
          v43 = v25;
          SLDaemonLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_8();

          objc_msgSend(*(id *)(a1 + 40), "persistence");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("rankings"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (!v46)
            v46 = v43;
          v80 = (void *)objc_msgSend(v46, "mutableCopy");

          objc_msgSend(*(id *)(a1 + 48), "recordID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "zoneID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "zoneName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectForKeyedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (!v51)
            v51 = (void *)MEMORY[0x1E0C9AA70];
          v53 = (void *)objc_msgSend(v51, "mutableCopy", v80);

          objc_msgSend(*(id *)(a1 + 48), "encryptedValues");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("recordIDs"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "recordID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "recordName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v55, v57);

          objc_msgSend(*(id *)(a1 + 48), "recordID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "zoneID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "zoneName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v53, v60);

          objc_msgSend(*(id *)(a1 + 40), "persistence");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v81, CFSTR("rankings"));

          v36 = v82;
        }
        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "zoneID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "zoneName");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v32, v64);

        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v26, CFSTR("files"));

        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "recordName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject URLByAppendingPathComponent:](v9, "URLByAppendingPathComponent:", v67);
        v68 = objc_claimAutoreleasedReturnValue();

        SLDaemonLogHandle();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_7();

        objc_msgSend(*v4, "recordType");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(CFSTR("image"), "isEqual:", v70);

        SLDaemonLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG);
        if (v71)
        {
          if (v73)
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_3();

          objc_msgSend(*v4, "encryptedValues");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("compressed"));
          v75 = (id)objc_claimAutoreleasedReturnValue();

          v85 = 0;
          objc_msgSend(v75, "writeToURL:options:error:", v68, 0, &v85);
          v76 = v85;
          if (!v76)
            goto LABEL_51;
          SLDaemonLogHandle();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_2();
        }
        else
        {
          if (v73)
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_6();

          v78 = *v4;
          v84 = 0;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v78, 1, &v84);
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v75 = v84;
          if (v76)
          {
            v83 = 0;
            objc_msgSend(v76, "writeToURL:options:error:", v68, 0, &v83);
            v77 = v83;
            if (v77)
            {
              SLDaemonLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_5();

            }
          }
          else
          {
            SLDaemonLogHandle();
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_4();
          }
        }

LABEL_51:
        objc_msgSend(*(id *)(a1 + 40), "garbageCollect");
LABEL_52:

LABEL_53:
LABEL_54:

LABEL_55:
      }
    }
  }
}

- (void)notifyChangeCallback
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK notifyChangeCallback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__SLDCloudKitSyncReader_notifyChangeCallback__block_invoke(uint64_t a1)
{
  const void **WeakRetained;
  const void **v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  __int16 v6[8];
  uint8_t buf[16];

  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 72) = 0;
    v3 = _Block_copy(WeakRetained[8]);
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "#SLDCK invoking change callback", buf, 2u);
      }

      dispatch_get_global_queue(-2, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v4, v3);
    }
    else if (v5)
    {
      v6[0] = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "#SLDCK not invoking change callback because it's nil", (uint8_t *)v6, 2u);
    }

  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncReader *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "#SLDCK Failed to fetch changes for zone %@: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0C947D8]))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0C94878]);

      if (!v9)
        return;
    }
    if (objc_msgSend(*(id *)(a1 + 56), "code") == 112)
    {
      objc_msgSend(*(id *)(a1 + 48), "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(CFSTR("readers"), "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        SLDaemonLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1();

        objc_msgSend(*(id *)(a1 + 40), "syncEngine");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRecordZonesToSave:recordZoneIDsToDelete:", 0, v14);

      }
    }
  }
}

- (void)invalidateApps
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SLDCloudKitSyncReader_invalidateApps__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__SLDCloudKitSyncReader_invalidateApps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateAppsInternal");
}

- (void)addApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SLDCloudKitSyncReader_addApplicationIdentifier___block_invoke;
  v7[3] = &unk_1E37942C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__SLDCloudKitSyncReader_addApplicationIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addApplicationIdentifierInternal:", *(_QWORD *)(a1 + 40));
}

- (id)getHighlightsForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SLDCloudKitSyncReader_getHighlightsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E3794E38;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__SLDCloudKitSyncReader_getHighlightsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SLHighlight *v12;
  void *v13;
  SLHighlight *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getHighlightsInternalForApplicationIdentifier:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "originatingDeviceId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v10 = (void *)objc_opt_new();
          objc_msgSend(v8, "originatingDeviceId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v11);

        }
        v12 = [SLHighlight alloc];
        objc_msgSend(v8, "highlight");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v14 = -[SLHighlight initWithPortraitHighlight:error:](v12, "initWithPortraitHighlight:error:", v13, &v20);
        v15 = v20;

        if (v14)
        {
          objc_msgSend(v10, "addObject:", v14);
        }
        else
        {
          SLDaemonLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_fault_impl(&dword_199EFF000, v16, OS_LOG_TYPE_FAULT, "couldn't convert portrait highlight to sl highlight: %@", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v2;

}

- (id)getSyncableHighlightsForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SLDCloudKitSyncReader_getSyncableHighlightsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E3795CE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__SLDCloudKitSyncReader_getSyncableHighlightsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "getHighlightsInternalForApplicationIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);

}

- (id)fetchAttribution:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLDCloudKitSyncReader_fetchAttribution___block_invoke;
  block[3] = &unk_1E3795CE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__SLDCloudKitSyncReader_fetchAttribution___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_fetchAttributionInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setChangeCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SLDCloudKitSyncReader_setChangeCallback___block_invoke;
  block[3] = &unk_1E3794DE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __43__SLDCloudKitSyncReader_setChangeCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garbageCollectScheduled, 0);
}

- (void)_validateRecordIDString:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "substringWithRange:", a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v6, "#SLDCK rejecting record id string %@ due to character %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

- (void)addApplicationIdentifierInternal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK adding app identifier %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_fetchAttributionInternal:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  _os_log_fault_impl(&dword_199EFF000, v0, OS_LOG_TYPE_FAULT, "#SLDCK cannot make SLAttribution for %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)getHighlightsInternalForApplicationIdentifier:(_QWORD *)a3 .cold.1(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_15_0(&dword_199EFF000, v6, v7, "#SLDCK nil identifier in record written by version %@");

  OUTLINED_FUNCTION_21();
}

- (void)getHighlightsInternalForApplicationIdentifier:(_QWORD *)a3 .cold.2(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_15_0(&dword_199EFF000, v6, v7, "#SLDCK nil supplementary data in record written by version %@");

  OUTLINED_FUNCTION_21();
}

- (void)syncEngine:(void *)a1 didSaveRecordZone:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v5, "#SLDCK did save record zone %@", v6);

  OUTLINED_FUNCTION_9();
}

- (void)syncEngine:failedToSaveRecordZone:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, v4, "#SLDCK failed to save record zone %@, error: %@", v5);

  OUTLINED_FUNCTION_9();
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v1, (uint64_t)v1, "#SLDCK giving sync engine contents for record id %@: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK returning nil for recordToSaveForRecordID for unknown id %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)syncEngine:(void *)a1 didSaveRecord:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "#SLDCK did save record id %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_24();
  objc_msgSend((id)OUTLINED_FUNCTION_18(v1), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, v4, "#SLDCK error saving apps list record id %@, error: %@", v5);

  OUTLINED_FUNCTION_9();
}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_19(&dword_199EFF000, v0, OS_LOG_TYPE_FAULT, "#SLDCK why were we trying to save a record into the readers zone? %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)syncEngine:didDeleteRecordWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK did delete record id %@", v2);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "#SLDCK failed to get sync directory URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "#SLDCK error writing image to %@: %@", v1);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK will serialize %@ as a raw image", v2);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_24();
  objc_msgSend((id)OUTLINED_FUNCTION_18(v1), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, v3, "#SLDCK failed to archive ckrecord %@: %@", v4);

  OUTLINED_FUNCTION_9();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "#SLDCK failed to write ckrecord archive to %@: %@", v1);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK will serialize %@ as a ckrecord", v2);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK will write to %@", v2);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK writing new index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_9()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "#SLDCK couldn't make writer dir for %@ due to error %@", v1);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK already have record on disk %@", v2);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_11(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK got record %@", v5);

  OUTLINED_FUNCTION_6();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_12(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((id)OUTLINED_FUNCTION_18((uint64_t)a1), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v5, v6, "#SLDCK rejecting record %@ due to unsupported zone %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_13(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK rejecting record %@ due to unsupported version", v5);

  OUTLINED_FUNCTION_6();
}

void __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK Deleting %@ zone due to missing manatee identity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
