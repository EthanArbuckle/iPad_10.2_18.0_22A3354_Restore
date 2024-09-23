@implementation MBKeychainPlugin

- (id)_preparingBackupWithDriveEngine:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  id v40;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = CFSTR("/var/Keychains/keychain-backup.plist");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Exporting keychain to %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Exporting keychain to %@", CFSTR("/var/Keychains/keychain-backup.plist"));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keybag"));
  v36 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataWithError:", &v36));
  v11 = v36;

  if (v10)
  {
    v35 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v35));
    v15 = v35;

    if (!v14)
    {
      v16 = +[MBError isError:withCode:](MBError, "isError:withCode:", v15, 4);
      if (!(_DWORD)v16)
      {
        v32 = MBGetDefaultLog(v16, v17);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = CFSTR("/var/Keychains/keychain-backup.plist");
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: no password", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Exporting keychain to %@ failed: no password", CFSTR("/var/Keychains/keychain-backup.plist"));
        }

        v20 = v15;
        v26 = 1;
        goto LABEL_18;
      }

      v15 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
    v34 = v15;
    v19 = sub_10003C158(CFSTR("/var/Keychains/keychain-backup.plist"), (uint64_t)v10, (uint64_t)v18, &v34);
    v20 = v34;

    v23 = MBGetDefaultLog(v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v19)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = CFSTR("/var/Keychains/keychain-backup.plist");
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Exporting keychain to %@ succeeded", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Exporting keychain to %@ succeeded", CFSTR("/var/Keychains/keychain-backup.plist"));
      }

      v26 = 0;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = CFSTR("/var/Keychains/keychain-backup.plist");
        v39 = 2112;
        v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Exporting keychain to %@ failed: %@", CFSTR("/var/Keychains/keychain-backup.plist"), v20);
      }

      v29 = v20;
      v26 = 1;
    }

LABEL_18:
    goto LABEL_19;
  }
  v27 = MBGetDefaultLog(v12, v13);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = CFSTR("/var/Keychains/keychain-backup.plist");
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: no keybag", buf, 0xCu);
    _MBLog(CFSTR("ERROR"), "Exporting keychain to %@ failed: no keybag", CFSTR("/var/Keychains/keychain-backup.plist"));
  }

  v20 = v11;
  v26 = 1;
LABEL_19:

  objc_autoreleasePoolPop(v4);
  if (v26)
    v30 = v20;
  else
    v30 = 0;

  return v30;
}

- (id)_preparingBackupWithCKEngine:(id)a3
{
  unsigned __int8 v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = +[MBKeychainPlugin exportKeychainForCKBackupEngine:error:](MBKeychainPlugin, "exportKeychainForCKBackupEngine:error:", a3, &v8);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if ((v3 & 1) == 0)
    v6 = v4;

  return v6;
}

+ (BOOL)_exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  unsigned __int8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *log;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  NSFileAttributeKey v60;
  void *v61;
  uint8_t buf[4];
  const __CFString *v63;
  __int16 v64;
  uint64_t v65;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v59 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", CFSTR("/var/Keychains/keychain-2.db-wal"), &v59));
  v8 = v59;
  v9 = v8;
  if (v7)
  {
    v58 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", CFSTR("/var/Keychains/keychain-ota-backup.plist"), &v58));
    v11 = v58;

    if (v10)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileModificationDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileModificationDate"));
      -[NSObject timeIntervalSinceReferenceDate](v12, "timeIntervalSinceReferenceDate");
      v15 = v14 * 1000.0;
      v16 = objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v19 = v18 * 1000.0;
      if (v15 > 1.84467441e19 || v19 > 1.84467441e19)
      {
        v16 = -[NSObject isEqualToDate:](v12, "isEqualToDate:", v13, v19);
        if ((v16 & 1) == 0)
        {
LABEL_16:
          v25 = MBGetDefaultLog(v16, v17);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            -[NSObject timeIntervalSince1970](v12, "timeIntervalSince1970");
            v28 = v27;
            objc_msgSend(v13, "timeIntervalSince1970");
            *(_DWORD *)buf = 134218240;
            v63 = v28;
            v64 = 2048;
            v65 = v29;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Keychain database was modified since the last export (%.6f, %.6f)", buf, 0x16u);
            -[NSObject timeIntervalSince1970](v12, "timeIntervalSince1970");
            v31 = v30;
            objc_msgSend(v13, "timeIntervalSince1970");
            _MBLog(CFSTR("INFO"), "Keychain database was modified since the last export (%.6f, %.6f)", v31, v32);
          }

          goto LABEL_19;
        }
      }
      else if (*(uint64_t *)&v15 != *(uint64_t *)&v19)
      {
        goto LABEL_16;
      }

      v21 = 1;
LABEL_54:

      v9 = v11;
      goto LABEL_55;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    if (objc_msgSend(v22, "isEqualToString:", NSCocoaErrorDomain))
    {
      if (objc_msgSend(v11, "code") == (id)4)
      {

        goto LABEL_41;
      }
      v47 = objc_msgSend(v11, "code");

      if (v47 == (id)260)
      {
LABEL_41:
        v48 = MBGetDefaultLog(v23, v24);
        v12 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Keychain backup not found", buf, 2u);
          _MBLog(CFSTR("INFO"), "Keychain backup not found");
        }
LABEL_19:

        if (!+[MBKeyBag isDeviceKeyBagLocked](MBKeyBag, "isDeviceKeyBagLocked"))
        {
          v57 = v11;
          v34 = sub_10003C158(CFSTR("/var/Keychains/keychain-ota-backup.plist"), 0, 0, &v57);
          v35 = v57;

          if (v34)
          {
            if (v5)
            {
              v36 = open_dprotected_np((const char *)objc_msgSend(CFSTR("/var/Keychains/keychain-ota-backup.plist"), "fileSystemRepresentation"), 0, 1, 0, 256);
              v38 = v36;
              if ((v36 & 0x80000000) != 0)
              {
                v49 = MBGetDefaultLog(v36, v37);
                v40 = objc_claimAutoreleasedReturnValue(v49);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "Failed to verify keychain keybag because open_dprotected_np failed", buf, 2u);
                  _MBLog(CFSTR("FAULT"), "Failed to verify keychain keybag because open_dprotected_np failed");
                }
              }
              else
              {
                v56 = 0;
                v40 = _SecKeychainCopyKeybagUUIDFromFileDescriptor(v36, &v56);
                if (v40)
                {
                  v41 = objc_claimAutoreleasedReturnValue(+[NSData mb_dataFromHexadecimalString:](NSData, "mb_dataFromHexadecimalString:", v40));
                  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject base64EncodedStringWithOptions:](v41, "base64EncodedStringWithOptions:", 0));
                  v43 = objc_msgSend(v5, "checkIfBackupHasKeybagWithUUID:", v42);
                  if ((v43 & 1) == 0)
                  {
                    v45 = MBGetDefaultLog(v43, v44);
                    log = objc_claimAutoreleasedReturnValue(v45);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v63 = (const __CFString *)v40;
                      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Current backup doesn't have keybag %{public}@", buf, 0xCu);
                      _MBLog(CFSTR("FAULT"), "Current backup doesn't have keybag %{public}@", v40);
                    }

                  }
                }
                else
                {
                  v50 = MBGetDefaultLog(0, v39);
                  v41 = objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v63 = CFSTR("/var/Keychains/keychain-ota-backup.plist");
                    v64 = 2114;
                    v65 = v56;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Failed to copy the UUID from the keybag plist at %{public}@: %{public}@", buf, 0x16u);
                    _MBLog(CFSTR("FAULT"), "Failed to copy the UUID from the keybag plist at %{public}@: %{public}@", CFSTR("/var/Keychains/keychain-ota-backup.plist"), v56);
                  }
                }

              }
              close(v38);
            }
            v60 = NSFileModificationDate;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileModificationDate"));
            v61 = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));

            v55 = v35;
            v21 = objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v52, CFSTR("/var/Keychains/keychain-ota-backup.plist"), &v55);
            v11 = v55;

            if ((v21 & 1) == 0)
            {
              objc_msgSend(v6, "removeItemAtPath:error:", CFSTR("/var/Keychains/keychain-ota-backup.plist"), 0);
              if (a4)
                *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v11, CFSTR("/var/Keychains/keychain-ota-backup.plist"), CFSTR("Error setting keychain backup modification date")));
            }

            goto LABEL_54;
          }
          if (!a4)
          {
            v21 = 0;
            v11 = v35;
            goto LABEL_54;
          }
          v46 = objc_retainAutorelease(v35);
          v11 = v46;
          goto LABEL_36;
        }
        if (a4)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Can't export modified keychain because the device is locked")));
LABEL_35:
          v46 = v33;
LABEL_36:
          v21 = 0;
          *a4 = v46;
          goto LABEL_54;
        }
        goto LABEL_37;
      }
    }
    else
    {

    }
    if (a4)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v11, CFSTR("/var/Keychains/keychain-ota-backup.plist"), CFSTR("Error getting keychain backup attributes")));
      goto LABEL_35;
    }
LABEL_37:
    v21 = 0;
    goto LABEL_54;
  }
  v21 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v8, CFSTR("/var/Keychains/keychain-2.db-wal"), CFSTR("Error getting keychain database attributes")));
LABEL_55:

  return v21;
}

+ (BOOL)exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v11;

  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v11 = 0;
  v8 = objc_msgSend((id)objc_opt_class(a1), "_exportKeychainForCKBackupEngine:error:", v6, &v11);
  v9 = v11;
  objc_autoreleasePoolPop(v7);
  if (a4 && (v8 & 1) == 0)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (void)removeServiceKeychainBackup
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;

  v2 = MBGetDefaultLog(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = CFSTR("/var/Keychains/keychain-ota-backup.plist");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Removing %@", CFSTR("/var/Keychains/keychain-ota-backup.plist"));
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/Keychains/keychain-ota-backup.plist"), 0);

}

- (id)preparingBackupWithEngine:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  if (!objc_msgSend(v4, "backsUpPrimaryAccount")
    || (objc_msgSend(v4, "isDeviceTransferEngine") & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isDriveEngine"))
  {
    if (objc_msgSend(v4, "isCloudKitEngine"))
    {
      v6 = objc_claimAutoreleasedReturnValue(-[MBKeychainPlugin _preparingBackupWithCKEngine:](self, "_preparingBackupWithCKEngine:", v4));
      v8 = (void *)v6;
      if (v6)
      {
        v9 = MBGetDefaultLog(v6, v7);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to back up the keychain: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to back up the keychain: %@", v8);
        }

      }
    }
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBKeychainPlugin _preparingBackupWithDriveEngine:](self, "_preparingBackupWithDriveEngine:", v4));
LABEL_12:

  return v5;
}

- (id)endingBackupWithEngine:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v11;

  v3 = a3;
  if (objc_msgSend(v3, "backsUpPrimaryAccount")
    && (objc_msgSend(v3, "isDeviceTransferEngine") & 1) == 0
    && objc_msgSend(v3, "isDriveEngine"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/Keychains/keychain-backup.plist"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encryptionManager"));
    v11 = 0;
    v7 = objc_msgSend(v6, "makeLockdownAndKeychainConsistentWithError:", &v11);
    v8 = v11;

    v9 = 0;
    if ((v7 & 1) == 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v8, CFSTR("Error making lockdown and keychain encryption state consistent")));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_endingRestoreWithDriveEngine:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  unsigned __int8 v28;
  id v29;
  int v30;
  void *v31;
  id v33;
  id v34;
  uint8_t buf[16];
  id v36;
  id v37;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persona"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedIncompleteRestoreDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/var/Keychains/keychain-backup.plist")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "password"));

  v10 = +[MBRestoreDirectoryAnnotator isRestoredPath:](MBRestoreDirectoryAnnotator, "isRestoredPath:", v7);
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keybag"));
    v37 = 0;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataWithError:", &v37));
    v14 = v37;

    if (!v13)
    {
      v27 = v14;
      v30 = 1;
      v17 = v27;
      goto LABEL_19;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
    v36 = v14;
    v16 = sub_10003CB60(v7, (uint64_t)v13, (uint64_t)v15, &v36);
    v17 = v36;

    if (!v16)
    {
      v27 = v17;

      v30 = 1;
      v17 = v27;
      goto LABEL_19;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v18, "removeItemAtPath:error:", v7, 0);

  }
  else
  {
    v19 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No keychain in backup", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "No keychain in backup");
    }
    v17 = 0;
  }

  v22 = MBGetDefaultLog(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Restoring backup password to keychain", buf, 2u);
    _MBLog(CFSTR("INFO"), "Restoring backup password to keychain");
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "encryptionManager"));

  v34 = v17;
  v26 = objc_msgSend(v25, "setPasswordInKeychain:error:", v9, &v34);
  v27 = v34;

  if ((v26 & 1) != 0)
  {
    v33 = v27;
    v28 = objc_msgSend(v25, "setWillEncryptInLockdown:error:", v9 != 0, &v33);
    v29 = v33;

    if ((v28 & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      v30 = 1;
      v17 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v29, CFSTR("Error setting WillEncrypt value in lockdown")));
    }
    v27 = v29;
  }
  else
  {
    v30 = 1;
    v17 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v27, CFSTR("Error restoring backup password to keychain")));
  }

LABEL_19:
  objc_autoreleasePoolPop(v4);
  if (v30)
    v31 = v17;
  else
    v31 = 0;

  return v31;
}

- (void)_restoreKeychainBackupAtPath:(id)a3 withEngine:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  _BYTE v61[18];

  v5 = a3;
  v6 = a4;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v61 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring keychain backup at %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Restoring keychain backup at %{public}@", v5);
  }

  v59 = 0;
  v10 = +[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v5, &v59);
  v11 = v59;
  v13 = v11;
  if ((_DWORD)v10 == 1)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));
    v58 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v15, &v58));
    v17 = v58;

    if (!v16)
    {
      v28 = MBGetDefaultLog(v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v61 = v5;
        *(_WORD *)&v61[8] = 2114;
        *(_QWORD *)&v61[10] = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to open the keychain backup at %{public}@: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to open the keychain backup at %{public}@: %{public}@", v5, v17);
      }
      goto LABEL_38;
    }
    v57 = 0;
    if ((objc_opt_respondsToSelector(v6, "lastKeyBag") & 1) != 0)
    {
      v52 = v16;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastKeyBag"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secret"));
      v56 = v17;
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dataWithError:", &v56));
      v23 = v56;

      v55 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDWithError:", &v55));
      v25 = v55;

      v26 = (void *)v21;
      if (!v22)
      {
        v16 = v52;
        goto LABEL_37;
      }
      v16 = v52;
      if (!v24)
        goto LABEL_37;
LABEL_23:
      if ((_SecKeychainRestoreBackupFromFileDescriptor(objc_msgSend(v16, "fileDescriptor"), v22, v26, &v57) & 1) == 0)
      {
        v42 = v57;

        v45 = MBGetDefaultLog(v43, v44);
        v30 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v61 = v5;
          *(_WORD *)&v61[8] = 2114;
          *(_QWORD *)&v61[10] = v42;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "_SecKeychainRestoreBackupFromFileDescriptor failed for the keychain backup at %{public}@: %{public}@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "_SecKeychainRestoreBackupFromFileDescriptor failed for the keychain backup at %{public}@: %{public}@", v5, v42);
        }
        goto LABEL_36;
      }
LABEL_37:

      v17 = v25;
LABEL_38:

      v13 = v17;
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector(v6, "keyBagForUUID:") & 1) == 0)
      sub_100088260();
    v29 = _SecKeychainCopyKeybagUUIDFromFileDescriptor(objc_msgSend(v16, "fileDescriptor"), &v57);
    if (!v29)
    {
      v42 = v57;

      v48 = MBGetDefaultLog(v46, v47);
      v30 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v61 = v5;
        *(_WORD *)&v61[8] = 2114;
        *(_QWORD *)&v61[10] = v42;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to copy the UUID from the keybag at %{public}@: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to copy the UUID from the keybag at %{public}@: %{public}@", v5, v42);
      }
      v26 = 0;
      v22 = 0;
      goto LABEL_36;
    }
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData mb_dataFromHexadecimalString:](NSData, "mb_dataFromHexadecimalString:", v29));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyBagForUUID:", v31));
    v34 = v32;
    if (v32)
    {
      v54 = v17;
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dataWithError:", &v54));
      v25 = v54;

      if (v22)
      {
        v53 = v31;
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secretForUUID:", v31));
        v39 = MBGetDefaultLog(v37, v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = -[NSObject length](v22, "length");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v61 = v30;
          *(_WORD *)&v61[8] = 2048;
          *(_QWORD *)&v61[10] = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Found keybag for keychain restore: %{public}@ (%ld bytes)", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "Found keybag for keychain restore: %{public}@ (%ld bytes)", v30, -[NSObject length](v22, "length"));
        }

        v26 = (void *)v37;
        goto LABEL_23;
      }
      v51 = MBGetDefaultLog(v35, v36);
      v50 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v61 = v30;
        *(_WORD *)&v61[8] = 2114;
        *(_QWORD *)&v61[10] = v25;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to fetch the keybag data for %{public}@: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to fetch the keybag data for %{public}@: %{public}@", v30, v25);
      }
      v17 = v25;
    }
    else
    {
      v49 = MBGetDefaultLog(0, v33);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v61 = v30;
        *(_WORD *)&v61[8] = 2114;
        *(_QWORD *)&v61[10] = v17;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to fetch the keybag for %{public}@: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to fetch the keybag for %{public}@: %{public}@", v30, v17);
      }
    }

    v26 = 0;
    v22 = 0;
    v42 = v17;
LABEL_36:

    v25 = v42;
    goto LABEL_37;
  }
  if ((_DWORD)v10 == 255)
  {
    v14 = MBGetDefaultLog(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v61 = v5;
      *(_WORD *)&v61[8] = 2114;
      *(_QWORD *)&v61[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch the keychain backup protection class at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to fetch the keychain backup protection class at %{public}@: %{public}@", v5, v13);
    }
  }
  else
  {
    v27 = MBGetDefaultLog(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v61 = v10;
      *(_WORD *)&v61[4] = 2114;
      *(_QWORD *)&v61[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Found an unexpected protection class (%d) for the keychain backup at %{public}@", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "Found an unexpected protection class (%d) for the keychain backup at %{public}@", v10, v5);
    }
  }
LABEL_39:

}

- (void)_endingRestoreWithServicePolicy:(id)a3 engine:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  unsigned __int8 v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  NSObject *v51;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persona"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedIncompleteRestoreDirectory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("/var/Keychains/keychain-ota-backup.plist")));

  v11 = +[MBRestoreDirectoryAnnotator isRestoredPath:](MBRestoreDirectoryAnnotator, "isRestoredPath:", v10);
  if (v11)
  {
    v13 = objc_msgSend(v6, "isRestoringToSameDevice");
    if ((v13 & 1) != 0)
    {
      v47 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeychain allPasswordItemsForServices:error:](MBKeychain, "allPasswordItemsForServices:error:", &off_1000E5018, &v47));
      v16 = v47;
      v18 = v16;
      if (!v15)
      {
        v19 = MBGetDefaultLog(v16, v17);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the preserved keychain items: %{public}@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to fetch the preserved keychain items: %{public}@", v18);
        }

      }
      v21 = MBGetDefaultLog(v16, v17);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v15, "count");
        v24 = MBStringWithArray(v15);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 134218242;
        v49 = v23;
        v50 = 2112;
        v51 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Preserving %ld keychain items: %@", buf, 0x16u);

        v26 = objc_msgSend(v15, "count");
        v27 = MBStringWithArray(v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        _MBLog(CFSTR("DEFAULT"), "Preserving %ld keychain items: %@", v26, v28);

      }
      v29 = -[MBKeychainPlugin _restoreKeychainBackupAtPath:withEngine:](self, "_restoreKeychainBackupAtPath:withEngine:", v10, v7);
      v31 = MBGetDefaultLog(v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v10;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Removing the keychain backup at %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Removing the keychain backup at %{public}@", v10);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v33, "removeItemAtPath:error:", v10, 0);

      v46 = v18;
      v34 = +[MBKeychain addAllPasswordItems:error:](MBKeychain, "addAllPasswordItems:error:", v15, &v46);
      v35 = v46;

      v38 = MBGetDefaultLog(v36, v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      if ((v34 & 1) != 0)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v41 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 134217984;
          v49 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Added %ld preserved keychain items to the restored keychain", buf, 0xCu);
          objc_msgSend(v15, "count");
          _MBLog(CFSTR("DEFAULT"), "Added %ld preserved keychain items to the restored keychain");
        }
      }
      else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218242;
        v49 = v45;
        v50 = 2114;
        v51 = v35;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to add %ld items to the restored keychain: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to add %ld items to the restored keychain: %{public}@", objc_msgSend(v15, "count"), v35);
      }

    }
    else
    {
      v43 = MBGetDefaultLog(v13, v14);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v10;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Can't migrate keychain - removing the keychain backup at %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Can't migrate keychain - removing the keychain backup at %{public}@", v10);
      }

      v35 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      -[NSObject removeItemAtPath:error:](v35, "removeItemAtPath:error:", v10, 0);
    }
  }
  else
  {
    v42 = MBGetDefaultLog(v11, v12);
    v35 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No keychain in backup", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "No keychain in backup");
    }
  }

}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "restoresPrimaryAccount")
    || (objc_msgSend(v7, "isDeviceTransferEngine") & 1) != 0)
  {
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "isDriveEngine"))
  {
    -[MBKeychainPlugin _endingRestoreWithServicePolicy:engine:](self, "_endingRestoreWithServicePolicy:engine:", v6, v7);
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBKeychainPlugin _endingRestoreWithDriveEngine:](self, "_endingRestoreWithDriveEngine:", v7));
LABEL_7:

  return v8;
}

@end
