@implementation MBWiFiPlugin

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t isKindOfClass;
  uint64_t v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint8_t buf[4];
  id v49;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "restoresPrimaryAccount"))
    goto LABEL_34;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settingsContext"));
  v8 = objc_msgSend(v7, "shouldRestoreSystemFiles");

  if (!v8)
    goto LABEL_34;
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Merging known Wi-Fi networks", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Merging known Wi-Fi networks");
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persona"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sharedIncompleteRestoreDirectory"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("/var/preferences/SystemConfiguration/com.apple.wifi.plist")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("/var/preferences/SystemConfiguration/com.apple.wifi-networks.plist")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("/var/preferences/com.apple.wifi.known-networks.plist")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v15);

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v15));
    v22 = v20;
    if (!v20)
    {
      v34 = MBGetDefaultLog(0, v21);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v15;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to read contents of \"%{public}@\", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to read contents of \"%{public}@\", v15);
      }

      v33 = v15;
      goto LABEL_25;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Version")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isWiFiPNLMigrationComplete")));
    if (v23 && (v25 = objc_opt_class(NSNumber), v26 = objc_opt_isKindOfClass(v23, v25), (v26 & 1) == 0))
    {
      v36 = MBGetDefaultLog(v26, v27);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v23;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unexpected version key/value: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Unexpected version key/value: %@", v23);
      }
    }
    else
    {
      if (!v24
        || (v28 = objc_opt_class(NSNumber),
            isKindOfClass = objc_opt_isKindOfClass(v24, v28),
            (isKindOfClass & 1) != 0))
      {
        v31 = objc_msgSend(v23, "intValue");
        v32 = v17;
        if (v31 <= 13)
        {
          if (objc_msgSend(v24, "BOOLValue"))
            v32 = v16;
          else
            v32 = v15;
        }
        goto LABEL_24;
      }
      v38 = MBGetDefaultLog(isKindOfClass, v30);
      v37 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v24;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unexpected class C migration key/value: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Unexpected class C migration key/value: %@", v24);
      }
    }

    v32 = v15;
LABEL_24:
    v33 = v32;

LABEL_25:
    goto LABEL_26;
  }
  v33 = v15;
LABEL_26:
  if (!v33)
    sub_100088A08();
  v39 = (const void *)WiFiManagerClientCreate(0, 0);
  v41 = MBGetDefaultLog(v39, v40);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v33;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Merging known Wi-Fi networks with \"%{public}@\", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Merging known Wi-Fi networks with \"%{public}@\", v33);
  }

  v43 = WiFiManagerClientMergeKnownNetworks(v39, v33);
  if (!(_DWORD)v43)
  {
    v45 = MBGetDefaultLog(v43, v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to merge known Wi-Fi networks", buf, 2u);
      _MBLog(CFSTR("ERROR"), "Failed to merge known Wi-Fi networks");
    }

  }
  CFRelease(v39);

LABEL_34:
  return 0;
}

@end
