@implementation SDUnlockSecurityManager

- (SDUnlockSecurityManager)initWithPairingID:(id)a3 pairingStorePath:(id)a4 deviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  SDUnlockSecurityManager *v11;
  NSString *v12;
  NSString *pairingID;
  NSString *v14;
  NSString *pairingStorePath;
  NSString *v16;
  NSString *deviceName;
  void *v18;
  unsigned int v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SDUnlockSecurityManager;
  v11 = -[SDUnlockSecurityManager init](&v21, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    pairingID = v11->_pairingID;
    v11->_pairingID = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    pairingStorePath = v11->_pairingStorePath;
    v11->_pairingStorePath = v14;

    v16 = (NSString *)objc_msgSend(v10, "copy");
    deviceName = v11->_deviceName;
    v11->_deviceName = v16;

    -[SDUnlockSecurityManager migrateOldKeysIfNeeded](v11, "migrateOldKeysIfNeeded");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v19 = objc_msgSend(v18, "deviceKeyBagUnlocked");

    if (v19)
      -[SDUnlockSecurityManager migrateEscrowDataIfNeeded](v11, "migrateEscrowDataIfNeeded");
  }

  return v11;
}

- (unsigned)lockState
{
  unsigned int v3;

  v3 = 0;
  aks_get_lock_state(0, &v3);
  return v3;
}

- (BOOL)ltksExist
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));

    if (v5)
    {
      v8 = paired_unlock_log(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LTKs exists", v11, 2u);
      }

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)generateLocalLongTermKey:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v14[16];
  uint64_t v15;
  void *v16;

  v15 = 0;
  v16 = 0;
  if (a3 == 1)
    v3 = 9;
  else
    v3 = 11;
  v4 = aks_create_signing_key(0, v3, &v16, &v15);
  if ((_DWORD)v4 == -536870212 || v15 == 0)
  {
    v7 = paired_unlock_log(v4, v5);
    v11 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100179AC4();
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16));
    v10 = paired_unlock_log(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Generated local key", v14, 2u);
    }
  }

  if (v16)
    free(v16);
  return v8;
}

- (id)signRemoteKey:(id)a3 withLocalKey:(id)a4 localKeyClass:(int64_t)a5 remoteKeyClass:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[16];
  uint64_t v29;
  void *v30;

  v9 = a3;
  v10 = a4;
  v12 = v10;
  v29 = 0;
  v30 = 0;
  if (!v10)
  {
    v25 = paired_unlock_log(0, v11);
    v24 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100179B28();
    goto LABEL_16;
  }
  if (a5 == 1)
    v13 = 9;
  else
    v13 = 11;
  if (a6 == 1)
    v14 = 9;
  else
    v14 = 11;
  v15 = objc_retainAutorelease(v10);
  v16 = objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");
  v18 = objc_retainAutorelease(v9);
  v19 = aks_sign_signing_key(0, v13, v16, v17, v14, objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), &v30, &v29);
  if ((_DWORD)v19 == -536870212 || !v29)
  {
    v26 = paired_unlock_log(v19, v20);
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100179B54();
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v30));
  v23 = paired_unlock_log(v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "signed remote key and received data", buf, 2u);
  }
LABEL_17:

  if (v30)
    free(v30);

  return v21;
}

- (void)updateLocalLongTermKey:(id)a3 remoteLongTermKey:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSData **p_localLongTermKey;
  uint64_t v12;
  NSObject *v13;
  NSData *localLongTermKey;
  NSData *remoteLongTermKey;
  SDUnlockSecurityManager *v16;
  int v17;
  NSData *v18;
  __int16 v19;
  NSData *v20;

  v7 = a3;
  v8 = a4;
  v10 = v8;
  p_localLongTermKey = &self->_localLongTermKey;
  if (*(_OWORD *)&self->_localLongTermKey != 0)
  {
    v12 = paired_unlock_log(v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      localLongTermKey = self->_localLongTermKey;
      remoteLongTermKey = self->_remoteLongTermKey;
      v17 = 138412546;
      v18 = localLongTermKey;
      v19 = 2112;
      v20 = remoteLongTermKey;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Overriding existing long term keys (local %@, remote %@)", (uint8_t *)&v17, 0x16u);
    }

  }
  v16 = self;
  objc_sync_enter(v16);
  objc_storeStrong((id *)p_localLongTermKey, a3);
  objc_storeStrong((id *)&v16->_remoteLongTermKey, a4);
  -[SDUnlockSecurityManager saveLongTermKeys](v16, "saveLongTermKeys");
  objc_sync_exit(v16);

}

- (void)deleteLongTermKeys
{
  SDUnlockSecurityManager *v2;
  NSData *localLongTermKey;
  NSData *remoteLongTermKey;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  v2->_localLongTermKey = 0;

  remoteLongTermKey = v2->_remoteLongTermKey;
  v2->_remoteLongTermKey = 0;

  v5 = -[SDUnlockSecurityManager deletePersistedLongTermKeys](v2, "deletePersistedLongTermKeys");
  v7 = paired_unlock_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](v2, "pairingID"));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted LTKs for %@", (uint8_t *)&v10, 0xCu);

  }
  objc_sync_exit(v2);

}

- (NSData)localLongTermKey
{
  SDUnlockSecurityManager *v2;
  NSData *localLongTermKey;
  NSData *v4;

  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  if (!localLongTermKey)
  {
    -[SDUnlockSecurityManager loadLongTermKeys](v2, "loadLongTermKeys");
    localLongTermKey = v2->_localLongTermKey;
  }
  v4 = localLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (NSData)remoteLongTermKey
{
  SDUnlockSecurityManager *v2;
  NSData *remoteLongTermKey;
  NSData *v4;

  v2 = self;
  objc_sync_enter(v2);
  remoteLongTermKey = v2->_remoteLongTermKey;
  if (!remoteLongTermKey)
  {
    -[SDUnlockSecurityManager loadLongTermKeys](v2, "loadLongTermKeys");
    remoteLongTermKey = v2->_remoteLongTermKey;
  }
  v4 = remoteLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (void)validateKeybagUUID
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];

  if (self->_keybagUUID)
  {
    v3 = sub_10001D548();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = objc_msgSend(v5, "isEqualToString:", self->_keybagUUID);

    v9 = paired_unlock_log(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "KeybagUUIDs match", v12, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      sub_100179BB8();
    }

  }
  else
  {
    -[SDUnlockSecurityManager saveLongTermKeys](self, "saveLongTermKeys");
  }
}

- (void)checkForBackupExclusion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SDUnlockBackupExclusion")));
  v5 = v4;
  if (self->_localLongTermKey)
  {
    if (self->_remoteLongTermKey)
    {
      v6 = objc_msgSend(v4, "BOOLValue");
      if ((v6 & 1) == 0)
      {
        v8 = paired_unlock_log(v6, v7);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resaving LTKs with backup exclusion", v10, 2u);
        }

        -[SDUnlockSecurityManager saveLongTermKeys](self, "saveLongTermKeys");
      }
    }
  }

}

- (void)saveLongTermKeys
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSData *remoteLongTermKey;
  const __CFString *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  v5 = (void *)v3;
  if (!self->_localLongTermKey || (self->_remoteLongTermKey ? (v6 = v3 == 0) : (v6 = 1), v6))
  {
    v7 = paired_unlock_log(v3, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = CFSTR("YES");
      remoteLongTermKey = self->_remoteLongTermKey;
      if (self->_localLongTermKey)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (!remoteLongTermKey)
        v9 = CFSTR("NO");
      v38 = (void *)v11;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Save missing info (local %@, remote %@, pairing store path %@)", buf, 0x20u);
    }
  }
  else
  {
    v12 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", self->_localLongTermKey, CFSTR("SDUnlockLocalLTK"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", self->_remoteLongTermKey, CFSTR("SDUnlockRemoteLTK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, CFSTR("SDUnlockPairingID"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SDUnlockBackupExclusion"));
    v14 = sub_10001D548();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, CFSTR("SDUnlockKeybagUUID"));

    }
    v36 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v12, 200, 0, &v36));
    v19 = v36;
    v8 = v19;
    if (v18)
    {

      v21 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
      v35 = 0;
      v22 = objc_msgSend(v18, "writeToURL:options:error:", v21, 268435457, &v35);
      v23 = v35;
      v25 = paired_unlock_log(v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v22)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v12;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Saved LTKs %@", buf, 0xCu);
        }

        v34 = v23;
        v28 = -[NSObject setResourceValue:forKey:error:](v21, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v34);
        v8 = v34;

        v31 = paired_unlock_log(v29, v30);
        v27 = objc_claimAutoreleasedReturnValue(v31);
        v32 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v28)
        {
          if (v32)
            sub_100179C50();
        }
        else if (v32)
        {
          sub_100179C7C();
        }
      }
      else
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_100179CDC();
        v8 = v23;
      }

    }
    else
    {
      v33 = paired_unlock_log(v19, v20);
      v21 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100179BF0();
    }

  }
}

- (void)loadLongTermKeys
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSData *v12;
  NSData *localLongTermKey;
  NSData *v14;
  NSData *remoteLongTermKey;
  NSString *v16;
  NSString *keybagUUID;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSData *v22;
  NSData *v23;
  NSString *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  NSData *v31;
  __int16 v32;
  NSData *v33;
  __int16 v34;
  NSString *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  if (v3)
  {
    v29 = 0;
    v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v3, 0, &v29);
    v5 = v29;
    v7 = v5;
    if (v4)
    {
      v28 = 0;
      v8 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v28));
      v9 = v28;

      if (v8)
      {
        v12 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("SDUnlockLocalLTK")));
        localLongTermKey = self->_localLongTermKey;
        self->_localLongTermKey = v12;

        v14 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("SDUnlockRemoteLTK")));
        remoteLongTermKey = self->_remoteLongTermKey;
        self->_remoteLongTermKey = v14;

        v16 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("SDUnlockKeybagUUID")));
        keybagUUID = self->_keybagUUID;
        self->_keybagUUID = v16;

        v20 = paired_unlock_log(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_localLongTermKey;
          v23 = self->_remoteLongTermKey;
          v24 = self->_keybagUUID;
          *(_DWORD *)buf = 138412802;
          v31 = v22;
          v32 = 2112;
          v33 = v23;
          v34 = 2112;
          v35 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Loaded LTKs\n local %@\nremote %@\nkeybag UUID %@)", buf, 0x20u);
        }

        -[SDUnlockSecurityManager checkForBackupExclusion:](self, "checkForBackupExclusion:", v8);
        -[SDUnlockSecurityManager validateKeybagUUID](self, "validateKeybagUUID");
      }
      else
      {
        v26 = paired_unlock_log(v10, v11);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_100179D9C();

      }
    }
    else
    {
      v25 = paired_unlock_log(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100179D3C();
      v9 = v7;
    }

  }
}

- (void)deletePersistedLongTermKeys
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint8_t buf[2];
  id v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = 0;
    v6 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v21);
    v7 = v21;

    if ((v6 & 1) != 0)
    {
      v10 = paired_unlock_log(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v12 = "Deleted LTKs";
        v13 = (uint8_t *)&v19;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else
    {
      v15 = -[NSObject code](v7, "code");
      if (v15 != (id)-1100)
      {
        v15 = -[NSObject code](v7, "code");
        if (v15 != (id)260)
        {
          v15 = -[NSObject code](v7, "code");
          if (v15 != (id)4)
          {
            v18 = paired_unlock_log(v15, v16);
            v11 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              sub_100179E8C();
            goto LABEL_13;
          }
        }
      }
      v17 = paired_unlock_log(v15, v16);
      v11 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "LTKs already deleted";
        v13 = buf;
        goto LABEL_12;
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v14 = paired_unlock_log(0, v3);
  v7 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100179DFC(self, v7);
LABEL_14:

}

- (id)longTermKeyStorageFilePath
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingStorePath](self, "pairingStorePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.sharing")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14);
  v7 = v14;

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ltk.plist")));
  }
  else
  {
    v11 = paired_unlock_log(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100179EEC(self);

    v10 = 0;
  }

  return v10;
}

- (BOOL)ltkFileExists
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v11;

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
      v11 = 0;
      LOBYTE(v3) = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v11);
      v6 = v11;
      v7 = v6;
      if ((v3 & 1) == 0)
      {
        v8 = auto_unlock_log(v6);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100179F78();

      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (id)legacyRemoteLongTermKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("UnlockSecurityRemoteLongTermKey")));

  return v3;
}

- (id)legacyLocalLongTermKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("UnlockSecurityLocalLongTermKey")));

  return v3;
}

- (void)migrateOldKeysIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyLocalLongTermKey](self, "legacyLocalLongTermKey"));
  v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyRemoteLongTermKey](self, "legacyRemoteLongTermKey"));
  v6 = (void *)v4;
  if (v3 && v4)
  {
    v7 = paired_unlock_log(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migrating old keys to %@", (uint8_t *)&v13, 0xCu);

    }
    -[SDUnlockSecurityManager updateLocalLongTermKey:remoteLongTermKey:](self, "updateLocalLongTermKey:remoteLongTermKey:", v3, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("UnlockSecurityLocalLongTermKey"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("UnlockSecurityRemoteLongTermKey"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "synchronize");

  }
}

- (int64_t)escrowCreationSessionAsOriginator:(BOOL)a3 errorCode:(int *)a4
{
  uint64_t v4;

  if (a3)
    v4 = 132;
  else
    v4 = 4;
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:](self, "authSessionWithFlags:secret:errorCode:", v4, 0, a4);
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5
{
  return -[SDUnlockSecurityManager unlockSessionAsOriginator:usingEscrow:escrowSecret:errorCode:](self, "unlockSessionAsOriginator:usingEscrow:escrowSecret:errorCode:", a3, a4, a5, 0);
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5 errorCode:(int *)a6
{
  int v6;
  int v7;

  if (a3)
    v6 = 128;
  else
    v6 = 0;
  if (a4)
    v7 = 5;
  else
    v7 = 2;
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:](self, "authSessionWithFlags:secret:errorCode:", v7 | v6, a5, a6);
}

- (int64_t)stashBagSessionAsOriginator:(BOOL)a3 escrowSecret:(id)a4 manifest:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (v8 == 0 && v6)
    v10 = 134;
  else
    v10 = 137;
  if (v6)
    v11 = v10;
  else
    v11 = 9;
  if (v8)
  {
    v23 = 0;
    v12 = objc_retainAutorelease(a4);
    v13 = objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "length");

    v15 = objc_retainAutorelease(v9);
    v16 = aks_create_escrow_blob(&v23, v13, v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    v22 = v16;
    if (v16 && v23)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v16, v23, 0, v22));
      v19 = -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:](self, "authSessionWithFlags:secret:errorCode:", v11, v18, 0);
      aks_free_escrow_blob(&v22, v23);
    }
    else
    {
      v20 = paired_unlock_log(v16, v17);
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100179FD8();
      v19 = 101;
    }
  }
  else
  {
    v18 = a4;
    v19 = -[SDUnlockSecurityManager authSessionWithFlags:secret:](self, "authSessionWithFlags:secret:", v11, v18);
  }

  return v19;
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4
{
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:](self, "authSessionWithFlags:secret:errorCode:", *(_QWORD *)&a3, a4, 0);
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4 errorCode:(int *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  int *v39;
  int64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v51;
  void *v52;
  id v53;
  unsigned int v54;
  int *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  int v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v60 = 0;
  v9 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (v9)
  {
    v11 = (void *)v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));

    if (v12)
    {
      v55 = a5;
      v59 = v8;
      v13 = paired_unlock_log(v9, v10);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v62 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating auth session with flags = %d", buf, 8u);
      }

      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey")));
      v56 = objc_msgSend(v57, "bytes");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
      v16 = objc_msgSend(v15, "length");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey")));
      v18 = objc_msgSend(v17, "bytes");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
      v20 = objc_msgSend(v19, "length");
      v53 = objc_retainAutorelease(v59);
      v54 = v6;
      v21 = aks_remote_session(0, v6, v56, v16, v18, v20, objc_msgSend(v53, "bytes"), objc_msgSend(v53, "length"), &v60);

      v24 = paired_unlock_log(v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v62 = v60;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Auth session -- create (session id: %d)", buf, 8u);
      }

      if (v21 == -536870211)
      {
        v28 = paired_unlock_log(v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Received no memory error when creating session, clearing and retrying", buf, 2u);
        }

        sub_10001D818(v30);
        v60 = 0;
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey")));
        v58 = objc_msgSend(v31, "bytes");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
        v33 = objc_msgSend(v32, "length");
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey")));
        v35 = objc_msgSend(v34, "bytes");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
        v37 = objc_msgSend(v36, "length");
        v38 = objc_retainAutorelease(v53);
        v21 = aks_remote_session(0, v54, v58, v33, v35, v37, objc_msgSend(v38, "bytes"), objc_msgSend(v38, "length"), &v60);

      }
      if (v21 <= -536870161)
      {
        v8 = v59;
        v39 = v55;
        if (v21 != -536870207)
        {
          if (v21 != -536870184)
          {
LABEL_29:
            v48 = paired_unlock_log(v26, v27);
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
              *(_DWORD *)buf = 67109890;
              v62 = v21;
              v63 = 1024;
              v64 = v54;
              v65 = 2112;
              v66 = v51;
              v67 = 2112;
              v68 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to setup session: (status = %x, flags = %d,\n localKey = %@,\n remoteKey = %@)", buf, 0x22u);

            }
            goto LABEL_32;
          }
LABEL_21:
          v43 = paired_unlock_log(v26, v27);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v62 = v21;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Escrow record exists, but not available (status = %d)", buf, 8u);
          }

          v40 = 0;
          goto LABEL_33;
        }
        v47 = paired_unlock_log(v26, v27);
        v46 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_10017A0A8();
      }
      else
      {
        v8 = v59;
        v39 = v55;
        if (v21 != -536870160)
        {
          if (v21 != -536363000)
          {
            if (!v21)
            {
              v40 = v60;
              goto LABEL_33;
            }
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        v45 = paired_unlock_log(v26, v27);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v62 = -536870160;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Escrow record not found status = %d", buf, 8u);
        }
      }

LABEL_32:
      v40 = -1;
LABEL_33:
      if (v39)
        *v39 = v21;
      goto LABEL_35;
    }
  }
  v41 = paired_unlock_log(v9, v10);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    sub_10017A004(self);

  v40 = -1;
LABEL_35:

  return v40;
}

- (BOOL)setupWithAuthSession:(int64_t)a3 passcode:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v18[2];

  v5 = objc_retainAutorelease(a4);
  v6 = objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "length");

  v8 = aks_remote_peer_setup(a3, v6, v7, 0, 0);
  v9 = v8;
  v11 = paired_unlock_log(v8, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setupWithAuthSession status = %d", (uint8_t *)v18, 8u);
  }

  if (v9 == -536870212)
  {
    v15 = paired_unlock_log(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10017A0D4();

  }
  return v9 != -536870212;
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4
{
  return -[SDUnlockSecurityManager stepWithAuthSession:data:authStep:](self, "stepWithAuthSession:data:authStep:", a3, a4, 0);
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5
{
  return -[SDUnlockSecurityManager stepWithAuthSession:data:authStep:errorCode:](self, "stepWithAuthSession:data:authStep:errorCode:", a3, a4, a5, 0);
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5 errorCode:(int64_t *)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;

  v9 = a4;
  v11 = v9;
  v21 = 0;
  v22 = 0;
  if (!a3)
  {
    v18 = paired_unlock_log(v9, v10);
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10017A100();
    goto LABEL_11;
  }
  v12 = objc_retainAutorelease(v9);
  v13 = aks_remote_session_step(a3, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), &v22, &v21);
  v15 = v13;
  if ((_DWORD)v13 || !a5 && !v21)
  {
    if (a6)
      *a6 = (int)v13;
    v16 = paired_unlock_log(v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10017A12C((uint64_t)&v21, v15, v17);
LABEL_11:

    v19 = 0;
    goto LABEL_12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v22, v21, v21));
LABEL_12:
  if (v22)
    free(v22);

  return v19;
}

- (id)escrowSecretWithAuthSession:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;

  v16 = 0;
  v17 = 0;
  v3 = aks_remote_peer_confirm(a3, &v17, &v16);
  if ((_DWORD)v3 == -536870212 || v16 == 0)
  {
    v6 = paired_unlock_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10017A1A0((uint64_t)&v16, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17));
  }
  if (v17)
    free(v17);
  return v14;
}

- (BOOL)confirmUnlockWithAuthSession:(int64_t)a3
{
  return aks_remote_peer_confirm(a3, 0, 0) == 0;
}

- (void)clearStateForSession:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109120;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reseting session id %d", (uint8_t *)&v21, 8u);
  }

  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = paired_unlock_log(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 67109120;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Auth session -- reset (session id: %d)", (uint8_t *)&v21, 8u);
    }

    v10 = aks_reset_session(a3);
    if ((_DWORD)v10 == -536870212)
    {
      v12 = paired_unlock_log(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10017A208(v13, v14, v15, v16, v17, v18, v19, v20);

    }
  }
}

- (void)resetEscrowRecord
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (!v3
    || (v5 = (void *)v3,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey")),
        v6,
        v5,
        !v6))
  {
    v20 = paired_unlock_log(v3, v4);
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10017A278();
    goto LABEL_10;
  }
  v7 = paired_unlock_log(v3, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting Escrow Record", buf, 2u);
  }

  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey")));
  v10 = objc_msgSend(v9, "bytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  v12 = objc_msgSend(v11, "length");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey")));
  v14 = objc_msgSend(v13, "bytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
  LODWORD(v10) = aks_remote_session(0, 3, v10, v12, v14, objc_msgSend(v15, "length"), 0, 0, 0);

  if ((_DWORD)v10 == -536870212)
  {
    v18 = paired_unlock_log(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10017A2A4();
LABEL_10:

  }
}

- (BOOL)storeEscrowData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  __int16 v28;
  uint8_t buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v5, "deviceKeyBagUnlocked") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager deviceName](self, "deviceName"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kSecAttrLabel);

      v10 = objc_opt_new(NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", kSecAttrAccessibleWhenUnlockedThisDeviceOnly, kSecAttrAccessible);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v4, kSecValueData);
      v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v8);
      objc_msgSend(v11, "addEntriesFromDictionary:", v10);
      v12 = SecItemAdd((CFDictionaryRef)v11, 0);
      if ((_DWORD)v12)
      {
        v14 = SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)v10);
        if ((_DWORD)v14)
        {
          v16 = SecItemDelete((CFDictionaryRef)v8);
          v17 = SecItemAdd((CFDictionaryRef)v11, 0);
          if (!(_DWORD)v17)
          {
            v22 = 1;
            goto LABEL_18;
          }
          v19 = v17;
          v20 = paired_unlock_log(v17, v18);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10017A2D0(v19, v16, v21);
          v22 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v26 = paired_unlock_log(v14, v15);
        v21 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "Updated escrow data";
          v25 = buf;
          goto LABEL_15;
        }
      }
      else
      {
        v23 = paired_unlock_log(v12, v13);
        v21 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 0;
          v24 = "Added escrow data";
          v25 = (uint8_t *)&v28;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
        }
      }
      v22 = 1;
      goto LABEL_17;
    }
  }
  else
  {

  }
  v22 = 0;
LABEL_19:

  return v22;
}

- (id)escrowData
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  CFTypeRef result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    result = 0;
    v4 = objc_alloc((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    v6 = objc_msgSend(v4, "initWithDictionary:", v5);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
    if (SecItemCopyMatching((CFDictionaryRef)v6, &result))
      v7 = 0;
    else
      v7 = (void *)result;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)checkForEscrowData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    v6 = objc_alloc((Class)NSMutableDictionary);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    v8 = objc_msgSend(v6, "initWithDictionary:", v7);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnPersistentRef);
    v9 = SecItemCopyMatching((CFDictionaryRef)v8, 0);
    v11 = (_DWORD)v9 == -25308 || v9 == 0;
    if ((_DWORD)v9 != -25308 && (_DWORD)v9 != -25300 && (_DWORD)v9 != 0)
    {
      v14 = v9;
      v15 = paired_unlock_log(v9, v10);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 67109120;
        LODWORD(v27) = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received unexpected SecItem error = %d", (uint8_t *)&v26, 8u);
      }

    }
  }
  else
  {
    v11 = 0;
  }
  v17 = paired_unlock_log(v4, v5);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
    v26 = 138412546;
    v27 = v19;
    v28 = 2112;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Escrow data exist:%@, pairing id:%@", (uint8_t *)&v26, 0x16u);

  }
  if (v11)
    goto LABEL_27;
  v21 = -[SDUnlockSecurityManager checkForLegacyEscrowData](self, "checkForLegacyEscrowData");
  if (v21)
  {
    v23 = paired_unlock_log(v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Escrow data hasn't been migrated", (uint8_t *)&v26, 2u);
    }

LABEL_27:
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (void)deleteEscrowData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    v4 = SecItemDelete((CFDictionaryRef)-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    if ((_DWORD)v4 != -25300)
    {
      v6 = v4;
      if ((_DWORD)v4)
      {
        v7 = paired_unlock_log(v4, v5);
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_10017A340(v6, v8, v9, v10, v11, v12, v13, v14);

      }
    }
  }
}

- (id)allKeychainItems
{
  __CFString *v3;
  id v4;
  void *v5;
  id v6;
  OSStatus v7;
  void *v8;
  CFTypeRef result;

  result = 0;
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    v4 = objc_alloc((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    v6 = objc_msgSend(v4, "initWithDictionary:", v5);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
    v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
    if (v7 == -25308)
    {
      v3 = CFSTR("Items Exist | Device Locked");
    }
    else if (v7)
    {
      v3 = 0;
    }
    else
    {
      v8 = (void *)result;
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "description"));

    }
  }
  return v3;
}

- (id)baseDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", kSecClassGenericPassword, kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.sharingd.unlock"), kSecAttrAccount);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.sharingd"), kSecAttrAccessGroup);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  v5 = -[NSMutableDictionary copy](v3, "copy");
  return v5;
}

- (id)legacyEscrowData
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v4[0] = kSecClass;
  v4[1] = kSecAttrLabel;
  v5[0] = kSecClassGenericPassword;
  v5[1] = CFSTR("com.apple.Sharing.lock-escrow");
  v4[2] = kSecAttrAccessGroup;
  v4[3] = kSecReturnData;
  v3 = 0;
  v5[2] = CFSTR("com.apple.sharingd");
  v5[3] = &__kCFBooleanTrue;
  v4[4] = kSecAttrService;
  v5[4] = CFSTR("UnlockServiceName");
  if (SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 5), (CFTypeRef *)&v3))
  {
    return 0;
  }
  else
  {
    return v3;
  }
}

- (BOOL)checkForLegacyEscrowData
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v14[0] = kSecClass;
  v14[1] = kSecAttrLabel;
  v15[0] = kSecClassGenericPassword;
  v15[1] = CFSTR("com.apple.Sharing.lock-escrow");
  v14[2] = kSecAttrService;
  v14[3] = kSecAttrAccessGroup;
  v15[2] = CFSTR("UnlockServiceName");
  v15[3] = CFSTR("com.apple.sharingd");
  v14[4] = kSecReturnPersistentRef;
  v15[4] = &__kCFBooleanTrue;
  v2 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5), 0);
  v4 = (_DWORD)v2 == -25308 || v2 == 0;
  if ((_DWORD)v2 != -25308)
  {
    v5 = v2;
    if ((_DWORD)v2 != -25300)
    {
      if ((_DWORD)v2)
      {
        v6 = paired_unlock_log(v2, v3);
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 67109120;
          LODWORD(v13) = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received unexpected SecItem error = %d", (uint8_t *)&v12, 8u);
        }

      }
    }
  }
  v8 = paired_unlock_log(v2, v3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v12 = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Legacy escrow data exist:%@", (uint8_t *)&v12, 0xCu);
  }

  return v4;
}

- (void)migrateEscrowDataIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyEscrowData](self, "legacyEscrowData"));
  v5 = (void *)v3;
  if (v3)
  {
    v6 = paired_unlock_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migrating escrow data", v12, 2u);
    }

    v8 = -[SDUnlockSecurityManager storeEscrowData:](self, "storeEscrowData:", v5);
    if (v8)
    {
      -[SDUnlockSecurityManager deleteLegacyEscrowData](self, "deleteLegacyEscrowData");
    }
    else
    {
      v10 = paired_unlock_log(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10017A3A4();

    }
  }

}

- (void)deleteLegacyEscrowData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v13[0] = kSecClass;
  v13[1] = kSecAttrLabel;
  v14[0] = kSecClassGenericPassword;
  v14[1] = CFSTR("com.apple.Sharing.lock-escrow");
  v13[2] = kSecAttrService;
  v14[2] = CFSTR("UnlockServiceName");
  v2 = SecItemDelete((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  if ((_DWORD)v2)
  {
    v4 = v2;
    v5 = paired_unlock_log(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10017A3D0(v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)setLocalLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_localLongTermKey, a3);
}

- (void)setRemoteLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLongTermKey, a3);
}

- (NSString)keybagUUID
{
  return self->_keybagUUID;
}

- (void)setKeybagUUID:(id)a3
{
  objc_storeStrong((id *)&self->_keybagUUID, a3);
}

- (NSString)keyDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPairingID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)pairingStorePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPairingStorePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_keyDeviceID, 0);
  objc_storeStrong((id *)&self->_keybagUUID, 0);
  objc_storeStrong((id *)&self->_remoteLongTermKey, 0);
  objc_storeStrong((id *)&self->_localLongTermKey, 0);
}

@end
