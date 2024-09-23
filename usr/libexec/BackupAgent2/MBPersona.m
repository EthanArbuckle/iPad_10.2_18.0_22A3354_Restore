@implementation MBPersona

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSMutableDictionary *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t isKindOfClass;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  id v49;
  id v50;
  __CFString *v51;
  id v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  __CFString *v56;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (!v7)
    sub_1000885D0();
  v8 = v7;
  if (!-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MBPersona preferencesDirectory](self, "preferencesDirectory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v52 = 0;
    v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v52);
    v15 = (__CFString *)v52;

    if ((v14 & 1) == 0)
    {
      v18 = MBGetDefaultLog(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v54 = (const __CFString *)v12;
        v55 = 2112;
        v56 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create the directory at %{public}@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to create the directory at %{public}@: %@", v12, v15);
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v12, "stringByAppendingPathComponent:", CFSTR("com.apple.MobileBackup.plist")));
    v21 = objc_opt_class(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_sync_enter(v22);
    v51 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v20, 0, &v51));
    v24 = v51;

    if (v23)
    {
      v50 = 0;
      v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v23, 1, 0, &v50));
      v26 = (__CFString *)v50;

      if (v25)
      {
        v29 = objc_opt_class(NSMutableDictionary);
        isKindOfClass = objc_opt_isKindOfClass(v25, v29);
        if ((isKindOfClass & 1) != 0)
        {
          v24 = v26;
          goto LABEL_24;
        }
        v35 = MBGetDefaultLog(isKindOfClass, v31);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = (const __CFString *)v25;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Found unexpected class: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Found unexpected class: %@", v25);
        }

      }
      else
      {
        v34 = MBGetDefaultLog(v27, v28);
        v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(&v25->super.super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v20;
          v55 = 2112;
          v56 = v26;
          _os_log_impl((void *)&_mh_execute_header, &v25->super.super, OS_LOG_TYPE_ERROR, "Failed to deserialize data for the file at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to deserialize data for the file at %@: %@", v20, v26);
        }
      }

      v24 = v26;
    }
    else
    {
      v32 = +[MBError isNSFileNotFoundError:](MBError, "isNSFileNotFoundError:", v24);
      if (!(_DWORD)v32)
      {
        v47 = MBGetDefaultLog(v32, v33);
        v45 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v20;
          v55 = 2112;
          v56 = v24;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to read the file at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to read the file at %@: %@", v20, v24);
        }
        v37 = 0;
        v25 = 0;
        goto LABEL_37;
      }
      v25 = objc_opt_new(NSMutableDictionary);
      if (v25)
      {
LABEL_24:
        if (v6)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v6, v8);
        else
          -[NSMutableDictionary removeObjectForKey:](v25, "removeObjectForKey:", v8);
        v49 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v25, 200, 0, &v49));
        v38 = (__CFString *)v49;

        if (v37)
        {
          v48 = v38;
          v41 = objc_msgSend(v37, "writeToFile:options:error:", v20, 268435457, &v48);
          v24 = v48;

          if ((v41 & 1) != 0)
          {
LABEL_38:

            objc_sync_exit(v22);
LABEL_39:

            goto LABEL_40;
          }
          v44 = MBGetDefaultLog(v42, v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v54 = v20;
            v55 = 2112;
            v56 = v24;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to write data at %@: %@", buf, 0x16u);
            _MBLog(CFSTR("ERROR"), "Failed to write data at %@: %@", v20, v24);
          }
        }
        else
        {
          v46 = MBGetDefaultLog(v39, v40);
          v45 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v38;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to serialize dictionary: %@", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), "Failed to serialize dictionary: %@", v38);
          }
          v37 = 0;
          v24 = v38;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    v25 = objc_opt_new(NSMutableDictionary);
    goto LABEL_24;
  }
  CFPreferencesSetValue(v8, v6, CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), kCFPreferencesCurrentHost);
  v9 = CFPreferencesSynchronize(CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), kCFPreferencesCurrentHost);
  if (!(_DWORD)v9)
  {
    v11 = MBGetDefaultLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v54 = CFSTR("com.apple.MobileBackup");
      v55 = 2112;
      v56 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %{public}@ domain (%@)", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to sync preferences for %{public}@ domain (%@)", CFSTR("com.apple.MobileBackup"), v8);
    }
    goto LABEL_39;
  }
LABEL_40:

}

- (id)copyPreferencesValueForKey:(id)a3 class:(Class)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t isKindOfClass;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;

  v6 = (__CFString *)a3;
  if (!v6)
    sub_1000885F8();
  v7 = v6;
  if (!-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona preferencesDirectory](self, "preferencesDirectory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("com.apple.MobileBackup.plist")));

    v32 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v10, 0, &v32));
    v12 = v32;
    if (v11)
    {
      v31 = 0;
      v13 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v11, 0, 0, &v31));
      v14 = v31;

      if (v13)
      {
        v17 = objc_opt_class(NSDictionary);
        isKindOfClass = objc_opt_isKindOfClass(v13, v17);
        if ((isKindOfClass & 1) != 0)
        {
LABEL_19:
          v12 = v14;
LABEL_20:
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v7));

          if (!v8)
            goto LABEL_25;
          goto LABEL_21;
        }
        v20 = MBGetDefaultLog(isKindOfClass, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v13;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Found unexpected class: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Found unexpected class: %@", v13);
        }

      }
      else
      {
        v24 = MBGetDefaultLog(v15, v16);
        v13 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v10;
          v35 = 2112;
          v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize the file at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to deserialize the file at %@: %@", v10, v14);
        }
      }
    }
    else
    {
      v22 = +[MBError isNSFileNotFoundError:](MBError, "isNSFileNotFoundError:", v12);
      if ((v22 & 1) != 0)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v25 = MBGetDefaultLog(v22, v23);
      v13 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v10;
        v35 = 2112;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to read the file at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to read the file at %@: %@", v10, v12);
      }
      v14 = v12;
    }

    v13 = 0;
    goto LABEL_19;
  }
  v8 = (void *)CFPreferencesCopyValue(v7, CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), kCFPreferencesCurrentHost);
  if (!v8)
    goto LABEL_25;
LABEL_21:
  v26 = objc_opt_isKindOfClass(v8, a4);
  if ((v26 & 1) == 0)
  {
    v28 = MBGetDefaultLog(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      v35 = 2112;
      v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Invalid class for \"%{public}@\" key: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Invalid class for \"%{public}@\" key: %@", v7, v8);
    }

    v8 = 0;
  }
LABEL_25:

  return v8;
}

- (unsigned)getBooleanValueForKey:(id)a3 keyExists:(char *)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;

  v6 = a3;
  v7 = -[MBPersona copyPreferencesValueForKey:class:](self, "copyPreferencesValueForKey:class:", v6, objc_opt_class(NSNumber));

  if (v7)
  {
    if (a4)
      *a4 = 1;
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = 0;
  }

  return v8;
}

+ (id)personalPersonaWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaType:withError:](UMUserPersonaAttributes, "personaAttributesForPersonaType:withError:", 0, a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personaWithAttributes:volumeMountPoint:](MBPersona, "personaWithAttributes:volumeMountPoint:", v5, CFSTR("/private/var/mobile")));
  }
  else
  {
    v7 = MBGetDefaultLog(0, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "nil personaAttributes for %ld persona", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "nil personaAttributes for %ld persona", 0);
    }

    v6 = 0;
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil personaAttributes")));
  }

  return v6;
}

+ (id)allPersonae
{
  NSMutableArray *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;

  v2 = objc_opt_new(NSMutableArray);
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v16));
  v4 = v16;
  if (v3)
    -[NSMutableArray addObject:](v2, "addObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaType:](UMUserPersonaAttributes, "personaAttributesForPersonaType:", 2));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaLayoutPathURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));

    if (v8)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MBPersona personaWithAttributes:volumeMountPoint:](MBPersona, "personaWithAttributes:volumeMountPoint:", v6, v8));
      -[NSMutableArray addObject:](v2, "addObject:", v11);
    }
    else
    {
      v12 = MBGetDefaultLog(v9, v10);
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userPersonaUniqueString"));
        *(_DWORD *)buf = 134218242;
        v18 = 2;
        v19 = 2114;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil volumeMountPoint for %ld persona (%{public}@)", buf, 0x16u);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userPersonaUniqueString"));
        _MBLog(CFSTR("ERROR"), "nil volumeMountPoint for %ld persona (%{public}@)", 2, v14);

      }
    }

  }
  return v2;
}

+ (void)removeBackupSnapshotsForAllPersonae
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[MBPersona allPersonae](MBPersona, "allPersonae"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v5);
        v7 = objc_autoreleasePoolPush();
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "volumesToBackUp"));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:error:](MBFileSystemManager, "deleteAllSnapshotsForVolume:withPrefix:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), CFSTR("com.apple.mobilebackup"), 0);
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(v7);
        v5 = (char *)v5 + 1;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }

}

+ (void)removeBackupSnapshotsForPersonalPersona
{
  +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:error:](MBFileSystemManager, "deleteAllSnapshotsForVolume:withPrefix:error:", CFSTR("/private/var/mobile"), CFSTR("com.apple.mobilebackup"), 0);
  +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:error:](MBFileSystemManager, "deleteAllSnapshotsForVolume:withPrefix:error:", CFSTR("/private/var"), CFSTR("com.apple.mobilebackup"), 0);
}

- (void)_removeTemporaryDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    MBRemoveTemporaryDirectory();
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona volumeMountPoint](self, "volumeMountPoint"));
    if (!v3)
      sub_1000886E8();
    v22 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("tmp")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtPath:", v4));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v9 = objc_autoreleasePoolPush();
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("backupd-")))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v8));
          v12 = MBGetDefaultLog(v10, v11);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing temporary directory at %{public}@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Removing temporary directory at %{public}@", v10);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v23 = 0;
          v15 = objc_msgSend(v14, "removeItemAtPath:error:", v10, &v23);
          v16 = v23;

          if ((v15 & 1) == 0)
          {
            v19 = MBGetDefaultLog(v17, v18);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v25 = v10;
              v26 = 2114;
              v27 = v16;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to remove the temporary directory at %{public}@: %{public}@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), "Failed to remove the temporary directory at %{public}@: %{public}@", v10, v16);
            }

          }
        }
        objc_autoreleasePoolPop(v9);
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

        v8 = (void *)v21;
      }
      while (v21);
    }

  }
}

+ (void)removeTemporaryDirectoriesForAllPersonae
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona allPersonae](MBPersona, "allPersonae", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);
        v8 = objc_autoreleasePoolPush();
        objc_msgSend(v7, "_removeTemporaryDirectories");
        objc_autoreleasePoolPop(v8);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)restorePathForRestorable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v4 = a3;
  if (!v4)
    sub_100088E90();
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona _restorePathForDomain:isSystemContainer:](self, "_restorePathForDomain:isSystemContainer:", v6, &v12));
  if (v12)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absolutePath"));
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v8));

  return v10;
}

- (id)_restorePathForDomain:(id)a3 isSystemContainer:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  if (!v6)
    sub_100088EB8();
  if (!a4)
    sub_100088EE0();
  v7 = v6;
  if ((objc_msgSend(v6, "shouldRestoreToSharedVolume") & 1) != 0)
    v8 = objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
  else
    v8 = objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
  v9 = (void *)v8;
  if (objc_msgSend(v7, "isSystemContainerDomain"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v10));

    v12 = objc_claimAutoreleasedReturnValue(-[MBPersona systemDataContainerRestoreDirectory](self, "systemDataContainerRestoreDirectory"));
  }
  else
  {
    if (!objc_msgSend(v7, "isSystemSharedContainerDomain"))
    {
      *a4 = 0;
      v16 = v9;
      goto LABEL_12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v13));

    v12 = objc_claimAutoreleasedReturnValue(-[MBPersona systemSharedDataContainerRestoreDirectory](self, "systemSharedDataContainerRestoreDirectory"));
  }
  v14 = (void *)v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v12));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v11));
  *a4 = 1;

LABEL_12:
  return v16;
}

- (id)stashAsset:(id)a3 forDomain:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona restorePrefetchDirectoryForDomain:](self, "restorePrefetchDirectoryForDomain:", a4));
  v10 = objc_msgSend((id)objc_opt_class(self), "_stashFileAtURL:prefetchDirectory:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
  else
    v12 = 0;

  return v12;
}

+ (id)_stashFileAtURL:(id)a3 prefetchDirectory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  id v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  int v44;
  stat buf;

  v7 = a3;
  v8 = a4;
  if (!v7)
    sub_100088F08();
  v9 = v8;
  if (!v8)
    sub_100088F30();
  if (!a5)
    sub_100088F58();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileOperation createPathInDirectory:fileName:](MBFileOperation, "createPathInDirectory:fileName:", v8, 0));
  v11 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v40 = 0;
  v13 = objc_msgSend(v12, "moveItemAtURL:toURL:error:", v7, v11, &v40);
  v14 = v40;

  if ((v13 & 1) != 0)
  {
    v15 = v11;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v18 = MBGetDefaultLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412802;
      *(_QWORD *)&buf.st_mode = v16;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v10;
      HIWORD(buf.st_gid) = 2112;
      *(_QWORD *)&buf.st_rdev = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to move %@ to %@: %@", (uint8_t *)&buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "Failed to move %@ to %@: %@", v16, v10, v14);
    }

    *a5 = objc_retainAutorelease(v14);
    memset(&buf, 0, sizeof(buf));
    v20 = objc_retainAutorelease(v16);
    v21 = lstat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &buf);
    v22 = v21;
    v24 = MBGetDefaultLog(v21, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = *__error();
        *(_DWORD *)v41 = 138412546;
        v42 = v20;
        v43 = 1024;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v41, 0x12u);
        v38 = *__error();
        _MBLog(CFSTR("ERROR"), "lstat failed at %@: %{errno}d", v20, v38);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v41 = 138412290;
      v42 = v20;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Found source file at %@", v41, 0xCu);
      _MBLog(CFSTR("INFO"), "Found source file at %@", v20, v37);
    }

    v28 = objc_retainAutorelease(v10);
    v29 = lstat((const char *)objc_msgSend(v28, "fileSystemRepresentation"), &buf);
    v30 = v29;
    v32 = MBGetDefaultLog(v29, v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = v33;
    if (v30)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35 = *__error();
        *(_DWORD *)v41 = 138412546;
        v42 = v28;
        v43 = 1024;
        v44 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v41, 0x12u);
        v39 = *__error();
        _MBLog(CFSTR("ERROR"), "lstat failed at %@: %{errno}d", v28, v39);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v41 = 138412290;
      v42 = v28;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Found destination file at %@", v41, 0xCu);
      _MBLog(CFSTR("INFO"), "Found destination file at %@", v28, v37);
    }

    v15 = 0;
  }

  return v15;
}

- (BOOL)shouldRestoreFilesSparse
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  char *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  unsigned __int8 v22;
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  MBPersona *v28;

  v4 = MBGetDefaultLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (char *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412546;
    v26 = v7;
    v27 = 2112;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    _MBLog(CFSTR("DEBUG"), "%@: persona:%@", v9, self);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona volumeMountPoint](self, "volumeMountPoint"));
  if (qword_1000F9E90 != -1)
    dispatch_once(&qword_1000F9E90, &stru_1000DA258);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1000F9E98);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000F9E88, "objectForKeyedSubscript:", v10));
  if (!v11)
  {
    v24 = 0;
    v12 = -[MBPersona getBooleanValueForKey:keyExists:](self, "getBooleanValueForKey:keyExists:", CFSTR("RestoreFilesSparse"), &v24);
    v13 = -[MBPersona _fileSystemSupportsSparseFiles:](self, "_fileSystemSupportsSparseFiles:", v10);
    v14 = 0;
    if (v13)
    {
      if (v24)
        v15 = v12 == 0;
      else
        v15 = 0;
      v14 = !v15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    objc_msgSend((id)qword_1000F9E88, "setObject:forKeyedSubscript:", v16, v10);
    v11 = v16;
    v18 = MBGetDefaultLog(v11, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v11, "BOOLValue"))
        v20 = "YES";
      else
        v20 = "NO";
      *(_DWORD *)buf = 136315138;
      v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "shouldRestoreFilesSparse=%s", buf, 0xCu);
      if (objc_msgSend(v11, "BOOLValue"))
        v21 = "YES";
      else
        v21 = "NO";
      _MBLog(CFSTR("DEFAULT"), "shouldRestoreFilesSparse=%s", v21);
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1000F9E98);
  v22 = objc_msgSend(v11, "BOOLValue");

  return v22;
}

- (BOOL)_fileSystemSupportsSparseFiles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int *v14;
  _BOOL4 v15;
  unsigned int v16;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  uint8_t v22[32];
  int v23;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0);
  if ((v4 & 0x80000000) != 0)
  {
    v11 = MBGetDefaultLog(v4, v5);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = v3;
      *(_WORD *)&v22[12] = 1024;
      *(_DWORD *)&v22[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d while checking if FS supports sparse files", v22, 0x12u);
      v14 = __error();
      _MBLog(CFSTR("ERROR"), "Unable to open %@: %{errno}d while checking if FS supports sparse files", v3, *v14);
    }

  }
  else
  {
    v6 = v4;
    v19 = 0;
    v18 = xmmword_10009D4E0;
    v23 = 0;
    memset(v22, 0, sizeof(v22));
    v7 = fgetattrlist(v4, &v18, v22, 0x24uLL, 0);
    if (!(_DWORD)v7)
    {
      v16 = *(_DWORD *)&v22[4] & *(_DWORD *)&v22[20];
      close(v6);
      v15 = (v16 >> 6) & 1;
      goto LABEL_11;
    }
    v9 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Couldn't get attr list for filesystem path %@ while checking if it can support sparse files", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Couldn't get attr list for filesystem path %@ while checking if it can support sparse files", v3);
    }

    close(v6);
  }
  LOBYTE(v15) = 0;
LABEL_11:

  return v15;
}

- (BOOL)createRestoreDirectoriesWithError:(id *)a3
{
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  MBPersona *v41;

  v6 = MBGetDefaultLog(self, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412546;
    v39 = v9;
    v40 = 2112;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _MBLog(CFSTR("DEBUG"), "%@: persona:%@", v11, self);

  }
  v14 = MBGetDefaultLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
    *(_DWORD *)buf = 138412290;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating user incomplete restore directory: %@", buf, 0xCu);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
    _MBLog(CFSTR("INFO"), "Creating user incomplete restore directory: %@", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
  v37 = 0;
  v19 = sub_100082C9C(v18, 2, (uint64_t)&v37);
  v20 = v37;

  if ((v19 & 1) != 0)
  {
    v21 = -[MBPersona shouldRestoreToSharedVolume](self, "shouldRestoreToSharedVolume");
    v22 = (int)v21;
    v24 = MBGetDefaultLog(v21, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
        *(_DWORD *)buf = 138412290;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Creating shared incomplete restore directory: %@", buf, 0xCu);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
        _MBLog(CFSTR("INFO"), "Creating shared incomplete restore directory: %@", v28);

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
      v36 = v20;
      v30 = 1;
      v31 = sub_100082C9C(v29, 1, (uint64_t)&v36);
      v32 = v36;

      if ((v31 & 1) == 0)
      {
        v30 = 0;
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v32, CFSTR("Error creating incomplete shared restore directory")));
      }
      v20 = v32;
    }
    else
    {
      if (v26)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
        *(_DWORD *)buf = 138412290;
        v39 = v33;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Skipping shared creating incomplete restore directory: %@", buf, 0xCu);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
        _MBLog(CFSTR("INFO"), "Skipping shared creating incomplete restore directory: %@", v34);

      }
      v30 = 1;
    }
  }
  else
  {
    v30 = 0;
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v20, CFSTR("Error creating incomplete user restore directory")));
  }

  return v30;
}

- (BOOL)cleanupRestoreDirectoriesWithError:(id *)a3
{
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  MBPersona *v21;

  v6 = MBGetDefaultLog(self, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _MBLog(CFSTR("DEBUG"), "%@: persona:%@", v11, self);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userRestoreDirectory](self, "userRestoreDirectory"));
  v14 = objc_msgSend(v12, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v13, a3);

  if (v14)
  {
    if (-[MBPersona shouldRestoreToSharedVolume](self, "shouldRestoreToSharedVolume"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedRestoreDirectory](self, "sharedRestoreDirectory"));
      v16 = objc_msgSend(v12, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v15, a3);

    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)removeRestorePrefetchCachesOlderThanDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  MBPersona *v28;

  v5 = a3;
  v7 = MBGetDefaultLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _MBLog(CFSTR("DEBUG"), "%@: persona:%@", v12, self);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona restorePrefetchDirectories](self, "restorePrefetchDirectories"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v13);
        v16 += -[MBPersona _removeRestorePrefetchCacheAtPath:earliestDate:](self, "_removeRestorePrefetchCacheAtPath:earliestDate:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), v5);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)_removeRestorePrefetchCacheAtPath:(id)a3 earliestDate:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  unint64_t v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  NSObject *v76;

  v5 = a3;
  v65 = a4;
  v7 = MBGetDefaultLog(v65, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing the prefetch directory at %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Removing the prefetch directory at %{public}@", v5);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v5);
  if ((v10 & 1) == 0)
  {
    v32 = MBGetDefaultLog(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No prefetch directory found at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "No prefetch directory found at %{public}@", v5);
    }
    goto LABEL_23;
  }
  v64 = v9;
  if (v65)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtPath:", v5));
    v13 = objc_autoreleasePoolPush();
    v14 = objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v12, "nextObject"));
    if (v14)
    {
      v15 = (void *)v14;
      v63 = 0;
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v15));
        v67 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v16, &v67));
        v18 = v67;
        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSFileCreationDate));
          if (v19 && objc_msgSend(v65, "compare:", v19) == (id)-1)
          {
            v21 = v18;
          }
          else
          {
            v66 = v18;
            v20 = objc_msgSend(v9, "removeItemAtPath:error:", v16, &v66);
            v21 = v66;

            if ((v20 & 1) != 0)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSFileSize));
              v25 = (unint64_t)objc_msgSend(v24, "unsignedLongLongValue");

              v28 = MBGetDefaultLog(v26, v27);
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v72 = v16;
                v73 = 2048;
                v74 = v25;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removed %@: %llu bytes", buf, 0x16u);
                _MBLog(CFSTR("INFO"), "Removed %@: %llu bytes", v16, v25);
              }

              v63 += v25;
            }
            else
            {
              v30 = MBGetDefaultLog(v22, v23);
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v72 = v16;
                v73 = 2112;
                v74 = (unint64_t)v21;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
                _MBLog(CFSTR("ERROR"), "Failed to remove %@: %@", v16, v21);
              }

            }
          }

          v18 = v21;
          v9 = v64;
        }

        objc_autoreleasePoolPop(v13);
        v13 = objc_autoreleasePoolPush();
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v12, "nextObject"));
      }
      while (v15);
    }
    else
    {
      v63 = 0;
    }
    objc_autoreleasePoolPop(v13);
    v33 = v63;
LABEL_33:

    v48 = MBGetDefaultLog(v46, v47);
    v12 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v72 = v5;
      v73 = 2048;
      v74 = v33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ (%llu bytes)", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Removed %{public}@ (%llu bytes)", v5, v33);
    }
    goto LABEL_48;
  }
  v70 = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:](MBTemporaryDirectory, "temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:", v5, CFSTR("prefetch-dir-cleanup"), &v70));
  v35 = v70;
  if (!v34)
  {
    v49 = sub_100081D30();
    v9 = v64;
    if ((_DWORD)v49)
    {
      v51 = MBGetDefaultLog(v49, v50);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v35;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "Failed to create temporary directory %@", buf, 0xCu);
        _MBLog(CFSTR("FAULT"), "Failed to create temporary directory %@", v35);
      }

    }
    v69 = v35;
    v53 = objc_msgSend(v64, "removeItemAtPath:error:", v5, &v69);
    v12 = v69;

    if ((v53 & 1) == 0)
    {
      v56 = MBGetDefaultLog(v54, v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v72 = v5;
        v73 = 2112;
        v74 = (unint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to remove %{public}@: %@", v5, v12);
      }

    }
LABEL_23:
    v33 = 0;
    goto LABEL_48;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "makeTemporaryFilePath"));
  v68 = v35;
  v37 = objc_msgSend(v64, "moveItemAtPath:toPath:error:", v5, v36, &v68);
  v12 = v68;

  if ((v37 & 1) != 0)
  {
    v40 = MBGetDefaultLog(v38, v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v72 = v5;
      v73 = 2114;
      v74 = (unint64_t)v36;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Moved prefetch directory from %{public}@ -> %{public}@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Moved prefetch directory from %{public}@ -> %{public}@", v5, v36);
    }

    v42 = objc_msgSend(v34, "dispose");
    v44 = MBGetDefaultLog(v42, v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = v5;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Removed prefetch directory at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Removed prefetch directory at %{public}@", v5);
    }

    v33 = 0;
    v9 = v64;
    goto LABEL_33;
  }
  v58 = sub_100081D30();
  if ((_DWORD)v58)
  {
    v60 = MBGetDefaultLog(v58, v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      v72 = v5;
      v73 = 2114;
      v74 = (unint64_t)v36;
      v75 = 2112;
      v76 = v12;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_FAULT, "Failed to move prefetch directory from %{public}@ -> %{public}@: %@", buf, 0x20u);
      _MBLog(CFSTR("FAULT"), "Failed to move prefetch directory from %{public}@ -> %{public}@: %@", v5, v36, v12);
    }

  }
  v33 = 0;
  v9 = v64;
LABEL_48:

  return v33;
}

- (BOOL)finalizeRestoreDirectoriesWithError:(id *)a3
{
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  MBPersona *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  MBPersona *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  MBPersona *v38;

  if (!a3)
    sub_100088F80();
  v6 = MBGetDefaultLog(self, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412546;
    v36 = v9;
    v37 = 2112;
    v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _MBLog(CFSTR("DEBUG"), "%@: persona:%@", v11, self);

  }
  v14 = MBGetDefaultLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
    v17 = (MBPersona *)objc_claimAutoreleasedReturnValue(-[MBPersona userRestoreDirectory](self, "userRestoreDirectory"));
    *(_DWORD *)buf = 138412546;
    v36 = v16;
    v37 = 2112;
    v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Moving user restore directory into place: %@ -> %@", buf, 0x16u);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userRestoreDirectory](self, "userRestoreDirectory"));
    _MBLog(CFSTR("INFO"), "Moving user restore directory into place: %@ -> %@", v18, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userRestoreDirectory](self, "userRestoreDirectory"));
  v22 = -[MBPersona _moveRestoreDirectoryFrom:toFinalLocation:error:](self, "_moveRestoreDirectoryFrom:toFinalLocation:error:", v20, v21, a3);

  if (!v22)
    return 0;
  v23 = -[MBPersona shouldRestoreToSharedVolume](self, "shouldRestoreToSharedVolume");
  if (!(_DWORD)v23)
    return 1;
  v25 = MBGetDefaultLog(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
    v28 = (MBPersona *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedRestoreDirectory](self, "sharedRestoreDirectory"));
    *(_DWORD *)buf = 138412546;
    v36 = v27;
    v37 = 2112;
    v38 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Moving shared restore directory into place: %@ -> %@", buf, 0x16u);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedRestoreDirectory](self, "sharedRestoreDirectory"));
    _MBLog(CFSTR("INFO"), "Moving shared restore directory into place: %@ -> %@", v29, v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedIncompleteRestoreDirectory](self, "sharedIncompleteRestoreDirectory"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona sharedRestoreDirectory](self, "sharedRestoreDirectory"));
  v33 = -[MBPersona _moveRestoreDirectoryFrom:toFinalLocation:error:](self, "_moveRestoreDirectoryFrom:toFinalLocation:error:", v31, v32, a3);

  return v33 != 0;
}

- (BOOL)_moveRestoreDirectoryFrom:(id)a3 toFinalLocation:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned __int8 v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;

  v7 = a3;
  v8 = a4;
  if (!a5)
    sub_100088FA8();
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v7, 0);
  if ((v11 & 1) != 0)
  {
    if (objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, 0))
    {
      v28 = 0;
      v13 = objc_msgSend(v10, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v9, &v28);
      v14 = v28;
      v16 = v14;
      if ((v13 & 1) == 0)
      {
        v17 = MBGetDefaultLog(v14, v15);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v9;
          v31 = 2114;
          v32 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to remove existing restore directory at %{public}@: %{public}@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to remove existing restore directory at %{public}@: %{public}@", v9, v16);
        }

        *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v16, v9, CFSTR("Failed to remove existing restore directory")));
      }

    }
    v27 = 0;
    v19 = objc_msgSend(v10, "moveItemAtPath:toPath:error:", v7, v9, &v27);
    v20 = v27;
    v22 = v20;
    if ((v19 & 1) == 0)
    {
      v23 = MBGetDefaultLog(v20, v21);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v30 = v7;
        v31 = 2114;
        v32 = v9;
        v33 = 2114;
        v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to move restore sandbox from %{public}@ into place %{public}@: %{public}@", buf, 0x20u);
        _MBLog(CFSTR("ERROR"), "Failed to move restore sandbox from %{public}@ into place %{public}@: %{public}@", v7, v9, v22);
      }

      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 101, v9, CFSTR("Failed to move restore sandbox into place")));
    }
  }
  else
  {
    v25 = MBGetDefaultLog(v11, v12);
    v22 = objc_claimAutoreleasedReturnValue(v25);
    v19 = 1;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "No restore sandbox at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "No restore sandbox at %{public}@", v7);
    }
  }

  return v19;
}

- (BOOL)copyPlaceholderIPAsForAppInstallationExcluding:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *i;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned __int8 v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  BOOL v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  void *v55;
  void *v56;
  id obj;
  uint64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  uint8_t v66[4];
  void *v67;
  __int16 v68;
  NSObject *v69;
  _BYTE v70[128];
  NSURLResourceKey v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;

  v53 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona appPlaceholderArchiveDirectory](self, "appPlaceholderArchiveDirectory"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona userIncompleteRestoreDirectory](self, "userIncompleteRestoreDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBPersona placeholderRestoreDirectory](self, "placeholderRestoreDirectory"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v8));

  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v55;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Moving placeholders from %@ to %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "=restore-placeholder= Moving placeholders from %@ to %@", v52, v55);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v56, "fileExistsAtPath:", v55) & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v73 = sub_1000848F0;
    v74 = sub_100084900;
    v75 = 0;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v52));
    v71 = NSURLIsRegularFileKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100084908;
    v65[3] = &unk_1000DA280;
    v65[4] = buf;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v51, v13, 1, v65));

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v14;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v15)
    {
      v58 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v58)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v59 = 0;
          v60 = 0;
          v18 = *(_QWORD *)&buf[8];
          v19 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v60, NSURLIsRegularFileKey, &v59);
          v20 = v60;
          objc_storeStrong((id *)(v18 + 40), v59);
          if ((v19 & 1) == 0)
          {
            v46 = MBGetDefaultLog(v21, v22);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v66 = 138412546;
              v67 = v17;
              v68 = 2112;
              v69 = v48;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "=restore-placeholder= Failed to get NSURLIsDirectoryKey for %@: %@", v66, 0x16u);
              _MBLog(CFSTR("ERROR"), "=restore-placeholder= Failed to get NSURLIsDirectoryKey for %@: %@", v17, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            }

            goto LABEL_34;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
          v24 = objc_msgSend(v20, "BOOLValue");
          if ((v24 & 1) != 0)
          {
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathExtension](v26, "pathExtension"));
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("ipa"));
            if ((v28 & 1) != 0)
            {
              v30 = objc_claimAutoreleasedReturnValue(-[NSObject stringByDeletingPathExtension](v26, "stringByDeletingPathExtension"));
              v31 = objc_msgSend(v53, "containsObject:", v30);
              if ((_DWORD)v31)
              {
                v33 = MBGetDefaultLog(v31, v32);
                v34 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v66 = 138412546;
                  v67 = v23;
                  v68 = 2112;
                  v69 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Not moving restored placeholder .ipa at %@ corresponding to excluded bundleID %@", v66, 0x16u);
                  _MBLog(CFSTR("DEFAULT"), "=restore-placeholder= Not moving restored placeholder .ipa at %@ corresponding to excluded bundleID %@", v23, v30);
                }
              }
              else
              {
                v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingPathComponent:", v30));
                v37 = MBMobileFileAttributes();
                v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                v39 = objc_msgSend(v56, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v34, 1, v38, a4);

                if ((v39 & 1) == 0)
                {

                  goto LABEL_41;
                }
                v40 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v34, "stringByAppendingPathComponent:", v26));
                v41 = objc_msgSend(v56, "copyItemAtPath:toPath:error:", v23, v40, a4);
                if ((v41 & 1) == 0)
                {

                  goto LABEL_41;
                }
                v43 = MBGetDefaultLog(v41, v42);
                v44 = objc_claimAutoreleasedReturnValue(v43);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v66 = 138412546;
                  v67 = v23;
                  v68 = 2112;
                  v69 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Moved restored placeholder .ipa from %@ to %@", v66, 0x16u);
                  _MBLog(CFSTR("DEFAULT"), "=restore-placeholder= Moved restored placeholder .ipa from %@ to %@", v23, v40);
                }

              }
            }
            else
            {
              v36 = MBGetDefaultLog(v28, v29);
              v30 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v66 = 138412290;
                v67 = v23;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "=restore-placeholder= Not moving non-ipa file at %@ for RestorePostProcess", v66, 0xCu);
                _MBLog(CFSTR("FAULT"), "=restore-placeholder= Not moving non-ipa file at %@ for RestorePostProcess", v23);
              }
            }

          }
          else
          {
            v35 = MBGetDefaultLog(v24, v25);
            v26 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v66 = 138412290;
              v67 = v23;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Not moving non-regular file at %@", v66, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "=restore-placeholder= Not moving non-regular file at %@", v23);
            }
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_34:

    v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v49)
    {
      if (a4)
      {
        v45 = 0;
        *a4 = objc_retainAutorelease(v49);
      }
      else
      {
LABEL_41:
        v45 = 0;
      }
    }
    else
    {
      v45 = 1;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v45 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 4, v55, CFSTR("Restore placeholders not found")));
  }

  return v45;
}

@end
