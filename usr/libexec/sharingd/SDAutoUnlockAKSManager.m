@implementation SDAutoUnlockAKSManager

+ (id)sharedManager
{
  if (qword_1007C69B0 != -1)
    dispatch_once(&qword_1007C69B0, &stru_100717B70);
  return (id)qword_1007C69A8;
}

- (SDAutoUnlockAKSManager)init
{
  SDAutoUnlockAKSManager *v2;
  SDAutoUnlockAKSManager *v3;
  uint64_t v4;
  NSString *localDeviceID;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedSessions;
  NSMutableDictionary *v8;
  NSMutableDictionary *preferredRemoteLTKForDeviceID;
  NSMutableDictionary *v10;
  NSMutableDictionary *activeAKSSessions;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  objc_super v21;
  uint8_t buf[4];
  const __CFString *v23;

  v21.receiver = self;
  v21.super_class = (Class)SDAutoUnlockAKSManager;
  v2 = -[SDAutoUnlockAKSManager init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cachedSessionKeysLock._os_unfair_lock_opaque = 0;
    v4 = IDSCopyLocalDeviceUniqueID();
    localDeviceID = v3->_localDeviceID;
    v3->_localDeviceID = (NSString *)v4;

    v6 = objc_opt_new(NSMutableDictionary);
    cachedSessions = v3->_cachedSessions;
    v3->_cachedSessions = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    preferredRemoteLTKForDeviceID = v3->_preferredRemoteLTKForDeviceID;
    v3->_preferredRemoteLTKForDeviceID = v8;

    v3->_t208Machine = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
    v10 = objc_opt_new(NSMutableDictionary);
    activeAKSSessions = v3->_activeAKSSessions;
    v3->_activeAKSSessions = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v12, "addClient:forIdentifer:", v3, CFSTR("A70C5EAF-F24F-48A7-B834-F5297000C7A2"));

    v13 = auto_unlock_log(-[SDAutoUnlockAKSManager addObservers](v3, "addObservers"));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v3->_localDeviceID;
      *(_DWORD *)buf = 138412290;
      v23 = (const __CFString *)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local Unique ID:%@", buf, 0xCu);
    }

    v17 = auto_unlock_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("YES");
      if (!v3->_t208Machine)
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Touch Bar:%@", buf, 0xCu);
    }

  }
  return v3;
}

- (void)start
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceSupportsRanging");

  if (v4)
  {
    -[SDAutoUnlockAKSManager loadWatchIDsToPairingRecords](self, "loadWatchIDsToPairingRecords");
    -[SDAutoUnlockAKSManager updateLTKs](self, "updateLTKs");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v6 = objc_msgSend(v5, "deviceKeyBagUnlocked");

    if (v6)
      -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
    -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "myAltDSID"));
    -[SDAutoUnlockAKSManager setAltDSID:](self, "setAltDSID:", v8);

    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager altDSID](self, "altDSID"));
      v13 = CFSTR("YES");
      if (!v12)
        v13 = CFSTR("NO");
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DSID: %@", (uint8_t *)&v14, 0xCu);

    }
    if (sub_1000C8E68())
    {
      -[SDAutoUnlockAKSManager setAutoUnlockDisabledDueToManagement:](self, "setAutoUnlockDisabledDueToManagement:", 1);
      -[SDAutoUnlockAKSManager handleRequiredStateDisabled](self, "handleRequiredStateDisabled");
    }
    -[SDAutoUnlockAKSManager updateRangingKeysIfNeccesary](self, "updateRangingKeysIfNeccesary");
  }
}

- (void)updateLTKs
{
  void *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceSupportsRanging");

  if (v4)
  {
    v5 = -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
    -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
    -[SDAutoUnlockAKSManager checkLocalLTK](self, "checkLocalLTK");
    if (v5)
      -[SDAutoUnlockAKSManager checkLocalAttestedLTK](self, "checkLocalAttestedLTK");
  }
}

- (void)updateLocalLTK
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceSupportsRanging");

  if (v4)
  {
    -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
    -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
  }
  else
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device does not support ranging, not loading localLTKs", v8, 2u);
    }

  }
}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  SDAutoUnlockAKSManager *v45;
  void *i;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  SDAutoUnlockAKSManager *v59;
  id obj;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v84 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v84, "%@\n", v5);
  v6 = v84;

  v83 = v6;
  NSAppendPrintF(&v83, "-------------\n");
  v7 = v83;

  v82 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  NSAppendPrintF(&v82, "Local Unique ID: %@\n", v8);
  v9 = v82;

  v81 = v9;
  NSAppendPrintF(&v81, "\n");
  v10 = v81;

  v80 = v10;
  if (-[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  NSAppendPrintF(&v80, "View Syncing: %@\n", v11);
  v12 = v80;

  v79 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v13, "deviceWasUnlockedOnce"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  NSAppendPrintF(&v79, "Device First Unlocked: %@\n", v14);
  v15 = v79;

  v78 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allKeychainDevices](self, "allKeychainDevices"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  v18 = SFCompactStringFromCollection(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  NSAppendPrintF(&v78, "Keychain Devices: %@\n", v19);
  v20 = v78;

  v77 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](self, "remoteLTKStorageFilePath"));
  NSAppendPrintF(&v77, "Remote LTK File Path: %@\n", v21);
  v22 = v77;

  v76 = v22;
  NSAppendPrintF(&v76, "Remote LTKs\n");
  v23 = v76;

  v59 = self;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allKeys"));
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v73;
    do
    {
      v27 = 0;
      v28 = v23;
      do
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", v29));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("LTK Data")));
        if (!v31)
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Attested LTK Data")));
        v71 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("LTK ID")));
        v33 = sub_10001D8AC(v31);
        v34 = sub_10001DD10(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description"));
        NSAppendPrintF(&v71, "Device ID: %@, Remote LTK ID: %@, ASK Peer State: %@, Remote LTK: %@\n", v29, v32, v35, v36);
        v23 = v71;

        v27 = (char *)v27 + 1;
        v28 = v23;
      }
      while (v25 != v27);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    }
    while (v25);
  }

  v70 = v23;
  NSAppendPrintF(&v70, "\n");
  v37 = v70;

  v38 = objc_opt_new(NSMutableArray);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "devicesWithLTKs"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allObjects"));

  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v67;
    v45 = v59;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(v41);
        v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](v45, "localDeviceID"));
        v49 = objc_msgSend(v47, "isEqualToString:", v48);

        if ((v49 & 1) == 0
          && -[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](v45, "escrowSecretExistsForDevice:", v47))
        {
          -[NSMutableArray addObject:](v38, "addObject:", v47);
          v65 = v37;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](v45, "rangingKeyForDeviceID:", v47));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "description"));
          NSAppendPrintF(&v65, "Ranging Key: \"%@\" : %@\n", v47, v51);
          v52 = v65;

          v64 = v52;
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keyPairingIDForDeviceID:](v59, "keyPairingIDForDeviceID:", v47));
          NSAppendPrintF(&v64, "Pairing ID: \"%@\" : %@\n", v47, v53);
          v37 = v64;

          v45 = v59;
        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    }
    while (v43);
  }

  v63 = v37;
  v54 = SFCompactStringFromCollection(v38);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  NSAppendPrintF(&v63, "Escrow Exists: %@\n", v55);
  v56 = v63;

  v62 = v56;
  NSAppendPrintF(&v62, "\n");
  v57 = v62;

  return (NSString *)v57;
}

- (BOOL)viewSyncing
{
  id v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;

  v2 = objc_alloc_init(off_1007B1F80());
  v9 = 0;
  v3 = objc_msgSend(v2, "isManateeAvailable:", &v9);
  v4 = v9;
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    v6 = auto_unlock_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100112CE0();

  }
  return v3;
}

- (void)loadLocalUniqueIDIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

  if (!v3)
  {
    v4 = (void *)IDSCopyLocalDeviceUniqueID();
    -[SDAutoUnlockAKSManager setLocalDeviceID:](self, "setLocalDeviceID:", v4);

    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading local unique ID: %@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)addObservers
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const char *v10;
  id v11;
  _QWORD handler[4];
  id v13;
  int out_token;
  id location;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100112D40();

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "appleAccountSignedIn:", CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "appleAccountSignedOut:", CFSTR("com.apple.sharingd.AppleAccountSignOut"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "deviceFirstUnlocked:", CFSTR("com.apple.sharingd.KeyBagFirstUnlock"), 0);

  v8 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "handleManagementChanged:", MCEffectiveSettingsChangedNotification, 0);

  location = 0;
  objc_initWeak(&location, self);
  out_token = 0;
  v10 = (const char *)objc_msgSend(kMANotificationDCRTOOBPerformed, "UTF8String");
  v11 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100106444;
  handler[3] = &unk_100714590;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v10, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)handleManagementChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = SFMainQueue(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010652C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)deviceFirstUnlocked:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  SDAutoUnlockDeviceFirstUnlocked *v8;

  v8 = objc_opt_new(SDAutoUnlockDeviceFirstUnlocked);
  -[SDAutoUnlockDeviceFirstUnlocked setVersion:](v8, "setVersion:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceFirstUnlocked data](v8, "data"));
  v6 = IDSDefaultPairedDevice;
  v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("A70C5EAF-F24F-48A7-B834-F5297000C7A2"));
  objc_msgSend(v4, "sendPayload:toDevice:type:sessionID:queueOneID:timeout:errorHandler:", v5, v6, 308, v7, 0, 0, &stru_100717B90);

  -[SDAutoUnlockAKSManager updateRangingKeysIfNeccesary](self, "updateRangingKeysIfNeccesary");
}

- (void)appleAccountSignedIn:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sharing_persistent_log(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign in", v5, 2u);
  }

}

- (void)appleAccountSignedOut:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = auto_unlock_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign out", v7, 2u);
  }

  -[SDAutoUnlockAKSManager removeAllRemoteLTKsOnSignOut](self, "removeAllRemoteLTKsOnSignOut");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v6, "resetAppleWatchExisted");

}

- (void)screenLockUnlocked:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3));
  if (objc_msgSend(v4, "deviceSupportsRanging"))
  {
    -[SDAutoUnlockAKSManager loadLocalUniqueIDIfNeeded](self, "loadLocalUniqueIDIfNeeded");
    -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
    -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
    -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
    -[SDAutoUnlockAKSManager checkLocalLTK](self, "checkLocalLTK");
    -[SDAutoUnlockAKSManager checkLocalAttestedLTK](self, "checkLocalAttestedLTK");
    -[SDAutoUnlockAKSManager checkRemoteLTKs](self, "checkRemoteLTKs");
    -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
  }

}

- (void)handleKeyBagLockStateChanged
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v3, "deviceKeyBagUnlocked"))
  {
    v4 = objc_msgSend(v3, "deviceSupportsRanging");
    if ((_DWORD)v4)
    {
      v4 = (id)SFDeviceSupportsAutoUnlock();
      if ((_DWORD)v4)
      {
        -[SDAutoUnlockAKSManager loadLocalUniqueIDIfNeeded](self, "loadLocalUniqueIDIfNeeded");
        -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
        -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
        -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
        -[SDAutoUnlockAKSManager checkLocalLTK](self, "checkLocalLTK");
        -[SDAutoUnlockAKSManager checkLocalAttestedLTK](self, "checkLocalAttestedLTK");
        -[SDAutoUnlockAKSManager checkRemoteLTKs](self, "checkRemoteLTKs");
        -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
        -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
        v4 = -[SDAutoUnlockAKSManager reloadPairingRecordsIfNeeded](self, "reloadPairingRecordsIfNeeded");
      }
    }
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Auto Unlock dynamic store updated", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("SDAutoUnlockAKSManagerDynamicStoreUpdatedAfterFirstUnlockNotification"), 0, 0);

  }
}

- (void)consoleUserChanged:(id)a3
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  pid_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3));
  v4 = objc_msgSend(v3, "currentConsoleUser");

  if (v4)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = getuid();
      v10 = 1024;
      v11 = getpid();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current console user changed (uid: %d, pid: %d)", (uint8_t *)v9, 0xEu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    objc_msgSend(v8, "updateDynamicStoreEnabled");

  }
}

- (id)aksPairingSessionForDeviceID:(id)a3 originator:(BOOL)a4 errorCode:(int64_t *)a5 requiresAttestation:(BOOL)a6 requiresEscrow:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  SDAutoUnlockAKSSession *v19;
  uint64_t v20;
  NSObject *v21;
  int64_t v22;
  void *v23;
  unsigned int v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  _BYTE v30[24];
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v12 = a3;
  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    -[SDAutoUnlockAKSManager checkRemoteLTKForDeviceID:](self, "checkRemoteLTKForDeviceID:", v12);
  }
  v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v12));
  v15 = (void *)v14;
  if (v14 && v13)
  {
    if (v8)
      v16 = 4;
    else
      v16 = 1;
    if (v8 && v7)
    {
      v17 = auto_unlock_log(v14);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using attested escrow pairing type", v30, 2u);
      }

      v16 = 6;
    }
    v19 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:]([SDAutoUnlockAKSSession alloc], "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:", v13, v15, v16, v10, v12);
  }
  else
  {
    v20 = auto_unlock_log(v14);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
      v26 = CFSTR("NO");
      *(_DWORD *)v30 = 138413827;
      *(_QWORD *)&v30[4] = v12;
      *(_WORD *)&v30[12] = 2112;
      if (v25)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      *(_QWORD *)&v30[14] = v27;
      if (v8)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      *(_WORD *)&v30[22] = 2112;
      if (v13)
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      v31 = v28;
      if (v15)
        v26 = CFSTR("YES");
      v32 = 2112;
      v33 = v29;
      v34 = 2113;
      v35 = v13;
      v36 = 2112;
      v37 = v26;
      v38 = 2113;
      v39 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, attestation: %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@)", v30, 0x48u);
    }

    v19 = 0;
    if (a5)
    {
      if (v15)
      {
        if (v13)
          v22 = 101;
        else
          v22 = 149;
      }
      else
      {
        v22 = 148;
      }
      *a5 = v22;
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager activeAKSSessions](self, "activeAKSSessions", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, v12);

  return v19;
}

- (id)aksRegistrationSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SDAutoUnlockAKSSession *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  _BYTE v17[24];
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));
  v9 = (void *)v8;
  if (v8 && v7)
  {
    v10 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:]([SDAutoUnlockAKSSession alloc], "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:", v7, v8, 5, v4, v6);
  }
  else
  {
    v11 = auto_unlock_log(v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = CFSTR("NO");
      *(_DWORD *)v17 = 138413315;
      *(_QWORD *)&v17[4] = v6;
      if (v7)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      *(_QWORD *)&v17[14] = v16;
      *(_WORD *)&v17[12] = 2112;
      if (v9)
        v15 = CFSTR("YES");
      *(_WORD *)&v17[22] = 2113;
      v18 = v7;
      v19 = 2112;
      v20 = v15;
      v21 = 2113;
      v22 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@)", v17, 0x34u);
    }

    v10 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager activeAKSSessions](self, "activeAKSSessions", *(_OWORD *)v17, *(_QWORD *)&v17[16]));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v6);

  return v10;
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  return -[SDAutoUnlockAKSManager aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:](self, "aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:", a3, a4, 0, 0, 2);
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4 usingEscrow:(BOOL)a5 attestation:(BOOL)a6 sessionType:(int64_t)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  SDAutoUnlockAKSSession *v25;
  uint64_t v26;
  NSObject *v27;
  SDAutoUnlockAKSSession *v28;
  void *v29;
  void *v30;
  int64_t v31;
  uint64_t v32;
  __CFString *v33;
  _BOOL8 v34;
  uint64_t v35;
  NSObject *v36;
  unsigned int v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  int v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = (__CFString *)a3;
  if (v8)
    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  else
    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  v14 = (void *)v13;
  v15 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v12));
  v16 = (void *)v15;
  if (v15 && v14)
  {
    if (v10)
    {
      if (v9)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDevice:](self, "escrowSecretForDevice:", v12));
        v18 = auto_unlock_log(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = CFSTR("YES");
          if (!v17)
            v20 = CFSTR("NO");
          v45 = 138412546;
          v46 = v20;
          v47 = 2112;
          v48 = v12;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Escrow secret (exists: %@, device ID: %@)", (uint8_t *)&v45, 0x16u);
        }

        v22 = auto_unlock_log(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          sub_100112DF8();

        if (v17)
        {
          v25 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:]([SDAutoUnlockAKSSession alloc], "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:", v14, v16, a7, 1, v12, v17);
        }
        else
        {
          v35 = auto_unlock_log(v24);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_100112DCC();

          v25 = 0;
        }

        goto LABEL_25;
      }
      v28 = [SDAutoUnlockAKSSession alloc];
      v29 = v14;
      v30 = v16;
      v31 = a7;
      v32 = 1;
      v33 = v12;
      v34 = 0;
    }
    else
    {
      v28 = [SDAutoUnlockAKSSession alloc];
      v29 = v14;
      v30 = v16;
      v31 = a7;
      v32 = 0;
      v33 = v12;
      v34 = v9;
    }
    v25 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:usingEscrow:](v28, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:usingEscrow:", v29, v30, v31, v32, v33, v34);
    goto LABEL_25;
  }
  v26 = auto_unlock_log(v15);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v38 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
    v39 = CFSTR("NO");
    v45 = 138414339;
    v46 = v12;
    v47 = 2112;
    if (v38)
      v40 = CFSTR("YES");
    else
      v40 = CFSTR("NO");
    v48 = v40;
    if (v14)
      v41 = CFSTR("YES");
    else
      v41 = CFSTR("NO");
    v49 = 2112;
    if (v16)
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    v50 = v41;
    v51 = 2113;
    if (v10)
      v43 = CFSTR("YES");
    else
      v43 = CFSTR("NO");
    v52 = v14;
    if (v9)
      v44 = CFSTR("YES");
    else
      v44 = CFSTR("NO");
    v53 = 2112;
    if (v8)
      v39 = CFSTR("YES");
    v54 = v42;
    v55 = 2113;
    v56 = v16;
    v57 = 2112;
    v58 = v43;
    v59 = 2112;
    v60 = v44;
    v61 = 2112;
    v62 = v39;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@, originator: %@, escrow: %@, attested: %@)", (uint8_t *)&v45, 0x5Cu);
  }

  v25 = 0;
LABEL_25:

  return v25;
}

- (id)aksAuthSessionForDeviceID:(id)a3 attestation:(BOOL)a4 sessionType:(int64_t)a5 escrowSecret:(id)a6
{
  _BOOL4 v8;
  __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  SDAutoUnlockAKSSession *v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;

  v8 = a4;
  v10 = (__CFString *)a3;
  v11 = a6;
  if (v8)
    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  else
    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v10));
  v15 = auto_unlock_log(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (!v14 || !v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
      v32 = 138414083;
      v28 = CFSTR("NO");
      v33 = v10;
      v34 = 2112;
      if (v27)
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      v35 = v29;
      if (v13)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      v36 = 2112;
      if (v14)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      v37 = v30;
      v38 = 2113;
      if (v8)
        v28 = CFSTR("YES");
      v39 = v13;
      v40 = 2112;
      v41 = v31;
      v42 = 2113;
      v43 = v14;
      v44 = 2112;
      v45 = CFSTR("YES");
      v46 = 2112;
      v47 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@, originator: %@, attested: %@)", (uint8_t *)&v32, 0x52u);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("YES");
    if (!v11)
      v18 = CFSTR("NO");
    v32 = 138412546;
    v33 = v18;
    v34 = 2112;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Escrow secret (exists: %@, device ID: %@)", (uint8_t *)&v32, 0x16u);
  }

  v20 = auto_unlock_log(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_100112DF8();

  if (!v11)
  {
    v24 = auto_unlock_log(v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100112DCC();

LABEL_19:
    v23 = 0;
    goto LABEL_20;
  }
  v23 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:]([SDAutoUnlockAKSSession alloc], "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:", v13, v14, a5, 1, v10, v11);
LABEL_20:

  return v23;
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 originator:(BOOL)a4 sessionType:(int64_t)a5
{
  return -[SDAutoUnlockAKSManager aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:](self, "aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:", a3, 0, a4, 0, a5);
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 attestation:(BOOL)a4 originator:(BOOL)a5 externalACMContext:(id)a6 sessionType:(int64_t)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SDAutoUnlockAKSSession *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  SDAutoUnlockAKSSession *v28;
  SDAutoUnlockAKSSession *v29;
  int v31;
  const __CFString *v32;
  __int16 v33;
  id v34;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  if (a4)
    v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  else
    v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v12));
  v17 = 0;
  if (!v16 || !v15)
    goto LABEL_24;
  if (!v9)
  {
    v17 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:]([SDAutoUnlockAKSSession alloc], "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:", v15, v16, a7, 0, v12, v13);
    goto LABEL_24;
  }
  if (a7 != 3)
  {
    v18 = 0;
LABEL_20:
    v28 = [SDAutoUnlockAKSSession alloc];
    if (v13)
      v29 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:](v28, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:", v15, v16, a7, 1, v12, v13);
    else
      v29 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:](v28, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:", v15, v16, a7, 1, v12, v18);
    v17 = v29;

    goto LABEL_24;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDevice:](self, "escrowSecretForDevice:", v12));
  v19 = auto_unlock_log(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = CFSTR("YES");
    if (!v18)
      v21 = CFSTR("NO");
    v31 = 138412546;
    v32 = v21;
    v33 = 2112;
    v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Escrow secret for authorization (exists: %@, device ID: %@)", (uint8_t *)&v31, 0x16u);
  }

  v23 = auto_unlock_log(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    sub_100112DF8();

  if (v18)
    goto LABEL_20;
  v26 = auto_unlock_log(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    sub_100112E58();

  v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)canCreateTokenSessionForDeviceID:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", a3));
  v4 = v3;
  if (v3)
    v5 = sub_10001D8AC(v3) == 3;
  else
    v5 = 0;

  return v5;
}

- (BOOL)encryptMessageData:(id)a3 deviceID:(id)a4 encryptedMessage:(id *)a5 authTag:(id *)a6 nonce:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  id v44;
  uint64_t v45;
  _QWORD v46[2];
  uint64_t v47;
  int v48;

  v12 = a4;
  v48 = 0;
  v47 = 0;
  v13 = objc_msgSend(a3, "mutableCopy");
  v14 = v13;
  v46[0] = 0;
  v46[1] = 0;
  if (a5 && a6 && a7)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", v12));
    if (v15)
    {
      v16 = RandomBytes(&v47, 12);
      if ((_DWORD)v16)
      {
        v17 = v16;
        v18 = auto_unlock_log(v16);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100112F4C(v17, v19, v20, v21, v22, v23, v24, v25);
      }
      else
      {
        v45 = kCryptoAEADDescriptorChaCha20Poly1305;
        v15 = objc_retainAutorelease(v15);
        v44 = -[NSObject bytes](v15, "bytes");
        v28 = -[NSObject length](v15, "length");
        v29 = objc_retainAutorelease(v14);
        v30 = objc_msgSend(v29, "mutableBytes");
        v31 = objc_msgSend(v29, "length");
        v32 = objc_retainAutorelease(v29);
        v33 = CryptoAEADEncryptMessageOneShot(v45, v44, v28, &v47, 12, 0, 0, v30, v31, objc_msgSend(v32, "mutableBytes"), v46, 16);
        if (!(_DWORD)v33)
        {
          *a5 = objc_retainAutorelease(v32);
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v46, 16));
          *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v47, 12));
          v42 = 1;
          goto LABEL_17;
        }
        v34 = v33;
        v35 = auto_unlock_log(v33);
        v19 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100112EE4(v34, v19, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      v27 = auto_unlock_log(0);
      v19 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100112E84();
    }

  }
  else
  {
    v26 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100112FB4();
  }
  v42 = 0;
LABEL_17:

  return v42;
}

- (id)decryptMessage:(id)a3 authTag:(id)a4 nonce:(id)a5 bluetoothID:(id)a6 cachedDevices:(BOOL)a7 errorCode:(int64_t *)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *i;
  NSMutableArray *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  int v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  int64_t v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v62;
  NSObject *v63;
  int64_t *v64;
  id v65;
  _BOOL4 v66;
  uint64_t v67;
  NSMutableArray *obj;
  id v69;
  id v70;
  NSMutableArray *v71;
  uint64_t v72;
  id v73;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  uint8_t buf[4];
  NSMutableArray *v86;
  __int16 v87;
  id v88;
  _BYTE v89[128];

  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v71 = objc_opt_new(NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v18 = v17;
  v66 = v9;
  if (v9)
  {
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cachedIDSDeviceIDsForBluetoothID:", v16));

    v21 = auto_unlock_log(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v23 = "Decrypting with cached device IDs";
  }
  else
  {
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceIDsForBluetoothID:", v16));

    v25 = auto_unlock_log(v24);
    v22 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v23 = "Decrypting without cached device IDs";
  }
  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
LABEL_7:

  v26 = -[NSMutableArray count](v19, "count");
  if ((unint64_t)v26 >= 2)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_100107FD8;
    v84[3] = &unk_100717BB8;
    v84[4] = self;
    v27 = objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v19, "sortedArrayUsingComparator:", v84));

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    v19 = (NSMutableArray *)v27;
  }
  v28 = auto_unlock_log(v26);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v19;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt message with sorted device IDs %@", buf, 0xCu);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v19;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v73)
  {
    v64 = a8;
    v65 = v16;
    v30 = 0;
    v72 = *(_QWORD *)v81;
    v69 = v15;
    v70 = v13;
    while (2)
    {
      for (i = 0; i != v73; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v72)
          objc_enumerationMutation(obj);
        v32 = *(NSMutableArray **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", v32));
        if (v33)
        {
          v67 = v30;
          -[NSMutableArray addObject:](v71, "addObject:", v32);
          v34 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(v13, "length"));
          v79 = kCryptoAEADDescriptorChaCha20Poly1305;
          v35 = objc_retainAutorelease(v33);
          v78 = objc_msgSend(v35, "bytes");
          v77 = objc_msgSend(v35, "length");
          v36 = objc_retainAutorelease(v15);
          v76 = objc_msgSend(v36, "bytes");
          v75 = objc_msgSend(v36, "length");
          v37 = objc_retainAutorelease(v13);
          v38 = objc_msgSend(v37, "bytes");
          v39 = objc_msgSend(v37, "length");
          v40 = objc_retainAutorelease(v34);
          v41 = objc_msgSend(v40, "mutableBytes");
          v42 = objc_retainAutorelease(v14);
          v43 = CryptoAEADDecryptMessageOneShot(v79, v78, v77, v76, v75, 0, 0, v38, v39, v41, objc_msgSend(v42, "bytes"), objc_msgSend(v42, "length"));
          v44 = v43;
          v45 = auto_unlock_log(v43);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          v47 = v46;
          if (!v44)
          {
            v30 = v67;
            v49 = v40;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v50 = objc_msgSend(v40, "length");
              *(_DWORD *)buf = 138412546;
              v86 = v32;
              v87 = 2048;
              v88 = v50;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Decrypted message (deviceID: %@, length: %ld)", buf, 0x16u);
            }

            v48 = 1;
            v15 = v69;
            v13 = v70;
            goto LABEL_27;
          }
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v86 = v32;
            v87 = 2048;
            v88 = (id)v44;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Error decryption failure (device ID: %@, error %ld)", buf, 0x16u);
          }

          v30 = 190;
          v15 = v69;
          v13 = v70;
        }

      }
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      if (v73)
        continue;
      break;
    }
    v48 = 0;
    v49 = 0;
LABEL_27:
    a8 = v64;
    v16 = v65;
  }
  else
  {
    v48 = 0;
    v30 = 0;
    v49 = 0;
  }

  v52 = auto_unlock_log(v51);
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v71;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Devices with session keys: %@", buf, 0xCu);
  }

  if (((v48 | !v66) & 1) != 0)
  {
    if (-[NSMutableArray count](obj, "count"))
    {
      v55 = 191;
      if (v48)
        v55 = v30;
      if (!a8)
        goto LABEL_37;
    }
    else
    {
      v62 = auto_unlock_log(0);
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        sub_100113020(v16, v63);

      v55 = 198;
      if (!a8)
        goto LABEL_37;
    }
    *a8 = v55;
LABEL_37:
    v56 = v49;
    goto LABEL_41;
  }
  v57 = auto_unlock_log(v54);
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Failed to find key with cached devices, trying without cache", buf, 2u);
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v59, "logBluetoothIDCache");

  v56 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager decryptMessage:authTag:nonce:bluetoothID:cachedDevices:errorCode:](self, "decryptMessage:authTag:nonce:bluetoothID:cachedDevices:errorCode:", v13, v14, v15, v16, 0, a8));
LABEL_41:
  v60 = v56;

  return v60;
}

- (void)addDeviceIDMissingSessionKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v5)
    v6 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  v8 = objc_msgSend(v7, "containsObject:", v12);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    objc_msgSend(v9, "addObject:", v12);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("AutoUnlockDevicesMissingSessionKey"));

    objc_msgSend(v4, "synchronize");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v11, "refreshAutoUnlockDeviceCache");

  }
}

- (void)removeDeviceIDMissingSessionKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v5)
    v6 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  objc_msgSend(v7, "removeObject:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("AutoUnlockDevicesMissingSessionKey"));

  objc_msgSend(v10, "synchronize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v9, "refreshAutoUnlockDeviceCache");

}

- (void)clearAllDeviceIDsMissingSessionKeys
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v3)
    v4 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("AutoUnlockDevicesMissingSessionKey"));

  objc_msgSend(v8, "synchronize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v7, "refreshAutoUnlockDeviceCache");

}

- (id)deviceIDsMissingSessionKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayForKey:", CFSTR("AutoUnlockDevicesMissingSessionKey")));
    v6 = objc_msgSend(v5, "mutableCopy");
    -[SDAutoUnlockAKSManager setWatchIDsMissingSessionKey:](self, "setWatchIDsMissingSessionKey:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    if (!v7)
    {
      v8 = objc_opt_new(NSMutableArray);
      -[SDAutoUnlockAKSManager setWatchIDsMissingSessionKey:](self, "setWatchIDsMissingSessionKey:", v8);

    }
  }
  return -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
}

- (BOOL)loadLocalLTK
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v44;
  int v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;

  if (SFDeviceClassCodeGet(self, a2) == 7 || SFDeviceIsRealityDevice())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

  }
  else
  {
    v4 = 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));

  if (v5)
  {
    v7 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      v9 = "Local LTK Exists";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v45, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (!v4)
  {
    v42 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      v9 = "Waiting for first unlock to load local LTK";
      goto LABEL_31;
    }
LABEL_32:
    v41 = 0;
    goto LABEL_33;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

  if (!v10)
  {
    v44 = auto_unlock_log(v11);
    v8 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1001130A0(self, v8);
    goto LABEL_32;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v12, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ltk](v8, "ltk"));
  -[SDAutoUnlockAKSManager setLocalLTK:](self, "setLocalLTK:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v15, 0));

    if (v16)
    {
      v18 = auto_unlock_log(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v45) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adding existing LTK to new syncing view", (uint8_t *)&v45, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "computerName"));
      -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v16, v20, v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ltk"));
      -[SDAutoUnlockAKSManager setLocalLTK:](self, "setLocalLTK:", v23);

      v24 = v16;
      v8 = v24;
    }

  }
  v25 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  if (v25)
  {
    v26 = (void *)v25;
    v27 = -[NSObject version](v8, "version");

    if (v27 <= 1)
    {
      v29 = auto_unlock_log(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v45) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating version for local LTK", (uint8_t *)&v45, 2u);
      }

      -[NSObject setVersion:](v8, "setVersion:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "computerName"));
      -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v8, v31, v33);

    }
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));

  if (!v34)
    v35 = -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:](self, "generateLocalLTKWithAttestation:", 0);
  v36 = auto_unlock_log(v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    if (v38)
      v39 = CFSTR("YES");
    else
      v39 = CFSTR("NO");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    v45 = 138412547;
    v46 = v39;
    v47 = 2113;
    v48 = v40;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Loaded local LTK: (%@), %{private}@", (uint8_t *)&v45, 0x16u);

  }
  v41 = 1;
LABEL_33:

  return v41;
}

- (BOOL)loadLocalAttestedLTKIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v37[5];
  __CFString *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  void *v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));

  if (v3)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local attested LTK Exists", buf, 2u);
    }
LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

  if (!v7)
  {
    v20 = auto_unlock_log(v8);
    v6 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100113120(self, v6);
    goto LABEL_31;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:attested:](self, "ltkInfoForDeviceID:modern:attested:", v9, 1, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ltk](v6, "ltk"));
  -[SDAutoUnlockAKSManager setLocalAttestedLTK:](self, "setLocalAttestedLTK:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  v12 = v11 != 0;
  v14 = auto_unlock_log(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
      if (v17)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
      *(_DWORD *)buf = 138412547;
      v45 = v18;
      v46 = 2113;
      v47 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loaded local attested LTK: (%@), %{private}@", buf, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1001131A0(self, v16);

    if (SFDeviceClassCodeGet(v21, v22) != 5)
      goto LABEL_31;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "idsDevicesIDs"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allObjects"));

    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
LABEL_19:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v16);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v31 = objc_msgSend(v30, "deviceTypeForDeviceID:", v29);

        if (v31 == (id)2)
        {
          -[SDAutoUnlockAKSManager loadRemoteLTKsIfNeeded](self, "loadRemoteLTKsIfNeeded");
          if (-[SDAutoUnlockAKSManager deviceEnabledAsKeyForIDSDeviceID:](self, "deviceEnabledAsKeyForIDSDeviceID:", v29))
          {
            break;
          }
        }
        if (v26 == (id)++v28)
        {
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v26)
            goto LABEL_19;
          goto LABEL_11;
        }
      }
      v32 = v29;

      if (!v32)
        goto LABEL_31;
      v34 = auto_unlock_log(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v32;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found Enabled iPhone for MacUnlockPhone: %@", buf, 0xCu);
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100108C68;
      v37[3] = &unk_100717BE0;
      v37[4] = self;
      v38 = v32;
      v16 = v32;
      -[SDAutoUnlockAKSManager generateLocalAttestedLTKIfNeccessaryWithCompletion:](self, "generateLocalAttestedLTKIfNeccessaryWithCompletion:", v37);

    }
  }
LABEL_11:

LABEL_32:
  return v12;
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3
{
  -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:](self, "generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:", a3, 0);
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3 forceDCRTRetrievalWithCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  uint64_t IsRealityDevice;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  BOOL v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  const __CFString *v43;

  v6 = a4;
  v9 = sharing_persistent_log(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Generating local LTK", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = objc_msgSend(v11, "runningAsSetupUser");
  v14 = (int)v12;
  if ((v12 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
    v15 = v16 != 0;

  }
  IsRealityDevice = SFDeviceClassCodeGet(v12, v13);
  if ((_DWORD)IsRealityDevice == 7 || (IsRealityDevice = SFDeviceIsRealityDevice(), (_DWORD)IsRealityDevice))
  {
    if (!v15)
      goto LABEL_11;
    if ((objc_msgSend(v11, "deviceKeyBagUnlocked") & 1) == 0)
    {
      IsRealityDevice = (uint64_t)objc_msgSend(v11, "deviceKeyBagDisabled");
      if ((IsRealityDevice & 1) == 0)
        goto LABEL_11;
    }
LABEL_18:
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001090A4;
    v32[3] = &unk_1007158A8;
    v32[4] = self;
    v35 = a3;
    v33 = v11;
    v26 = v6;
    v34 = v26;
    v27 = objc_retainBlock(v32);
    v28 = v27;
    if (v26)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100109374;
      v29[3] = &unk_100717C08;
      v29[4] = self;
      v30 = v27;
      v31 = v26;
      sub_10001E478(v29);

    }
    else
    {
      ((void (*)(_QWORD *))v27[2])(v27);
    }

    goto LABEL_22;
  }
  if (v15)
    goto LABEL_18;
LABEL_11:
  v18 = auto_unlock_log(IsRealityDevice);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
    v21 = objc_msgSend(v11, "deviceKeyBagState");
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v39 = v20;
    if (v14)
      v22 = CFSTR("YES");
    v40 = 1024;
    v41 = v21;
    v42 = 2112;
    v43 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to generate LTK (local device ID: %@, keybag state: %d, setup user: %@)", buf, 0x1Cu);

  }
  if (v6)
  {
    v23 = SFAutoUnlockErrorDomain;
    v36 = NSLocalizedDescriptionKey;
    v37 = CFSTR("Unable to generate LTK");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 149, v24));

    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);
  }
LABEL_22:

}

- (BOOL)isMobileActivationErrorNetworkError:(id)a3
{
  return 0;
}

- (void)checkLocalLTK
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  _BOOL4 v31;
  const char *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  _BOOL4 v56;
  _BYTE v57[12];
  __int16 v58;
  const __CFString *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceKeyBagUnlocked");

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v8, 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v10, 1));

      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ltk"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ltk"));
      v14 = auto_unlock_log(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Checking Local LTKs", v57, 2u);
      }

      if (!(v12 | v13))
      {
        v26 = auto_unlock_log(v16);
        v20 = objc_claimAutoreleasedReturnValue(v26);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

LABEL_19:
          -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:](self, "generateLocalLTKWithAttestation:", 0, *(_QWORD *)v57);
LABEL_20:
          v24 = 0;
LABEL_21:

          goto LABEL_22;
        }
        *(_WORD *)v57 = 0;
        v27 = "Both LTKs missing, generating new LTK";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v27, v57, 2u);
        goto LABEL_18;
      }
      if (v12 && !v13)
      {
        v17 = sub_10001D5F4((void *)v12, -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0), -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine"));
        v18 = v17;
        v19 = auto_unlock_log(v17);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v21)
          {
            *(_WORD *)v57 = 0;
            v22 = "Modern LTK is missing: Storing legacy LTK";
LABEL_44:
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, v57, 2u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
        if (!v21)
          goto LABEL_18;
        *(_WORD *)v57 = 0;
        v27 = "Modern LTK is missing: Legacy LTK is invalid, regenerating";
        goto LABEL_17;
      }
      if (v12 || !v13)
      {
        v34 = objc_msgSend((id)v12, "isEqualToData:", v13);
        v35 = -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0);
        v36 = -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine");
        if (v34)
        {
          v37 = sub_10001D5F4((void *)v13, v35, v36);
          v38 = v37;
          v39 = auto_unlock_log(v37);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = CFSTR("NO");
            if (v38)
              v41 = CFSTR("YES");
            *(_DWORD *)v57 = 138412290;
            *(_QWORD *)&v57[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "LTKs match (valid: %@)", v57, 0xCu);
          }

          if ((v38 & 1) != 0)
            goto LABEL_20;
          goto LABEL_19;
        }
        v42 = sub_10001D5F4((void *)v12, v35, v36);
        if ((_DWORD)v42)
        {
          v43 = auto_unlock_log(v42);
          v20 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            v22 = "LTK Mismatch: Legacy LTK is valid, overwriting modern LTK";
            goto LABEL_44;
          }
LABEL_45:
          v33 = v9;
          goto LABEL_46;
        }
        v53 = sub_10001D5F4((void *)v13, -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0), -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine"));
        v54 = v53;
        v55 = auto_unlock_log(v53);
        v20 = objc_claimAutoreleasedReturnValue(v55);
        v56 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (!v54)
        {
          if (!v56)
            goto LABEL_18;
          *(_WORD *)v57 = 0;
          v27 = "LTK Mismatch: Modern LTK is invalid, regenerating";
          goto LABEL_17;
        }
        if (v56)
        {
          *(_WORD *)v57 = 0;
          v32 = "LTK Mismatch: Modern LTK is valid, overwriting legacy LTK";
          goto LABEL_28;
        }
      }
      else
      {
        v28 = sub_10001D5F4((void *)v13, -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0), -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine"));
        v29 = v28;
        v30 = auto_unlock_log(v28);
        v20 = objc_claimAutoreleasedReturnValue(v30);
        v31 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (!v29)
        {
          if (!v31)
            goto LABEL_18;
          *(_WORD *)v57 = 0;
          v27 = "Legacy LTK is missing: Modern LTK is invalid, regenerating";
          goto LABEL_17;
        }
        if (v31)
        {
          *(_WORD *)v57 = 0;
          v32 = "Legacy LTK is missing: Storing modern LTK";
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v32, v57, 2u);
        }
      }
      v33 = v11;
LABEL_46:

      v24 = v33;
      if (v24)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "computerName"));
        v47 = -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v24, v44, v46);

        if (v47)
        {
          v49 = auto_unlock_log(v48);
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
            *(_DWORD *)v57 = 138412546;
            *(_QWORD *)&v57[4] = v51;
            v58 = 2112;
            v59 = CFSTR("YES");
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Saved Local LTK after validation check (device ID: %@, saved: %@)", v57, 0x16u);

          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ltk](v24, "ltk"));
          -[SDAutoUnlockAKSManager setLocalLTK:](self, "setLocalLTK:", v52);

        }
      }
      goto LABEL_21;
    }
    v25 = auto_unlock_log(v7);
    v24 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100113220();
  }
  else
  {
    v23 = auto_unlock_log(v5);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Device locked, not checking local LTK", v57, 2u);
    }
  }
LABEL_22:

}

- (void)checkLocalAttestedLTK
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceKeyBagUnlocked");

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:attested:](self, "ltkInfoForDeviceID:modern:attested:", v8, 0, 1));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ltk](v9, "ltk"));
      if (v10)
      {
        v11 = sub_10001D5F4(v10, -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 1), -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine"));
        if ((v11 & 1) != 0)
        {
LABEL_15:

          goto LABEL_16;
        }
        v12 = auto_unlock_log(v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "LTK Mismatch: Attested LTK is invalid, deleting", buf, 2u);
        }

        -[SDAutoUnlockAKSManager setLocalAttestedLTK:](self, "setLocalAttestedLTK:", 0);
        -[SDAutoUnlockAKSManager deleteLocalAttestedLTK](self, "deleteLocalAttestedLTK");
        -[SDAutoUnlockAKSManager disablePairingForAllKeyDevices](self, "disablePairingForAllKeyDevices");
        -[SDAutoUnlockAKSManager clearRemoteLTKs](self, "clearRemoteLTKs");
        v14 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        -[NSObject postNotificationName:object:](v14, "postNotificationName:object:", CFSTR("SDAutoUnlockAKSManagerUnexpectedDisablementNotification"), 0);
      }
      else
      {
        v17 = auto_unlock_log(0);
        v14 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local attested LTK missing", v20, 2u);
        }
      }

      goto LABEL_15;
    }
    v16 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100113220();
  }
  else
  {
    v15 = auto_unlock_log(v5);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device locked, not checking local LTK", v18, 2u);
    }
  }
LABEL_16:

}

- (id)ltkHashForLocalLTK
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    v5 = sub_10019B308(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)updateLocalLTKForSignout
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sharing_persistent_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating local ltk for sign out", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:](self, "ltkInfoForDeviceID:", v5));

  objc_msgSend(v6, "setSignout:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "computerName"));
  -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v6, v7, v9);

}

- (int64_t)ltkKeyClassWithAttestation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int64_t v9;
  int v10;
  uint64_t IsRealityDevice;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  const char *v15;
  uint8_t *v16;
  __int16 v18;
  uint8_t v19[2];
  __int16 v20;
  uint8_t v21[16];
  uint8_t buf[2];

  v3 = a3;
  v4 = SFDeviceClassCodeGet(self, a2);
  if ((_DWORD)v4 == 7)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v9 = 1;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v7 = "Using key class A for watch";
    v8 = buf;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_5;
  }
  v10 = v4;
  IsRealityDevice = SFDeviceIsRealityDevice();
  if (!(_DWORD)IsRealityDevice)
  {
    v13 = auto_unlock_log(IsRealityDevice);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v10 == 5)
    {
      if (v3)
      {
        if (!v14)
          goto LABEL_5;
        v20 = 0;
        v7 = "Using key class A for mac";
        v8 = (uint8_t *)&v20;
        goto LABEL_4;
      }
      if (v14)
      {
        *(_WORD *)v19 = 0;
        v15 = "Using key class C for mac";
        v9 = 2;
        v16 = v19;
        goto LABEL_18;
      }
    }
    else if (v14)
    {
      v18 = 0;
      v15 = "Using key class C";
      v9 = 2;
      v16 = (uint8_t *)&v18;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_20;
    }
    v9 = 2;
    goto LABEL_20;
  }
  v12 = auto_unlock_log(IsRealityDevice);
  v6 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using key class D", v21, 2u);
  }
  v9 = 3;
LABEL_20:

  return v9;
}

- (int64_t)keyClassForDeviceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  int64_t v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceForUniqueID:", v3));

  v8 = SFDeviceClassCodeGet(v6, v7);
  if (v5)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v11 = (int64_t)objc_msgSend(v10, "deviceTypeForDevice:", v5);

    switch(v11)
    {
      case 2:
        break;
      case 3:
      case 5:
        v11 = 3;
        break;
      case 4:
        if (v9 == 1)
          v11 = 1;
        else
          v11 = 2;
        break;
      default:
        v11 = 1;
        break;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)deviceIsLocalDevice:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (int)ltkSyncStatusForDeviceID:(id)a3 hash:(id)a4 modern:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  int v17;
  char v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", a3));
  v10 = v9;
  if (v5)
    v11 = CFSTR("Modern LTK Data");
  else
    v11 = CFSTR("LTK Data");
  if (v5)
    v12 = CFSTR("Modern LTK Hash");
  else
    v12 = CFSTR("LTK Hash");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));
  v15 = objc_msgSend(v8, "isEqualToData:", v14);

  if (v13 && (v15 & 1) != 0)
  {
    v17 = 3;
  }
  else if (v8 && v13 && v14)
  {
    v17 = 2;
  }
  else
  {
    v18 = v15 ^ 1;
    if (v8)
      v19 = v14 == 0;
    else
      v19 = 1;
    v20 = !v19 || v13 == 0;
    v17 = !v20;
    if (!v20)
      v18 = 1;
    if ((v18 & 1) == 0)
    {
      v21 = auto_unlock_log(v16);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        sub_10011324C();

      v17 = 0;
    }
  }

  return v17;
}

- (void)generateLocalAttestedLTKIfNeccessaryWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("forcelocalAttestedLTKRegeneration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7 || (v6 & 1) != 0)
  {
    if (v11)
    {
      v13 = CFSTR("NO");
      if (v6)
        v13 = CFSTR("YES");
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Generating cached local attested LTK (forcedRegeneration: %@)", (uint8_t *)&v14, 0xCu);
    }

    -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:](self, "generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:", 1, v4);
  }
  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning cached local attested LTK", (uint8_t *)&v14, 2u);
    }

    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
    v4[2](v4, v12, 0);

    v4 = (void (**)(id, uint64_t, _QWORD))v12;
  }

}

- (void)updateLTKsForDeviceID:(id)a3 staleRemoteLTK:(BOOL)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3, a4));
  v6 = objc_msgSend(v5, "deviceSupportsRanging");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v8 = objc_msgSend(v7, "deviceWasUnlockedOnce");

    if (v8)
    {
      -[SDAutoUnlockAKSManager loadRemoteLTKsIfNeeded](self, "loadRemoteLTKsIfNeeded");
    }
    else
    {
      v10 = auto_unlock_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not updating remote LTKs because device not first unlocked", v12, 2u);
      }

    }
  }
}

- (void)updateRemoteLTKs
{
  -[SDAutoUnlockAKSManager updateLTKsForDeviceID:staleRemoteLTK:](self, "updateLTKsForDeviceID:staleRemoteLTK:", 0, 0);
}

- (void)checkRemoteLTKForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:](self, "remoteLTKHashForDeviceID:modern:", v4, 0));
  v8 = sub_10019B308(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9 && (v11 = objc_msgSend(v9, "isEqualToData:", v7), (v11 & 1) == 0))
  {
    v15 = auto_unlock_log(v11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remote LTK needs resigning for pairing for hash", v17, 2u);
    }

    -[SDAutoUnlockAKSManager signLTK:modernLTK:forDeviceID:](self, "signLTK:modernLTK:forDeviceID:", v5, v6, v4);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:](self, "remoteLTKHashForDeviceID:modern:", v4, 1));

    v13 = sub_10019B308(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      if ((objc_msgSend(v14, "isEqualToData:", v12) & 1) == 0)
        -[SDAutoUnlockAKSManager signLTK:modernLTK:forDeviceID:](self, "signLTK:modernLTK:forDeviceID:", v5, v6, v4);
      v7 = (void *)v12;
      v10 = v14;
    }
    else
    {
      v10 = 0;
      v7 = (void *)v12;
    }
  }

}

- (void)checkPhoneRemoteLTKs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDevicesIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v12 = objc_msgSend(v11, "deviceTypeForDeviceID:", v10);

        if (v12 == (id)2
          && -[SDAutoUnlockAKSManager deviceEnabledAsKeyForIDSDeviceID:](self, "deviceEnabledAsKeyForIDSDeviceID:", v10))
        {
          -[SDAutoUnlockAKSManager removeCorruptedRemoteLTKIfNecessaryForDeviceID:](self, "removeCorruptedRemoteLTKIfNecessaryForDeviceID:", v10);
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)resignRemoteLTKForDeviceID:(id)a3
{
  -[SDAutoUnlockAKSManager signLTKsForDeviceID:](self, "signLTKsForDeviceID:", a3);
}

- (BOOL)signLTKsForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1));
  LOBYTE(self) = -[SDAutoUnlockAKSManager signLTK:modernLTK:forDeviceID:](self, "signLTK:modernLTK:forDeviceID:", v5, v6, v4);

  return (char)self;
}

- (BOOL)signLTK:(id)a3 modernLTK:(id)a4 forDeviceID:(id)a5
{
  return -[SDAutoUnlockAKSManager signLTK:ltkModDate:modernLTK:modernLTKModDate:deviceID:](self, "signLTK:ltkModDate:modernLTK:modernLTKModDate:deviceID:", a3, 0, a4, 0, a5);
}

- (BOOL)signLTK:(id)a3 ltkModDate:(id)a4 modernLTK:(id)a5 modernLTKModDate:(id)a6 deviceID:(id)a7
{
  unint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  __CFString *v16;
  void *v17;
  int64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  _BOOL4 v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  NSObject *v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;

  v12 = (unint64_t)a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = (__CFString *)a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  v18 = -[SDAutoUnlockAKSManager keyClassForDeviceID:](self, "keyClassForDeviceID:", v16);
  if ((v18 | 2) != 2)
  {
    v20 = v18;
    v21 = auto_unlock_log(v18);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v42 = v16;
      if (!v12)
        v23 = CFSTR("NO");
      v43 = 2112;
      v44 = v23;
      v45 = 1024;
      LODWORD(v46) = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Signing remote LTK (device: %@ LTK: %@, class: %d)", buf, 0x1Cu);
    }

    if (!(v12 | v14) || !v17)
    {
      v29 = auto_unlock_log(v24);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v37 = CFSTR("NO");
        *(_DWORD *)buf = 138413059;
        if (v12)
          v38 = CFSTR("YES");
        else
          v38 = CFSTR("NO");
        v42 = v38;
        v43 = 2113;
        v44 = (const __CFString *)v12;
        if (v17)
          v37 = CFSTR("YES");
        v45 = 2112;
        v46 = v37;
        v47 = 2113;
        v48 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)", buf, 0x2Au);
      }
      v19 = 0;
      goto LABEL_26;
    }
    if (v12)
    {
      v25 = sub_10001E1FC((void *)v12, v20, v17, 2);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (v26)
      {
        v40 = v26;
        v27 = sub_10019B308((void *)v12);
        v26 = objc_claimAutoreleasedReturnValue(v27);
        v28 = v26 != 0;
        goto LABEL_17;
      }
      v40 = 0;
    }
    else
    {
      v40 = 0;
      v26 = 0;
    }
    v28 = 0;
LABEL_17:
    v39 = (void *)v26;
    if (v14)
    {
      v31 = sub_10001E1FC((void *)v14, v20, v17, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (v32)
      {
        v33 = sub_10019B308((void *)v14);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        if (v34)
          goto LABEL_22;
      }
      if (v28)
      {
LABEL_21:
        v34 = 0;
LABEL_22:
        v35 = v39;
        -[SDAutoUnlockAKSManager addRemoteLTK:ltkHash:ltkModDate:modernLTK:modernLTKHash:modernLTKModeDate:deviceID:](self, "addRemoteLTK:ltkHash:ltkModDate:modernLTK:modernLTKHash:modernLTKModeDate:deviceID:", v40, v39, v13, v32, v34, v15, v16);

        v19 = 1;
LABEL_25:

        v30 = v40;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      v32 = 0;
      if (v28)
        goto LABEL_21;
    }
    v19 = 0;
    v35 = v39;
    goto LABEL_25;
  }
  v19 = 0;
LABEL_27:

  return v19;
}

- (id)allKeychainDevices
{
  return -[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 0);
}

- (id)keychainDevices:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CFTypeRef result;
  _BYTE v20[128];

  v3 = a3;
  result = 0;
  v5 = objc_opt_new(NSMutableSet);
  if (v3)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseModernSyncedDictionary](self, "baseModernSyncedDictionary"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseSyncedDictionary](self, "baseSyncedDictionary"));
  v7 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", kSecAttrSynchronizableAny, kSecAttrSynchronizable);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
  if (!SecItemCopyMatching((CFDictionaryRef)v7, &result))
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (id)result;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", kSecAttrService, (_QWORD)v15));
          if (!-[SDAutoUnlockAKSManager deviceIsLocalDevice:](self, "deviceIsLocalDevice:", v13))
            -[NSMutableSet addObject:](v5, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (id)modificationDataForDeviceID:(id)a3 modern:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  CFTypeRef result;
  uint8_t buf[4];
  int v18;

  v6 = a3;
  result = 0;
  if (a4)
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v6));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v6));
  v8 = (void *)v7;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v7);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  v10 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if ((_DWORD)v10 == -25300)
  {
    v13 = 0;
  }
  else
  {
    v11 = v10;
    if ((_DWORD)v10)
    {
      v14 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }
      v13 = 0;
    }
    else
    {
      v12 = result;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKeyedSubscript:", kSecAttrModificationDate));
    }

  }
  return v13;
}

- (id)modernSignedDevices
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  _QWORD v8[4];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010AF2C;
  v8[3] = &unk_100717C30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  return v6;
}

- (id)signedDevices
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  _QWORD v8[4];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010B048;
  v8[3] = &unk_100717C30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  return v6;
}

- (void)signAndStoreRemoteLTK:(id)a3 forDeviceID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  _BYTE v31[22];
  __int16 v32;
  _BYTE v33[10];
  void *v34;
  const __CFString *v35;
  NSObject *v36;

  v6 = a3;
  v7 = a4;
  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v31[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asked to store remote LTK for %@", v31, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  v11 = -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 1);
  v12 = -[SDAutoUnlockAKSManager keyClassForDeviceID:](self, "keyClassForDeviceID:", v7);
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("YES");
      *(_DWORD *)v31 = 138413058;
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[4] = v7;
      if (!v6)
        v16 = CFSTR("NO");
      *(_QWORD *)&v31[14] = v16;
      v32 = 1024;
      *(_DWORD *)v33 = v12;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Signing remote LTK (device: %@ LTK: %@, class: %d) with localLTK (class: %d)", v31, 0x22u);
    }

    if (v6 && v10)
    {
      v18 = sub_10001E1FC(v6, v12, v10, v11);
      v15 = objc_claimAutoreleasedReturnValue(v18);
      if (v15)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
        v20 = objc_msgSend(v19, "mutableCopy");

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v7));
        if (v21)
        {
          v23 = auto_unlock_log(v22);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", v31, 2u);
          }

        }
        v35 = CFSTR("Attested LTK Data");
        v36 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1, *(_OWORD *)v31));
        -[NSObject setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v25, v7);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, CFSTR("Remote LTKs"));

        -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
        -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v7);
      }
      else
      {
        v30 = auto_unlock_log(0);
        v20 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1001132E4();
      }

    }
    else
    {
      v27 = auto_unlock_log(v17);
      v15 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v28 = CFSTR("NO");
        *(_DWORD *)v31 = 138413059;
        if (v6)
          v29 = CFSTR("YES");
        else
          v29 = CFSTR("NO");
        *(_QWORD *)&v31[4] = v29;
        *(_WORD *)&v31[12] = 2113;
        *(_QWORD *)&v31[14] = v6;
        if (v10)
          v28 = CFSTR("YES");
        v32 = 2112;
        *(_QWORD *)v33 = v28;
        *(_WORD *)&v33[8] = 2113;
        v34 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)", v31, 0x2Au);
      }
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_100113284();
  }

}

- (id)allRemoteLTKData
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  _QWORD v8[4];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010B4E4;
  v8[3] = &unk_100717C30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = -[NSMutableArray copy](v5, "copy");

  return v6;
}

- (id)remoteLTKForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

    if (!v6)
    {
      -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hashMatchesAnyRemoteLTKForDeviceID:(id)a3 ltkHash:(id)a4 isPreferred:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  BOOL *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (!v11)
  {
    -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));

    if (!v11)
    {
      v22 = 0;
      v20 = 0;
      if (!a5)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v28 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LTK Data")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Modern LTK Data")));
  v16 = objc_msgSend(v14, "isEqualToData:", v15);
  v17 = objc_msgSend(v11, "isEqualToData:", v15);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:](self, "remoteLTKHashForDeviceID:modern:", v8, 0));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:](self, "remoteLTKHashForDeviceID:modern:", v8, 1));
  if (objc_msgSend(v9, "isEqualToData:", v18))
  {
    v20 = v16 | v17 ^ 1;
LABEL_7:
    v22 = 1;
    goto LABEL_16;
  }
  v21 = objc_msgSend(v9, "isEqualToData:", v19);
  if ((_DWORD)v21)
  {
    v20 = v16 | v17;
    goto LABEL_7;
  }
  v23 = auto_unlock_log(v21);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("nil");
    *(_DWORD *)buf = 138413058;
    if (v18)
      v26 = v18;
    else
      v26 = CFSTR("nil");
    v30 = v8;
    v31 = 2112;
    if (v19)
      v25 = v19;
    v32 = v9;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "LTK hashes do not match {\n\tdevice ID: %@, \n\trequestLTKHash: %@, \n\tlegacyRemoteLTKHash: %@, \n\tmodernRemoteLTKHash: %@\n}", buf, 0x2Au);
  }

  v22 = 0;
  v20 = 0;
LABEL_16:

  a5 = v28;
  if (v28)
LABEL_17:
    *a5 = v20;
LABEL_18:

  return v22;
}

- (id)remoteLTKHashForDeviceID:(id)a3 modern:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", a3));
  v6 = v5;
  if (v4)
    v7 = CFSTR("Modern LTK Hash");
  else
    v7 = CFSTR("LTK Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  return v8;
}

- (id)remoteLTKEntryForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)remoteLTKList
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Remote LTKs"))),
        v6,
        v5,
        v4,
        !v6))
  {
    v7 = auto_unlock_log(v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100113310(self, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Remote LTKs")));

  return v10;
}

- (void)updatePreferredRemoteLTKForDeviceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  int v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", v4));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LTK Data")));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Modern LTK Data")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Attested LTK Data")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v10 = v9;
    v11 = v8;
LABEL_3:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v4);
LABEL_4:

    goto LABEL_5;
  }
  if (!(v6 | v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    objc_msgSend(v10, "removeObjectForKey:", v4);
    goto LABEL_4;
  }
  if (v6 && !v7)
    goto LABEL_14;
  if (!v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v10 = v9;
    v11 = (void *)v7;
    goto LABEL_3;
  }
  v12 = objc_msgSend((id)v6, "isEqualToData:", v7);
  if ((_DWORD)v12)
  {
LABEL_14:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v10 = v9;
    v11 = (void *)v6;
    goto LABEL_3;
  }
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "LTK's are mismatched between keychain views (device ID: %@)", (uint8_t *)&v23, 0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LTK Mod Date")));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Modern LTK Mod Date")));
  v17 = (void *)v16;
  if ((!v6 || !v15 || v16)
    && (v7 && v16 && !v15
     || v15
     && v16
     && (!v6 || (objc_msgSend(v15, "timeIntervalSinceDate:", v16), v21 < 0.0))
     && v7
     && (objc_msgSend(v17, "timeIntervalSinceDate:", v15), v22 >= 0.0)))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v19 = v18;
    v20 = v7;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    v19 = v18;
    v20 = v6;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v4);

LABEL_5:
}

- (void)fetchLTKsFromCompanion:(BOOL)a3
{
  -[SDAutoUnlockAKSManager fetchLTKsFromCompanionForDeviceID:needsLTK:remoteNeedsLTK:checkViewState:](self, "fetchLTKsFromCompanionForDeviceID:needsLTK:remoteNeedsLTK:checkViewState:", 0, 0, 0, 0);
}

- (void)sendLTKResponseWithPayload:(id)a3 viewState:(id)a4 needsUnlock:(id)a5 currentlySyncing:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SDAutoUnlockLTKResponse *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  SDAutoUnlockLTKResponse *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_opt_new(SDAutoUnlockLTKResponse);
  v14 = -[SDAutoUnlockLTKResponse setVersion:](v13, "setVersion:", 2);
  if (v9)
    v14 = -[SDAutoUnlockLTKResponse setLtkData:](v13, "setLtkData:", v9);
  if (v10)
    v14 = -[SDAutoUnlockLTKResponse setViewState:](v13, "setViewState:", objc_msgSend(v10, "BOOLValue"));
  if (v11)
    v14 = -[SDAutoUnlockLTKResponse setNeedsUnlock:](v13, "setNeedsUnlock:", objc_msgSend(v11, "BOOLValue"));
  if (v12)
    v14 = -[SDAutoUnlockLTKResponse setCurrentlySyncing:](v13, "setCurrentlySyncing:", objc_msgSend(v12, "BOOLValue"));
  v15 = auto_unlock_log(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending LTK Response %@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKResponse data](v13, "data"));
  v19 = IDSDefaultPairedDevice;
  v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("A70C5EAF-F24F-48A7-B834-F5297000C7A2"));
  objc_msgSend(v17, "sendPayload:toDevice:type:sessionID:queueOneID:timeout:errorHandler:", v18, v19, 202, v20, CFSTR("com.apple.sharing.auto-unlock.watch-ltk-response"), 0, &stru_100717C50);

}

- (void)handleLTKRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  SDAutoUnlockLTKRequest *v7;
  _BOOL8 v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  _QWORD *v17;
  _BOOL8 v18;
  _BOOL8 v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  _BOOL8 v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  SDAutoUnlockLTKInfo *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  _QWORD v54[4];
  __CFString *v55;
  SDAutoUnlockAKSManager *v56;
  uint8_t buf[4];
  const __CFString *v58;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "deviceWasUnlockedOnce");

  v7 = -[SDAutoUnlockLTKRequest initWithData:]([SDAutoUnlockLTKRequest alloc], "initWithData:", v4);
  if (v6)
  {
    v8 = -[SDAutoUnlockLTKRequest hasLocalID](v7, "hasLocalID");
    if (v8)
    {
      v8 = -[SDAutoUnlockLTKRequest hasLtk](v7, "hasLtk");
      if (v8)
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltksForRequest:](self, "ltksForRequest:", v7));
        v10 = auto_unlock_log(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString allKeys](v9, "allKeys"));
          *(_DWORD *)buf = 138412290;
          v58 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending LTKs for devices to Watch: %@", buf, 0xCu);

        }
        v14 = auto_unlock_log(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v58 = v9;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending LTKs to Watch: %{private}@", buf, 0xCu);
        }

        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10010C49C;
        v54[3] = &unk_100717C78;
        v16 = v9;
        v55 = v16;
        v56 = self;
        v17 = objc_retainBlock(v54);
        v18 = -[SDAutoUnlockLTKRequest hasCheckViewState](v7, "hasCheckViewState");
        if (v18 && (v18 = -[SDAutoUnlockLTKRequest checkViewState](v7, "checkViewState")))
        {
          v19 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
          v20 = v19;
          v21 = auto_unlock_log(v19);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "View syncing", buf, 2u);
            }

            ((void (*)(_QWORD *, void *, void *, void *))v17[2])(v17, &__kCFBooleanTrue, &__kCFBooleanFalse, &__kCFBooleanTrue);
          }
          else
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Posting follow up", buf, 2u);
            }

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[CDPFollowUpContext contextForStateRepair](CDPFollowUpContext, "contextForStateRepair"));
            objc_msgSend(v47, "setShouldNotify:", 1);
            objc_msgSend(v47, "setForce:", 1);
            v48 = objc_alloc_init((Class)CDPFollowUpController);
            v53 = 0;
            objc_msgSend(v48, "postFollowUpWithContext:error:", v47, &v53);
            v49 = v53;
            v50 = v49;
            if (v49)
            {
              v51 = auto_unlock_log(v49);
              v52 = objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                sub_100113438();

            }
            ((void (*)(_QWORD *, void *, void *, void *))v17[2])(v17, &__kCFBooleanFalse, &__kCFBooleanFalse, &__kCFBooleanFalse);

          }
        }
        else
        {
          v30 = auto_unlock_log(v18);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "View sync state not requested", buf, 2u);
          }

          ((void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))v17[2])(v17, 0, 0, 0);
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "activeDevice"));

        v34 = objc_opt_new(SDAutoUnlockLTKInfo);
        -[SDAutoUnlockLTKInfo setVersion:](v34, "setVersion:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKRequest ltk](v7, "ltk"));
        -[SDAutoUnlockLTKInfo setLtk:](v34, "setLtk:", v35);

        if (-[SDAutoUnlockLTKRequest hasLtkID](v7, "hasLtkID"))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKRequest ltkID](v7, "ltkID"));
          -[SDAutoUnlockLTKInfo setLtkID:](v34, "setLtkID:", v36);

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKRequest localID](v7, "localID"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
        v39 = -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v34, v37, v38);

        v41 = auto_unlock_log(v40);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = CFSTR("NO");
          if (v39)
            v43 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v58 = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Stored Watch LTK %@", buf, 0xCu);
        }

        if (v39)
        {
          -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
        }
        else
        {
          v45 = auto_unlock_log(v44);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            sub_10011340C();

        }
        goto LABEL_24;
      }
    }
    v27 = auto_unlock_log(v8);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100113498(v7, v28);
LABEL_23:

    goto LABEL_24;
  }
  v24 = -[SDAutoUnlockLTKRequest hasCheckViewState](v7, "hasCheckViewState");
  if (!v24 || !(v24 = -[SDAutoUnlockLTKRequest checkViewState](v7, "checkViewState")))
  {
    v29 = auto_unlock_log(v24);
    v28 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Companion not first unlocked, not sending LTKs", buf, 2u);
    }
    goto LABEL_23;
  }
  v25 = auto_unlock_log(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Companion not first unlocked, responding with state", buf, 2u);
  }

  -[SDAutoUnlockAKSManager sendLTKResponseWithPayload:viewState:needsUnlock:currentlySyncing:](self, "sendLTKResponseWithPayload:viewState:needsUnlock:currentlySyncing:", 0, 0, &__kCFBooleanTrue, 0);
LABEL_24:

}

- (id)ltksForRequest:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  NSMutableDictionary *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSMutableDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  NSMutableDictionary *v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10010C764;
  v26[3] = &unk_100717CA0;
  v26[4] = self;
  v6 = v4;
  v27 = v6;
  v7 = v5;
  v28 = v7;
  v8 = objc_retainBlock(v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteDeviceID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteDeviceID"));
    ((void (*)(_QWORD *, void *))v8[2])(v8, v10);
  }
  else
  {
    v21 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allKeychainDevices](self, "allKeychainDevices"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localID"));
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) == 0)
            ((void (*)(_QWORD *, void *))v8[2])(v8, v16);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v13);
    }

    v7 = v21;
  }

  v19 = -[NSMutableDictionary copy](v7, "copy");
  return v19;
}

- (void)takeMobileKeybagAssertion
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id keybagAssertion;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v7, 2u);
  }

  if (!self->_keybagAssertion)
  {
    v8[0] = CFSTR("MKBAssertionKey");
    v8[1] = CFSTR("MKBAssertionTimeout");
    v9[0] = CFSTR("RemoteProfile");
    v9[1] = &off_10074B850;
    v5 = (void *)MKBDeviceLockAssertion(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2, 0), &v7);
    keybagAssertion = self->_keybagAssertion;
    self->_keybagAssertion = v5;

    -[SDAutoUnlockAKSManager restartKeybagAssertionTimer](self, "restartKeybagAssertionTimer");
  }
}

- (void)releaseKeybagAssertion
{
  uint64_t v3;
  NSObject *v4;
  id keybagAssertion;
  uint8_t v6[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v6, 2u);
  }

  keybagAssertion = self->_keybagAssertion;
  self->_keybagAssertion = 0;

}

- (void)restartKeybagAssertionTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting keybag assertion timer", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
  if (!v5)
  {
    v8 = SFMainQueue(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010CC20;
    v15[3] = &unk_1007146D8;
    v15[4] = self;
    v10 = sub_10019AAD8(0, v9, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SDAutoUnlockAKSManager setKeybagAssertionTimer:](self, "setKeybagAssertionTimer:", v11);

    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
    dispatch_resume(v12);

  }
  v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
  v14 = sub_10019AAC0(55.0);
  sub_10019AB78(v13, v14);

}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v7 != 308)
  {
    if (v7 == 202)
    {
      -[SDAutoUnlockAKSManager handleLTKResponse:](self, "handleLTKResponse:", v11);
    }
    else if (v7 == 201)
    {
      -[SDAutoUnlockAKSManager handleLTKRequest:](self, "handleLTKRequest:", v11);
    }
    else
    {
      v14 = auto_unlock_log(v12);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1001135C0();

    }
  }

}

- (BOOL)localDeviceEnabledAsKey
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

  if (v4)
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyDevice](self, "deviceEnabledAsKeyForAnyDevice");
  else
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyIDSDevice](self, "deviceEnabledAsKeyForAnyIDSDevice");
}

- (BOOL)localDeviceEnabledAsKeyForMac
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

  if (v4)
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyMac](self, "deviceEnabledAsKeyForAnyMac");
  else
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyIDSMac](self, "deviceEnabledAsKeyForAnyIDSMac");
}

- (BOOL)deviceEnabledAsKeyForIDSDeviceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v6 = objc_msgSend(v5, "deviceTypeForDeviceID:", v4);

  v7 = -[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v4);
  if (v7)
  {
    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1001135EC();
LABEL_8:

    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  if (v6 != (id)2)
  {
    LOBYTE(v9) = 0;
    goto LABEL_10;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));

  if (v9)
  {
    v11 = auto_unlock_log(v10);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10011364C();
    goto LABEL_8;
  }
LABEL_10:

  return (char)v9;
}

- (BOOL)deviceEnabledAsKeyForAnyIDSDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDevicesIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0
          && -[SDAutoUnlockAKSManager deviceEnabledAsKeyForIDSDeviceID:](self, "deviceEnabledAsKeyForIDSDeviceID:", v10))
        {
          v13 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)deviceEnabledAsKeyForAnyIDSMac
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDevicesIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
          if (-[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
            v14 = objc_msgSend(v13, "deviceTypeForDeviceID:", v10);

            if (v14 == (id)4)
            {
              v17 = auto_unlock_log(v15);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                sub_1001135EC();

              v16 = 1;
              goto LABEL_15;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)deviceEnabledAsKeyForAnyDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicesWithLTKs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
          v14 = objc_msgSend(v13, "deviceTypeForDeviceID:", v10);

          v15 = -[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10);
          if (v15)
          {
            v19 = auto_unlock_log(v15);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              sub_1001135EC();
            goto LABEL_17;
          }
          if (v14 == (id)2)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v10));

            if (v16)
            {
              v21 = auto_unlock_log(v17);
              v20 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                sub_10011364C();
LABEL_17:

              v18 = 1;
              goto LABEL_18;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_18:

  return v18;
}

- (BOOL)deviceEnabledAsKeyForAnyMac
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicesWithLTKs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
          if (-[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
            v14 = objc_msgSend(v13, "deviceTypeForDeviceID:", v10);

            if (v14 == (id)4)
            {
              v17 = auto_unlock_log(v15);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                sub_1001135EC();

              v16 = 1;
              goto LABEL_15;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)deviceEnabledAsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  uint8_t buf[16];
  uint8_t v50[4];
  id v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDForWatchID:](self, "companionIDForWatchID:", v4));
  v7 = v6 != 0;

  v8 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  v10 = (void *)v9;
  if (v5)
  {
    v11 = auto_unlock_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_100113738(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v21 = objc_msgSend(v20, "deviceTypeForDeviceID:", v4);

  v24 = SFDeviceClassCodeGet(v22, v23);
  v25 = v24;
  if (v24 == 8 || v24 == 1)
  {
    v26 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));

    v7 = 1;
    v8 = 1;
    v10 = (void *)v26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));
  v28 = v27;
  if (v25 == 5 && v21 == (id)7)
  {
    if (!v27)
      goto LABEL_21;
LABEL_15:
    *(_DWORD *)v50 = 0;
    v29 = sub_10001EC34(v10, v27, 0, 1, 0, 0, 0, 1, v50);
    v30 = v29;
    if (*(_DWORD *)v50 == -536363002 || *(_DWORD *)v50 == -536870194)
    {
      if (v25 == 5)
      {
        v31 = auto_unlock_log(v29);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Attempting to fix remote LTK for check", buf, 2u);
        }

        -[SDAutoUnlockAKSManager resignRemoteLTKForDeviceID:](self, "resignRemoteLTKForDeviceID:", v4);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));

        v29 = sub_10001EC34(v10, v33, 0, 1, 0, 0, 0, 1, 0);
        v30 = v29;
        v28 = v33;
      }
      else
      {
        v37 = auto_unlock_log(v29);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Local and remote LTKs don't match", buf, 2u);
        }

      }
    }
    if (v30 < 0)
      goto LABEL_39;
    v36 = 1;
    goto LABEL_31;
  }
  if (!v27)
  {
LABEL_21:
    v34 = auto_unlock_log(v27);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      sub_1001136D8();

    v28 = 0;
    goto LABEL_39;
  }
  if (v25 == 7 && v21 == (id)5)
    goto LABEL_15;
  v29 = sub_10001D8AC(v27);
  if (!v29)
  {
LABEL_39:
    v43 = auto_unlock_log(v29);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_100113678();

    v40 = 0;
    goto LABEL_42;
  }
  v36 = 0;
  v30 = -1;
LABEL_31:
  if (v5)
    v39 = v7;
  else
    v39 = 0;
  v40 = v39 & v8;
  if ((v39 & v8 & 1) == 0)
  {
    v41 = auto_unlock_log(v29);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v46 = CFSTR("NO");
      if (v5)
        v47 = CFSTR("YES");
      else
        v47 = CFSTR("NO");
      *(_DWORD *)v50 = 138413058;
      v51 = v4;
      if (v7)
        v48 = CFSTR("YES");
      else
        v48 = CFSTR("NO");
      v53 = v47;
      v52 = 2112;
      v54 = 2112;
      if (v8)
        v46 = CFSTR("YES");
      v55 = v48;
      v56 = 2112;
      v57 = v46;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Device not enabled but can create session (device: %@, ranging key exists: %@, companion ID exists: %@, view syncing: %@)", v50, 0x2Au);
    }

  }
  if (v36)
    sub_10001F728(v30);
LABEL_42:

  return v40;
}

- (void)deleteEscrowSecretForAllDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicesWithLTKs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "autoUnlockDeviceForDeviceID:", v10));

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keyPairingIDForDeviceID:](self, "keyPairingIDForDeviceID:", v10));
          -[SDAutoUnlockAKSManager deleteEscrowSecretForDeviceID:](self, "deleteEscrowSecretForDeviceID:", v10);
          -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v10);
          if (objc_msgSend(v14, "type") == (id)2 || v15 != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
            objc_msgSend(v17, "sendDisableMessageToDeviceID:pairingID:", v10, v15);

          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  -[SDAutoUnlockAKSManager deleteAllEscrowSecrets](self, "deleteAllEscrowSecrets");
  -[SDAutoUnlockAKSManager deleteAllRangingKeys](self, "deleteAllRangingKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v18, "clearAllKeysWithTokens");

  -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
}

- (void)deleteEscrowSecretForPhones
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicesWithLTKs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412290;
    v20 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", v20));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autoUnlockDeviceForDeviceID:", v11));

        if (objc_msgSend(v13, "type") == (id)2)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
          v15 = objc_msgSend(v11, "isEqualToString:", v14);

          if ((v15 & 1) == 0)
          {
            v17 = auto_unlock_log(v16);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              v26 = v13;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Disabling feature for device: %@", buf, 0xCu);
            }

            -[SDAutoUnlockAKSManager deleteEscrowSecretForDeviceID:](self, "deleteEscrowSecretForDeviceID:", v11);
            -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
            objc_msgSend(v19, "sendDisableMessageToDeviceID:pairingID:", v11, 0);

          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

}

- (void)disablePairingForAllKeyDevices
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allPairedWatchDeviceIDs](self, "allPairedWatchDeviceIDs"));
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all keys %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager pairingIDForWatchID:](self, "pairingIDForWatchID:", v11, (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
        objc_msgSend(v13, "sendDisableMessageToDeviceID:pairingID:", v11, v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        v15 = objc_msgSend(v11, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
          -[SDAutoUnlockAKSManager disablePairingWithKeyDevice:](self, "disablePairingWithKeyDevice:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[SDAutoUnlockAKSManager deleteAllRangingKeys](self, "deleteAllRangingKeys");
}

- (void)disablePairingForAllLockPhones
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicesWithLTKs"));

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all phones", buf, 2u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport", (_QWORD)v20));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceForUniqueID:", v13));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v17 = objc_msgSend(v16, "deviceTypeForDevice:", v15);

        if (v17 == (id)2)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
          v19 = objc_msgSend(v13, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
          {
            -[SDAutoUnlockAKSManager disablePairingWithKeyDevice:](self, "disablePairingWithKeyDevice:", v13);
            -[SDAutoUnlockAKSManager removeRemoteLTKForDeviceID:](self, "removeRemoteLTKForDeviceID:", v13);
          }
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

}

- (void)removeAllRemoteLTKsOnSignOut
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all remote LTKs on sign out", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 1));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[SDAutoUnlockAKSManager deleteRemoteLongTermKeyForDeviceID:modern:tombstone:](self, "deleteRemoteLongTermKeyForDeviceID:modern:tombstone:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11), 0, 0);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SDAutoUnlockAKSManager deleteRemoteLongTermKeyForDeviceID:modern:tombstone:](self, "deleteRemoteLongTermKeyForDeviceID:modern:tombstone:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), 1, 0, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v14);
  }

  -[SDAutoUnlockAKSManager clearRemoteLTKs](self, "clearRemoteLTKs");
}

- (BOOL)ltkExistsForKeyDevice:(id)a3
{
  return -[SDAutoUnlockAKSManager ltkExistsForKeyDevice:updateLTKs:](self, "ltkExistsForKeyDevice:updateLTKs:", a3, 0);
}

- (BOOL)ltkExistsForKeyDevice:(id)a3 updateLTKs:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));

  if (v7)
    LOBYTE(v8) = 1;
  else
    LOBYTE(v8) = v4;
  if (v4 && !v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager anyLongTermKeyForDeviceID:](self, "anyLongTermKeyForDeviceID:", v6));

    if (v8)
    {
      v10 = auto_unlock_log(v9);
      v8 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating remote LTK for %@", (uint8_t *)&v13, 0xCu);
      }

      -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));
      LOBYTE(v8) = v11 != 0;

    }
  }

  return (char)v8;
}

- (BOOL)disablePairingWithKeyDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    v7 = sub_10001F1B0(v6, v5);

  }
  else
  {
    v7 = 0;
  }
  v8 = auto_unlock_log(-[SDAutoUnlockAKSManager removePairingRecordForWatchID:](self, "removePairingRecordForWatchID:", v4));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing remote LTK for %@", (uint8_t *)&v11, 0xCu);
  }

  -[SDAutoUnlockAKSManager removeRemoteLTKForDeviceID:](self, "removeRemoteLTKForDeviceID:", v4);
  -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v4);
  -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");

  return v7;
}

- (void)addRemoteLTK:(id)a3 ltkHash:(id)a4 ltkModDate:(id)a5 modernLTK:(id)a6 modernLTKHash:(id)a7 modernLTKModeDate:(id)a8 deviceID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  uint8_t buf[16];

  v30 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v22 = objc_msgSend(v21, "mutableCopy");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v20));
  if (v23)
  {
    v25 = auto_unlock_log(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", buf, 2u);
    }

  }
  v27 = objc_opt_new(NSMutableDictionary);
  v28 = v27;
  if (v30)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v30, CFSTR("LTK Data"));
  if (v15)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v15, CFSTR("LTK Hash"));
  if (v16)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v16, CFSTR("LTK Mod Date"));
  if (v17)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v17, CFSTR("Modern LTK Data"));
  if (v18)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v18, CFSTR("Modern LTK Hash"));
  if (v19)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v19, CFSTR("Modern LTK Mod Date"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v22, CFSTR("Remote LTKs"));

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v20);

}

- (void)removeRemoteLTKForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "removeObjectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("Remote LTKs"));

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  objc_msgSend(v7, "removeObjectForKey:", v4);

}

- (void)clearRemoteLTKs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableDictionary);
  -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v3);

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Remote LTKs"));

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  objc_msgSend(v6, "removeAllObjects");

}

- (void)saveRemoteLTKs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](self, "remoteLTKStorageFilePath"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
    v17 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v17));
    v6 = v17;

    if (v5)
    {
      if (SFDeviceIsRealityDevice())
        v8 = 268435457;
      else
        v8 = 1;
      v16 = v6;
      v9 = objc_msgSend(v5, "writeToFile:options:error:", v3, v8, &v16);
      v10 = v16;

      v12 = auto_unlock_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v9)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          sub_100113808(self, v14);
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        sub_100113888();
      }
    }
    else
    {
      v15 = auto_unlock_log(v7);
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1001137A8();
      v10 = v6;
    }

  }
}

- (void)loadRemoteLTKsIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));

  if (!v3)
    -[SDAutoUnlockAKSManager loadRemoteLTKs](self, "loadRemoteLTKs");
}

- (void)loadRemoteLTKs
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](self, "remoteLTKStorageFilePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0);

  if ((v5 & 1) == 0)
  {
    v7 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating Remote LTK file", buf, 2u);
    }

    v9 = objc_opt_new(NSMutableDictionary);
    -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v9);

    v10 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("Remote LTKs"));

    -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  }
  if (v3)
  {
    v35 = 0;
    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v3, 0, &v35);
    v13 = v35;
    v14 = v13;
    if (v12)
    {
      v34 = 0;
      v15 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 0, 0, &v34));
      v16 = v34;

      if (v15)
      {
        v18 = -[NSObject mutableCopy](v15, "mutableCopy");
        -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
        objc_msgSend(v19, "removeAllObjects");

        v21 = auto_unlock_log(v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
          v25 = SFCompactStringFromCollection(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(_DWORD *)buf = 138412290;
          v37 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Loaded remote LTKs: %@", buf, 0xCu);

        }
        v28 = auto_unlock_log(v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
          *(_DWORD *)buf = 138477827;
          v37 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Remote LTK Data: %{private}@", buf, 0xCu);

        }
      }
      else
      {
        v33 = auto_unlock_log(v17);
        v29 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_100113948();
      }

    }
    else
    {
      if (objc_msgSend(v13, "code") == (id)-1100)
        goto LABEL_22;
      if (objc_msgSend(v14, "code") == (id)260)
        goto LABEL_22;
      v31 = objc_msgSend(v14, "code");
      if (v31 == (id)4)
        goto LABEL_22;
      v32 = auto_unlock_log(v31);
      v15 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1001138E8();
      v16 = v14;
    }

    v14 = v16;
LABEL_22:

  }
}

- (NSString)remoteLTKStorageFilePath
{
  NSString *remoteLTKStorageFilePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  if (!remoteLTKStorageFilePath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ltk.plist")));
    v6 = self->_remoteLTKStorageFilePath;
    self->_remoteLTKStorageFilePath = v5;

    remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  }
  return remoteLTKStorageFilePath;
}

- (void)reloadPairingRecordsIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));

  if (!v3)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reloading pairing records", v7, 2u);
    }

    -[SDAutoUnlockAKSManager loadWatchIDsToPairingRecords](self, "loadWatchIDsToPairingRecords");
  }
}

- (id)allPairedWatchDeviceIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return v3;
}

- (void)setCompanionID:(id)a3 forWatchID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v11 = objc_opt_new(NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, CFSTR("Companion ID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (id)companionIDForWatchID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Companion ID")));
  return v7;
}

- (void)removeCompanionIDForWatchID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v10));
    v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = objc_opt_new(NSMutableDictionary);
  }

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("Companion ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)setPairingID:(id)a3 forWatchID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v11 = objc_opt_new(NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, CFSTR("Pairing ID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (id)pairingIDForWatchID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Pairing ID")));
  return v7;
}

- (void)removePairingIDForWatchID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v10));
    v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = objc_opt_new(NSMutableDictionary);
  }

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("Pairing ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)removePairingRecordForWatchID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)saveWatchIDsToPairingRecords
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecordsStorageFilePath](self, "watchIDsToPairingRecordsStorageFilePath"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    v16 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v16));
    v6 = v16;

    if (v5)
    {
      v15 = v6;
      v8 = objc_msgSend(v5, "writeToFile:options:error:", v3, 1, &v15);
      v9 = v15;

      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v8)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          sub_100113A08(self, v13);
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_100113A88();
      }
    }
    else
    {
      v14 = auto_unlock_log(v7);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1001139A8();
      v9 = v6;
    }

  }
}

- (void)loadWatchIDsToPairingRecords
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isKindOfClass;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  int v30;
  uint64_t v31;
  NSMutableDictionary *watchIDsToPairingRecords;
  _BOOL4 v33;
  NSMutableDictionary *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecordsStorageFilePath](self, "watchIDsToPairingRecordsStorageFilePath"));
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100113D2C();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v3, 0);

  if ((v7 & 1) == 0)
  {
    v9 = auto_unlock_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_100113D00();

    v11 = objc_opt_new(NSMutableDictionary);
    -[SDAutoUnlockAKSManager setWatchIDsToPairingRecords:](self, "setWatchIDsToPairingRecords:", v11);

    -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
  }
  if (v3)
  {
    v38 = 0;
    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v3, 0, &v38);
    v13 = v38;
    v14 = v13;
    if (v12)
    {
      v37 = 0;
      v15 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 0, 0, &v37));
      v16 = v37;

      if (v15)
      {
        v19 = objc_opt_class(NSDictionary, v18);
        isKindOfClass = objc_opt_isKindOfClass(v15, v19);
        if ((isKindOfClass & 1) != 0)
        {
          v21 = -[NSObject mutableCopy](v15, "mutableCopy");
          -[SDAutoUnlockAKSManager setWatchIDsToPairingRecords:](self, "setWatchIDsToPairingRecords:", v21);

          v23 = auto_unlock_log(v22);
          v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(&v24->super.super, OS_LOG_TYPE_DEBUG))
            sub_100113C00(self, &v24->super.super);
        }
        else
        {
          v35 = auto_unlock_log(isKindOfClass);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_100113C80((uint64_t)v15, v36);

          v24 = objc_opt_new(NSMutableDictionary);
          -[SDAutoUnlockAKSManager setWatchIDsToPairingRecords:](self, "setWatchIDsToPairingRecords:", v24);
        }
      }
      else
      {
        v27 = auto_unlock_log(v17);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_100113BA0();

        v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v29 = -[NSMutableDictionary BOOLForKey:](v24, "BOOLForKey:", CFSTR("AutoUnlockErrorLoadingPairingRecords"));
        v30 = (int)v29;
        v31 = auto_unlock_log(v29);
        watchIDsToPairingRecords = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v31);
        v33 = os_log_type_enabled(&watchIDsToPairingRecords->super.super, OS_LOG_TYPE_ERROR);
        if (v30)
        {
          if (v33)
            sub_100113B48();

          v34 = objc_opt_new(NSMutableDictionary);
          watchIDsToPairingRecords = self->_watchIDsToPairingRecords;
          self->_watchIDsToPairingRecords = v34;
        }
        else if (v33)
        {
          sub_100113B74();
        }

        -[NSMutableDictionary setBool:forKey:](v24, "setBool:forKey:", v30 ^ 1u, CFSTR("AutoUnlockErrorLoadingPairingRecords"));
      }

    }
    else
    {
      if (objc_msgSend(v13, "code") == (id)-1100)
        goto LABEL_34;
      if (objc_msgSend(v14, "code") == (id)260)
        goto LABEL_34;
      v25 = objc_msgSend(v14, "code");
      if (v25 == (id)4)
        goto LABEL_34;
      v26 = auto_unlock_log(v25);
      v15 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100113AE8();
      v16 = v14;
    }

    v14 = v16;
LABEL_34:

    goto LABEL_35;
  }
  v14 = 0;
LABEL_35:
  -[SDAutoUnlockAKSManager migrateLegacyWatchIDToCompanionIDs](self, "migrateLegacyWatchIDToCompanionIDs");

}

- (NSString)watchIDsToPairingRecordsStorageFilePath
{
  NSString *watchIDsToPairingRecordsStorageFilePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  if (!watchIDsToPairingRecordsStorageFilePath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("pairing-records.plist")));
    v6 = self->_watchIDsToPairingRecordsStorageFilePath;
    self->_watchIDsToPairingRecordsStorageFilePath = v5;

    watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  }
  return watchIDsToPairingRecordsStorageFilePath;
}

- (void)migrateLegacyWatchIDToCompanionIDs
{
  id v3;
  _QWORD v4[5];

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager loadLegacyWatchIDToCompanionIDMapping](self, "loadLegacyWatchIDToCompanionIDMapping"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010FA8C;
  v4[3] = &unk_100717CC8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
  -[SDAutoUnlockAKSManager deleteLegacyWatchToCompanionIDs](self, "deleteLegacyWatchToCompanionIDs");

}

- (void)deleteLegacyWatchToCompanionIDs
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDToCompanionIDStorageFilePath](self, "watchIDToCompanionIDStorageFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v9);
  v5 = v9;

  if ((v4 & 1) == 0 && objc_msgSend(v5, "code") != (id)-1100 && objc_msgSend(v5, "code") != (id)260)
  {
    v6 = objc_msgSend(v5, "code");
    if (v6 != (id)4)
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100113D8C();

    }
  }

}

- (id)loadLegacyWatchIDToCompanionIDMapping
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  id v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDToCompanionIDStorageFilePath](self, "watchIDToCompanionIDStorageFilePath"));
  if (v3)
  {
    v19 = 0;
    v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v3, 0, &v19);
    v5 = v19;
    v6 = v5;
    if (v4)
    {
      v18 = 0;
      v7 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v18));
      v8 = v18;

      if (v7)
      {
        v10 = -[NSObject mutableCopy](v7, "mutableCopy");
        v11 = auto_unlock_log(v10);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          sub_100113EAC();
      }
      else
      {
        v14 = auto_unlock_log(v9);
        v12 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100113E4C();
        v10 = 0;
      }

    }
    else
    {
      if (objc_msgSend(v5, "code") == (id)-1100
        || objc_msgSend(v6, "code") == (id)260
        || (v13 = objc_msgSend(v6, "code"), v13 == (id)4))
      {
        v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v17 = auto_unlock_log(v13);
      v7 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100113DEC();
      v10 = 0;
      v8 = v6;
    }

    v6 = v8;
    goto LABEL_16;
  }
  v6 = 0;
  v10 = 0;
LABEL_17:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager migrateLegacyCompanionIDs:](self, "migrateLegacyCompanionIDs:", v10));

  return v15;
}

- (NSString)watchIDToCompanionIDStorageFilePath
{
  NSString *watchIDToCompanionIDStorageFilePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  if (!watchIDToCompanionIDStorageFilePath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("watch-companion-mapping.plist")));
    v6 = self->_watchIDToCompanionIDStorageFilePath;
    self->_watchIDToCompanionIDStorageFilePath = v5;

    watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  }
  return watchIDToCompanionIDStorageFilePath;
}

- (id)migrateLegacyCompanionIDs:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  _QWORD v9[4];
  NSMutableDictionary *v10;

  if (a3)
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  else
    v4 = objc_opt_new(NSMutableDictionary);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager loadCompanionIDs](self, "loadCompanionIDs"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010FECC;
  v9[3] = &unk_100717CC8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[SDAutoUnlockAKSManager deleteLegacyCompanionIDs](self, "deleteLegacyCompanionIDs");

  return v7;
}

- (void)deleteLegacyCompanionIDs
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDStorageFilePath](self, "companionIDStorageFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v9);
  v5 = v9;

  if ((v4 & 1) == 0 && objc_msgSend(v5, "code") != (id)-1100 && objc_msgSend(v5, "code") != (id)260)
  {
    v6 = objc_msgSend(v5, "code");
    if (v6 != (id)4)
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100113F0C();

    }
  }

}

- (id)loadCompanionIDs
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDStorageFilePath](self, "companionIDStorageFilePath"));
  if (v2)
  {
    v17 = 0;
    v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v2, 0, &v17);
    v4 = v17;
    v5 = v4;
    if (v3)
    {
      v16 = 0;
      v6 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, &v16));
      v7 = v16;

      if (v6)
      {
        v9 = -[NSObject mutableCopy](v6, "mutableCopy");
        v10 = auto_unlock_log(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded companion IDs: %@", buf, 0xCu);
        }
      }
      else
      {
        v13 = auto_unlock_log(v8);
        v11 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_100113FCC();
        v9 = 0;
      }

    }
    else
    {
      if (objc_msgSend(v4, "code") == (id)-1100
        || objc_msgSend(v5, "code") == (id)260
        || (v12 = objc_msgSend(v5, "code"), v12 == (id)4))
      {
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v15 = auto_unlock_log(v12);
      v6 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100113F6C();
      v9 = 0;
      v7 = v5;
    }

    v5 = v7;
    goto LABEL_16;
  }
  v5 = 0;
  v9 = 0;
LABEL_17:

  return v9;
}

- (NSString)companionIDStorageFilePath
{
  NSString *companionIDStorageFilePath;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  NSString *v12;
  NSObject *v13;
  uint64_t v14;
  id v16;

  companionIDStorageFilePath = self->_companionIDStorageFilePath;
  if (!companionIDStorageFilePath)
  {
    v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Sharing")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = 0;
    v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v16);
    v10 = v16;

    if (v9)
    {
      v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("companion-paired-devices.plist")));
      v13 = self->_companionIDStorageFilePath;
      self->_companionIDStorageFilePath = v12;
    }
    else
    {
      v14 = auto_unlock_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10011402C();
    }

    companionIDStorageFilePath = self->_companionIDStorageFilePath;
  }
  return companionIDStorageFilePath;
}

- (id)autoUnlockFolderPath
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v2 = sub_10019BA08();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AutoUnlock")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v12);
  v7 = v12;

  if ((v6 & 1) == 0)
  {
    v9 = auto_unlock_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10011408C();

  }
  return v4;
}

+ (BOOL)useKeychainForLTKSyncing
{
  return 0;
}

- (BOOL)storeKeychainItemWithAttributeDictionary:(id)a3 updateDictionary:(id)a4 addDictionary:(id)a5
{
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  __int16 v21;
  uint8_t buf[2];

  v7 = (const __CFDictionary *)a3;
  v8 = (const __CFDictionary *)a4;
  v9 = (const __CFDictionary *)a5;
  v10 = SecItemAdd(v9, 0);
  if (!(_DWORD)v10)
  {
    v16 = auto_unlock_log(v10);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v17 = "Added keychain item";
      v18 = (uint8_t *)&v21;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
LABEL_12:
    v15 = 1;
    goto LABEL_13;
  }
  v11 = SecItemUpdate(v7, v8);
  if (!(_DWORD)v11)
  {
    v19 = auto_unlock_log(v11);
    v14 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Updated keychain item";
      v18 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  SecItemDelete(v7);
  v12 = SecItemAdd(v9, 0);
  if (!(_DWORD)v12)
  {
    v15 = 1;
    goto LABEL_14;
  }
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1001140EC();
  v15 = 0;
LABEL_13:

LABEL_14:
  return v15;
}

- (id)escrowSecretForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  SDAutoUnlockEscrowSecretInfo *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  SDAutoUnlockEscrowSecretInfo *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", v4, &off_10074B868));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v5));

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded escrowSecret from keychain", buf, 2u);
  }

  if (v6)
  {
    v10 = -[SDAutoUnlockEscrowSecretInfo initWithData:]([SDAutoUnlockEscrowSecretInfo alloc], "initWithData:", v6);
    v11 = v10;
    if (v10
      && (v10 = (SDAutoUnlockEscrowSecretInfo *)-[SDAutoUnlockEscrowSecretInfo hasSecret](v10, "hasSecret"), (_DWORD)v10))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject secret](v11, "secret"));
      v13 = auto_unlock_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using new secret", v28, 2u);
      }
    }
    else
    {
      v15 = auto_unlock_log(v10);
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10011414C(v11, v14);
      v12 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", v4, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v16));

  v18 = auto_unlock_log(v17);
  v11 = objc_claimAutoreleasedReturnValue(v18);
  v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v19)
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating escrow secret", v27, 2u);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", v4, 0));
    v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v11);
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &off_10074B868, kSecAttrKeyType);
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", kSecAttrAccessibleWhenUnlockedThisDeviceOnly, kSecAttrAccessible);
    v20 = objc_opt_new(SDAutoUnlockEscrowSecretInfo);
    -[SDAutoUnlockEscrowSecretInfo setSecret:](v20, "setSecret:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo data](v20, "data"));
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v21, kSecValueData);

    SecItemDelete((CFDictionaryRef)v11);
    v22 = SecItemAdd((CFDictionaryRef)v14, 0);
    if ((_DWORD)v22)
    {
      v23 = auto_unlock_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1001140EC();

    }
    goto LABEL_19;
  }
  if (v19)
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No secret", v26, 2u);
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (BOOL)cachedEscrowSecretExistsForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDeviceID](self, "escrowSecretForDeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (BOOL)cachedEscrowSecretIsValidForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDeviceID](self, "escrowSecretForDeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "isValid");
  else
    v7 = 0;

  return v7;
}

- (id)keyPairingIDForDeviceID:(id)a3
{
  void *v4;
  void *v5;
  SDAutoUnlockEscrowSecretInfo *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", a3, &off_10074B868));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v4));

  if (v5)
  {
    v6 = -[SDAutoUnlockEscrowSecretInfo initWithData:]([SDAutoUnlockEscrowSecretInfo alloc], "initWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo pairingID](v6, "pairingID"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)storeEscrowSecret:(id)a3 pairingID:(id)a4 deviceID:(id)a5 requiresUnlock:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  const CFStringRef *v15;
  SDAutoUnlockEscrowSecretInfo *v16;
  void *v17;
  id v18;
  BOOL v19;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", a5, &off_10074B868));
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = v13;
  v15 = &kSecAttrAccessibleAfterFirstUnlock;
  if (v6)
    v15 = &kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", *v15, kSecAttrAccessible);
  v16 = objc_opt_new(SDAutoUnlockEscrowSecretInfo);
  -[SDAutoUnlockEscrowSecretInfo setSecret:](v16, "setSecret:", v11);

  -[SDAutoUnlockEscrowSecretInfo setPairingID:](v16, "setPairingID:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo data](v16, "data"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, kSecValueData);

  v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v12);
  objc_msgSend(v18, "addEntriesFromDictionary:", v14);
  v19 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:](self, "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:", v12, v14, v18);

  return v19;
}

- (BOOL)escrowSecretExistsForDevice:(id)a3
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", a3, 0));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnPersistentRef);
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, 0);
  v5 = v4;
  if ((_DWORD)v4 != -25308 && (_DWORD)v4 != -25300 && (_DWORD)v4)
  {
    v6 = auto_unlock_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001141EC();

  }
  if (v5)
    v8 = v5 == -25308;
  else
    v8 = 1;
  v9 = v8;

  return v9;
}

- (id)escrowSecretCreationDateForDeviceID:(id)a3
{
  void *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  CFTypeRef result;
  uint8_t buf[4];
  int v12;

  result = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", a3, 0));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if ((_DWORD)v4 == -25300)
  {
    v7 = 0;
  }
  else
  {
    v5 = v4;
    if ((_DWORD)v4)
    {
      v8 = auto_unlock_log(v4);
      v6 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }
      v7 = 0;
    }
    else
    {
      v6 = result;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKeyedSubscript:", kSecAttrCreationDate));
    }

  }
  return v7;
}

- (void)deleteEscrowSecretForDeviceID:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:](self, "baseLocalKeysDictionaryForDevice:type:", v4, 0));
  v6 = SecItemDelete(v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      v9 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10011424C();
    }
    else
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted escrow secret for device %@", (uint8_t *)&v10, 0xCu);
      }
    }

  }
}

- (void)deleteAllEscrowSecrets
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionary](self, "baseLocalKeysDictionary"));
  v3 = SecItemDelete(v2);
  if ((_DWORD)v3 != -25300)
  {
    if ((_DWORD)v3)
    {
      v6 = auto_unlock_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001142AC();
    }
    else
    {
      v4 = auto_unlock_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleted all escrow secrets", v7, 2u);
      }
    }

  }
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if (-[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:modern:](self, "storeLongTermKey:forDeviceID:name:modern:", v8, v9, v10, 0))
  {
    v11 = -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:modern:](self, "storeLongTermKey:forDeviceID:name:modern:", v8, v9, v10, 1);
  }

  return v11;
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5 modern:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  BOOL v24;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSMutableDictionary *v35;
  __int16 v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v11));
  else
    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v11));
  v14 = (void *)v13;
  v15 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", kSecAttrAccessibleAfterFirstUnlock, kSecAttrAccessible);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), CFSTR("Auto Unlock"), v12));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, kSecAttrLabel);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, kSecValueData);

  v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v14);
  v19 = objc_msgSend(v18, "addEntriesFromDictionary:", v15);
  v21 = sharing_persistent_log(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("YES");
    *(_DWORD *)buf = 138413571;
    if (!v10)
      v23 = CFSTR("NO");
    v27 = v23;
    v28 = 2113;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v14;
    v34 = 2113;
    v35 = v15;
    v36 = 2113;
    v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Store LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)", buf, 0x3Eu);
  }

  v24 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:](self, "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:", v14, v15, v18);
  return v24;
}

- (BOOL)storeAttestedLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  int IsRealityDevice;
  const CFStringRef *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  BOOL v23;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSMutableDictionary *v34;
  __int16 v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager attestedDictionaryForDevice:](self, "attestedDictionaryForDevice:", v9));
  v12 = objc_opt_new(NSMutableDictionary);
  IsRealityDevice = SFDeviceIsRealityDevice();
  v14 = &kSecAttrAccessibleAfterFirstUnlock;
  if (IsRealityDevice)
    v14 = &kSecAttrAccessibleAlways;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", *v14, kSecAttrAccessible);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), CFSTR("Auto Unlock"), v10));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, kSecAttrLabel);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, kSecValueData);

  v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v11);
  v18 = objc_msgSend(v17, "addEntriesFromDictionary:", v12);
  v20 = sharing_persistent_log(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = CFSTR("YES");
    *(_DWORD *)buf = 138413571;
    if (!v8)
      v22 = CFSTR("NO");
    v26 = v22;
    v27 = 2113;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v11;
    v33 = 2113;
    v34 = v12;
    v35 = 2113;
    v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Store attested LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)", buf, 0x3Eu);
  }

  v23 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:](self, "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:", v11, v12, v17);
  return v23;
}

- (void)deleteRemoteLongTermKeyForDeviceID:(id)a3 modern:(BOOL)a4 tombstone:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;

  v6 = a4;
  v8 = a3;
  if (v6)
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v8));
  else
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v8));
  v10 = v9;
  if (!a5)
    -[__CFDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSecUseTombstones);
  v11 = SecItemDelete(v10);
  if ((_DWORD)v11 != -25300)
  {
    v12 = v11;
    if ((_DWORD)v11)
    {
      v13 = auto_unlock_log(v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10011430C((uint64_t)v10, v12, v14);

    }
  }

}

- (id)anyLongTermKeyForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0));
  v8 = v7;

  return v8;
}

- (id)longTermKeyForDevice:(id)a3 modern:(BOOL)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ltk"));

  return v5;
}

- (id)longTermKeyIDForDeviceID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:](self, "ltkInfoForDeviceID:", a3));
  if (objc_msgSend(v3, "hasLtkID"))
  {
    v4 = objc_alloc((Class)NSUUID);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ltkID")));
    v6 = objc_msgSend(v4, "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ltkInfoForDeviceID:(id)a3
{
  return -[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", a3, 0);
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4
{
  return -[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:attested:](self, "ltkInfoForDeviceID:modern:attested:", a3, a4, 0);
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4 attested:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SDAutoUnlockLTKInfo *v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager attestedDictionaryForDevice:](self, "attestedDictionaryForDevice:", v8));
  }
  else if (v6)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v8));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v8));
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v9));
  if (v11)
    v12 = -[SDAutoUnlockLTKInfo initWithData:]([SDAutoUnlockLTKInfo alloc], "initWithData:", v11);
  else
    v12 = 0;

  return v12;
}

- (void)deleteLocalAttestedLTK
{
  void *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager attestedDictionaryForDevice:](self, "attestedDictionaryForDevice:", v3));

  v5 = SecItemDelete(v4);
  if ((_DWORD)v5 != -25300)
  {
    if ((_DWORD)v5)
    {
      v8 = auto_unlock_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10011438C();
    }
    else
    {
      v6 = auto_unlock_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleted local attested LTK", v9, 2u);
      }
    }

  }
}

- (void)updateRangingKeysIfNeccesary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CFTypeRef result;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

  if (v4)
  {
    result = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionary](self, "baseRangingDictionary"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", kSecAttrSynchronizableAny, kSecAttrSynchronizable);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
    if (!SecItemCopyMatching((CFDictionaryRef)v5, &result))
    {
      v18 = v5;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v6 = (id)result;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kSecAttrIsInvisible));

            if (!v12)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kSecAttrService));
              if (v13)
              {
                v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v13));
                v15 = (void *)v14;
                if (v14)
                {
                  v16 = auto_unlock_log(v14);
                  v17 = objc_claimAutoreleasedReturnValue(v16);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v25 = v13;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating session key (device id: %@)", buf, 0xCu);
                  }

                  -[SDAutoUnlockAKSManager storeRangingKey:forDeviceID:](self, "storeRangingKey:forDeviceID:", v15, v13);
                }

              }
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v8);
      }

      v5 = v18;
    }

  }
}

- (void)updateSessionKeys
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  os_unfair_lock_t lock;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledAutoUnlockDevicesUsingCache:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v11), "uniqueID"));
        -[NSMutableArray addObject:](v3, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v9);
  }

  v13 = v3;
  lock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));

  if (!v14)
  {
    v15 = objc_opt_new(NSMutableDictionary);
    -[SDAutoUnlockAKSManager setCachedSessionKeys:](self, "setCachedSessionKeys:", v15);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = v13;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v21));

        if (!v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v21));
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager deriveKeyFromSharedSecret:](self, "deriveKeyFromSharedSecret:", v24));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v21);

          }
        }
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v18);
  }

  v28 = auto_unlock_log(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
    *(_DWORD *)buf = 138412290;
    v42 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Cached session keys for devices %@", buf, 0xCu);

  }
  os_unfair_lock_unlock(lock);

}

- (id)deriveKeyFromSharedSecret:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _OWORD v9[2];

  if (a3)
  {
    memset(v9, 0, sizeof(v9));
    v3 = kCryptoHashDescriptor_SHA512;
    v4 = objc_retainAutorelease(a3);
    v5 = objc_msgSend(v4, "bytes");
    v6 = objc_msgSend(v4, "length");

    CryptoHKDF(v3, v5, v6, "AutoUnlockSalt", 15, "AutoUnlockInfo", 15, 32, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9, 32));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)sessionKeyExistsForDeviceID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)sessionKeyForDeviceID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachedSessionKeysLock;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v4 = a3;
  p_cachedSessionKeysLock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v4));
      if (v9)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager deriveKeyFromSharedSecret:](self, "deriveKeyFromSharedSecret:", v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v4);

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v11 = auto_unlock_log(v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1001143EC();

    v8 = 0;
  }
  os_unfair_lock_unlock(p_cachedSessionKeysLock);

  return v8;
}

- (id)rangingKeyForDeviceID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:](self, "baseRangingDictionaryForDevice:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v4));

  return v5;
}

- (BOOL)storeRangingKey:(id)a3 forDeviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  int IsRealityDevice;
  const CFStringRef *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSMutableDictionary *v23;
  __int16 v24;
  id v25;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:](self, "baseRangingDictionaryForDevice:", v6));
  v9 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, kSecValueData);

  IsRealityDevice = SFDeviceIsRealityDevice(-[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrIsInvisible));
  v11 = &kSecAttrAccessibleAfterFirstUnlock;
  if (IsRealityDevice)
    v11 = &kSecAttrAccessibleAlways;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", *v11, kSecAttrAccessible);
  v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v8);
  v13 = auto_unlock_log(objc_msgSend(v12, "addEntriesFromDictionary:", v9));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138413059;
    v19 = v6;
    v20 = 2113;
    v21 = v8;
    v22 = 2113;
    v23 = v9;
    v24 = 2113;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Storing Session Key (deviceID: %@ attributes: %{private}@, update: %{private}@, add: %{private}@)", (uint8_t *)&v18, 0x2Au);
  }

  v15 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:](self, "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:", v8, v9, v12);
  if (v15)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    objc_msgSend(v16, "removeObjectForKey:", v6);

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    -[SDAutoUnlockAKSManager removeDeviceIDMissingSessionKey:](self, "removeDeviceIDMissingSessionKey:", v6);
    -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
  }

  return v15;
}

- (void)deleteRangingKeyForDeviceID:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v4 = a3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:](self, "baseRangingDictionaryForDevice:", v4));
  v6 = SecItemDelete(v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      v10 = auto_unlock_log(v6);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100114418();

    }
    else
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting session key (device ID: %@)", (uint8_t *)&v12, 0xCu);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
      objc_msgSend(v9, "removeObjectForKey:", v4);

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      -[SDAutoUnlockAKSManager removeDeviceIDMissingSessionKey:](self, "removeDeviceIDMissingSessionKey:", v4);
      -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
    }
  }

}

- (void)deleteAllRangingKeys
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting all ranging keys", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.rangingkeys"), kSecAttrAccount);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecUseDataProtectionKeychain);
  v6 = SecItemDelete((CFDictionaryRef)v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      v10 = auto_unlock_log(v6);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100114478();

    }
    else
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted all ranging keys", v12, 2u);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
      objc_msgSend(v9, "removeAllObjects");

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      -[SDAutoUnlockAKSManager clearAllDeviceIDsMissingSessionKeys](self, "clearAllDeviceIDsMissingSessionKeys");
    }
  }

}

- (id)keychainDataForQuery:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  CFTypeRef result;
  uint8_t buf[4];
  int v13;

  result = 0;
  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v3);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  if ((_DWORD)v5 == -25300)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v6 = v5;
  if ((_DWORD)v5)
  {
    v8 = auto_unlock_log(v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Query status: %d", buf, 8u);
    }

    goto LABEL_7;
  }
  v7 = (void *)result;
LABEL_8:

  return v7;
}

- (id)baseRangingDictionaryForDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionary](self, "baseRangingDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  return v5;
}

- (id)baseRangingDictionary
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.rangingkeys"), kSecAttrAccount);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecUseDataProtectionKeychain);
  return v2;
}

- (id)syncedDictionaryForDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseSyncedDictionary](self, "baseSyncedDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrIsInvisible);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrSynchronizable);
  return v5;
}

- (id)baseSyncedDictionary
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.sync"), kSecAttrAccount);
  return v2;
}

- (id)modernSyncedDictionaryForDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseModernSyncedDictionary](self, "baseModernSyncedDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrIsInvisible);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrSynchronizable);
  return v5;
}

- (id)attestedDictionaryForDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.attested"), kSecAttrAccount);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrIsInvisible);
  return v5;
}

- (id)baseModernSyncedDictionary
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.sync"), kSecAttrAccount);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("AutoUnlock"), kSecAttrSyncViewHint);
  return v2;
}

- (id)baseLocalKeysDictionaryForDevice:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionary](self, "baseLocalKeysDictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, kSecAttrService);

  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, kSecAttrKeyType);

  return v8;
}

- (id)baseLocalKeysDictionary
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.auto-unlock.localkeys"), kSecAttrAccount);
  return v2;
}

- (id)baseDictionary
{
  NSMutableDictionary *v2;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", kSecClassGenericPassword, kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.unlock"), kSecAttrAccessGroup);
  return v2;
}

- (void)updateDynamicStoreEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeDevice"));

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIDOverride"));
    v5 = -[SDAutoUnlockAKSManager deviceEnabledAsKey:](self, "deviceEnabledAsKey:", v4);

  }
  else
  {
    v5 = 0;
  }
  sub_1000C8A18(v5);

}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)wristDetectDisabled
{
  return self->_wristDetectDisabled;
}

- (void)setWristDetectDisabled:(BOOL)a3
{
  self->_wristDetectDisabled = a3;
}

- (NSMutableDictionary)activeAKSSessions
{
  return self->_activeAKSSessions;
}

- (void)setActiveAKSSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeAKSSessions, a3);
}

- (NSData)localAttestedLTK
{
  return self->_localAttestedLTK;
}

- (void)setLocalAttestedLTK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)autoUnlockDisabledDueToManagement
{
  return self->_autoUnlockDisabledDueToManagement;
}

- (void)setAutoUnlockDisabledDueToManagement:(BOOL)a3
{
  self->_autoUnlockDisabledDueToManagement = a3;
}

- (BOOL)t208Machine
{
  return self->_t208Machine;
}

- (void)setT208Machine:(BOOL)a3
{
  self->_t208Machine = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_source)keybagAssertionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKeybagAssertionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)remoteLTKs
{
  return self->_remoteLTKs;
}

- (void)setRemoteLTKs:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLTKs, a3);
}

- (NSMutableDictionary)cachedSessions
{
  return self->_cachedSessions;
}

- (void)setCachedSessions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSessions, a3);
}

- (NSMutableDictionary)cachedSessionKeys
{
  return self->_cachedSessionKeys;
}

- (void)setCachedSessionKeys:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSessionKeys, a3);
}

- (NSMutableDictionary)watchIDsToPairingRecords
{
  return self->_watchIDsToPairingRecords;
}

- (void)setWatchIDsToPairingRecords:(id)a3
{
  objc_storeStrong((id *)&self->_watchIDsToPairingRecords, a3);
}

- (NSMutableDictionary)preferredRemoteLTKForDeviceID
{
  return self->_preferredRemoteLTKForDeviceID;
}

- (void)setPreferredRemoteLTKForDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_preferredRemoteLTKForDeviceID, a3);
}

- (NSMutableDictionary)escrowSecretForDeviceID
{
  return self->_escrowSecretForDeviceID;
}

- (void)setEscrowSecretForDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_escrowSecretForDeviceID, a3);
}

- (NSMutableArray)watchIDsMissingSessionKey
{
  return self->_watchIDsMissingSessionKey;
}

- (void)setWatchIDsMissingSessionKey:(id)a3
{
  objc_storeStrong((id *)&self->_watchIDsMissingSessionKey, a3);
}

- (void)setRemoteLTKStorageFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setWatchIDsToPairingRecordsStorageFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setKeybagAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setCompanionIDStorageFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setWatchIDToCompanionIDStorageFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (os_unfair_lock_s)cachedSessionKeysLock
{
  return self->_cachedSessionKeysLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIDToCompanionIDStorageFilePath, 0);
  objc_storeStrong((id *)&self->_companionIDStorageFilePath, 0);
  objc_storeStrong(&self->_keybagAssertion, 0);
  objc_storeStrong((id *)&self->_watchIDsToPairingRecordsStorageFilePath, 0);
  objc_storeStrong((id *)&self->_remoteLTKStorageFilePath, 0);
  objc_storeStrong((id *)&self->_watchIDsMissingSessionKey, 0);
  objc_storeStrong((id *)&self->_escrowSecretForDeviceID, 0);
  objc_storeStrong((id *)&self->_preferredRemoteLTKForDeviceID, 0);
  objc_storeStrong((id *)&self->_watchIDsToPairingRecords, 0);
  objc_storeStrong((id *)&self->_cachedSessionKeys, 0);
  objc_storeStrong((id *)&self->_cachedSessions, 0);
  objc_storeStrong((id *)&self->_remoteLTKs, 0);
  objc_storeStrong((id *)&self->_keybagAssertionTimer, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_localLTK, 0);
  objc_storeStrong((id *)&self->_localAttestedLTK, 0);
  objc_storeStrong((id *)&self->_activeAKSSessions, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_localDeviceID, 0);
}

@end
