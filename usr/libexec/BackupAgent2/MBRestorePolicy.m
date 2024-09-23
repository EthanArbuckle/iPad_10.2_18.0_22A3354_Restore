@implementation MBRestorePolicy

- (MBRestorePolicy)initWithPersona:(id)a3 enginePolicyProvider:(id)a4 appManager:(id)a5 plugins:(id)a6 serviceRestoreMode:(id)a7 osBuildVersionOfBackup:(id)a8 shouldRestoreSystemFiles:(BOOL)a9 isRestoringPrimaryAccount:(BOOL)a10 shouldCreateMissingIntermediateDirectories:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  MBRestorePolicy *v24;
  MBRestorePolicy *v25;
  void *v26;
  id v28;
  objc_super v29;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v28 = a7;
  v22 = a8;
  if (!v18)
    sub_100088648();
  if (!v20)
    sub_100088670();
  v23 = v22;
  v29.receiver = self;
  v29.super_class = (Class)MBRestorePolicy;
  v24 = -[MBRestorePolicy init](&v29, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_persona, a3);
    objc_storeWeak((id *)&v25->_enginePolicyProvider, v19);
    v25->_enginePolicy = 0;
    objc_storeStrong((id *)&v25->_appManager, a5);
    if (v21)
      v26 = v21;
    else
      v26 = &__NSArray0__struct;
    objc_storeStrong((id *)&v25->_plugins, v26);
    objc_storeStrong((id *)&v25->_serviceRestoreMode, a7);
    objc_storeStrong((id *)&v25->_osBuildVersionOfBackup, a8);
    v25->_shouldRestoreSystemFiles = a9;
    v25->_isRestoringPrimaryAccount = a10;
    v25->_shouldCreateMissingIntermediateDirectories = a11;
  }

  return v25;
}

- (unint64_t)_enginePolicy
{
  unint64_t result;
  id WeakRetained;

  result = self->_enginePolicy;
  if (!result)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_enginePolicyProvider);
    self->_enginePolicy = (unint64_t)objc_msgSend(WeakRetained, "enginePolicy");

    result = self->_enginePolicy;
    if (!result)
      sub_100088698();
  }
  return result;
}

- (BOOL)isRestoringToSameDevice
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 7) & 1;
}

- (BOOL)_isCloudKitEngine
{
  return -[MBRestorePolicy _enginePolicy](self, "_enginePolicy") & 1;
}

- (BOOL)_isDriveEngine
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 1) & 1;
}

- (BOOL)_isServiceEngine
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 3) & 1;
}

- (BOOL)_isDeviceTransferEngine
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 2) & 1;
}

- (BOOL)_isMegaBackup
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 5) & 1;
}

- (BOOL)_isEncrypted
{
  return (-[MBRestorePolicy _enginePolicy](self, "_enginePolicy") >> 4) & 1;
}

- (BOOL)_isDriveOrMegaBackupPolicy
{
  if (-[MBRestorePolicy _isDriveEngine](self, "_isDriveEngine"))
    return 1;
  else
    return -[MBRestorePolicy _isMegaBackup](self, "_isMegaBackup");
}

- (int)restoreType
{
  MBServiceRestoreMode *serviceRestoreMode;
  unsigned int v3;

  serviceRestoreMode = self->_serviceRestoreMode;
  if (serviceRestoreMode && (v3 = -[MBServiceRestoreMode type](serviceRestoreMode, "type") - 1, v3 <= 6))
    return dword_10009D3F8[v3];
  else
    return 1;
}

- (BOOL)_isForegroundRestore
{
  return -[MBRestorePolicy restoreType](self, "restoreType") == 1;
}

- (BOOL)shouldForegroundRestoreDomain:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[NSSet containsObject:](self->_domainNamesToForegroundInstall, "containsObject:", v4)
    || !+[MBDomain isContainerizedName:](MBDomain, "isContainerizedName:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AppDomainGroup-group.com.apple.FileProvider.LocalStorage"));
  }

  return v5;
}

- (void)setDomainNamesToForegroundRestore:(id)a3
{
  objc_storeStrong((id *)&self->_domainNamesToForegroundInstall, a3);
}

- (id)destinationPathForRestorable:(id)a3 safeHarborDir:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (-[MBServiceRestoreMode type](self->_serviceRestoreMode, "type") == 6)
    goto LABEL_2;
  if (-[MBRestorePolicy _isForegroundRestore](self, "_isForegroundRestore"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy persona](self, "persona"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if ((objc_msgSend(v10, "shouldRestoreToSharedVolume") & 1) != 0)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedIncompleteRestoreDirectory"));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIncompleteRestoreDirectory"));
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v13));

    goto LABEL_10;
  }
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", kMBSafeHarborDataDirName));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v10));
LABEL_10:

    goto LABEL_11;
  }
LABEL_2:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absolutePath"));
LABEL_11:

  return v8;
}

- (BOOL)shouldRestoreSystemFile:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  char v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  void *v34;
  MBRestorePolicy *v35;
  NSObject *v36;
  id obj;
  uint64_t v38;
  id v39;
  void *context;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (!objc_msgSend(v5, "isSystemSharedContainerDomain")
    || !-[MBRestorePolicy shouldAlwaysRestoreSystemSharedContainerDomain:](self, "shouldAlwaysRestoreSystemSharedContainerDomain:", v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePathsOfSystemFilesToAlwaysRestore"));
    if (objc_msgSend(v7, "count"))
    {
      v35 = self;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relativePath"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathComponents"));

      v10 = -[NSObject count](v9, "count");
      v11 = 0;
      v36 = v9;
      do
      {
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject subarrayWithRange:](v9, "subarrayWithRange:", 0, v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePathsOfSystemFilesToAlwaysRestore"));
        v16 = objc_msgSend(v15, "containsObject:", v14);

        objc_autoreleasePoolPop(v12);
        if ((v16 & 1) != 0)
        {
          v6 = 1;
          v28 = v36;
          goto LABEL_29;
        }
        ++v11;
        v9 = v36;
      }
      while (v11 <= (unint64_t)v10);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v7;
      v39 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v39)
      {
        v33 = v7;
        v34 = v5;
        v18 = 0;
        obj = v17;
        v38 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(_QWORD *)v42 != v38)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
            context = objc_autoreleasePoolPush();
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathComponents"));
            v22 = objc_msgSend(v21, "count");
            v23 = 0;
            do
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subarrayWithRange:", 0, v23));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v24));

              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relativePath"));
              v27 = objc_msgSend(v26, "isEqualToString:", v25);

              if (v27)
                v18 = 1;

              ++v23;
            }
            while (v23 <= (unint64_t)v22);

            objc_autoreleasePoolPop(context);
          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v39);

        v7 = v33;
        v5 = v34;
        self = v35;
        if ((v18 & 1) != 0)
          goto LABEL_25;
      }
      else
      {

        self = v35;
      }
    }
    v29 = objc_msgSend(v5, "isAppDomain");
    if ((v29 & 1) == 0 && !self->_shouldRestoreSystemFiles)
    {
      v31 = MBGetDefaultLog(v29, v30);
      v28 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Not restoring system file: %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Not restoring system file: %@", v4);
      }
      v6 = 0;
LABEL_29:

      goto LABEL_30;
    }
LABEL_25:
    v6 = 1;
LABEL_30:

    goto LABEL_31;
  }
  v6 = 1;
LABEL_31:

  return v6;
}

- (BOOL)shouldRestoreFile:(id)a3 markFileAsSkipped:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _BOOL4 shouldRestoreSystemFiles;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  MBAppManager *appManager;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  unsigned int v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  _BOOL4 v77;
  uint64_t v78;
  NSObject *v79;
  _BOOL4 v80;
  id v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  const __CFString *v89;
  id v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  _BOOL4 v95;
  id *v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  id v102;
  uint8_t buf[4];
  id v104;

  v8 = a3;
  if (a4)
    *a4 = 0;
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (!v10)
    sub_1000886C0();
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootPath"));
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("/private")) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootPath"));
    v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("/private/var/PersonaVolumes"));

    if ((v14 & 1) == 0)
    {
      v17 = MBGetDefaultLog(v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Not restoring (invalid path prefix): %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Not restoring (invalid path prefix): %@", v8);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootPath"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootPath"));
      v21 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, v19, CFSTR("Domain %@ has an invalid root path: %@"), v11, v20));

      objc_autoreleasePoolPop(v9);
      goto LABEL_72;
    }
  }
  else
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootPath"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v23));

  v25 = objc_retainAutorelease((id)v24);
  v26 = strlen((const char *)objc_msgSend(v25, "fileSystemRepresentation"));
  if (v26 >= 0x3E6)
  {
    v28 = MBGetDefaultLog(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v104 = v8;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Not restoring (file name too long): %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Not restoring (file name too long): %@", v8);
    }

    if (a4)
      *a4 = 1;
    v21 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 107, v25, CFSTR("Cannot restore file with path name that is too long")));
    v30 = 6;
    goto LABEL_71;
  }
  v102 = 0;
  v31 = -[MBRestorePolicy restoreBehaviorForFile:debugContext:error:](self, "restoreBehaviorForFile:debugContext:error:", v8, 0, &v102);
  v99 = v102;
  if (v31 == -1)
  {
LABEL_20:
    v30 = 6;
    v21 = v99;
    goto LABEL_71;
  }
  if (v31 == 1)
  {
    if (a4)
      *a4 = 1;
    goto LABEL_20;
  }
  v98 = v25;
  if (_os_feature_enabled_impl("MobileBackup", "RestoreLocalFilesBackground"))
  {
    if (-[MBRestorePolicy _isForegroundRestore](self, "_isForegroundRestore"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("AppDomainGroup-group.com.apple.FileProvider.LocalStorage"));

      if (v34)
      {
        v37 = MBGetDefaultLog(v35, v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v104 = v8;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Not restoring in foreground because file is in LocalStorage domain: %@", buf, 0xCu);
          _MBLog(CFSTR("DEBUG"), "Not restoring in foreground because file is in LocalStorage domain: %@", v8);
        }

        LOBYTE(v24) = 0;
        v30 = 1;
        v25 = v98;
        v21 = v99;
        goto LABEL_71;
      }
    }
  }
  v96 = a5;
  v97 = v9;
  v100 = v8;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "pathComponents"));

  v101 = v40;
  v41 = objc_msgSend(v40, "count");
  v42 = 0;
  do
  {
    v43 = objc_autoreleasePoolPush();
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "subarrayWithRange:", 0, v42));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v44));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relativePathsNotToRestore"));
    v47 = objc_msgSend(v46, "containsObject:", v45);

    if (v47)
    {
      a5 = v96;
      if (a4)
        *a4 = 1;
      v73 = MBGetDefaultLog(v48, v49);
      v76 = objc_claimAutoreleasedReturnValue(v73);
      v30 = 1;
      v21 = v99;
      v8 = v100;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v100;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Not restoring: %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Not restoring: %@", v100);
      }
      goto LABEL_66;
    }
    if (-[MBRestorePolicy _isForegroundRestore](self, "_isForegroundRestore")
      && (objc_msgSend(v100, "type") & 0xF000) == 0x8000)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relativePathsToBackgroundRestore"));
      if ((objc_msgSend(v50, "containsObject:", v45) & 1) != 0)
      {
        shouldRestoreSystemFiles = self->_shouldRestoreSystemFiles;

        if (shouldRestoreSystemFiles)
        {
          v78 = MBGetDefaultLog(v52, v53);
          v79 = objc_claimAutoreleasedReturnValue(v78);
          v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG);
          v8 = v100;
          if (v80)
          {
            *(_DWORD *)buf = 138412290;
            v104 = v100;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Ignoring file since it needs to be restored in the background: %@", buf, 0xCu);
            _MBLog(CFSTR("DEBUG"), "Ignoring file since it needs to be restored in the background: %@", v100);
          }

          v21 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 213, CFSTR("Domain policy requires file must be restored in the background")));
          v76 = v99;
          v30 = 6;
LABEL_65:
          a5 = v96;
LABEL_66:

          objc_autoreleasePoolPop(v43);
          LOBYTE(v24) = 0;
          v9 = v97;
          v25 = v98;
          goto LABEL_70;
        }
      }
      else
      {

      }
    }
    if (!-[MBRestorePolicy isRestoringToSameDevice](self, "isRestoringToSameDevice"))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relativePathsNotToMigrate"));
      v55 = objc_msgSend(v54, "containsObject:", v45);

      if (v55)
      {
        v74 = MBGetDefaultLog(v56, v57);
        v76 = objc_claimAutoreleasedReturnValue(v74);
        v30 = 1;
        v21 = v99;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v8 = v100;
          v104 = v100;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Not restoring because this is a migrate: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Not restoring because this is a migrate: %@", v100);
        }
        else
        {
          v8 = v100;
        }
        goto LABEL_65;
      }
    }
    v58 = MBDeviceClass();
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    if ((objc_msgSend(v59, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relativePathsNotToRestoreToIPods"));
      v61 = objc_msgSend(v60, "containsObject:", v45);

      if (v61)
      {
        v75 = MBGetDefaultLog(v62, v63);
        v76 = objc_claimAutoreleasedReturnValue(v75);
        v30 = 1;
        v77 = os_log_type_enabled(v76, OS_LOG_TYPE_INFO);
        v8 = v100;
        if (v77)
        {
          *(_DWORD *)buf = 138412290;
          v104 = v100;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Not restoring because this is an iPod: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Not restoring because this is an iPod: %@", v100);
        }
        a5 = v96;
        v21 = v99;
        goto LABEL_66;
      }
    }
    else
    {

    }
    objc_autoreleasePoolPop(v43);
    ++v42;
  }
  while (v42 <= (unint64_t)v41);
  v8 = v100;
  v25 = v98;
  if (!-[MBRestorePolicy shouldRestoreSystemFile:](self, "shouldRestoreSystemFile:", v100))
  {
    LOBYTE(v24) = 0;
    v30 = 1;
    a5 = v96;
    v9 = v97;
LABEL_69:
    v21 = v99;
    goto LABEL_70;
  }
  a5 = v96;
  v9 = v97;
  if (!-[MBRestorePolicy _isForegroundRestore](self, "_isForegroundRestore"))
  {
LABEL_68:
    v30 = 1;
    LOBYTE(v24) = 1;
    goto LABEL_69;
  }
  if (!objc_msgSend(v11, "isAppDomain"))
  {
    if (!-[MBRestorePolicy _pluginsAllowForegroundRestoreFile:](self, "_pluginsAllowForegroundRestoreFile:", v100))
    {
      LOBYTE(v24) = 0;
      v30 = 1;
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  appManager = self->_appManager;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MBAppManager appWithIdentifier:](appManager, "appWithIdentifier:", v65));

  v67 = objc_msgSend(v66, "isSystemApp");
  if ((v67 & 1) != 0
    || (v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name")),
        v70 = -[MBRestorePolicy shouldForegroundRestoreDomain:](self, "shouldForegroundRestoreDomain:", v69),
        v69,
        v70))
  {
    v71 = MBGetDefaultLog(v67, v68);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v104 = v100;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Restoring system app in the foreground: %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Restoring system app in the foreground: %@", v100);
    }
    v30 = 1;
    LOBYTE(v24) = 1;
    v21 = v99;
  }
  else
  {
    v82 = objc_msgSend(v11, "isPlaceholderAppDomain");
    if ((_DWORD)v82)
    {
      v84 = MBGetDefaultLog(v82, v83);
      v72 = objc_claimAutoreleasedReturnValue(v84);
      v21 = v99;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v100;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Restoring app placeholder file in the foreground: %@", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), "Restoring app placeholder file in the foreground: %@", v100);
      }
      v30 = 1;
      LOBYTE(v24) = 1;
    }
    else
    {
      v85 = objc_msgSend(v11, "isPluginAppDomain");
      if ((_DWORD)v85)
      {
        v87 = MBGetDefaultLog(v85, v86);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v104 = v100;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "Restoring app plugin file in the background: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Restoring app plugin file in the background: %@", v100);
        }

        v89 = CFSTR("App plug-in file must be restored in the background");
      }
      else
      {
        v90 = objc_msgSend(v11, "isGroupAppDomain");
        v91 = (int)v90;
        v93 = MBGetDefaultLog(v90, v92);
        v94 = objc_claimAutoreleasedReturnValue(v93);
        v95 = os_log_type_enabled(v94, OS_LOG_TYPE_INFO);
        if (v91)
        {
          if (v95)
          {
            *(_DWORD *)buf = 138412290;
            v104 = v100;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "Restoring group container file in the background: %@", buf, 0xCu);
            _MBLog(CFSTR("INFO"), "Restoring group container file in the background: %@", v100);
          }

          v89 = CFSTR("Group container file must be restored in the background");
        }
        else
        {
          if (v95)
          {
            *(_DWORD *)buf = 138412290;
            v104 = v100;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "Restoring app file in the background: %@", buf, 0xCu);
            _MBLog(CFSTR("INFO"), "Restoring app file in the background: %@", v100);
          }

          v89 = CFSTR("App file must be restored in the background");
        }
      }
      LOBYTE(v24) = 0;
      v72 = v99;
      v30 = 6;
      v21 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 213, v89));
    }
  }

  v25 = v98;
LABEL_70:

LABEL_71:
  objc_autoreleasePoolPop(v9);
  if (v30 == 6)
  {
LABEL_72:
    if (a5)
    {
      v21 = objc_retainAutorelease(v21);
      LOBYTE(v24) = 0;
      *a5 = v21;
    }
    else
    {
      LOBYTE(v24) = 0;
    }
  }

  return v24 & 1;
}

- (BOOL)_pluginsAllowForegroundRestoreFile:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  char **v8;
  char **v9;
  char **v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  objc_class *v27;
  const char *Name;
  objc_class *v29;
  const char *v30;
  uint64_t v31;
  objc_class *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v38;
  const char *v39;
  objc_class *v40;
  const char *v41;
  NSArray *obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];

  v4 = a3;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v5)
  {
    v25 = 1;
    goto LABEL_33;
  }
  v6 = v5;
  v44 = v4;
  v7 = *(_QWORD *)v46;
  v8 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
  v9 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
  v10 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
  while (2)
  {
    v11 = 0;
    v12 = v8[314];
    v13 = v9[305];
    v14 = v10[315];
    do
    {
      if (*(_QWORD *)v46 != v7)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v11);
      if ((objc_opt_respondsToSelector(v15, v12) & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "absolutePath"));
        v17 = objc_msgSend(v15, "shouldRestoreContentWithPolicy:atPath:", self, v16);

        if ((v17 & 1) == 0)
        {
          v26 = MBGetDefaultLog(v18, v19);
          v20 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v27 = (objc_class *)objc_opt_class(v15);
            Name = class_getName(v27);
            *(_DWORD *)buf = 136446466;
            v50 = Name;
            v51 = 2112;
            v4 = v44;
            v52 = v44;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);
            v29 = (objc_class *)objc_opt_class(v15);
            v30 = class_getName(v29);
            _MBLog(CFSTR("INFO"), "Not restoring because it was refused by plugin %{public}s: %@", v30, v44);
          }
          else
          {
            v4 = v44;
          }
          goto LABEL_32;
        }
      }
      if ((objc_opt_respondsToSelector(v15, v13) & 1) == 0)
      {
        if ((objc_opt_respondsToSelector(v15, v14) & 1) == 0)
        {
          v20 = 0;
          goto LABEL_18;
        }
LABEL_14:
        v20 = objc_claimAutoreleasedReturnValue(+[MBFileInfo fileInfoWithRestorable:](MBFileInfo, "fileInfoWithRestorable:", v44));
LABEL_15:
        v23 = objc_msgSend(v15, "shouldRestoreContentWithPolicy:fileInfo:", self, v20);
        if ((v23 & 1) == 0)
        {
          v35 = MBGetDefaultLog(v23, v24);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v38 = (objc_class *)objc_opt_class(v15);
            v39 = class_getName(v38);
            *(_DWORD *)buf = 136446466;
            v50 = v39;
            v51 = 2112;
            v4 = v44;
            v52 = v44;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);
            v34 = "Not restoring because it was refused by plugin %{public}s: %@";
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        goto LABEL_18;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[MBFileInfo fileInfoWithRestorable:](MBFileInfo, "fileInfoWithRestorable:", v44));
      v21 = objc_msgSend(v15, "shouldBackgroundRestoreContentWithPolicy:fileInfo:", self, v20);
      if ((_DWORD)v21)
      {
        v31 = MBGetDefaultLog(v21, v22);
        v36 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v32 = (objc_class *)objc_opt_class(v15);
          v33 = class_getName(v32);
          *(_DWORD *)buf = 136446466;
          v50 = v33;
          v51 = 2112;
          v4 = v44;
          v52 = v44;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Restoring system file in the background (requested by plugin %{public}s: %@", buf, 0x16u);
          v34 = "Restoring system file in the background (requested by plugin %{public}s: %@";
LABEL_28:
          v40 = (objc_class *)objc_opt_class(v15);
          v41 = class_getName(v40);
          _MBLog(CFSTR("INFO"), v34, v41, v4);
LABEL_30:

LABEL_32:
          v25 = 0;
          goto LABEL_33;
        }
LABEL_29:
        v4 = v44;
        goto LABEL_30;
      }
      if ((objc_opt_respondsToSelector(v15, v14) & 1) != 0)
      {
        if (!v20)
          goto LABEL_14;
        goto LABEL_15;
      }
LABEL_18:

      v11 = (char *)v11 + 1;
    }
    while (v6 != v11);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    v8 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
    v9 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
    v10 = &selRef_relativePathsOfSystemFilesToAlwaysRestore;
    if (v6)
      continue;
    break;
  }
  v25 = 1;
  v4 = v44;
LABEL_33:

  return v25;
}

- (int64_t)restoreBehaviorForDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  int64_t v14;
  NSMutableDictionary *cachedDomainRestoreBehaviors;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFBoolean *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  const __CFBoolean *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableDictionary *v52;
  void *v53;
  CFErrorRef error;
  const __CFBoolean *propertyValueTypeRefPtr;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  CFErrorRef v62;

  v6 = a3;
  v7 = v6;
  if (self->_shouldRestoreSystemFiles
    || (objc_msgSend(v6, "isAppDomain") & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relativePathsOfSystemFilesToAlwaysRestore")),
        v8,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("/private")) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("/private/var/PersonaVolumes"));

      if ((v11 & 1) == 0)
      {
        if (a4)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, v12, CFSTR("Domain %@ has an invalid root path: %@"), v7, v13));

        }
        v14 = -1;
        goto LABEL_47;
      }
    }
    else
    {

    }
    cachedDomainRestoreBehaviors = self->_cachedDomainRestoreBehaviors;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cachedDomainRestoreBehaviors, "objectForKeyedSubscript:", v16));

    if (v17)
    {
      v14 = (int64_t)objc_msgSend(v17, "integerValue");
LABEL_46:

      goto LABEL_47;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy _localRootPathForDomain:](self, "_localRootPathForDomain:", v7));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));

    v58 = 0;
    v57 = 0;
    v20 = objc_msgSend(v19, "getResourceValue:forKey:error:", &v58, NSURLIsExcludedFromBackupKey, &v57);
    v21 = v58;
    v22 = v57;
    if (v20)
    {
      v23 = objc_msgSend(v21, "BOOLValue");
      if ((_DWORD)v23)
      {
        v25 = MBGetDefaultLog(v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v7;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not restoring domain (attribute set locally): %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Not restoring domain (attribute set locally): %@", v7);
        }

        v27 = self->_cachedDomainRestoreBehaviors;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", &off_1000E4F38, v28);

        goto LABEL_17;
      }
    }
    if (!-[MBRestorePolicy _isDriveOrMegaBackupPolicy](self, "_isDriveOrMegaBackupPolicy")
      || -[MBRestorePolicy _isEncrypted](self, "_isEncrypted")
      || -[MBRestorePolicy _isDeviceTransferEngine](self, "_isDeviceTransferEngine"))
    {
      if (!-[MBRestorePolicy _isCloudKitEngine](self, "_isCloudKitEngine"))
        goto LABEL_44;
      error = 0;
      propertyValueTypeRefPtr = 0;
      v29 = (void *)_kCFURLIsExcludedFromCloudBackupKey;
      v30 = CFURLCopyResourcePropertyForKey((CFURLRef)v19, _kCFURLIsExcludedFromCloudBackupKey, &propertyValueTypeRefPtr, &error);
      if ((_DWORD)v30)
      {
        v32 = propertyValueTypeRefPtr;
        if (propertyValueTypeRefPtr)
        {
          CFRelease(propertyValueTypeRefPtr);
          if (v32 == kCFBooleanTrue)
          {
            v35 = MBGetDefaultLog(v33, v34);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v7;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not restoring domain from iCloud (attribute set locally): %@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Not restoring domain from iCloud (attribute set locally): %@", v7);
            }
LABEL_39:

LABEL_17:
            v14 = 1;
LABEL_45:

            goto LABEL_46;
          }
        }
        goto LABEL_44;
      }
      v43 = MBGetDefaultLog(v30, v31);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
LABEL_41:
        *(_DWORD *)buf = 138543618;
        v60 = v29;
        v61 = 2112;
        v62 = error;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Error fetching value for property %{public}@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Error fetching value for property %{public}@: %@", v29, error);
      }
    }
    else
    {
      error = 0;
      propertyValueTypeRefPtr = 0;
      v29 = (void *)_kCFURLIsExcludedFromUnencryptedBackupKey;
      v45 = CFURLCopyResourcePropertyForKey((CFURLRef)v19, _kCFURLIsExcludedFromUnencryptedBackupKey, &propertyValueTypeRefPtr, &error);
      if ((_DWORD)v45)
      {
        v47 = propertyValueTypeRefPtr;
        if (propertyValueTypeRefPtr)
        {
          CFRelease(propertyValueTypeRefPtr);
          if (v47 == kCFBooleanTrue)
          {
            v50 = MBGetDefaultLog(v48, v49);
            v36 = objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v7;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not restoring domain from unencrypted iTunes backup (attribute set locally): %@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Not restoring domain from unencrypted iTunes backup (attribute set locally): %@", v7);
            }
            goto LABEL_39;
          }
        }
LABEL_44:
        v52 = self->_cachedDomainRestoreBehaviors;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", &off_1000E4F50, v53);

        v14 = 0;
        goto LABEL_45;
      }
      v51 = MBGetDefaultLog(v45, v46);
      v44 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_41;
    }

    if (error)
      CFRelease(error);
    goto LABEL_44;
  }
  v37 = -[MBRestorePolicy shouldAlwaysRestoreSystemSharedContainerDomain:](self, "shouldAlwaysRestoreSystemSharedContainerDomain:", v7);
  if (v37)
  {
    v14 = 0;
  }
  else
  {
    v39 = MBGetDefaultLog(v37, v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      *(_DWORD *)buf = 138412290;
      v60 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Not restoring system domain: %@", buf, 0xCu);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      _MBLog(CFSTR("DEFAULT"), "Not restoring system domain: %@", v42);

    }
    v14 = 1;
  }
LABEL_47:

  return v14;
}

- (int64_t)restoreBehaviorForFile:(id)a3 debugContext:(id)a4 error:(id *)a5
{
  return -[MBRestorePolicy restoreBehaviorForFile:withValidation:debugContext:error:](self, "restoreBehaviorForFile:withValidation:debugContext:error:", a3, 1, a4, a5);
}

- (int64_t)restoreBehaviorForFile:(id)a3 withValidation:(BOOL)a4 debugContext:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  uint8_t *v14;
  void *v15;
  NSObject *v16;
  _BYTE *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  size_t v30;
  NSObject *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  void *v38;
  unint64_t v39;
  void *v40;
  NSString *v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  NSObject *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  NSString *v66;
  void *v67;
  id v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  unsigned __int8 v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  NSString *v106;
  void *v107;
  uint64_t v108;
  NSString *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  NSObject *v114;
  NSString *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 v124;
  _QWORD *v125;
  NSObject *v126;
  MBRestorePolicy *v127;
  _QWORD *v128;
  void *v129;
  int v130;
  void *v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[5];
  _QWORD v141[5];
  char v142;
  uint8_t buf[4];
  NSURLResourceKey p_isa;
  __int16 v145;
  NSObject *v146;
  __int16 v147;
  void *v148;
  _BYTE v149[128];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v13 = -[MBRestorePolicy restoreBehaviorForDomain:error:](self, "restoreBehaviorForDomain:error:", v12, a6);

  if (v13)
    goto LABEL_81;
  v14 = buf;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePath"));
  v17 = -[NSObject length](v16, "length");
  if (v17 - (_BYTE *)objc_msgSend(CFSTR(".plist.1234567"), "length") >= 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject substringFromIndex:](v16, "substringFromIndex:"));
    v19 = objc_msgSend(v18, "hasPrefix:", CFSTR(".plist."));

    if (v19)
    {
      v22 = MBGetDefaultLog(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        p_isa = (NSURLResourceKey)&v16->isa;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Not restoring up failed plist safe save: %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Not restoring up failed plist safe save: %@", v16);
      }
LABEL_10:

LABEL_11:
      v13 = 1;
      goto LABEL_80;
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathExtension](v16, "pathExtension"));
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("dat")))
  {
    v25 = -[NSObject containsString:](v16, "containsString:", CFSTR("binarycookies_tmp"));

    if (v25)
    {
      v28 = MBGetDefaultLog(v26, v27);
      v23 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        p_isa = (NSURLResourceKey)&v16->isa;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Not restoring up temporary cookie: %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Not restoring up temporary cookie: %@", v16);
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  v124 = v8;
  if (v8)
  {
    if ((MBIsValidRelativePath(v16) & 1) == 0)
    {
      if (a6)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("File path is invalid: %@:%@"), v50, v16));

      }
      v13 = -1;
      goto LABEL_80;
    }
    if (-[NSObject length](v16, "length"))
    {
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootPath")));
      v30 = strlen((const char *)objc_msgSend(v29, "fileSystemRepresentation"));
      v31 = objc_retainAutorelease(v16);
      v32 = strlen((const char *)-[NSObject fileSystemRepresentation](v31, "fileSystemRepresentation")) + v30;

      if (v32 >= 0x3E6)
      {
        v74 = MBGetDefaultLog(v33, v34);
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          p_isa = (NSURLResourceKey)v15;
          v145 = 2112;
          v146 = v31;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "File path is too long and will be skipped: %@:%@", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "File path is too long and will be skipped: %@:%@", v15, v31);
        }

        goto LABEL_11;
      }
    }
  }
  v132 = -[MBRestorePolicy _isMegaBackup](self, "_isMegaBackup");
  v35 = -[MBRestorePolicy _isDriveEngine](self, "_isDriveEngine") | v132;
  v36 = -[MBRestorePolicy _isServiceEngine](self, "_isServiceEngine");
  v135 = v35;
  v37 = v35 ^ 1;
  v122 = v11;
  v123 = v10;
  if (-[MBRestorePolicy _isDriveEngine](self, "_isDriveEngine"))
    v133 = !-[MBRestorePolicy _isDeviceTransferEngine](self, "_isDeviceTransferEngine");
  else
    v133 = 0;
  v134 = v36 & v37;
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472;
  v141[2] = sub_100057890;
  v141[3] = &unk_1000D9CF0;
  v142 = v135;
  v141[4] = self;
  v127 = self;
  v128 = objc_retainBlock(v141);
  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472;
  v140[2] = sub_100057C74;
  v140[3] = &unk_1000D9D18;
  v140[4] = self;
  v125 = objc_retainBlock(v140);
  v126 = v16;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathComponents](v16, "pathComponents"));
  objc_msgSend(v38, "count");
  v39 = -1;
  v131 = v38;
  do
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subarrayWithRange:", 0, v39 + 1));
    v41 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v40));

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackup"));
    if ((objc_msgSend(v42, "containsObject:", v41) & 1) != 0)
      goto LABEL_74;
    if (v135)
    {
      v14 = (uint8_t *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToDrive"));
      if ((-[uint8_t containsObject:](v14, "containsObject:", v41) & 1) != 0)
      {

LABEL_74:
LABEL_75:
        v71 = MBGetDefaultLog(v48, v49);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        v10 = v123;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          p_isa = v41;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Skipping file %@", buf, 0xCu);
          _MBLog(CFSTR("DEBUG"), "Skipping file %@", v41);
        }

        v13 = 1;
LABEL_78:
        v11 = v122;
        v16 = v126;
        goto LABEL_79;
      }
    }
    if (v134)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToService"));
      if ((objc_msgSend(v10, "containsObject:", v41) & 1) != 0)
      {
        v43 = 1;
LABEL_40:

        if ((v135 & 1) == 0)
          goto LABEL_42;
LABEL_41:

        goto LABEL_42;
      }
    }
    if (v133)
    {
      self = (MBRestorePolicy *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToLocal"));
      if ((-[MBRestorePolicy containsObject:](self, "containsObject:", v41) & 1) != 0)
      {
        v43 = 1;
LABEL_39:

        if ((v134 & 1) != 0)
          goto LABEL_40;
        goto LABEL_49;
      }
    }
    if (v132)
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupInMegaBackup"));
      if ((objc_msgSend(v129, "containsObject:", v41) & 1) != 0)
      {
        v43 = 1;
        goto LABEL_38;
      }
    }
    v44 = v15;
    v45 = MBDeviceClass();
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("AppleTV")))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "relativePathsNotToBackupAndRestoreToAppleTVs"));
      v43 = objc_msgSend(v47, "containsObject:", v41);

      if ((v132 & 1) != 0)
      {
        v15 = v44;
        v38 = v131;
        goto LABEL_38;
      }
      v15 = v44;
      v38 = v131;
    }
    else
    {

      v43 = 0;
      if ((v132 & 1) != 0)
      {
        v15 = v44;
LABEL_38:

        if ((v133 & 1) != 0)
          goto LABEL_39;
        goto LABEL_48;
      }
      v15 = v44;
    }
    if (v133)
      goto LABEL_39;
LABEL_48:
    if (v134)
      goto LABEL_40;
LABEL_49:
    if (v135)
      goto LABEL_41;
LABEL_42:

    if ((v43 & 1) != 0)
      goto LABEL_75;

    ++v39;
  }
  while ((unint64_t)objc_msgSend(v38, "count") > v39);
  v51 = 1;
  v52 = v124;
  if (!v135)
    goto LABEL_94;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsToIgnoreExclusionsForDrive"));
  v54 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
  if (!v54)
  {
    v70 = v53;
    goto LABEL_93;
  }
  v55 = v54;
  v56 = v15;
  v57 = *(_QWORD *)v137;
  v58 = v126;
LABEL_57:
  v59 = 0;
  while (2)
  {
    if (*(_QWORD *)v137 != v57)
      objc_enumerationMutation(v53);
    v60 = *(NSObject **)(*((_QWORD *)&v136 + 1) + 8 * v59);
    v61 = -[NSObject hasSuffix:](v60, "hasSuffix:", CFSTR("/"));
    if ((_DWORD)v61)
    {
      v63 = MBGetDefaultLog(v61, v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = v64;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "name"));
          *(_DWORD *)buf = 138412546;
          p_isa = v66;
          v145 = 2112;
          v146 = v60;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", buf, 0x16u);

        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "name"));
        _MBLog(CFSTR("ERROR"), "Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", v67, v60);

        v58 = v126;
      }

LABEL_70:
      if (v55 != (id)++v59)
        continue;
      v55 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
      if (v55)
        goto LABEL_57;
      v51 = 1;
      v70 = v53;
LABEL_91:
      v15 = v56;
      v38 = v131;
      goto LABEL_92;
    }
    break;
  }
  if (!-[NSObject hasPrefix:](v58, "hasPrefix:", v60))
    goto LABEL_70;
  v68 = -[NSObject length](v58, "length");
  v69 = -[NSObject length](v60, "length");
  if (v68 != v69 && (v69 >= v68 || -[NSObject characterAtIndex:](v58, "characterAtIndex:", v69) != 47))
    goto LABEL_70;

  v78 = MBGetDefaultLog(v76, v77);
  v70 = objc_claimAutoreleasedReturnValue(v78);
  if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    v51 = 0;
    goto LABEL_91;
  }
  v70 = v70;
  v15 = v56;
  v38 = v131;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    p_isa = (NSURLResourceKey)v123;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Skipping exclusion check for %@", buf, 0xCu);
  }

  _MBLog(CFSTR("DEBUG"), "Skipping exclusion check for %@", v123);
  v51 = 0;
LABEL_92:
  v52 = v124;
LABEL_93:

LABEL_94:
  objc_msgSend(v38, "count");
  v79 = -1;
  v13 = 1;
  v130 = v51;
  while (2)
  {
    v80 = objc_autoreleasePoolPush();
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subarrayWithRange:", 0, v79 + 1));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v81));

    if (v51)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy _localRootPathForDomain:](v127, "_localRootPathForDomain:", v15));
      v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "stringByAppendingPathComponent:", v82));

      if (((unsigned int (*)(_QWORD *, NSObject *))v128[2])(v128, v84))
      {
        v85 = -[NSObject isEqualToString:](v84, "isEqualToString:", CFSTR("/var/mobile/Library/Preferences"));
        if (!(_DWORD)v85)
        {
          v104 = MBGetDefaultLog(v85, v86);
          v105 = objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            v106 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
            *(_DWORD *)buf = 138412802;
            p_isa = v106;
            v145 = 2112;
            v16 = v126;
            v146 = v126;
            v147 = 2112;
            v148 = v82;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "Not restoring file (attribute set locally): %@:%@ (%@)", buf, 0x20u);

            v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
            _MBLog(CFSTR("DEFAULT"), "Not restoring file (attribute set locally): %@:%@ (%@)", v107, v126, v82);

            goto LABEL_166;
          }
          v11 = v122;
          v16 = v126;
LABEL_174:

          goto LABEL_176;
        }
        if ((byte_1000F9E28 & 1) == 0)
        {
          byte_1000F9E28 = 1;
          v87 = MBGetDefaultLog(v85, v86);
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = v15;
            v90 = v88;
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_isa = NSURLIsExcludedFromBackupKey;
              v145 = 2112;
              v146 = v84;
              _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Found %@ at %@ - ignoring", buf, 0x16u);
            }

            _MBLog(CFSTR("DEFAULT"), "Found %@ at %@ - ignoring", NSURLIsExcludedFromBackupKey, v84);
            v15 = v89;
            v52 = v124;
          }

          v51 = v130;
        }
      }

    }
    if (!v52)
    {
      v38 = v131;
      goto LABEL_114;
    }
    v38 = v131;
    if ((unint64_t)objc_msgSend(v131, "count") > v79 + 1)
    {
      v91 = ((uint64_t (*)(_QWORD *, void *, void *))v125[2])(v125, v15, v82);
      if ((_DWORD)v91)
      {
        v108 = MBGetDefaultLog(v91, v92);
        v84 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v109 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          *(_DWORD *)buf = 138412546;
          p_isa = v109;
          v145 = 2112;
          v16 = v126;
          v146 = v126;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Not restoring file (path contains a symlink): %@:%@", buf, 0x16u);

          v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          _MBLog(CFSTR("DEFAULT"), "Not restoring file (path contains a symlink): %@:%@", v105, v126);
LABEL_166:
          v11 = v122;
          goto LABEL_174;
        }
        v11 = v122;
        v16 = v126;
LABEL_176:

        objc_autoreleasePoolPop(v80);
        v13 = 1;
        v10 = v123;
        goto LABEL_79;
      }
    }
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsToRestore"));
    if (objc_msgSend(v93, "containsObject:", v82))
    {
LABEL_112:

      v13 = 0;
      goto LABEL_114;
    }
    if (v134)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsToRestoreOnlyFromService"));
      v121 = v94;
      if (objc_msgSend(v94, "containsObject:", v82))
      {

        goto LABEL_112;
      }
    }
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsToBackupToDriveAndStandardAccount"));
    if ((objc_msgSend(v95, "containsObject:", v82) & 1) != 0)
    {
      v96 = 1;
      goto LABEL_120;
    }
    if (objc_msgSend(v15, "isExternalConfig"))
    {
      v96 = objc_msgSend(v15, "hasExternalConfig") ^ 1;
LABEL_120:

      if ((v134 & 1) != 0)
      if ((v96 & 1) != 0)
      {
        v13 = 0;
        v52 = v124;
        goto LABEL_114;
      }
    }
    else
    {

      if (v134)
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackup"));
    if ((objc_msgSend(v97, "containsObject:", v82) & 1) != 0)
    {
LABEL_131:

      v52 = v124;
      goto LABEL_154;
    }
    if (v135)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToDrive"));
      v119 = v98;
      if (objc_msgSend(v98, "containsObject:", v82))
      {

        goto LABEL_131;
      }
    }
    v52 = v124;
    if (v134)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToService"));
      if ((objc_msgSend(v120, "containsObject:", v82) & 1) != 0)
      {
        v99 = 1;
        goto LABEL_147;
      }
    }
    if (v133)
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupToLocal"));
      if ((objc_msgSend(v117, "containsObject:", v82) & 1) != 0)
      {
        v99 = 1;
        goto LABEL_146;
      }
    }
    if (v132)
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupInMegaBackup"));
      if ((objc_msgSend(v118, "containsObject:", v82) & 1) != 0)
      {
        v99 = 1;
        goto LABEL_145;
      }
    }
    v100 = MBDeviceClass();
    v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
    if (objc_msgSend(v101, "isEqualToString:", CFSTR("AppleTV")))
    {
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePathsNotToBackupAndRestoreToAppleTVs"));
      v99 = objc_msgSend(v102, "containsObject:", v82);

      if ((v132 & 1) != 0)
      {
        v38 = v131;
        goto LABEL_145;
      }
      v38 = v131;
LABEL_149:
      if (!v133)
        goto LABEL_150;
LABEL_146:

      if ((v134 & 1) != 0)
      {
LABEL_147:
        v103 = v120;
        goto LABEL_151;
      }
LABEL_156:
      if (!v135)
        goto LABEL_153;
LABEL_152:

      goto LABEL_153;
    }

    v99 = 0;
    if (!v132)
      goto LABEL_149;
LABEL_145:

    if ((v133 & 1) != 0)
      goto LABEL_146;
LABEL_150:
    v103 = v120;
    if (!v134)
      goto LABEL_156;
LABEL_151:
    v120 = v103;

    if ((v135 & 1) != 0)
      goto LABEL_152;
LABEL_153:

    if ((v99 & 1) != 0)
LABEL_154:
      v13 = 1;
    v51 = v130;
LABEL_114:

    objc_autoreleasePoolPop(v80);
    if ((unint64_t)objc_msgSend(v38, "count") > ++v79)
      continue;
    break;
  }
  if (!v52)
  {
    v13 = 0;
    v10 = v123;
    goto LABEL_78;
  }
  v10 = v123;
  v11 = v122;
  v16 = v126;
  if ((objc_msgSend(v123, "type") & 0xF000) == 0x4000)
  {
    v13 = 0;
  }
  else if (v13 == 1)
  {
    v110 = objc_msgSend(v122, "setFlag:", CFSTR("RestorePathNotInSetOfPathsToBackup"));
    v112 = MBGetDefaultLog(v110, v111);
    v113 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      v114 = v113;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        v115 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        *(_DWORD *)buf = 138412546;
        p_isa = v115;
        v145 = 2112;
        v146 = v126;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Not restoring file (skipped): %@:%@", buf, 0x16u);

      }
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      _MBLog(CFSTR("DEFAULT"), "Not restoring file (skipped): %@:%@", v116, v126);

    }
    v13 = 1;
  }
LABEL_79:

LABEL_80:
LABEL_81:

  return v13;
}

- (id)_localRootPathForDomain:(id)a3
{
  id v4;
  void *v5;
  MBAppManager *appManager;
  void *v7;
  void *v8;
  uint64_t v9;
  MBAppManager *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (!self->_appManager)
    goto LABEL_9;
  if (objc_msgSend(v4, "isSystemContainerDomain"))
  {
    appManager = self->_appManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v7));
    v9 = objc_claimAutoreleasedReturnValue(-[MBAppManager systemDataContainerWithIdentifier:](appManager, "systemDataContainerWithIdentifier:", v8));
    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "isSystemSharedContainerDomain"))
  {
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootPath"));
    goto LABEL_12;
  }
  v10 = self->_appManager;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v7));
  v9 = objc_claimAutoreleasedReturnValue(-[MBAppManager systemSharedContainerWithIdentifier:](v10, "systemSharedContainerWithIdentifier:", v8));
LABEL_6:
  v11 = (void *)v9;

  if (v11
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain")),
        v13 = objc_msgSend(v12, "hasRootPath"),
        v12,
        (v13 & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootPath"));

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootPath"));
  }

LABEL_12:
  return v15;
}

- (id)deprecated_validateFile:(id)a3 debugContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char valid;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  int v18;
  char v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  MBError *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
  valid = MBIsValidRelativePath(v8);

  if ((valid & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("File path is invalid: %@:%@"), v13, v14));
LABEL_58:

    goto LABEL_59;
  }
  v10 = -[MBRestorePolicy _isMegaBackup](self, "_isMegaBackup");
  v11 = -[MBRestorePolicy _isDriveEngine](self, "_isDriveEngine");
  if (-[MBRestorePolicy _isDriveEngine](self, "_isDriveEngine"))
    v48 = !-[MBRestorePolicy _isDeviceTransferEngine](self, "_isDeviceTransferEngine");
  else
    v48 = 0;
  v16 = -[MBRestorePolicy _isServiceEngine](self, "_isServiceEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "relativePathsToRestore"));
  if ((objc_msgSend(v14, "containsObject:", v12) & 1) != 0)
  {
    v15 = 0;
    goto LABEL_58;
  }
  v34 = v7;
  v17 = v11 | v10;
  v18 = v16 & ((v11 | v10) ^ 1);
  v39 = v10;
  while (1)
  {
    if (v18)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "relativePathsToRestoreOnlyFromService"));
      if ((objc_msgSend(v46, "containsObject:", v12) & 1) != 0)
      {
        v19 = 1;
        goto LABEL_20;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "relativePathsToBackupToDriveAndStandardAccount"));
      if ((objc_msgSend(v40, "containsObject:", v12) & 1) != 0)
      {
        v19 = 1;
LABEL_19:

LABEL_20:
        if ((v19 & 1) != 0)
          goto LABEL_60;
        goto LABEL_21;
      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (!objc_msgSend(v20, "isExternalConfig"))
    {

      if (!v18)
      {

        goto LABEL_21;
      }
      v19 = 0;
      goto LABEL_19;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v22 = objc_msgSend(v21, "hasExternalConfig");

    if ((v18 & 1) != 0)
    {
      v19 = v22 ^ 1;
      v10 = v39;
      goto LABEL_19;
    }

    v10 = v39;
    if ((v22 & 1) == 0)
      goto LABEL_60;
LABEL_21:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "relativePathsNotToBackup"));
    if ((objc_msgSend(v24, "containsObject:", v12) & 1) != 0)
    {

LABEL_53:
      v7 = v34;
      objc_msgSend(v34, "setFlag:", CFSTR("RestorePathInSetOfPathsNotToBackup"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
      v32 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("File path in set of paths not to back up: %@:%@"), v14, v31);
LABEL_57:
      v15 = (void *)objc_claimAutoreleasedReturnValue(v32);

      goto LABEL_58;
    }
    if (v17)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "relativePathsNotToBackupToDrive"));
      if ((objc_msgSend(v44, "containsObject:", v12) & 1) != 0)
      {
        LOBYTE(v25) = 1;
LABEL_39:

        if ((v25 & 1) != 0)
          goto LABEL_53;
        goto LABEL_49;
      }
    }
    if (v18)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "relativePathsNotToBackupToService"));
      if ((objc_msgSend(v42, "containsObject:", v12) & 1) != 0)
      {
        v25 = 1;
LABEL_38:

        if ((v17 & 1) != 0)
          goto LABEL_39;
        goto LABEL_48;
      }
    }
    if (v48)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "relativePathsNotToBackupToLocal"));
      if ((objc_msgSend(v37, "containsObject:", v12) & 1) != 0)
      {
        v25 = 1;
LABEL_37:

        if ((v18 & 1) != 0)
          goto LABEL_38;
        goto LABEL_47;
      }
    }
    if (v10)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "relativePathsNotToBackupInMegaBackup"));
      if ((objc_msgSend(v35, "containsObject:", v12) & 1) != 0)
      {
        v25 = 1;
LABEL_36:

        if ((v48 & 1) != 0)
          goto LABEL_37;
        goto LABEL_46;
      }
    }
    v26 = MBDeviceClass();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("AppleTV")))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "relativePathsNotToBackupAndRestoreToAppleTVs"));
      v25 = objc_msgSend(v29, "containsObject:", v12);

      v10 = v39;
      if ((v39 & 1) != 0)
        goto LABEL_36;
    }
    else
    {

      v25 = 0;
      if ((v10 & 1) != 0)
        goto LABEL_36;
    }
    if (v48)
      goto LABEL_37;
LABEL_46:
    if (v18)
      goto LABEL_38;
LABEL_47:
    if (v17)
      goto LABEL_39;
LABEL_48:

    if (v25)
      goto LABEL_53;
LABEL_49:
    if (!objc_msgSend(v12, "length"))
      break;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByDeletingLastPathComponent"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "relativePathsToRestore"));
    v12 = (void *)v30;
    if ((objc_msgSend(v14, "containsObject:", v30) & 1) != 0)
    {
      v15 = 0;
      v12 = (void *)v30;
      v7 = v34;
      goto LABEL_58;
    }
  }
  if ((objc_msgSend(v6, "type") & 0xF000) != 0x4000 || objc_msgSend(v12, "length"))
  {
    v7 = v34;
    objc_msgSend(v34, "setFlag:", CFSTR("RestorePathNotInSetOfPathsToBackup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v32 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("File path not in set of paths to back up: %@:%@"), v14, v31);
    goto LABEL_57;
  }
LABEL_60:
  v15 = 0;
  v7 = v34;
LABEL_59:

  return v15;
}

- (id)validateRestoreDomain:(id)a3 relativePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v28;
  int *v29;
  stat v31;
  const char *v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("/private")) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
    v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("/private/var/PersonaVolumes"));

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, v11, CFSTR("Domain %@ has an invalid root path: %@"), v6, v12));

      goto LABEL_24;
    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v7));

  v16 = objc_retainAutorelease(v15);
  if (strlen((const char *)objc_msgSend(v16, "fileSystemRepresentation")) >= 0x3E6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, v16, CFSTR("Cannot restore file with path name that is too long")));
    goto LABEL_23;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));

  if (!objc_msgSend(v17, "length"))
  {
    v13 = 0;
    v7 = v17;
    goto LABEL_23;
  }
  v7 = v17;
  while (1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBRestorePolicy persona](self, "persona"));
    v19 = sub_100057D4C(v6, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v7));

    v33 = 0;
    v32 = 0;
    objc_msgSend(v21, "mb_splitIntoBase:andRelativePath:", &v33, &v32);
    memset(&v31, 0, sizeof(v31));
    v22 = fstatat(v33, v32, &v31, 32);
    if ((v33 & 0x80000000) == 0)
      close(v33);
    if (v22)
      break;
    if ((~v31.st_mode & 0xA000) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, v21, CFSTR("Restore path parent directory is a symlink")));
      goto LABEL_22;
    }
LABEL_15:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));

    v7 = v23;
    if (!objc_msgSend(v23, "length"))
    {
      v13 = 0;
      v7 = v23;
      goto LABEL_23;
    }
  }
  if (*__error() == 2)
    goto LABEL_15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v21, CFSTR("lstat error")));
  v25 = MBGetDefaultLog(v13, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v28 = *__error();
    *(_DWORD *)buf = 138412546;
    v35 = v21;
    v36 = 1024;
    v37 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", buf, 0x12u);
    v29 = __error();
    _MBLog(CFSTR("ERROR"), "lstat failed at %@: %{errno}d", v21, *v29);
  }

LABEL_22:
LABEL_23:

LABEL_24:
  return v13;
}

- (BOOL)shouldAlwaysRestoreSystemSharedContainerDomain:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "isSystemSharedContainerDomain"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SysSharedContainerDomain-systemgroup.com.apple.configurationprofiles"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)notifyPluginsStartingRestoreWithEngine:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MBError *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_plugins, "objectEnumerator"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058994;
  v10[3] = &unk_1000D9D40;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  v7 = sub_1000397BC(v6, v5, "startingRestoreWithPolicy:engine:", (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)notifyPluginsPreparingRestoreWithEngine:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MBError *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_plugins, "objectEnumerator"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058A50;
  v10[3] = &unk_1000D9D40;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  v7 = sub_1000397BC(v6, v5, "preparingRestoreWithPolicy:engine:", (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)notifyPluginsEndingRestoreWithEngine:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MBError *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_plugins, "reverseObjectEnumerator"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058B0C;
  v10[3] = &unk_1000D9D40;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  v7 = sub_1000397BC(v6, v5, "endingRestoreWithPolicy:engine:", (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)notifyPluginsEndedRestoreWithEngine:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  MBError *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_plugins, "reverseObjectEnumerator"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058BF4;
  v14[3] = &unk_1000D9D68;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = sub_1000397BC(v10, v8, "endedRestoreWithPolicy:engine:error:", (uint64_t)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (MBPersona)persona
{
  return self->_persona;
}

- (MBServiceRestoreMode)serviceRestoreMode
{
  return self->_serviceRestoreMode;
}

- (NSString)osBuildVersionOfBackup
{
  return self->_osBuildVersionOfBackup;
}

- (BOOL)shouldCreateMissingIntermediateDirectories
{
  return self->_shouldCreateMissingIntermediateDirectories;
}

- (BOOL)isRestoringPrimaryAccount
{
  return self->_isRestoringPrimaryAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBuildVersionOfBackup, 0);
  objc_storeStrong((id *)&self->_serviceRestoreMode, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_domainNamesToForegroundInstall, 0);
  objc_storeStrong((id *)&self->_cachedDomainRestoreBehaviors, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_destroyWeak((id *)&self->_enginePolicyProvider);
}

@end
