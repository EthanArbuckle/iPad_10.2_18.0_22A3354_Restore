@implementation MBDeviceTools

+ (id)toolsWithSettingsContext:(id)a3 error:(id *)a4
{
  id v5;
  MBDeviceTools *v6;

  v5 = a3;
  v6 = -[MBDeviceTools initWithSettingsContext:error:]([MBDeviceTools alloc], "initWithSettingsContext:error:", v5, a4);

  return v6;
}

- (MBDeviceTools)initWithSettingsContext:(id)a3 error:(id *)a4
{
  id v7;
  MBDeviceTools *v8;
  MBDeviceTools *v9;
  MBToolsDomainManager *v10;
  MBDomainManager *domainManager;
  MBBackupHelper *v12;
  void *backupHelper;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceTools;
  v8 = -[MBDeviceTools init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_settingsContext, a3);
    v10 = -[MBToolsDomainManager initWithTools:error:]([MBToolsDomainManager alloc], "initWithTools:error:", v9, a4);
    domainManager = v9->_domainManager;
    v9->_domainManager = (MBDomainManager *)v10;

    if (v9->_domainManager)
    {
      v12 = -[MBBackupHelper initWithSettingsContext:domainManager:]([MBBackupHelper alloc], "initWithSettingsContext:domainManager:", v9->_settingsContext, v9->_domainManager);
      backupHelper = v9->_backupHelper;
      v9->_backupHelper = v12;
    }
    else
    {
      backupHelper = v9;
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)_extractWithManifest:(id)a3 file:(id)a4 keybag:(id)a5 toDrivePath:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id *v42;
  MBToolsFileHandleFactory *v43;
  void *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  const __CFString *v49;
  MBToolsFileHandleFactory *v50;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "properties"));
  LOBYTE(a3) = objc_msgSend(v15, "hasManifestDB");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileID"));
  v17 = v16;
  if ((a3 & 1) != 0)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filenameWithPrefix"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filename"));
  v19 = (void *)v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self->_settingsContext, "driveBackupDir"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v19));

  if (v13)
  {
    v24 = MBTemporaryPath(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encryptionKey"));
    if (v26)
    {
      v49 = CFSTR("FileHandleFactory");
      v50 = -[MBToolsFileHandleFactory initWithKeyBag:key:]([MBToolsFileHandleFactory alloc], "initWithKeyBag:key:", v13, v26);
      v43 = v50;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
      v28 = MBGetDefaultLog(v44, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v21;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Downloading and decrypting encrypted file from \"%@\", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Downloading and decrypting encrypted file from \"%@\", v21);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
      v42 = a7;
      v31 = objc_msgSend(v30, "downloadFileAtPath:toPath:options:error:", v21, v25, v44, a7);

      if (v31)
      {
        v34 = MBGetDefaultLog(v32, v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v14;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Uploading unencrypted file to \"%@\", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Uploading unencrypted file to \"%@\", v14);
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
        v37 = objc_msgSend(v36, "uploadFileAtPath:toPath:options:error:", v25, v14, 0, v42);

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v38, "removeItemAtPath:error:", v25, 0);

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
      if (a7)
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Encryption key not found")));
    }

  }
  else
  {
    v39 = MBGetDefaultLog(v22, v23);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v21;
      v47 = 2112;
      v48 = v14;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Copying \"%@\" to \"%@\", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Copying \"%@\" to \"%@\", v21, v14);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
    v37 = objc_msgSend(v25, "copyItemAtPath:toPath:options:error:", v21, v14, 0, a7);
  }

  return v37;
}

- (BOOL)extractWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  MBDeviceTools *v38;
  id v39;
  id v40;
  _BYTE *v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a3;
  v9 = a4;
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Extracting %@-%@", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Extracting %@-%@", v8, v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](self->_backupHelper, "readBackupManifestWithError:", a5));
  v14 = v13;
  if (!v13)
    goto LABEL_24;
  objc_msgSend(v13, "buildIndexFromDatabaseIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "properties"));
  v16 = objc_msgSend(v15, "encrypted");

  if (!v16)
  {
    v20 = 0;
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "properties"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keybagData"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext password](self->_settingsContext, "password"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v18, v19, a5));

    if (!v20)
      goto LABEL_24;
LABEL_9:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomainManager domainForName:](self->_domainManager, "domainForName:", v8));
    if (v21)
    {
      if ((MBIsValidRelativePath(v9) & 1) != 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithDomain:relativePath:](MBFileID, "fileIDWithDomain:relativePath:", v21, v9));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchFileWithID:error:", v35, a5));
        v23 = v22;
        if (v22)
        {
          if (objc_msgSend(v22, "isDirectory"))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "relativePath"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent"));
            objc_msgSend(v34, "removeItemAtPath:options:error:", v25, 0, 0);

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v43 = sub_10005D7EC;
            v44 = sub_10005D7FC;
            v45 = 0;
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10005D804;
            v36[3] = &unk_1000D9DC8;
            v37 = v23;
            v38 = self;
            v41 = buf;
            v39 = v14;
            v40 = v20;
            v26 = objc_msgSend(v39, "enumerateFiles:includeUninstalled:", v36, 1);
            v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
            v28 = v27 == 0;
            if (a5 && v27)
              *a5 = objc_retainAutorelease(v27);

            _Block_object_dispose(buf, 8);
            goto LABEL_36;
          }
          if (objc_msgSend(v23, "isRegularFile"))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
            v28 = -[MBDeviceTools _extractWithManifest:file:keybag:toDrivePath:error:](self, "_extractWithManifest:file:keybag:toDrivePath:error:", v14, v23, v20, v32, a5);

LABEL_36:
            goto LABEL_37;
          }
          if (a5)
          {
            v30 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 4, CFSTR("Not a regular file or directory")));
            goto LABEL_34;
          }
        }
        else if (a5)
        {
          v30 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 4, CFSTR("File not found in manifest")));
LABEL_34:
          v28 = 0;
          *a5 = v30;
          goto LABEL_36;
        }
        v28 = 0;
        goto LABEL_36;
      }
      if (a5)
      {
        if (objc_msgSend(v21, "isUninstalledAppDomain"))
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        else
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rootPath"));
        v31 = (void *)v29;
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Path to extract must be relative to domain root (%@)"), v29));

      }
    }
    else if (a5)
    {
      v28 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 4, CFSTR("Domain not found")));
LABEL_37:

      goto LABEL_38;
    }
    v28 = 0;
    goto LABEL_37;
  }
  if (!a5)
  {
LABEL_24:
    v28 = 0;
    goto LABEL_38;
  }
  v28 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Keybag data not found")));
LABEL_38:

  return v28;
}

- (id)infoWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readStatusWithError:](self->_backupHelper, "readStatusWithError:"));
  if (v23)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](self->_backupHelper, "readBackupManifestWithError:", a3));
    v22 = v5;
    if (v5)
    {
      objc_msgSend(v5, "buildIndexFromDatabaseIfNeeded");
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0x4000));
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = sub_10005D7EC;
      v34 = sub_10005D7FC;
      v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10005DE78;
      v29[3] = &unk_1000D9DF0;
      v29[4] = &v40;
      v29[5] = &v36;
      v29[6] = &v30;
      v6 = objc_msgSend(v22, "enumerateFiles:includeUninstalled:", v29, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
      objc_msgSend(v24, "appendFormat:", CFSTR("%@\n"), v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "properties"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      objc_msgSend(v24, "appendFormat:", CFSTR("%@\n"), v9);

      objc_msgSend(v24, "appendString:", CFSTR("\n"));
      objc_msgSend(v24, "appendString:", CFSTR(" Count   Size (B) Domain name\n"));
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "allKeys"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v44, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "objectForKeyedSubscript:", v15));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
            v18 = objc_msgSend(v17, "longValue");

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 1));
            v20 = objc_msgSend(v19, "longLongValue");

            objc_msgSend(v24, "appendFormat:", CFSTR("  %4ld %10lld %@\n"), v18, v20, v15);
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v44, 16);
        }
        while (v12);
      }

      objc_msgSend(v24, "appendFormat:", CFSTR("  %4ld %10lld %@\n"), v41[3], v37[3], CFSTR("Total"));
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)listWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  if (!a3)
    sub_100088738();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](self->_backupHelper, "readBackupManifestWithError:"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0x4000));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%-41s %-41s %7s %8s %4s %4s %-20s %-20s %-20s %11s %6s %s %s %s %s\n"), "ID,", "Digest,", "Mode,", "Inode,", "UID,", "GID,", "Last modified,", "Last status change,", "Birth,", "Size,", "Class,", "Domain,", "Relative path,", "Target,", "Extended attributes"));
    objc_msgSend(v5, "appendString:", v6);
    v7 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v7, "setFormatterBehavior:", 1040);
    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005E25C;
    v13[3] = &unk_1000D9E18;
    v14 = v7;
    v8 = v5;
    v15 = v8;
    v9 = v7;
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumerateFiles:", v13));
    v10 = v15;
    v11 = v8;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)unbackWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  MBDeviceTools *v41;
  id v42;
  id v43;
  id v44;
  __int128 *p_buf;
  id v46;
  id v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext sourceIdentifier](self->_settingsContext, "sourceIdentifier"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext targetIdentifier](self->_settingsContext, "targetIdentifier"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("_unback_"), "stringByAppendingPathComponent:", v8));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupManifestWithError:](self->_backupHelper, "readBackupManifestWithError:", a3));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "buildIndexFromDatabaseIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "properties"));
    v13 = objc_msgSend(v12, "encrypted");

    if (v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "properties"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keybagData"));

      if (!v17)
      {
        if (!a3)
        {
          v19 = 0;
LABEL_32:
          v20 = 0;
          goto LABEL_33;
        }
        v35 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Keybag data not found")));
        v19 = 0;
        v20 = 0;
LABEL_30:
        v21 = 0;
        *a3 = v35;
LABEL_34:

        goto LABEL_35;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext password](self->_settingsContext, "password"));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v17, v18, a3));

      if (!v19)
        goto LABEL_32;
    }
    else
    {
      v19 = 0;
    }
    v22 = MBGetDefaultLog(v14, v15);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("_unback_");
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Creating directory: %@", (uint8_t *)&buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Creating directory: %@", CFSTR("_unback_"));
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
    v47 = 0;
    v25 = objc_msgSend(v24, "createDirectoryAtPath:options:error:", CFSTR("_unback_"), 0, &v47);
    v20 = v47;

    if ((v25 & 1) != 0
      || (v26 = +[MBError isError:withCode:](MBError, "isError:withCode:", v20, 3),
          (v26 & 1) != 0))
    {
      v28 = MBGetDefaultLog(v26, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Creating directory: %@", (uint8_t *)&buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Creating directory: %@", v9);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
      v46 = v20;
      v31 = objc_msgSend(v30, "createDirectoryAtPath:options:error:", v9, 0, &v46);
      v32 = v46;

      if ((v31 & 1) != 0
        || (+[MBError isError:withCode:](MBError, "isError:withCode:", v32, 3) & 1) != 0)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v49 = 0x3032000000;
        v50 = sub_10005D7EC;
        v51 = sub_10005D7FC;
        v52 = 0;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10005EA34;
        v38[3] = &unk_1000D9E40;
        v39 = v9;
        v40 = v37;
        v41 = self;
        p_buf = &buf;
        v20 = v32;
        v42 = v20;
        v43 = v11;
        v19 = v19;
        v44 = v19;
        v33 = objc_msgSend(v43, "enumerateFiles:includeUninstalled:", v38, 1);
        v34 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v21 = v34 == 0;
        if (a3 && v34)
          *a3 = objc_retainAutorelease(v34);

        _Block_object_dispose(&buf, 8);
        goto LABEL_34;
      }
      if (!a3)
      {
        v21 = 0;
        v20 = v32;
        goto LABEL_34;
      }
      v35 = objc_retainAutorelease(v32);
    }
    else
    {
      if (!a3)
      {
LABEL_33:
        v21 = 0;
        goto LABEL_34;
      }
      v35 = objc_retainAutorelease(v20);
    }
    v20 = v35;
    goto LABEL_30;
  }
  v20 = 0;
  v21 = 0;
LABEL_35:

  return v21;
}

- (MBDriveSettingsContext)settingsContext
{
  return self->_settingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsContext, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
}

@end
