@implementation MBDataMigratorPlugin

- (id)preparingBackupWithEngine:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;

  v3 = a3;
  if (objc_msgSend(v3, "backsUpPrimaryAccount"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v5 = objc_msgSend(v4, "isPasscodeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "properties"));
    objc_msgSend(v6, "setPasscodeSet:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = objc_msgSend(v7, "fileExistsAtPath:", CFSTR("/var/root/Library/Caches/Backup"));
    if ((_DWORD)v8)
    {
      v10 = MBGetDefaultLog(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = CFSTR("/var/root/Library/Caches/Backup");
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Removing %{public}@", CFSTR("/var/root/Library/Caches/Backup"));
      }

      v19 = 0;
      v12 = objc_msgSend(v7, "removeItemAtPath:error:", CFSTR("/var/root/Library/Caches/Backup"), &v19);
      v13 = v19;
      v15 = v13;
      if ((v12 & 1) == 0)
      {
        v16 = MBGetDefaultLog(v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v21 = CFSTR("/var/root/Library/Caches/Backup");
          v22 = 2114;
          v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %{public}@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to remove %{public}@: %{public}@", CFSTR("/var/root/Library/Caches/Backup"), v15);
        }

      }
    }

  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDataMigratorPlugin _updateMobileBackupPreferencesWithEngine:](self, "_updateMobileBackupPreferencesWithEngine:", v7));
  if (!v8)
  {
    if (objc_msgSend(v7, "restoresPrimaryAccount"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:](self, "_setDMContextWithPolicy:engine:", v6, v7));
      if (!v8)
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDataMigratorPlugin _restoreDefaultsWithEngine:](self, "_restoreDefaultsWithEngine:", v7));
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_setDMContextWithPolicy:(id)a3 engine:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  __CFString *v22;
  unsigned int v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  uint8_t buf[4];
  id v53;
  _QWORD v54[8];
  _QWORD v55[8];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settingsContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "properties"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceName"));
  v10 = objc_msgSend(v5, "isRestoringToSameDevice");
  v46 = (void *)v9;
  if ((v10 & 1) != 0)
  {
    v51 = CFSTR("same device");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceID"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\" (%@ %@)"), v9, v11, v12));

  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buildVersion"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
  v14 = objc_msgSend(v7, "shouldPreserveSettings");
  v15 = objc_msgSend(v8, "wasPasscodeSet");
  v16 = objc_msgSend(v6, "isServiceEngine");
  v17 = objc_msgSend(v6, "isDeviceTransferEngine");
  v48 = v6;
  if ((v17 & 1) != 0)
    v18 = 0;
  else
    v18 = objc_msgSend(v6, "isDriveEngine");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buildVersion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productType"));
  v49 = v5;
  v47 = v7;
  if ((_DWORD)v17)
  {
    if ((_DWORD)v16)
      sub_1000888F0();
    if ((_DWORD)v18)
      sub_100088918();
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Restored from a %@ backup of %@ created using %@ at %@"), CFSTR("D2D"), v51, v13, v50));
  }
  else
  {
    if ((v16 & v18) == 1)
      sub_100088968();
    v20 = v14;
    if ((v16 & 1) != 0)
    {
      v21 = v15;
      v22 = CFSTR("iCloud");
    }
    else
    {
      if (!(_DWORD)v18)
        goto LABEL_38;
      v21 = v15;
      v23 = objc_msgSend(v8, "encrypted");
      v24 = CFSTR("unencrypted");
      if (v23)
        v24 = CFSTR("encrypted");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ iTunes"), v24));
      if (!v22)
LABEL_38:
        sub_1000889B8();
    }
    v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Restored from an %@ backup of %@ created using %@ at %@"), v22, v51, v13, v50));

    v19 = v25;
    v15 = v21;
    v14 = v20;
  }
  if (!v19)
    sub_100088940();
  v43 = (void *)v13;
  v54[0] = CFSTR("Reason");
  v54[1] = CFSTR("DidRestoreFromBackup");
  v42 = (void *)v19;
  v55[0] = v19;
  v55[1] = &__kCFBooleanTrue;
  v54[2] = CFSTR("DidMigrateBackupFromDifferentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10 ^ 1));
  v55[2] = v26;
  v54[3] = CFSTR("ShouldPreserveSettingsAfterRestore");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
  v55[3] = v27;
  v54[4] = CFSTR("WasPasscodeSetInBackup");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
  v55[4] = v28;
  v54[5] = CFSTR("RestoreFromBackupSourceiTunes");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18));
  v55[5] = v29;
  v54[6] = CFSTR("RestoreFromBackupSourceDeviceToDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17));
  v55[6] = v30;
  v54[7] = CFSTR("DidRestoreFromCloudBackup");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
  v55[7] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 8));
  v33 = objc_msgSend(v32, "mutableCopy");

  if (v45)
    v34 = objc_msgSend(v33, "setObject:forKeyedSubscript:", v45, CFSTR("RestoredBackupBuildVersion"));
  if (v44)
    v34 = objc_msgSend(v33, "setObject:forKeyedSubscript:", v44, CFSTR("RestoredBackupProductType"));
  v35 = MBDeviceUUID(v34);
  v36 = (id)objc_claimAutoreleasedReturnValue(v35);
  v38 = v36;
  if (v36)
    v36 = objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("BackupDeviceUUID"));
  if (v46)
    v36 = objc_msgSend(v33, "setObject:forKeyedSubscript:", v46, CFSTR("RestoredBackupDeviceName"));
  if ((_DWORD)v16)
  {
    v36 = objc_msgSend(v48, "backupPolicy");
    if (v36 == (id)1)
      v36 = objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("RestoredBackupIsMegaBackup"));
  }
  v39 = MBGetDefaultLog(v36, v37);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v33;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Setting data migration context: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Setting data migration context: %@", v33);
  }

  DMSetContext(v33);
  return 0;
}

- (void)_updateDeviceTransferInfoWithPlist:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0));
  v5 = objc_msgSend(v4, "copyPreferencesValueForKey:class:", CFSTR("DeviceTransferInfo"), objc_opt_class(NSDictionary));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RestoreStartDate")));
    if (v8)
    {
      v9 = objc_opt_class(NSDate);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v10, "timeIntervalSinceDate:", v8);
        v12 = (uint64_t)v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v12));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("RestoreDuration"));

      }
    }
    v14 = objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DeviceTransferInfo"));
    v16 = MBGetDefaultLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = CFSTR("DeviceTransferInfo");
      v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updated \"%{public}@\": %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Updated \"%{public}@\": %@", CFSTR("DeviceTransferInfo"), v7);
    }

  }
}

- (id)_updateMobileBackupPreferencesWithEngine:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  id v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  unsigned __int8 v54;
  id v55;
  void *v56;
  unsigned __int8 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  unsigned __int8 v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  MBDataMigratorPlugin *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  void *v112;
  _BYTE v113[128];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persona"));
  if (!v6)
    sub_1000889E0();
  v7 = (void *)v6;
  v92 = self;
  v95 = (void *)v6;
  v96 = v4;
  if (objc_msgSend(v4, "restoresPrimaryAccount"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userIncompleteRestoreDirectory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBackup.plist")));

    v10 = v9;
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v10));
    if (v11)
    {
      v13 = (void *)v11;
      v93 = 0;
      v94 = v5;
      v97 = v10;
      v98 = v10;
      goto LABEL_17;
    }
    v18 = MBGetDefaultLog(0, v12);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v110 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MobileBackup preferences not found in backup at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "MobileBackup preferences not found in backup at %{public}@", v10);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedIncompleteRestoreDirectory"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("/var/root/Library/Preferences/com.apple.MobileBackup.plist")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v21));
    v98 = (void *)v21;
    v22 = objc_msgSend(v5, "removeItemAtPath:error:", v21, 0);
    v24 = MBGetDefaultLog(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v110 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Trying to find MobileBackup preferences at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Trying to find MobileBackup preferences at %{public}@", v21);
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferencesDirectory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("com.apple.MobileBackup.plist")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v15));
    v16 = v15;
    v10 = v16;
    v98 = v16;
  }
  v97 = v10;
  if (v13)
  {
    v93 = 0;
    v94 = v5;
  }
  else
  {
    v26 = MBGetDefaultLog(v16, v17);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v110 = (uint64_t)v98;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "MobileBackup preferences not found in backup at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "MobileBackup preferences not found in backup at %{public}@", v98);
    }

    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent"));
    v116[0] = NSFileOwnerAccountName;
    v116[1] = NSFileGroupOwnerAccountName;
    v117[0] = CFSTR("mobile");
    v117[1] = CFSTR("mobile");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 2));
    v107 = 0;
    v30 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, v29, &v107);
    v31 = v107;

    if ((v30 & 1) == 0)
    {
      v49 = +[MBError codeForNSError:](MBError, "codeForNSError:", v31);
      if ((_DWORD)v49 != 3)
        goto LABEL_50;
      v51 = MBGetDefaultLog(v49, v50);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      v53 = v97;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v110 = (uint64_t)v28;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Removing existing file at %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Removing existing file at %@", v28);
      }

      v106 = v31;
      v54 = objc_msgSend(v5, "removeItemAtPath:error:", v28, &v106);
      v55 = v106;

      if ((v54 & 1) == 0)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 1, v55, v28, CFSTR("Error removing file")));
        v44 = v95;
        v31 = v55;
        goto LABEL_75;
      }
      v114[0] = NSFileOwnerAccountName;
      v114[1] = NSFileGroupOwnerAccountName;
      v115[0] = CFSTR("mobile");
      v115[1] = CFSTR("mobile");
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 2));
      v105 = v55;
      v57 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, v56, &v105);
      v31 = v105;

      if ((v57 & 1) == 0)
      {
LABEL_50:
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 1, v31, v28, CFSTR("Error creating directory")));
        v44 = v95;
        v53 = v97;
        goto LABEL_75;
      }
    }
    v94 = v5;

    v93 = v31;
    v13 = v99;
  }
LABEL_17:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("DebugContext"), CFSTR("Options"), CFSTR("DisabledDomains"), CFSTR("AllowiTunesBackup"), CFSTR("EnableBackupScheduling"), CFSTR("BackupEnabledForMegaBackup"), CFSTR("SyncSettingsEnabledForMegaBackup"), CFSTR("BackupDomainsEnabledForMegaBackup"), CFSTR("EnableBackupOnCellular"), CFSTR("MegaBackupTurnOnAllAppsSync"), CFSTR("MegaBackupTurnOniCloudBackup"), CFSTR("SyncSettingsEnabledForMegaBackup"), CFSTR("MegaBackupEntryPoint"), CFSTR("MegaBackupFlowStartDate"), CFSTR("EnterPrebuddyUIDateDelta"), CFSTR("InitialMegaBackupStartDateDelta"),
                    CFSTR("InitialMegaBackupFinishedDateDelta"),
                    CFSTR("RestoreAfterMegaBackupDateDelta"),
                    CFSTR("RestoreFinishedAfterMegaBackupDateDelta"),
                    CFSTR("MegaBackupRefreshDelta"),
                    CFSTR("PrebuddyFlowStep"),
                    CFSTR("MegaBackupSourceDeviceUUID"),
                    0));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v99 = v13;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v102 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
        v38 = objc_msgSend(v28, "containsObject:", v37);
        v39 = (int)v38;
        v41 = MBGetDefaultLog(v38, v40);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        if (v39)
        {
          if (v43)
          {
            *(_DWORD *)buf = 138543362;
            v110 = (uint64_t)v37;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Restoring MobileBackup preference: %{public}@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Restoring MobileBackup preference: %{public}@", v37);
          }

        }
        else
        {
          if (v43)
          {
            *(_DWORD *)buf = 138543362;
            v110 = (uint64_t)v37;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Not restoring MobileBackup preference: %{public}@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Not restoring MobileBackup preference: %{public}@", v37);
          }

          objc_msgSend(v99, "removeObjectForKey:", v37);
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
    }
    while (v34);
  }

  v4 = v96;
  v44 = v95;
  if (objc_msgSend(v96, "isCloudKitEngine"))
  {
    if (objc_msgSend(v96, "conformsToProtocol:", &OBJC_PROTOCOL___MBHasServiceAccount))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "serviceAccount"));

      if (v45)
      {
        if (objc_msgSend(v96, "restoresPrimaryAccount"))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "userIncompleteRestoreDirectory"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "skippedFileRecordsPlistPath"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringByAppendingPathComponent:", v47));

        }
        else
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "skippedFileRecordsPlistPath"));
        }
        v58 = objc_msgSend(v94, "fileExistsAtPath:", v48);
        if ((_DWORD)v58)
        {
          v60 = MBGetDefaultLog(v58, v59);
          v61 = objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v110 = (uint64_t)v48;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Copying skipped file records plist (%@) to preferences", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Copying skipped file records plist (%@) to preferences", v48);
          }

          v62 = v48;
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v62));
          if (v64)
          {
            v108 = 0;
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v64, 0, 0, &v108));
            v66 = v108;
            v68 = v66;
            if (!v65 || v66)
            {
              v72 = MBGetDefaultLog(v66, v67);
              v73 = objc_claimAutoreleasedReturnValue(v72);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v110 = (uint64_t)v68;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "NSPropertyListSerialization failed %@", buf, 0xCu);
                _MBLog(CFSTR("ERROR"), "NSPropertyListSerialization failed %@", v68);
              }

              v69 = 0;
            }
            else
            {
              v69 = v65;
            }

          }
          else
          {
            v71 = MBGetDefaultLog(0, v63);
            v68 = objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v110 = (uint64_t)v62;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "dataWithContentsOfFile returned nil for path %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "dataWithContentsOfFile returned nil for path %@", v62);
            }
            v69 = 0;
          }

          if (v69)
            objc_msgSend(v99, "setObject:forKeyedSubscript:", v69, CFSTR("RestoredFilesSkippedFromBackup"));
          v100 = 0;
          v74 = objc_msgSend(v94, "removeItemAtPath:error:", v62, &v100);
          v75 = v100;
          v77 = v75;
          if ((v74 & 1) == 0)
          {
            v78 = MBGetDefaultLog(v75, v76);
            v79 = objc_claimAutoreleasedReturnValue(v78);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v110 = (uint64_t)v62;
              v111 = 2112;
              v112 = v77;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to remove skipped file records plist %@ %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), "Failed to remove skipped file records plist %@ %@", v62, v77);
            }

          }
        }

      }
    }
  }
  v80 = objc_alloc_init((Class)MBRestoreInfo);
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v80, "setDate:", v81);

  objc_msgSend(v80, "setWasCloudRestore:", objc_msgSend(v96, "isServiceEngine"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "properties"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "buildVersion"));
  objc_msgSend(v80, "setBackupBuildVersion:", v83);

  v84 = MBBuildVersion();
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
  objc_msgSend(v80, "setDeviceBuildVersion:", v85);

  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "dictionaryRepresentation"));
  objc_msgSend(v99, "setObject:forKeyedSubscript:", v86, CFSTR("RestoreInfo"));

  v87 = objc_msgSend(v96, "isDeviceTransferEngine");
  v5 = v94;
  if ((_DWORD)v87)
    v87 = -[MBDataMigratorPlugin _updateDeviceTransferInfoWithPlist:](v92, "_updateDeviceTransferInfoWithPlist:", v99);
  v89 = MBGetDefaultLog(v87, v88);
  v90 = objc_claimAutoreleasedReturnValue(v89);
  v53 = v97;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v110 = (uint64_t)v97;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Writing out trimmed MobileBackup plist at %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Writing out trimmed MobileBackup plist at %@", v97);
  }

  if ((objc_msgSend(v99, "writeToFile:atomically:", v97, 1) & 1) != 0)
    v70 = 0;
  else
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, v98, CFSTR("Error saving MobileBackup preferences")));

  v31 = v93;
LABEL_75:

  return v70;
}

- (id)_restoreDefaultsWithEngine:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uid_t v28;
  gid_t v29;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v33 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "persona"));
  v4 = objc_msgSend(v3, "copyPreferencesValueForKey:class:", CFSTR("RestoredDefaults"), objc_opt_class(NSDictionary));

  if (v4)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v31 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      v9 = &AnalyticsSendEventLazy_ptr;
      v32 = v5;
      do
      {
        v10 = 0;
        v34 = v7;
        do
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
          v13 = objc_opt_class(v9[229]);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":")));
            v15 = objc_msgSend(v14, "count");
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
            v18 = (__CFString *)v16;
            if (v15 == (id)1)
            {
              v19 = CFSTR(".GlobalPreferences");
            }
            else
            {
              v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
              v19 = v18;
              v18 = (__CFString *)v16;
            }
            v20 = MBGetDefaultLog(v16, v17);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v40 = v19;
              v41 = 2112;
              v42 = v11;
              v43 = 2112;
              v44 = v12;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Restoring default %@ %@ = %@", buf, 0x20u);
              _MBLog(CFSTR("DEFAULT"), "Restoring default %@ %@ = %@", v19, v11, v12);
            }

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "persona"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userRestoreDirectory"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("/var/mobile/Library/Preferences/%@.plist"), v19));

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v24));
            if (!v25)
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v12, v18);
            objc_msgSend(v25, "writeToFile:atomically:", v24, 1);
            v26 = objc_retainAutorelease(v24);
            v27 = (const char *)objc_msgSend(v26, "fileSystemRepresentation");
            v28 = MBMobileUID();
            v29 = MBMobileUID();
            lchown(v27, v28, v29);

            v5 = v32;
            v9 = &AnalyticsSendEventLazy_ptr;
            v7 = v34;
          }

          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v7);
    }

    v4 = v31;
  }

  return 0;
}

@end
