@implementation MBiTunesStorePlugin

- (id)backingUpSQLiteFileCopyAtPath:(id)a3 temporaryPath:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSString *v9;
  _BYTE buf[24];

  v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb"));
  if ((_DWORD)v6)
  {
    v8 = MBGetDefaultLog(v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting unneeded domains from %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Deleting unneeded domains from %@", a3);
    }
    *(_QWORD *)buf = 0;
    sqlite3_open_v2((const char *)objc_msgSend(a4, "fileSystemRepresentation"), (sqlite3 **)buf, 2, 0);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("delete from kvs_value where domain not in ('%@', '%@'); vacuum;"),
           CFSTR("com.apple.itunesstored"),
           CFSTR("com.apple.mobile.iTunes.store"));
    sqlite3_exec(*(sqlite3 **)buf, -[NSString UTF8String](v9, "UTF8String"), 0, 0, 0);
    sqlite3_close(*(sqlite3 **)buf);
  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BOOL8 v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL8 v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  const __CFString *v32;
  uint8_t buf[4];
  const __CFString *v34;

  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3))
    return 0;
  v32 = 0;
  v6 = objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldRestoreSystemFiles");
  v7 = (char)v6;
  v9 = MBGetDefaultLog(v6, v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Restoring iTunesStore KeyValueStore", buf, 2u);
      _MBLog(CFSTR("INFO"), "Restoring iTunesStore KeyValueStore");
    }
    v11 = objc_msgSend(a4, "persona");
    if (!v11)
      sub_100088E40();
    v12 = v11;
    v13 = +[MBiTunesStoreKVS iTunesStoreKVS](MBiTunesStoreKVS, "iTunesStoreKVS");
    v14 = objc_msgSend(objc_msgSend(v12, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", CFSTR("/var/mobile/Library/com.apple.itunesstored"));
    v15 = objc_msgSend(objc_msgSend(v12, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", CFSTR("/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb"));
    v16 = objc_msgSend(v13, "knownAccountsByDSID");
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v15))
    {
      v17 = +[MBSQLiteFileHandle copySQLiteFileAtPath:toPath:timeout:error:](MBSQLiteFileHandle, "copySQLiteFileAtPath:toPath:timeout:error:", v15, CFSTR("/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb"), &v32, 10.0);
      if (!v17)
      {
        v19 = MBGetDefaultLog(v17, v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v32;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Error copying iTMS KVS db from backup to local path: %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Error copying iTMS KVS db from backup to local path: %@", v32);
        }
        return 0;
      }
    }
    else
    {
      objc_msgSend(v13, "removeAllValues");
    }
    v20 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "properties"), "lockdownKeys"), "objectForKeyedSubscript:", CFSTR("com.apple.itunesstored"));
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v13, "setValuesWithDictionary:forDomain:", v20, CFSTR("com.apple.itunesstored"));
    }
    else
    {
      v22 = MBGetDefaultLog(0, v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = CFSTR("com.apple.itunesstored");
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "No keys found in %@ lockdown domain", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "No keys found in %@ lockdown domain", CFSTR("com.apple.itunesstored"));
      }
    }
    objc_msgSend(v13, "setKnownAccounts:", objc_msgSend(+[MBiTunesStoreKVS mergeKnownAccountsByDSID:into:](MBiTunesStoreKVS, "mergeKnownAccountsByDSID:into:", v16, objc_msgSend(v13, "knownAccountsByDSID")), "allValues"));
    if (-[MBiTunesStorePlugin _mkdir:](self, "_mkdir:", v14))
    {
      v23 = +[MBSQLiteFileHandle copySQLiteFileAtPath:toPath:timeout:error:](MBSQLiteFileHandle, "copySQLiteFileAtPath:toPath:timeout:error:", CFSTR("/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb"), v15, &v32, 10.0);
      v24 = v23;
      v26 = MBGetDefaultLog(v23, v25);
      v27 = v26;
      if (v24)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Preserving iTunesStore CookieStorage", buf, 2u);
          _MBLog(CFSTR("INFO"), "Preserving iTunesStore CookieStorage");
        }
        v28 = objc_msgSend(objc_msgSend(v12, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", CFSTR("/var/mobile/Library/Cookies/com.apple.itunesstored.2.sqlitedb"));
        if (-[MBiTunesStorePlugin _mkdir:](self, "_mkdir:", CFSTR("/var/mobile/Library/Cookies")))
        {
          v29 = objc_msgSend(objc_alloc((Class)SSVCookieStorage), "initWithStorageLocation:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/mobile/Library/Cookies/com.apple.itunesstored.2.sqlitedb")));
          v30 = objc_msgSend(objc_alloc((Class)SSVCookieStorage), "initWithStorageLocation:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v28));
          objc_msgSend(v30, "setCookiesFromCookieStorage:", v29);

        }
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error copying iTMS KVS db from local to backup path: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Error copying iTMS KVS db from local to backup path: %@", v32);
      }
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not restoring iTunesStore KeyValueStore since system files weren't restored", buf, 2u);
    _MBLog(CFSTR("INFO"), "Not restoring iTunesStore KeyValueStore since system files weren't restored");
  }
  return 0;
}

- (BOOL)_mkdir:(id)a3
{
  BOOL v4;
  _BOOL8 v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  char v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;

  v14 = 0;
  v13 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v13))
  {
    v4 = v13 == 0;
  }
  else
  {
    v4 = 1;
  }
  if (!v4)
    return 1;
  if (!v13)
  {
    v5 = -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a3, &v14);
    if (!v5)
    {
      v11 = MBGetDefaultLog(v5, v6);
      v10 = 0;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        return v10;
      *(_DWORD *)buf = 138412546;
      v16 = a3;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error removing directory: %@: %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Error removing directory: %@: %@", a3, v14);
      return 0;
    }
  }
  v10 = 1;
  v7 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, MBMobileFileAttributes(), &v14);
  if (!v7)
  {
    v9 = MBGetDefaultLog(v7, v8);
    v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = a3;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error creating directory: %@: %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Error creating directory: %@: %@", a3, v14);
      return 0;
    }
  }
  return v10;
}

@end
