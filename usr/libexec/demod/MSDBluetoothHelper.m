@implementation MSDBluetoothHelper

+ (id)sharedInstance
{
  if (qword_100175218 != -1)
    dispatch_once(&qword_100175218, &stru_10013E2B0);
  return (id)qword_100175210;
}

- (BOOL)preserveBTPairingRecord
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "About to preserve bluetooth pairing records to ensure these pairings persist.", buf, 2u);
  }

  if (!-[MSDBluetoothHelper preserveBTFiles](self, "preserveBTFiles"))
  {
    v24 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000BB6A0();
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v10 = 0;
    goto LABEL_25;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v6 = objc_msgSend(v5, "macOS");

  if ((v6 & 1) == 0)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving bluetooth pairing info stored in system keychain.", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = objc_msgSend(v14, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v32 = 0;
      v17 = objc_msgSend(v16, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"), &v32);
      v10 = v32;

      if ((v17 & 1) == 0)
      {
        v18 = sub_1000604F0();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_1000BB640();
        v9 = 0;
        v8 = 0;
        v7 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v10 = 0;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getAllItemsForKey:withAttributes:", CFSTR("com.appl.mobilestoredemo.bluetooth."), 1));

    v21 = objc_claimAutoreleasedReturnValue(-[MSDBluetoothHelper getKeychainInfoToSave:](self, "getKeychainInfoToSave:", v9));
    if (!v21)
    {
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000BB5E8();
      v7 = 0;
      v8 = 0;
      v11 = 1;
LABEL_27:

      goto LABEL_16;
    }
    v8 = (void *)v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "performCryptoWithSecretKeyOnData:isDecipher:", v8, 0));

    v11 = 1;
    if ((objc_msgSend(v7, "writeToFile:atomically:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"), 1) & 1) != 0)goto LABEL_16;
    v27 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000BB614();
LABEL_25:

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v29 = objc_msgSend(v28, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"));

    if (!v29)
    {
      v11 = 0;
      goto LABEL_16;
    }
    v26 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v31 = v10;
    -[NSObject removeItemAtPath:error:](v26, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), &v31);
    v30 = v31;

    v11 = 0;
    v10 = v30;
    goto LABEL_27;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 1;
LABEL_16:

  return v11;
}

- (void)restoreBTPairingRecordIfNeeded
{
  MSDBluetoothHelper *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  int v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  MSDBluetoothHelper *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];

  v2 = self;
  if (-[MSDBluetoothHelper shouldRestoreBluetoothPairingRecord](self, "shouldRestoreBluetoothPairingRecord"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v4 = objc_msgSend(v3, "macOS");

    if ((v4 & 1) != 0)
    {
LABEL_25:
      -[MSDBluetoothHelper removeBluetoothPairingRecordIfNeeded](v2, "removeBluetoothPairingRecordIfNeeded");
      return;
    }
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restoring bluetooth pairing information to system keychain.", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain")));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performCryptoWithSecretKeyOnData:isDecipher:", v7, 1));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v9, 0, 0, 0));
        v11 = v10;
        if (v10)
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          obj = v10;
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v12)
          {
            v13 = v12;
            v32 = v9;
            v33 = v7;
            v34 = v2;
            v14 = 0;
            v15 = 0;
            v16 = *(_QWORD *)v37;
            while (2)
            {
              v17 = 0;
              v18 = v15;
              do
              {
                if (*(_QWORD *)v37 != v16)
                  objc_enumerationMutation(obj);
                v19 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v17);

                v14 = objc_msgSend(v19, "mutableCopy");
                v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kSecValueData));

                objc_msgSend(v14, "removeObjectForKey:", kSecValueData);
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
                v21 = objc_msgSend(v20, "saveItem:forKey:withAttributes:", v15, CFSTR("com.appl.mobilestoredemo.bluetooth."), v14);

                if ((v21 & 1) == 0)
                {
                  v25 = sub_1000604F0();
                  v26 = objc_claimAutoreleasedReturnValue(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    sub_1000BB750();

                  v24 = 4;
                  v7 = v33;
                  v2 = v34;
                  v9 = v32;
                  goto LABEL_23;
                }
                v17 = (char *)v17 + 1;
                v18 = v15;
              }
              while (v13 != v17);
              v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
              if (v13)
                continue;
              break;
            }

            v7 = v33;
            v2 = v34;
            v9 = v32;
          }

          v22 = sub_1000604F0();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Done restoring bluetooth keychain items.", buf, 2u);
          }

          v15 = objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
          -[NSObject restartBluetooth](v15, "restartBluetooth");
          v24 = 0;
        }
        else
        {
          v31 = sub_1000604F0();
          v15 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_1000BB724();
          v24 = 4;
        }
LABEL_23:

LABEL_24:
        if (v24)
          return;
        goto LABEL_25;
      }
      v30 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000BB6F8();
    }
    else
    {
      v29 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000BB6CC();
    }
    v24 = 4;
    goto LABEL_24;
  }
  v27 = sub_1000604F0();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_1000BB7B0();

}

- (BOOL)preserveBTFiles
{
  void *v2;
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  _UNKNOWN **v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void **p_vtable;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void **v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  BOOL v37;
  id v38;
  NSObject *v39;
  id v40;
  id v42;
  id v43;
  NSObject *v44;
  _UNKNOWN **obj;
  unsigned __int8 v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56;
  uint64_t v57;
  _BYTE v58[128];
  _QWORD v59[8];

  v57 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = 0;
  if (objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter")))
  {
    v56 = 0;
    v4 = objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), &v56);
    v3 = v56;
    if ((v4 & 1) == 0)
    {
      v43 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000BB918();
      goto LABEL_27;
    }
  }
  v5 = v3;
  v55 = v3;
  v6 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), 1, 0, &v55);
  v3 = v55;

  if ((v6 & 1) == 0)
  {
    v42 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BB8B8();
LABEL_27:
    v37 = 0;
    goto LABEL_28;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v8 = objc_msgSend(v7, "macOS");

  v49 = v3;
  if ((v8 & 1) != 0)
  {
    v9 = 0;
    v10 = &off_10014E3A8;
  }
  else
  {
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", container_system_group_path_for_identifier(0, "systemgroup.com.apple.bluetooth", &v57), 4);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.paired.db")));
    v59[0] = v47;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.paired.db-shm")));
    v59[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.paired.db-wal")));
    v59[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.other.db")));
    v59[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.other.db-shm")));
    v59[4] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Database/com.apple.MobileBluetooth.ledevices.other.db-wal")));
    v59[5] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Preferences/com.apple.MobileBluetooth.devices.plist")));
    v59[6] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Library/Preferences/com.apple.BTMagic.plist")));
    v59[7] = v18;
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 8));

  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v10;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (!v19)
    goto LABEL_19;
  v20 = v19;
  v44 = v9;
  v21 = 0;
  v48 = *(_QWORD *)v52;
  p_vtable = MSDIsEnrolledResponse.vtable;
  while (2)
  {
    v23 = 0;
    v24 = v21;
    do
    {
      if (*(_QWORD *)v52 != v48)
        objc_enumerationMutation(obj);
      v21 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingLastPathComponent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), "stringByAppendingPathComponent:", v25));
      v27 = objc_msgSend(v2, "fileExistsAtPath:", v26);

      if ((v27 & 1) == 0)
      {
        v28 = v2;
        v29 = p_vtable;
        v30 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingLastPathComponent"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), "stringByAppendingPathComponent:", v31));
        v50 = v49;
        v33 = v28;
        v46 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v50);
        v3 = v50;

        if ((v46 & 1) == 0)
        {
          v40 = sub_1000604F0();
          v39 = objc_claimAutoreleasedReturnValue(v40);
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v2 = v33;
            v9 = v44;
            goto LABEL_26;
          }
          sub_1000BB83C();
          v2 = v33;
LABEL_23:
          v9 = v44;
LABEL_26:

          goto LABEL_27;
        }
        v49 = v3;
        v34 = v33;
        v20 = v30;
        p_vtable = v29;
        v2 = v34;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 182, "sharedInstance", v44));
      v36 = objc_msgSend(v35, "preserveBluetoothFileToShelter:", v21);

      if ((v36 & 1) == 0)
      {
        v38 = sub_1000604F0();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_1000BB7DC();
        v3 = v49;
        goto LABEL_23;
      }
      v23 = (char *)v23 + 1;
      v24 = v21;
    }
    while (v20 != v23);
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v20)
      continue;
    break;
  }

  v9 = v44;
LABEL_19:

  v37 = 1;
  v3 = v49;
LABEL_28:

  return v37;
}

- (BOOL)shouldRestoreBluetoothPairingRecord
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v2, "isContentFrozen"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSavedRequest"));
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("RevertSnapshot")))
      v5 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"));
    else
      v5 = 0;

  }
  else
  {
    v5 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"));
  }

  return v5;
}

- (void)removeBluetoothPairingRecordIfNeeded
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v3, "isContentFrozen") & 1) == 0)
  {
    objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"), 0);
    objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), 0);
  }

}

- (id)getKeychainInfoToSave:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[4];

  v3 = a3;
  v32[0] = kSecAttrService;
  v32[1] = kSecAttrAccount;
  v32[2] = kSecAttrLabel;
  v32[3] = kSecValueData;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  v21 = objc_alloc_init((Class)NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v9 = objc_alloc_init((Class)NSMutableDictionary);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v4, "containsObject:", v15))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
                objc_msgSend(v9, "setObject:forKey:", v16, v15);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        objc_msgSend(v21, "addObject:", v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataFromPropertyList:format:errorDescription:](NSPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", v21, 200, 0));
  return v17;
}

@end
