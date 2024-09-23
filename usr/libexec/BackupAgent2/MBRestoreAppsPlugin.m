@implementation MBRestoreAppsPlugin

- (id)startingBackupWithEngine:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  MBIgnoredAccountsTracker *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  char v28;
  void *v29;
  void *v30;
  NSObject *v31;
  MBIgnoredAccountsTracker *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  unsigned __int8 v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  unsigned int v65;
  NSObject *v66;
  void *v67;
  unsigned __int8 v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  _copyfile_state *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  int *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  const char *v97;
  uid_t v98;
  gid_t v99;
  void *v100;
  void *v101;
  NSMutableSet *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  MBIgnoredAccountsTracker *v106;
  NSObject *v107;
  NSObject *v108;
  id v109;
  void *v110;
  id v111;
  NSObject *v112;
  NSObject *v113;
  id v114;
  _QWORD v115[4];
  NSObject *v116;
  MBIgnoredAccountsTracker *v117;
  id v118;
  id v119;
  char v120;
  id v121;
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[3];
  _QWORD v125[3];
  uint8_t buf[4];
  NSObject *v127;
  __int16 v128;
  _BYTE v129[14];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/var/root/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v121 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", CFSTR("/var/root/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist"), &v121);
    v8 = v121;

    v11 = MBGetDefaultLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleted demoted apps plist written to the old and outdated path", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Deleted demoted apps plist written to the old and outdated path");
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v127 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't delete demoted apps plist written to the old and outdated path - %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Couldn't delete demoted apps plist written to the old and outdated path - %@", v8);
    }

  }
  else
  {
    v8 = 0;
  }
  v14 = objc_alloc_init(MBIgnoredAccountsTracker);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persona"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "personaIdentifier"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persona"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "demotedAppsPlistPath"));

  v21 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___MBHasServiceAccount);
  if ((_DWORD)v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceAccount"));
    v24 = v23;
    if (v23)
      v25 = objc_msgSend(v23, "isPrimaryAccount");
    else
      v25 = 1;

  }
  else
  {
    v25 = 1;
  }
  v26 = MBGetDefaultLog(v21, v22);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v127 = v18;
    v128 = 1024;
    *(_DWORD *)v129 = v25;
    *(_WORD *)&v129[4] = 2112;
    *(_QWORD *)&v129[6] = v20;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Fetching demoted apps for persona %{public}@ (%d) (%@)", buf, 0x1Cu);
    _MBLog(CFSTR("DEFAULT"), "Fetching demoted apps for persona %{public}@ (%d) (%@)", v18, v25, v20);
  }

  if (!v20)
    sub_100088760();
  if (v18)
    v28 = 1;
  else
    v28 = v25;
  if ((v28 & 1) == 0)
    sub_100088788();
  v29 = objc_autoreleasePoolPush();
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_10006114C;
  v115[3] = &unk_1000D9F00;
  v120 = v25;
  v31 = v18;
  v116 = v31;
  v32 = v14;
  v117 = v32;
  v33 = v15;
  v118 = v33;
  v34 = v16;
  v119 = v34;
  objc_msgSend(v30, "enumerateBundlesOfType:block:", 0, v115);

  objc_autoreleasePoolPop(v29);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v110 = v35;
  if (objc_msgSend(v34, "count"))
  {
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("IntentionalDowngrades"));
    if (!objc_msgSend(v33, "count"))
    {
LABEL_27:
      v37 = v3;
      v38 = v8;
      v114 = 0;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v35, 200, 0, &v114));
      v40 = v114;
      v42 = v40;
      if (v39)
      {
        v109 = v33;
        v113 = v40;
        v43 = objc_msgSend(v39, "writeToFile:options:error:", v20, 268435457, &v113);
        v44 = v113;

        if ((v43 & 1) != 0)
        {
          v106 = v32;
          v107 = v31;
          v47 = MBMobileUID();
          v124[0] = NSFileOwnerAccountID;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v47));
          v125[0] = v48;
          v124[1] = NSFileGroupOwnerAccountID;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v47));
          v125[1] = v49;
          v124[2] = NSFilePosixPermissions;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 384));
          v125[2] = v50;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 3));

          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v52, "setAttributes:ofItemAtPath:error:", v51, v20, 0);

          v55 = MBGetDefaultLog(v53, v54);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v127 = v20;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Wrote out demoted apps plist to:%@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Wrote out demoted apps plist to:%@", v20);
          }

          v8 = v38;
          v3 = v37;
          v32 = v106;
          v31 = v107;
LABEL_48:

          goto LABEL_49;
        }
        v59 = MBGetDefaultLog(v45, v46);
        v58 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v127 = v20;
          v128 = 2112;
          *(_QWORD *)v129 = v44;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to write demoted app plists at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to write demoted app plists at %@: %@", v20, v44);
        }
        v42 = v44;
        v33 = v109;
      }
      else
      {
        v57 = MBGetDefaultLog(v40, v41);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v127 = v42;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to serialize demoted apps:%@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to serialize demoted apps:%@", v42);
        }
      }

      v60 = 0;
      v8 = v38;
      v3 = v37;
LABEL_38:
      v61 = v110;
      goto LABEL_62;
    }
LABEL_26:
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("AutomaticDowngrades"));
    goto LABEL_27;
  }
  if (objc_msgSend(v33, "count"))
    goto LABEL_26;
  v109 = v33;
  v62 = MBGetDefaultLog(0, v36);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "No demoted apps found on device. Skipping", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "No demoted apps found on device. Skipping");
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v65 = objc_msgSend(v64, "fileExistsAtPath:", v20);

  if (v65)
  {
    v66 = v31;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v112 = v8;
    v68 = objc_msgSend(v67, "removeItemAtPath:error:", v20, &v112);
    v69 = v112;

    v72 = MBGetDefaultLog(v70, v71);
    v73 = objc_claimAutoreleasedReturnValue(v72);
    v44 = v73;
    if ((v68 & 1) != 0)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Removed demoted apps plist made from a previous backup because there are no more demoted apps in the ongoing one", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Removed demoted apps plist made from a previous backup because there are no more demoted apps in the ongoing one", v105);
      }
    }
    else if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v127 = v69;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Couldn't delete demoted apps plist written to the new path during a previous backup - %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Couldn't delete demoted apps plist written to the new path during a previous backup - %@", v69);
    }
    v8 = v69;
    v31 = v66;
    goto LABEL_48;
  }
LABEL_49:
  v74 = copyfile_state_alloc();
  v75 = copyfile((const char *)objc_msgSend(CFSTR("/var/installd/Library/MobileInstallation/BackedUpState/SystemAppInstallState.plist"), "fileSystemRepresentation"), (const char *)objc_msgSend(CFSTR("/var/installd/Library/MobileInstallation/BackedUpState/BackupSystemAppInstallState.plist"), "fileSystemRepresentation"), v74, 0xEu);
  if ((_DWORD)v75)
  {
    v77 = v75;
    v78 = MBGetDefaultLog(v75, v76);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v127) = v77;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to copy system app plist: %{errno}d", buf, 8u);
      v80 = __error();
      _MBLog(CFSTR("ERROR"), "Failed to copy system app plist: %{errno}d", v77, *v80);
    }

  }
  copyfile_state_free(v74);
  if (!objc_msgSend(v3, "isDeviceTransferEngine"))
  {
    v92 = 0;
    goto LABEL_58;
  }
  v108 = v31;
  v81 = v3;
  v82 = v8;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v122[0] = NSFileOwnerAccountName;
  v122[1] = NSFileGroupOwnerAccountName;
  v123[0] = CFSTR("mobile");
  v123[1] = CFSTR("mobile");
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 2));
  v111 = 0;
  v85 = objc_msgSend(v83, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Media/iTunesRestore"), 1, v84, &v111);
  v86 = v111;

  if ((v85 & 1) != 0)
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(CFSTR("/var/mobile/Media/iTunesRestore/RestoreApplications.plist"), "fileSystemRepresentation"), 0, 0));
    v90 = sub_100070A4C(v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);

    v33 = v109;
    if (v91)
    {
      v60 = v91;

      v8 = v82;
      v3 = v81;
      v31 = v108;
      goto LABEL_38;
    }
    v97 = (const char *)objc_msgSend(CFSTR("/var/mobile/Media/iTunesRestore/RestoreApplications.plist"), "fileSystemRepresentation");
    v98 = MBMobileUID();
    v99 = MBMobileUID();
    v8 = v82;
    v31 = v108;
    if (lchown(v97, v98, v99))
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", CFSTR("/var/mobile/Media/iTunesRestore/RestoreApplications.plist"), CFSTR("lchown failed")));
      v3 = v81;
    }
    else
    {
      v3 = v81;
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "domainManager"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "domainForName:", CFSTR("MediaDomain")));

      v102 = objc_opt_new(NSMutableSet);
      -[NSMutableSet addObject:](v102, "addObject:", CFSTR("Media/iTunesRestore/RestoreApplications.plist"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "relativePathsToBackupAndRestore"));

      if (v103)
      {
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "relativePathsToBackupAndRestore"));
        -[NSMutableSet unionSet:](v102, "unionSet:", v104);

      }
      objc_msgSend(v101, "setRelativePathsToBackupAndRestore:", v102);

      v92 = 0;
      v31 = v108;
    }

LABEL_58:
    v33 = v109;
    v61 = v110;
    v60 = v92;
    goto LABEL_62;
  }
  v93 = MBGetDefaultLog(v87, v88);
  v94 = objc_claimAutoreleasedReturnValue(v93);
  v61 = v110;
  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
  {
    v95 = objc_msgSend(CFSTR("/var/mobile/Media/iTunesRestore"), "fileSystemRepresentation");
    *(_DWORD *)buf = 136315394;
    v127 = v95;
    v128 = 2112;
    *(_QWORD *)v129 = v86;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Failed to create directory at %s: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Failed to create directory at %s: %@", objc_msgSend(CFSTR("/var/mobile/Media/iTunesRestore"), "fileSystemRepresentation"), v86);
  }

  v60 = v86;
  v8 = v82;
  v3 = v81;
  v31 = v108;
  v33 = v109;
LABEL_62:

  return v60;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;

  if (objc_msgSend(a3, "isDeviceTransferEngine"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunesRestore/RestoreApplications.plist"), &v12);
    v6 = v12;

    if ((v5 & 1) == 0)
    {
      v9 = MBGetDefaultLog(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = CFSTR("/var/mobile/Media/iTunesRestore");
        v15 = 2112;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove file at: %@ - %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to remove file at: %@ - %@", CFSTR("/var/mobile/Media/iTunesRestore"), v6);
      }

    }
  }
  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;

  v4 = a4;
  if (objc_msgSend(v4, "restoresPrimaryAccount")
    && objc_msgSend(v4, "isDeviceTransferEngine"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainForName:", CFSTR("MediaDomain")));

    v7 = objc_opt_new(NSMutableSet);
    -[NSMutableSet addObject:](v7, "addObject:", CFSTR("Media/iTunesRestore/RestoreApplications.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));
      -[NSMutableSet unionSet:](v7, "unionSet:", v9);

    }
    objc_msgSend(v6, "setRelativePathsToBackupAndRestore:", v7);

  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;

  v4 = a4;
  if (objc_msgSend(v4, "restoresPrimaryAccount"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persona"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userIncompleteRestoreDirectory"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist")));
    if (sub_100081D30())
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v19 = 0;
        v11 = objc_msgSend(v10, "copyItemAtPath:toPath:error:", v7, CFSTR("/var/mobile/Library/Logs/MobileBackup/DemotedAppsCopy.plist"), &v19);
        v12 = (__CFString *)v19;

        v15 = MBGetDefaultLog(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if ((v11 & 1) != 0)
        {
          if (v17)
          {
            *(_DWORD *)buf = 138412290;
            v21 = CFSTR("/var/mobile/Library/Logs/MobileBackup/DemotedAppsCopy.plist");
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Demoted app plist copied successfully to: %@", buf, 0xCu);
            _MBLog(CFSTR("INFO"), "Demoted app plist copied successfully to: %@", CFSTR("/var/mobile/Library/Logs/MobileBackup/DemotedAppsCopy.plist"));
          }
        }
        else if (v17)
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Unable to copy demoted app plist: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Unable to copy demoted app plist: %@", v12);
        }

      }
    }

  }
  return 0;
}

@end
