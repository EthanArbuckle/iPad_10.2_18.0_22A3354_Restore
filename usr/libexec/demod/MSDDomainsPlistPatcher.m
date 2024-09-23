@implementation MSDDomainsPlistPatcher

+ (id)patchDomainsPlist:(id)a3
{
  id v3;
  int has_internal_content;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v88;
  NSObject *v89;
  id v90;
  id v91;
  NSObject *v92;
  id v93;
  NSObject *v94;
  id v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  id v99;
  NSObject *v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  id v105;
  id v106;
  NSObject *v107;
  id v108;
  NSObject *v109;
  id v110;
  NSObject *v111;
  id v112;
  id v113;
  NSObject *v114;
  id v115;
  id v116;
  NSObject *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  NSObject *v126;
  id v127;
  id v128;
  id v129;
  uint8_t buf[16];
  uint8_t v131[16];

  v3 = a3;
  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));
  v6 = v5;
  if (!v5)
  {
    v90 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000B9854((uint64_t)v3, v8);
    goto LABEL_141;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SystemDomains")));
  if (!v8 || (v9 = objc_opt_class(NSMutableDictionary, v7), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    v88 = sub_1000604F0();
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v131 = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", v131, 2u);
    }

    goto LABEL_141;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("CameraRollDomain")));
  v129 = v3;
  if (!v11
    || (v12 = objc_opt_class(NSMutableDictionary, v10), (objc_opt_isKindOfClass(v11, v12) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v16 = 0;
      goto LABEL_16;
    }
    v91 = sub_1000604F0();
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      sub_1000B98C8();

LABEL_140:
LABEL_141:
    v86 = 0;
    goto LABEL_116;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackup")));
  if (!v14 || (v15 = objc_opt_class(NSMutableArray, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_12;
    v103 = sub_1000604F0();
    v104 = objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_1000B9CBC();

    goto LABEL_140;
  }
  objc_msgSend(v14, "removeObject:", CFSTR("Media/PhotoData/Sync"));
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("CameraRollDomain"));
LABEL_12:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore")));

  if (v16 && (v18 = objc_opt_class(NSMutableArray, v17), (objc_opt_isKindOfClass(v16, v18) & 1) != 0))
  {
    objc_msgSend(v16, "removeObject:", CFSTR("Media/PhotoData/Sync"));
    objc_msgSend(v16, "removeObject:", CFSTR("Media/PhotoData/Metadata/PhotoData/Sync"));
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsToRemoveOnRestore"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("CameraRollDomain"));
  }
  else if (has_internal_content)
  {
    v105 = sub_1000604F0();
    v94 = objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      sub_1000B9CE8();
    goto LABEL_159;
  }
LABEL_16:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("HomeKitDomain")));

  if (v19)
  {
    v21 = objc_opt_class(NSMutableDictionary, v20);
    if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore")));

      if ((v22 || (v22 = objc_alloc_init((Class)NSMutableArray)) != 0)
        && (v24 = objc_opt_class(NSMutableArray, v23), (objc_opt_isKindOfClass(v22, v24) & 1) != 0))
      {
        objc_msgSend(v22, "addObject:", CFSTR("Library/homed/protected-home.config"));
        objc_msgSend(v22, "addObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v22, "addObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v22, "addObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("RelativePathsToRemoveOnRestore"));
        -[NSObject setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v128 = sub_1000604F0();
        v111 = objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          sub_1000B9BE0();
        goto LABEL_190;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("RelativePathsNotToBackupToService")));

      if (v16 && (v26 = objc_opt_class(NSMutableArray, v25), (objc_opt_isKindOfClass(v16, v26) & 1) != 0))
      {
        objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v19, "setObject:forKey:", v16, CFSTR("RelativePathsNotToBackupToService"));
        -[NSObject setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v106 = sub_1000604F0();
        v107 = objc_claimAutoreleasedReturnValue(v106);
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          sub_1000B9C0C();
LABEL_153:

LABEL_191:
        goto LABEL_187;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("RelativePathsNotToBackupInMegaBackup")));

      if (v27 && (v29 = objc_opt_class(NSMutableArray, v28), (objc_opt_isKindOfClass(v27, v29) & 1) != 0))
      {
        objc_msgSend(v27, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v27, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v27, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v19, "setObject:forKey:", v27, CFSTR("RelativePathsNotToBackupInMegaBackup"));
        -[NSObject setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        v108 = sub_1000604F0();
        v109 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          sub_1000B9C38();

        goto LABEL_191;
      }
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

      if (v22)
      {
        v31 = objc_opt_class(NSMutableArray, v30);
        if ((objc_opt_isKindOfClass(v22, v31) & 1) != 0)
        {
          objc_msgSend(v22, "removeObject:", CFSTR("Library/homed/protected-home.config"));
          objc_msgSend(v22, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
          objc_msgSend(v22, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
          objc_msgSend(v22, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
          objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("RelativePathsToRestoreOnly"));
          -[NSObject setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("HomeKitDomain"));
          goto LABEL_35;
        }
      }
      if (!has_internal_content)
      {
LABEL_35:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

        if (v16)
        {
          v33 = objc_opt_class(NSMutableArray, v32);
          if ((objc_opt_isKindOfClass(v16, v33) & 1) != 0)
          {
            objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/protected-home.config"));
            objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
            objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
            objc_msgSend(v16, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
            objc_msgSend(v19, "setObject:forKey:", v16, CFSTR("RelativePathsToOnlyBackupEncrypted"));
            -[NSObject setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("HomeKitDomain"));
            goto LABEL_39;
          }
        }
        if (!has_internal_content)
          goto LABEL_39;
        v112 = sub_1000604F0();
        v107 = objc_claimAutoreleasedReturnValue(v112);
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          sub_1000B9C90();
        goto LABEL_153;
      }
      v110 = sub_1000604F0();
      v111 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        sub_1000B9C64();
LABEL_190:

      goto LABEL_191;
    }
  }
LABEL_39:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("HomeDomain")));

  if (!v11
    || (v35 = objc_opt_class(NSMutableDictionary, v34), (objc_opt_isKindOfClass(v11, v35) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v39 = 0;
      goto LABEL_86;
    }
    v93 = sub_1000604F0();
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      sub_1000B98F4();
    goto LABEL_159;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackup")));

  if (v36 && (v38 = objc_opt_class(NSMutableArray, v37), (objc_opt_isKindOfClass(v36, v38) & 1) != 0))
  {
    objc_msgSend(v36, "addObject:", CFSTR("Library/Preferences/com.apple.identityservices.idstatuscache.plist"));
    objc_msgSend(v36, "addObject:", CFSTR("Library/Preferences/com.apple.identityservicesd.plist"));
    objc_msgSend(v36, "addObject:", CFSTR("Library/Preferences/com.apple.ids.deviceproperties.plist"));
    objc_msgSend(v36, "addObject:", CFSTR("Library/Preferences/com.apple.ids.subservices.plist"));
    objc_msgSend(v36, "addObject:", CFSTR("Library/Preferences/com.apple.ids.plist"));
    objc_msgSend(v36, "removeObject:", CFSTR("Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"));
    objc_msgSend(v11, "setObject:forKey:", v36, CFSTR("RelativePathsNotToBackup"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v113 = sub_1000604F0();
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      sub_1000B9A54();

    goto LABEL_186;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (!v16 || (v41 = objc_opt_class(NSMutableArray, v40), (objc_opt_isKindOfClass(v16, v41) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v39 = 0;
      goto LABEL_58;
    }
    v115 = sub_1000604F0();
    v94 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      sub_1000B9A80();
LABEL_159:

LABEL_185:
    goto LABEL_186;
  }
  objc_msgSend(v16, "removeObject:", CFSTR("Library/Accounts"));
  objc_msgSend(v16, "removeObject:", CFSTR("Library/DeviceRegistry"));
  objc_msgSend(v16, "removeObject:", CFSTR("Library/DeviceRegistry.state"));
  objc_msgSend(v16, "removeObject:", CFSTR("Library/MobileBluetooth"));
  objc_msgSend(v16, "addObject:", CFSTR("Library/Application Support/ScreenSaverManager"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount")));
  if (v39 && (v43 = objc_opt_class(NSMutableArray, v42), (objc_opt_isKindOfClass(v39, v43) & 1) != 0))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v39));
    v45 = objc_msgSend(v44, "mutableCopy");

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v11, "setObject:forKey:", v46, CFSTR("RelativePathsToBackupToDriveAndStandardAccount"));

    v16 = v45;
  }
  else
  {
    v47 = sub_1000604F0();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.", buf, 2u);
    }

  }
  objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
LABEL_58:
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (v49 && (v51 = objc_opt_class(NSMutableArray, v50), (objc_opt_isKindOfClass(v49, v51) & 1) != 0))
  {
    objc_msgSend(v49, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v49, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v11, "setObject:forKey:", v49, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v116 = sub_1000604F0();
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      sub_1000B9AAC();
    goto LABEL_177;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

  if (v16 && (v53 = objc_opt_class(NSMutableArray, v52), (objc_opt_isKindOfClass(v16, v53) & 1) != 0))
  {
    objc_msgSend(v16, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v16, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v118 = sub_1000604F0();
    v98 = objc_claimAutoreleasedReturnValue(v118);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_1000B9AD8();
    goto LABEL_184;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

  if (v49 && (v55 = objc_opt_class(NSMutableArray, v54), (objc_opt_isKindOfClass(v49, v55) & 1) != 0))
  {
    objc_msgSend(v49, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v49, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v11, "setObject:forKey:", v49, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v119 = sub_1000604F0();
    v117 = objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      sub_1000B9B04();
    goto LABEL_177;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (v16 && (v57 = objc_opt_class(NSMutableArray, v56), (objc_opt_isKindOfClass(v16, v57) & 1) != 0))
  {
    objc_msgSend(v16, "addObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v120 = sub_1000604F0();
    v98 = objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_1000B9B30();
    goto LABEL_184;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));

  if (v49 && (v59 = objc_opt_class(NSMutableArray, v58), (objc_opt_isKindOfClass(v49, v59) & 1) != 0))
  {
    objc_msgSend(v49, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v11, "setObject:forKey:", v49, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v121 = sub_1000604F0();
    v117 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      sub_1000B9B5C();
    goto LABEL_177;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));

  if (v60 && (v62 = objc_opt_class(NSMutableArray, v61), (objc_opt_isKindOfClass(v60, v62) & 1) != 0))
  {
    objc_msgSend(v60, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v11, "setObject:forKey:", v60, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v122 = sub_1000604F0();
    v102 = objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      sub_1000B9B88();
LABEL_172:

LABEL_186:
    goto LABEL_187;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackupToService")));

  if (v16 && (v64 = objc_opt_class(NSMutableArray, v63), (objc_opt_isKindOfClass(v16, v64) & 1) != 0))
  {
    objc_msgSend(v16, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsNotToBackupToService"));
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    v123 = sub_1000604F0();
    v98 = objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_1000B9BB4();
    goto LABEL_184;
  }
LABEL_86:
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("KeychainDomain")));

  if (v65
    && (v67 = objc_opt_class(NSMutableDictionary, v66), (objc_opt_isKindOfClass(v65, v67) & 1) != 0))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v65, "setObject:forKey:", v68, CFSTR("RelativePathsToBackupAndRestore"));

    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v65, CFSTR("KeychainDomain"));
  }
  else if (has_internal_content)
  {
    v95 = sub_1000604F0();
    v96 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      sub_1000B9920();

    goto LABEL_187;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("MediaDomain")));

  if (!v11
    || (v70 = objc_opt_class(NSMutableDictionary, v69), (objc_opt_isKindOfClass(v11, v70) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v49 = v16;
      goto LABEL_98;
    }
    v97 = sub_1000604F0();
    v98 = objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_1000B994C();
LABEL_184:

    goto LABEL_185;
  }
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("RelativePathsNotToBackupToDrive"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("MediaDomain"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));

  if (!v49 || (v72 = objc_opt_class(NSMutableArray, v71), (objc_opt_isKindOfClass(v49, v72) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_98;
    v124 = sub_1000604F0();
    v117 = objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      sub_1000B9A28();
LABEL_177:

    goto LABEL_186;
  }
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/Device/Trainer"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iTunesPrefs.plist"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MobileSync.plist"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/ApertureAlbumPrefs"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSAlbumAlbums"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSElementsAlbums"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderPrefs"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderAlbums"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderName"));
  objc_msgSend(v49, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/iTunes_Control/iTunes"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/iTunes_Control/Music"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/iTunes_Control/Sync"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/iTunes_Control/Artwork"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/Books"));
  objc_msgSend(v49, "addObject:", CFSTR("Media/Music/Downloads"));
  objc_msgSend(v11, "setObject:forKey:", v49, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("MediaDomain"));
LABEL_98:
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("RootDomain")));

  if (!v73
    || (v75 = objc_opt_class(NSMutableDictionary, v74), (objc_opt_isKindOfClass(v73, v75) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v60 = v49;
      goto LABEL_106;
    }
    v99 = sub_1000604F0();
    v100 = objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      sub_1000B9978();

LABEL_181:
LABEL_187:
    v86 = 0;
    goto LABEL_115;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKey:", CFSTR("RelativePathsNotToRestore")));

  if (!v60 || (v77 = objc_opt_class(NSMutableArray, v76), (objc_opt_isKindOfClass(v60, v77) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_106;
    v125 = sub_1000604F0();
    v126 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      sub_1000B99FC();

    goto LABEL_181;
  }
  objc_msgSend(v60, "addObject:", CFSTR("Library/Preferences/com.apple.ASPCarryLog.plist"));
  objc_msgSend(v73, "setObject:forKey:", v60, CFSTR("RelativePathsToRemoveOnRestore"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v73, CFSTR("RootDomain"));
LABEL_106:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("SystemPreferencesDomain")));

  if (!v11
    || (v79 = objc_opt_class(NSMutableDictionary, v78), (objc_opt_isKindOfClass(v11, v79) & 1) == 0))
  {
    if (!has_internal_content)
    {
      v16 = v60;
      goto LABEL_114;
    }
    v101 = sub_1000604F0();
    v102 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      sub_1000B99A4();
    goto LABEL_172;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackup")));

  if (!v16 || (v81 = objc_opt_class(NSMutableArray, v80), (objc_opt_isKindOfClass(v16, v81) & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_114;
    v127 = sub_1000604F0();
    v98 = objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      sub_1000B99D0();
    goto LABEL_184;
  }
  objc_msgSend(v16, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi.plist"));
  objc_msgSend(v16, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi-networks.plist"));
  objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v11, CFSTR("SystemPreferencesDomain"));
LABEL_114:
  v82 = objc_alloc_init((Class)NSMutableDictionary);

  objc_msgSend(v82, "setObject:forKey:", CFSTR("/var/MobileAsset"), CFSTR("RootPath"));
  v83 = objc_alloc_init((Class)NSMutableArray);

  objc_msgSend(v83, "addObject:", CFSTR("AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset"));
  objc_msgSend(v83, "addObject:", CFSTR("PreinstalledAssetsV2/InstallWithOs"));
  objc_msgSend(v82, "setObject:forKey:", v83, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v82, CFSTR("MobileAssetDomain"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

  objc_msgSend(v84, "setObject:forKey:", CFSTR("/var/mobile/XcodeBuiltProducts"), CFSTR("RootPath"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

  objc_msgSend(v85, "addObject:", CFSTR("PressDemoScripts.xctestproducts"));
  objc_msgSend(v84, "setObject:forKey:", v85, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v8, "setObject:forKey:", v84, CFSTR("DemoPortalScriptsDomain"));
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("SystemDomains"));
  v86 = v6;

LABEL_115:
  v3 = v129;
LABEL_116:

  return v86;
}

@end
