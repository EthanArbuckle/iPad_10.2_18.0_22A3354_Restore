@implementation MSDDomainsPlistPatcher

+ (id)patchDomainsPlist:(id)a3
{
  id v3;
  int has_internal_content;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  id v77;
  id v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  id v84;
  id v85;
  NSObject *v86;
  id v87;
  id v88;
  NSObject *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  uint8_t buf[16];
  uint8_t v103[16];

  v3 = a3;
  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));
  v6 = v5;
  if (!v5)
  {
    v62 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10002C3E4((uint64_t)v3, v7);
    goto LABEL_141;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SystemDomains")));
  if (!v7 || (v8 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    v60 = sub_100024A40();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v103 = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", v103, 2u);
    }

    goto LABEL_141;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("CameraRollDomain")));
  v101 = v3;
  if (!v9 || (v10 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v13 = 0;
      goto LABEL_16;
    }
    v63 = sub_100024A40();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_10002C458();

LABEL_140:
LABEL_141:
    v58 = 0;
    goto LABEL_116;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsNotToBackup")));
  if (!v11 || (v12 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v11, v12) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_12;
    v75 = sub_100024A40();
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      sub_10002C84C();

    goto LABEL_140;
  }
  objc_msgSend(v11, "removeObject:", CFSTR("Media/PhotoData/Sync"));
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("CameraRollDomain"));
LABEL_12:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore")));

  if (v13 && (v14 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    objc_msgSend(v13, "removeObject:", CFSTR("Media/PhotoData/Sync"));
    objc_msgSend(v13, "removeObject:", CFSTR("Media/PhotoData/Metadata/PhotoData/Sync"));
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsToRemoveOnRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("CameraRollDomain"));
  }
  else if (has_internal_content)
  {
    v77 = sub_100024A40();
    v66 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_10002C878();
    goto LABEL_159;
  }
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HomeKitDomain")));

  if (v15)
  {
    v16 = objc_opt_class(NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore")));

      if ((v17 || (v17 = objc_alloc_init((Class)NSMutableArray)) != 0)
        && (v18 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v17, v18) & 1) != 0))
      {
        objc_msgSend(v17, "addObject:", CFSTR("Library/homed/protected-home.config"));
        objc_msgSend(v17, "addObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v17, "addObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v17, "addObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("RelativePathsToRemoveOnRestore"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v100 = sub_100024A40();
        v83 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          sub_10002C770();
        goto LABEL_190;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsNotToBackupToService")));

      if (v13 && (v19 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v19) & 1) != 0))
      {
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("RelativePathsNotToBackupToService"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v78 = sub_100024A40();
        v79 = objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          sub_10002C79C();
LABEL_153:

LABEL_191:
        goto LABEL_187;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsNotToBackupInMegaBackup")));

      if (v20 && (v21 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v20, v21) & 1) != 0))
      {
        objc_msgSend(v20, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v20, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v20, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("RelativePathsNotToBackupInMegaBackup"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v80 = sub_100024A40();
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          sub_10002C7C8();

        goto LABEL_191;
      }
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

      if (v17)
      {
        v22 = objc_opt_class(NSMutableArray);
        if ((objc_opt_isKindOfClass(v17, v22) & 1) != 0)
        {
          objc_msgSend(v17, "removeObject:", CFSTR("Library/homed/protected-home.config"));
          objc_msgSend(v17, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
          objc_msgSend(v17, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
          objc_msgSend(v17, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
          objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("RelativePathsToRestoreOnly"));
          -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("HomeKitDomain"));
          goto LABEL_35;
        }
      }
      if (!has_internal_content)
      {
LABEL_35:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

        if (v13)
        {
          v23 = objc_opt_class(NSMutableArray);
          if ((objc_opt_isKindOfClass(v13, v23) & 1) != 0)
          {
            objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/protected-home.config"));
            objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
            objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
            objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
            objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("RelativePathsToOnlyBackupEncrypted"));
            -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("HomeKitDomain"));
            goto LABEL_39;
          }
        }
        if (!has_internal_content)
          goto LABEL_39;
        v84 = sub_100024A40();
        v79 = objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          sub_10002C820();
        goto LABEL_153;
      }
      v82 = sub_100024A40();
      v83 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        sub_10002C7F4();
LABEL_190:

      goto LABEL_191;
    }
  }
LABEL_39:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HomeDomain")));

  if (!v9 || (v24 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v9, v24) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v27 = 0;
      goto LABEL_86;
    }
    v65 = sub_100024A40();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_10002C484();
    goto LABEL_159;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsNotToBackup")));

  if (v25 && (v26 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v25, v26) & 1) != 0))
  {
    objc_msgSend(v25, "addObject:", CFSTR("Library/Preferences/com.apple.identityservices.idstatuscache.plist"));
    objc_msgSend(v25, "addObject:", CFSTR("Library/Preferences/com.apple.identityservicesd.plist"));
    objc_msgSend(v25, "addObject:", CFSTR("Library/Preferences/com.apple.ids.deviceproperties.plist"));
    objc_msgSend(v25, "addObject:", CFSTR("Library/Preferences/com.apple.ids.subservices.plist"));
    objc_msgSend(v25, "addObject:", CFSTR("Library/Preferences/com.apple.ids.plist"));
    objc_msgSend(v25, "removeObject:", CFSTR("Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"));
    objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("RelativePathsNotToBackup"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v85 = sub_100024A40();
    v86 = objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      sub_10002C5E4();

    goto LABEL_186;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (!v13 || (v28 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v28) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v27 = 0;
      goto LABEL_58;
    }
    v87 = sub_100024A40();
    v66 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_10002C610();
LABEL_159:

LABEL_185:
    goto LABEL_186;
  }
  objc_msgSend(v13, "removeObject:", CFSTR("Library/Accounts"));
  objc_msgSend(v13, "removeObject:", CFSTR("Library/DeviceRegistry"));
  objc_msgSend(v13, "removeObject:", CFSTR("Library/DeviceRegistry.state"));
  objc_msgSend(v13, "removeObject:", CFSTR("Library/MobileBluetooth"));
  objc_msgSend(v13, "addObject:", CFSTR("Library/Application Support/ScreenSaverManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount")));
  if (v27 && (v29 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v27, v29) & 1) != 0))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v27));
    v31 = objc_msgSend(v30, "mutableCopy");

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v9, "setObject:forKey:", v32, CFSTR("RelativePathsToBackupToDriveAndStandardAccount"));

    v13 = v31;
  }
  else
  {
    v33 = sub_100024A40();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.", buf, 2u);
    }

  }
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
LABEL_58:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (v35 && (v36 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v35, v36) & 1) != 0))
  {
    objc_msgSend(v35, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v35, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v88 = sub_100024A40();
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10002C63C();
    goto LABEL_177;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

  if (v13 && (v37 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v37) & 1) != 0))
  {
    objc_msgSend(v13, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v13, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v90 = sub_100024A40();
    v70 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_10002C668();
    goto LABEL_184;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

  if (v35 && (v38 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v35, v38) & 1) != 0))
  {
    objc_msgSend(v35, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v35, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v91 = sub_100024A40();
    v89 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10002C694();
    goto LABEL_177;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (v13 && (v39 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v39) & 1) != 0))
  {
    objc_msgSend(v13, "addObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v92 = sub_100024A40();
    v70 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_10002C6C0();
    goto LABEL_184;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

  if (v35 && (v40 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v35, v40) & 1) != 0))
  {
    objc_msgSend(v35, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v93 = sub_100024A40();
    v89 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10002C6EC();
    goto LABEL_177;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

  if (v41 && (v42 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v41, v42) & 1) != 0))
  {
    objc_msgSend(v41, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v9, "setObject:forKey:", v41, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v94 = sub_100024A40();
    v74 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      sub_10002C718();
LABEL_172:

LABEL_186:
    goto LABEL_187;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsNotToBackupToService")));

  if (v13 && (v43 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v43) & 1) != 0))
  {
    objc_msgSend(v13, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsNotToBackupToService"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v95 = sub_100024A40();
    v70 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_10002C744();
    goto LABEL_184;
  }
LABEL_86:
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("KeychainDomain")));

  if (v44 && (v45 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v44, v45) & 1) != 0))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("RelativePathsToBackupAndRestore"));

    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v44, CFSTR("KeychainDomain"));
  }
  else if (has_internal_content)
  {
    v67 = sub_100024A40();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_10002C4B0();

    goto LABEL_187;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("MediaDomain")));

  if (!v9 || (v47 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v9, v47) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v35 = v13;
      goto LABEL_98;
    }
    v69 = sub_100024A40();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_10002C4DC();
LABEL_184:

    goto LABEL_185;
  }
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("RelativePathsNotToBackupToDrive"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("MediaDomain"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (!v35 || (v48 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v35, v48) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_98;
    v96 = sub_100024A40();
    v89 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10002C5B8();
LABEL_177:

    goto LABEL_186;
  }
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/Device/Trainer"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iTunesPrefs.plist"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MobileSync.plist"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/ApertureAlbumPrefs"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSAlbumAlbums"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSElementsAlbums"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderPrefs"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderAlbums"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderName"));
  objc_msgSend(v35, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/iTunes_Control/iTunes"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/iTunes_Control/Music"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/iTunes_Control/Sync"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/iTunes_Control/Artwork"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/Books"));
  objc_msgSend(v35, "addObject:", CFSTR("Media/Music/Downloads"));
  objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("MediaDomain"));
LABEL_98:
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("RootDomain")));

  if (!v49 || (v50 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v49, v50) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v41 = v35;
      goto LABEL_106;
    }
    v71 = sub_100024A40();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      sub_10002C508();

LABEL_181:
LABEL_187:
    v58 = 0;
    goto LABEL_115;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", CFSTR("RelativePathsNotToRestore")));

  if (!v41 || (v51 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v41, v51) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_106;
    v97 = sub_100024A40();
    v98 = objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_10002C58C();

    goto LABEL_181;
  }
  objc_msgSend(v41, "addObject:", CFSTR("Library/Preferences/com.apple.ASPCarryLog.plist"));
  objc_msgSend(v49, "setObject:forKey:", v41, CFSTR("RelativePathsToRemoveOnRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v49, CFSTR("RootDomain"));
LABEL_106:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("SystemPreferencesDomain")));

  if (!v9 || (v52 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v9, v52) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v13 = v41;
      goto LABEL_114;
    }
    v73 = sub_100024A40();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      sub_10002C534();
    goto LABEL_172;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RelativePathsNotToBackup")));

  if (!v13 || (v53 = objc_opt_class(NSMutableArray), (objc_opt_isKindOfClass(v13, v53) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_114;
    v99 = sub_100024A40();
    v70 = objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_10002C560();
    goto LABEL_184;
  }
  objc_msgSend(v13, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi.plist"));
  objc_msgSend(v13, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi-networks.plist"));
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("SystemPreferencesDomain"));
LABEL_114:
  v54 = objc_alloc_init((Class)NSMutableDictionary);

  objc_msgSend(v54, "setObject:forKey:", CFSTR("/var/MobileAsset"), CFSTR("RootPath"));
  v55 = objc_alloc_init((Class)NSMutableArray);

  objc_msgSend(v55, "addObject:", CFSTR("AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset"));
  objc_msgSend(v55, "addObject:", CFSTR("PreinstalledAssetsV2/InstallWithOs"));
  objc_msgSend(v54, "setObject:forKey:", v55, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v54, CFSTR("MobileAssetDomain"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

  objc_msgSend(v56, "setObject:forKey:", CFSTR("/var/mobile/XcodeBuiltProducts"), CFSTR("RootPath"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

  objc_msgSend(v57, "addObject:", CFSTR("PressDemoScripts.xctestproducts"));
  objc_msgSend(v56, "setObject:forKey:", v57, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v56, CFSTR("DemoPortalScriptsDomain"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("SystemDomains"));
  v58 = v6;

LABEL_115:
  v3 = v101;
LABEL_116:

  return v58;
}

@end
