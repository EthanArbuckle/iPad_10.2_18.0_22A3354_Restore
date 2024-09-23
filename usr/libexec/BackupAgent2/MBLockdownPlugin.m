@implementation MBLockdownPlugin

- (id)preparingBackupWithEngine:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSDictionary *v9;
  id v10;
  uint64_t v11;
  void *i;
  NSMutableDictionary *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *j;
  NSMutableDictionary *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  NSMutableDictionary *v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *k;
  NSMutableDictionary *v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  NSObject *v57;
  NSObject *v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableDictionary *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  NSMutableDictionary *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  NSMutableDictionary *v98;
  __int16 v99;
  uint64_t v100;
  _BYTE v101[128];

  v3 = MBGetDefaultLog(self, a2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Backing up lockdown keys", buf, 2u);
    v4 = _MBLog(CFSTR("DEFAULT"), "Backing up lockdown keys");
  }
  v6 = MBGetDefaultLog(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog(CFSTR("DEBUG"), "Connecting to lockdown");
  }
  v72 = +[MBLockdown connect](MBLockdown, "connect");
  if (v72)
  {
    v71 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
    v8 = MBGetDefaultLog(v71, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Copying lockdown keys", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "Copying lockdown keys");
    }
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v9 = sub_10003F960();
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v90 != v11)
            objc_enumerationMutation(v9);
          v13 = *(NSMutableDictionary **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
          v14 = -[NSDictionary objectForKeyedSubscript:](sub_10003F960(), "objectForKeyedSubscript:", v13);
          v15 = MBGetGestaltValueForKey(v14);
          v17 = MBGetDefaultLog(v15, v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v98 = v13;
            v99 = 2112;
            v100 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "%@: %@", v13, v15);
          }
          if (v15)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v15, v13);
        }
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
      }
      while (v10);
    }
    v18 = objc_msgSend(a3, "backsUpPrimaryAccount");
    if ((_DWORD)v18)
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.Accessibility"), CFSTR("com.apple.mobile.data_sync"), CFSTR("com.apple.mobile.iTunes.accessories"), CFSTR("com.apple.MobileDeviceCrashCopy"), CFSTR("com.apple.TerminalFlashr"), 0);
      v21 = (uint64_t)-[NSSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      v23 = v21;
      if (v21)
      {
        v65 = *(_QWORD *)v86;
        do
        {
          v24 = 0;
          v64 = v23;
          do
          {
            if (*(_QWORD *)v86 != v65)
              objc_enumerationMutation(v20);
            v25 = *(NSMutableDictionary **)(*((_QWORD *)&v85 + 1) + 8 * v24);
            v26 = MBGetDefaultLog(v21, v22);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v98 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Copying lockdown domain %{public}@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Copying lockdown domain %{public}@", v25);
            }
            v27 = objc_msgSend(v72, "objectForDomain:andKey:", v25, 0);
            v28 = v27;
            if (v27)
            {
              v67 = v25;
              v69 = v24;
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
              if (v29)
              {
                v30 = *(_QWORD *)v82;
                do
                {
                  for (j = 0; j != v29; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v82 != v30)
                      objc_enumerationMutation(v28);
                    v32 = *(NSMutableDictionary **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j);
                    v33 = objc_msgSend(v28, "objectForKeyedSubscript:", v32);
                    v35 = MBGetDefaultLog(v33, v34);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v98 = v32;
                      v99 = 2112;
                      v100 = (uint64_t)v33;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
                      _MBLog(CFSTR("DEFAULT"), "%@: %@", v32, v33);
                    }
                  }
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
                }
                while (v29);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v28, v67);
              v23 = v64;
              v24 = v69;

            }
            else
            {
              v36 = sub_100081D30();
              if ((_DWORD)v36 && !dword_1000F9E0C)
              {
                do
                  v38 = __ldxr((unsigned int *)&dword_1000F9E0C);
                while (__stxr(v38 + 1, (unsigned int *)&dword_1000F9E0C));
                if (!v38)
                {
                  v39 = MBGetDefaultLog(v36, v37);
                  v36 = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
                  if ((_DWORD)v36)
                  {
                    *(_DWORD *)buf = 138412290;
                    v98 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Failed to copy lockdown domain: %@", buf, 0xCu);
                    v36 = _MBLog(CFSTR("FAULT"), "Failed to copy lockdown domain: %@", v25);
                  }
                }
              }
              v40 = MBGetDefaultLog(v36, v37);
              v21 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
              if ((_DWORD)v21)
              {
                *(_DWORD *)buf = 138543362;
                v98 = v25;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to copy lockdown domain %{public}@", buf, 0xCu);
                v21 = _MBLog(CFSTR("ERROR"), "Failed to copy lockdown domain %{public}@", v25);
              }
            }
            ++v24;
          }
          while (v24 != v23);
          v21 = (uint64_t)-[NSSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
          v23 = v21;
        }
        while (v21);
      }
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v18 = objc_msgSend(&off_1000E5048, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
      v41 = v18;
      if (v18)
      {
        v66 = *(_QWORD *)v78;
        do
        {
          v42 = 0;
          v68 = v41;
          do
          {
            if (*(_QWORD *)v78 != v66)
              objc_enumerationMutation(&off_1000E5048);
            v43 = *(NSMutableDictionary **)(*((_QWORD *)&v77 + 1) + 8 * v42);
            v44 = MBGetDefaultLog(v18, v19);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v98 = v43;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Copying keys from lockdown domain %{public}@", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Copying keys from lockdown domain %{public}@", v43);
            }
            v45 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
            v70 = v42;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v46 = objc_msgSend(&off_1000E5048, "objectForKeyedSubscript:", v43);
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
            if (v47)
            {
              v48 = *(_QWORD *)v74;
              do
              {
                for (k = 0; k != v47; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v74 != v48)
                    objc_enumerationMutation(v46);
                  v50 = *(NSMutableDictionary **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)k);
                  v51 = objc_msgSend(v72, "objectForDomain:andKey:", v43, v50);
                  v53 = MBGetDefaultLog(v51, v52);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v98 = v50;
                    v99 = 2112;
                    v100 = (uint64_t)v51;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
                    _MBLog(CFSTR("DEFAULT"), "%@: %@", v50, v51);
                  }
                  if (v51)
                  {
                    objc_msgSend(v45, "setObject:forKeyedSubscript:", v51, v50);

                  }
                }
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
              }
              while (v47);
            }
            v18 = -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v45, v43);
            v42 = v70 + 1;
          }
          while ((id)(v70 + 1) != v68);
          v18 = objc_msgSend(&off_1000E5048, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
          v41 = v18;
        }
        while (v18);
      }
    }
    else
    {
      LODWORD(v41) = 0;
    }
    v59 = MBGetDefaultLog(v18, v19);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Disconnecting from lockdown");
    }
    v60 = objc_msgSend(v72, "disconnect");
    if ((_DWORD)v41)
      objc_exception_rethrow();
    v62 = MBGetDefaultLog(v60, v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v71;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Saving lockdown keys in manifest properties: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Saving lockdown keys in manifest properties: %@", v71);
    }
    objc_msgSend(objc_msgSend(a3, "properties"), "setLockdownKeys:", v71);
    return 0;
  }
  else
  {
    v54 = sub_100081D30();
    if ((_DWORD)v54 && !dword_1000F9E08)
    {
      do
        v56 = __ldxr((unsigned int *)&dword_1000F9E08);
      while (__stxr(v56 + 1, (unsigned int *)&dword_1000F9E08));
      if (!v56)
      {
        v57 = MBGetDefaultLog(v54, v55);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "Failed to connect to lockdown", buf, 2u);
          _MBLog(CFSTR("FAULT"), "Failed to connect to lockdown");
        }
      }
    }
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Unable to connect to lockdown to backup keys"));
  }
}

- (id)_setLockdownValue:(id)a3 forDomain:(id)a4 key:(id)a5 connection:(id)a6
{
  id result;
  unsigned int v7;
  void *v8;

  result = a6;
  if (a6)
  {
    v8 = 0;
    if (a3)
      v7 = objc_msgSend(a6, "setObject:forDomain:andKey:withError:", a3, a4, a5, &v8);
    else
      v7 = objc_msgSend(a6, "removeObjectWithDomain:andKey:withError:", a4, a5, &v8);
    if (v7)
      return 0;
    else
      return v8;
  }
  return result;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  id v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  uint64_t v15;
  NSString *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  NSObject *v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint8_t v39[4];
  uint64_t v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  const __CFString *v44;

  if (!objc_msgSend(a3, "backsUpPrimaryAccount"))
    return 0;
  v7 = objc_msgSend(a3, "isDeviceTransferEngine");
  if ((v7 & 1) != 0)
    return 0;
  v11 = MBGetDefaultLog(v7, v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog(CFSTR("DEBUG"), "Connecting to lockdown");
  }
  v13 = +[MBLockdown connect](MBLockdown, "connect");
  if (!v13)
  {
    v20 = MBGetDefaultLog(0, v12);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to connect to lockdown to set PurpleBuddy keys", buf, 2u);
      _MBLog(CFSTR("ERROR"), "Unable to connect to lockdown to set PurpleBuddy keys");
    }
    return 0;
  }
  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x3052000000;
  v36 = sub_1000400D8;
  v37 = sub_1000400E8;
  v38 = 0;
  if (a4)
  {
    v14 = (const __CFString *)+[MBError isError:withCode:](MBError, "isError:withCode:", a4, 500);
    if ((v14 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_30;
    }
  }
  v16 = -[NSTimeZone abbreviation](+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"), "abbreviation");
  v17 = objc_msgSend(a3, "isCloudKitEngine");
  if ((_DWORD)v17)
  {
    v19 = MBGetDefaultLog(v17, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Getting last backup date from the CloudKit engine", v39, 2u);
      _MBLog(CFSTR("DEBUG"), "Getting last backup date from the CloudKit engine");
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000400F4;
    v32[3] = &unk_1000D9840;
    v32[4] = buf;
    v14 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "cache"), "enumerateSnapshots:", v32);
LABEL_20:
    v24 = CFSTR("LastCloudBackupTZ");
    v9 = CFSTR("LastCloudBackupDate");
    goto LABEL_25;
  }
  v21 = objc_msgSend(a3, "isServiceEngine");
  if ((_DWORD)v21)
  {
    v23 = MBGetDefaultLog(v21, v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Getting last backup date from the service engine", v39, 2u);
      _MBLog(CFSTR("DEBUG"), "Getting last backup date from the service engine");
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004020C;
    v31[3] = &unk_1000D9868;
    v31[4] = buf;
    v14 = (const __CFString *)sub_100005684((uint64_t)v31);
    goto LABEL_20;
  }
  v25 = MBGetDefaultLog(v21, v22);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Using the current date as the last backup", v39, 2u);
    _MBLog(CFSTR("DEBUG"), "Using the current date as the last backup");
  }
  -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
  v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v26);
  *((_QWORD *)v34 + 5) = v14;
  v24 = CFSTR("LastiTunesBackupTZ");
  v9 = CFSTR("LastiTunesBackupDate");
LABEL_25:
  if (!*((_QWORD *)v34 + 5))
    goto LABEL_31;
  v27 = MBGetDefaultLog(v14, v15);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = *((_QWORD *)v34 + 5);
    *(_DWORD *)v39 = 138412802;
    v40 = v28;
    v41 = 2112;
    v42 = v16;
    v43 = 2112;
    v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Setting last backup date to %@/%@ for key %@", v39, 0x20u);
    _MBLog(CFSTR("INFO"), "Setting last backup date to %@/%@ for key %@", *((_QWORD *)v34 + 5), v16, v9);
  }
  v14 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", *((_QWORD *)v34 + 5), CFSTR("com.apple.mobile.backup"), v9, v13);
  v9 = v14;
  if (!v14)
  {
    v14 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", v16, CFSTR("com.apple.mobile.backup"), v24, v13);
    v9 = v14;
    if (!v14)
    {
LABEL_31:
      v29 = 0;
      goto LABEL_32;
    }
  }
LABEL_30:
  v29 = 1;
LABEL_32:
  v30 = MBGetDefaultLog(v14, v15);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", v39, 2u);
    _MBLog(CFSTR("DEBUG"), "Disconnecting from lockdown");
  }
  objc_msgSend(v13, "disconnect");

  if (!v29)
    v9 = 0;
  _Block_object_dispose(buf, 8);
  return (id)v9;
}

- (id)_savePurpleBuddyRestoreState:(id)a3 persona:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v5 = objc_msgSend(objc_msgSend(a4, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", CFSTR("/var/mobile/Library/Preferences/com.apple.purplebuddy.plist"));
  v7 = MBGetDefaultLog(v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v5;
    v20 = 2114;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving the PurpleBuddy restore state at %{public}@: %{public}@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Saving the PurpleBuddy restore state at %{public}@: %{public}@", v5, a3);
  }
  v8 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v5);
  if (!v8)
  {
    v8 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (a3)
      goto LABEL_5;
LABEL_7:
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("SetupState"));
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("RestoreState"));
    goto LABEL_8;
  }
  if (!a3)
    goto LABEL_7;
LABEL_5:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", a3, CFSTR("SetupState"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", a3, CFSTR("RestoreState"));
LABEL_8:
  v9 = objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v17 = 0;
  v10 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v17);
  if (!v10)
  {
    v12 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create the directory at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to create the directory at %{public}@: %{public}@", v9, v17);
    }
  }
  v13 = -[NSMutableDictionary writeToURL:error:](v8, "writeToURL:error:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0), &v17);
  if ((v13 & 1) != 0)
    return 0;
  v16 = MBGetDefaultLog(v13, v14);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v5;
    v20 = 2114;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to saved the PurpleBuddy plist at %{public}@: %{public}@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Failed to saved the PurpleBuddy plist at %{public}@: %{public}@", v5, v17);
  }
  return v17;
}

- (id)_setPurpleBuddyRestoreState:(id)a3 withEngine:(id)a4
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;

  v7 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog(CFSTR("DEBUG"), "Connecting to lockdown");
  }
  v8 = +[MBLockdown connect](MBLockdown, "connect");
  v10 = v8;
  if (v8)
  {
    v11 = MBGetDefaultLog(v8, v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = CFSTR("com.apple.purplebuddy");
      v21 = 2112;
      v22 = CFSTR("SetupState");
      v23 = 2112;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting %@ %@ to \"%@\", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "Setting %@ %@ to \"%@\", CFSTR("com.apple.purplebuddy"), CFSTR("SetupState"), a3);
    }
    v12 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", a3, CFSTR("com.apple.purplebuddy"), CFSTR("SetupState"), v10);
    v14 = v12;
    if (!v12)
    {
      v15 = MBGetDefaultLog(0, v13);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v20 = CFSTR("com.apple.purplebuddy");
        v21 = 2112;
        v22 = CFSTR("RestoreState");
        v23 = 2112;
        v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting %@ %@ to \"%@\", buf, 0x20u);
        _MBLog(CFSTR("DEFAULT"), "Setting %@ %@ to \"%@\", CFSTR("com.apple.purplebuddy"), CFSTR("RestoreState"), a3);
      }
      v12 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", a3, CFSTR("com.apple.purplebuddy"), CFSTR("RestoreState"), v10);
      v14 = v12;
      if (!v12)
      {
        v12 = objc_msgSend(a4, "isForegroundRestore");
        if (!(_DWORD)v12
          || (v12 = -[MBLockdownPlugin _savePurpleBuddyRestoreState:persona:](self, "_savePurpleBuddyRestoreState:persona:", a3, objc_msgSend(a4, "persona")), (v14 = v12) == 0))
        {
          v14 = 0;
        }
      }
    }
    v16 = MBGetDefaultLog(v12, v13);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Disconnecting from lockdown");
    }
    objc_msgSend(v10, "disconnect");
  }
  else
  {
    v17 = MBGetDefaultLog(0, v9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown to set PurpleBuddy keys", buf, 2u);
      _MBLog(CFSTR("ERROR"), "Failed to connect to lockdown to set PurpleBuddy keys");
    }
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Unable to connect to lockdown to set PurpleBuddy keys"));
  }
  return v14;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  char i;
  char v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const __CFString *v14;
  uint64_t v15;
  MBLockdownPlugin *v17;
  uint8_t buf[4];
  uint64_t v19;

  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3))
    return 0;
  if ((objc_msgSend(a4, "isServiceEngine") & 1) == 0)
  {
    v17 = self;
    for (i = 1; ; i = 0)
    {
      v7 = i;
      v8 = -[FMDFMIPManager lockdownShouldDisableDeviceRestore](+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"), "lockdownShouldDisableDeviceRestore");
      v9 = (int)v8;
      v10 = fmdFMIPLastOperationResult;
      v12 = MBGetDefaultLog(v8, v11);
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v10)
        break;
      if (v13)
      {
        *(_DWORD *)buf = 134217984;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] failed: %ld", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] failed: %ld", v10);
      }
      if ((v7 & 1) == 0)
      {
        v14 = CFSTR("Failed to determine the Find My iPhone state");
        v15 = 1;
        return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v15, v14);
      }
    }
    self = v17;
    if (v13)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] returned %d", buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] returned %d", v9);
    }
    if ((v9 & 1) != 0)
    {
      v14 = CFSTR("Find My iPhone must be disabled before restoring");
      v15 = 211;
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v15, v14);
    }
  }
  if (objc_msgSend(a4, "isServiceEngine"))
    return -[MBLockdownPlugin _setPurpleBuddyRestoreState:withEngine:](self, "_setPurpleBuddyRestoreState:withEngine:", CFSTR("RestoringFromBackup"), a4);
  else
    return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  const __CFString *v6;
  id result;

  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3))
    return 0;
  if (objc_msgSend(a4, "isDeviceTransferEngine"))
  {
    v6 = CFSTR("RestoredFromDevice");
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "isDriveEngine"))
  {
    v6 = CFSTR("RestoredFromiTunesBackup");
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "isServiceEngine"))
  {
    v6 = CFSTR("BackgroundRestoringFromiCloudBackup");
LABEL_9:
    result = -[MBLockdownPlugin _setPurpleBuddyRestoreState:withEngine:](self, "_setPurpleBuddyRestoreState:withEngine:", v6, a4);
    if (result)
      return result;
  }
  return -[MBLockdownPlugin _restoreLockdownKeysWithEngine:](self, "_restoreLockdownKeysWithEngine:", a4);
}

- (id)_restoreLockdownKeysWithEngine:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSSet *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  MBError *v47;
  uint64_t v48;
  MBError *v49;
  MBError *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  id v56;
  MBError *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v67;
  uint64_t v68;
  NSSet *v69;
  uint64_t v70;
  id v71;
  MBError *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE buf[12];
  __int16 v100;
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];

  v4 = objc_msgSend(objc_msgSend(a3, "settingsContext"), "shouldRestoreSystemFiles");
  if ((v4 & 1) != 0)
  {
    v6 = objc_msgSend(objc_msgSend(a3, "properties"), "lockdownKeys");
    if (!v6)
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Saved lockdown keys not found in manifest properties"));
    v8 = v6;
    v9 = MBGetDefaultLog(v6, v7);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v10)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded saved lockdown keys: %@", buf, 0xCu);
      v10 = _MBLog(CFSTR("DEFAULT"), "Loaded saved lockdown keys: %@", v8);
    }
    v12 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Connecting to lockdown");
    }
    v13 = +[MBLockdown connect](MBLockdown, "connect");
    v15 = v13;
    if (v13)
    {
      v16 = MBGetDefaultLog(v13, v14);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restoring lockdown domains", buf, 2u);
        _MBLog(CFSTR("INFO"), "Restoring lockdown domains");
      }
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.Accessibility"), CFSTR("com.apple.mobile.data_sync"), CFSTR("com.apple.mobile.iTunes.accessories"), CFSTR("com.apple.MobileDeviceCrashCopy"), CFSTR("com.apple.TerminalFlashr"), 0);
      v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
      v74 = v8;
      if (v18)
      {
        v20 = *(_QWORD *)v94;
        v68 = *(_QWORD *)v94;
        v69 = v17;
        while (2)
        {
          v21 = 0;
          v71 = v18;
          do
          {
            if (*(_QWORD *)v94 != v20)
              objc_enumerationMutation(v17);
            v73 = v21;
            v22 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v21);
            v23 = MBGetDefaultLog(v18, v19);
            v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
            if ((_DWORD)v24)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Restoring lockdown domain %@", buf, 0xCu);
              v24 = _MBLog(CFSTR("INFO"), "Restoring lockdown domain %@", v22);
            }
            v26 = MBGetDefaultLog(v24, v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Clearing lockdown domain %@", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "Clearing lockdown domain %@", v22);
            }
            v27 = objc_msgSend(v15, "objectForDomain:andKey:", v22, 0);
            v28 = v27;
            if (!v27)
            {
              v47 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error copying lockdown domain %@"), v22);
LABEL_71:
              v49 = v47;
              goto LABEL_72;
            }
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
            v31 = v29;
            if (v29)
            {
              v32 = *(_QWORD *)v90;
              while (2)
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v90 != v32)
                    objc_enumerationMutation(v28);
                  v34 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v33);
                  v35 = MBGetDefaultLog(v29, v30);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v34;
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                    _MBLog(CFSTR("INFO"), "%@", v34);
                  }
                  *(_QWORD *)buf = 0;
                  v29 = objc_msgSend(v15, "removeObjectWithDomain:andKey:withError:", v22, v34, buf);
                  if ((v29 & 1) == 0)
                  {

                    v47 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error clearing lockdown key %@ from domain %@: %@"), v34, v22, *(_QWORD *)buf);
                    goto LABEL_71;
                  }
                  v33 = (char *)v33 + 1;
                }
                while (v31 != v33);
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
                v31 = v29;
                if (v29)
                  continue;
                break;
              }
            }

            v8 = v74;
            v38 = MBGetDefaultLog(v36, v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Setting lockdown keys for domain %@", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "Setting lockdown keys for domain %@", v22);
            }
            v39 = objc_msgSend(v74, "objectForKeyedSubscript:", v22);
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
            if (v40)
            {
              v41 = *(_QWORD *)v86;
LABEL_34:
              v42 = 0;
              while (1)
              {
                if (*(_QWORD *)v86 != v41)
                  objc_enumerationMutation(v39);
                v43 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v42);
                v44 = objc_msgSend(v39, "objectForKeyedSubscript:", v43);
                v46 = MBGetDefaultLog(v44, v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v43;
                  v100 = 2112;
                  v101 = v44;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
                  _MBLog(CFSTR("INFO"), "%@: %@", v43, v44);
                }
                v47 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", v44, v22, v43, v15);
                v49 = v47;
                if (v47)
                  goto LABEL_72;
                if (v40 == (id)++v42)
                {
                  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
                  v8 = v74;
                  if (v40)
                    goto LABEL_34;
                  break;
                }
              }
            }
            v18 = v71;
            v21 = v73 + 1;
            v20 = v68;
            v17 = v69;
          }
          while ((id)(v73 + 1) != v71);
          v18 = -[NSSet countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
          if (v18)
            continue;
          break;
        }
      }
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v47 = (MBError *)objc_msgSend(&off_1000E5048, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
      v50 = v47;
      if (v47)
      {
        v51 = *(_QWORD *)v82;
        v70 = *(_QWORD *)v82;
        while (2)
        {
          v52 = 0;
          v72 = v50;
          do
          {
            if (*(_QWORD *)v82 != v51)
              objc_enumerationMutation(&off_1000E5048);
            v53 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v52);
            v54 = MBGetDefaultLog(v47, v48);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v53;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Restoring lockdown keys for domain %@", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "Restoring lockdown keys for domain %@", v53);
            }
            v75 = v52;
            v55 = objc_msgSend(v8, "objectForKeyedSubscript:", v53);
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v56 = objc_msgSend(&off_1000E5048, "objectForKeyedSubscript:", v53);
            v47 = (MBError *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
            v57 = v47;
            if (v47)
            {
              v58 = *(_QWORD *)v78;
LABEL_53:
              v59 = 0;
              while (1)
              {
                if (*(_QWORD *)v78 != v58)
                  objc_enumerationMutation(v56);
                v60 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v59);
                v61 = objc_msgSend(v55, "objectForKeyedSubscript:", v60);
                v63 = v61;
                if (v61)
                {
                  v64 = MBGetDefaultLog(v61, v62);
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v60;
                    v100 = 2112;
                    v101 = v63;
                    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
                    _MBLog(CFSTR("INFO"), "%@: %@", v60, v63);
                  }
                  v47 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", v63, v53, v60, v15);
                  v49 = v47;
                  if (v47)
                    goto LABEL_72;
                }
                if (v57 == (MBError *)++v59)
                {
                  v47 = (MBError *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
                  v57 = v47;
                  if (v47)
                    goto LABEL_53;
                  break;
                }
              }
            }
            v8 = v74;
            v52 = v75 + 1;
            v51 = v70;
          }
          while ((MBError *)(v75 + 1) != v72);
          v47 = (MBError *)objc_msgSend(&off_1000E5048, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
          v50 = v47;
          v49 = 0;
          if (v47)
            continue;
          break;
        }
      }
      else
      {
        v49 = 0;
      }
LABEL_72:
      v67 = MBGetDefaultLog(v47, v48);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
        _MBLog(CFSTR("DEBUG"), "Disconnecting from lockdown");
      }
      objc_msgSend(v15, "disconnect");
    }
    else
    {
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Unable to connect to lockdown to restore keys"));
    }
  }
  else
  {
    v65 = MBGetDefaultLog(v4, v5);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring lockdown keys since system files weren't restored", buf, 2u);
      _MBLog(CFSTR("INFO"), "Not restoring lockdown keys since system files weren't restored");
    }
    return 0;
  }
  return v49;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  unsigned int v8;
  id result;

  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3))
    return 0;
  v8 = objc_msgSend(a4, "isServiceEngine");
  if (!a5)
    return 0;
  if (!v8)
    return 0;
  result = -[MBLockdownPlugin _setPurpleBuddyRestoreState:withEngine:](self, "_setPurpleBuddyRestoreState:withEngine:", 0, a4);
  if (!result)
    return 0;
  return result;
}

@end
