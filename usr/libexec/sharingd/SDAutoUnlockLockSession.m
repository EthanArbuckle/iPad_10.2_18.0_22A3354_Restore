@implementation SDAutoUnlockLockSession

- (SDAutoUnlockLockSession)initWithAutoUnlockDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9;
  NSString *v10;
  id v11;
  void *v12;
  SDAutoUnlockLockSession *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *watchModelID;
  uint64_t v22;
  NSString *watchBuildVersion;
  id v24;
  uint64_t v25;
  NSString *watchOSVersion;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  void *v37;
  id obj;
  _QWORD v40[3];
  objc_super v41;
  uint8_t buf[4];
  NSString *v43;
  __int16 v44;
  NSString *v45;
  __int16 v46;
  NSString *v47;

  v9 = a3;
  v10 = (NSString *)a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));
  v41.receiver = self;
  v41.super_class = (Class)SDAutoUnlockLockSession;
  v13 = -[SDAutoUnlockAuthSession initWithDevice:sessionID:bleDevice:](&v41, "initWithDevice:sessionID:bleDevice:", v12, v10, v11);

  if (v13)
  {
    v15 = auto_unlock_log(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating lock session (session ID = %@)", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v13, "deviceID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceForUniqueID:", v18));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
    watchModelID = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productBuildVersion"));
    watchBuildVersion = v13->_watchBuildVersion;
    v13->_watchBuildVersion = (NSString *)v22;

    obj = a3;
    if (v19)
      objc_msgSend(v19, "operatingSystemVersion", a3);
    else
      memset(v40, 0, sizeof(v40));
    v24 = sub_1000C8CB4(v40);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    watchOSVersion = v13->_watchOSVersion;
    v13->_watchOSVersion = (NSString *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v13, "deviceID"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "modelIdentifierForDeviceID:", v28));
    v30 = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v29;

    v32 = auto_unlock_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v13->_watchModelID;
      v35 = v13->_watchBuildVersion;
      v36 = v13->_watchOSVersion;
      *(_DWORD *)buf = 138412802;
      v43 = v34;
      v44 = 2112;
      v45 = v35;
      v46 = 2112;
      v47 = v36;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Watch info (model ID: %@, build: %@, os version: %@)", buf, 0x20u);
    }

    -[SDAutoUnlockAuthSession setProtocol:](v13, "setProtocol:", 2);
    objc_storeStrong((id *)&v13->_autoUnlockDevice, obj);
    v13->_watchRSSI = objc_msgSend(v11, "rssi");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockLockSession setDeviceWasLocked:](v13, "setDeviceWasLocked:", objc_msgSend(v37, "deviceKeyBagUnlocked") ^ 1);

    -[SDAutoUnlockLockSession addObservers](v13, "addObservers");
  }

  return v13;
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDAutoUnlockLockSession;
  -[SDAutoUnlockAuthSession invalidate](&v10, "invalidate");
  -[SDAutoUnlockPairingSession setDelegate:](self, "setDelegate:", 0);
  v3 = auto_unlock_log(-[SDAutoUnlockLockSession removeObservers](self, "removeObservers"));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping BLE connection", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  objc_msgSend(v5, "stopUnlockBLEConnectionWithDevice:", v6);

  -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v7, "removePreventExitForLocaleReason:", CFSTR("AutoUnlockConfirmationTimerPreventExitReason"));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213744;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateNoDisconnect
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAutoUnlockLockSession;
  -[SDAutoUnlockAuthSession invalidate](&v2, "invalidate");
}

- (void)completeAttemptIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213848;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)tearDownAWDLIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002139B0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213B40;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_cancel
{
  _BOOL8 v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  if (!-[SDAutoUnlockLockSession canceled](self, "canceled"))
  {
    -[SDAutoUnlockLockSession setCanceled:](self, "setCanceled:", 1);
    v3 = -[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded");
    v4 = v3;
    v5 = auto_unlock_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v7)
      {
LABEL_11:

        return;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Lock session canceled after success (device ID: %@, session ID: %@)", buf, 0x16u);

    }
    else
    {
      if (v7)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        v22 = 2112;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Lock session canceled (device ID: %@, session ID: %@)", buf, 0x16u);

      }
      if (-[SDAutoUnlockLockSession otherSessionCancel](self, "otherSessionCancel"))
      {
        v14 = SFAutoUnlockErrorDomain;
        v18 = NSLocalizedDescriptionKey;
        v19 = CFSTR("Attempt Cancelled");
        v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 118, v6));
        -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
      }
      else
      {
        -[SDAutoUnlockLockSession lockKeyBagIfNeeded](self, "lockKeyBagIfNeeded");
        v15 = SFAutoUnlockErrorDomain;
        v16 = NSLocalizedDescriptionKey;
        v17 = CFSTR("Attempt Cancelled");
        v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 118, v6));
        -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v8);
      }
    }

    goto LABEL_11;
  }
}

- (void)cancelWiFiRequest
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling WiFi request: %@", buf, 0xCu);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100213F2C;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not Canceling WiFi request: nil", buf, 2u);
    }

  }
}

- (void)lockKeyBagIfNeeded
{
  unsigned int v3;
  id v4;

  if (!-[SDAutoUnlockLockSession lockedKeyBag](self, "lockedKeyBag")
    && !-[SDAutoUnlockLockSession otherProviderCancel](self, "otherProviderCancel"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (objc_msgSend(v4, "deviceKeyBagUnlocked")
      && -[SDAutoUnlockLockSession deviceWasLocked](self, "deviceWasLocked"))
    {
      v3 = -[SDAutoUnlockAuthSession aksSuccess](self, "aksSuccess");

      if (v3)
        sub_10001D048((uint64_t)-[SDAutoUnlockLockSession setLockedKeyBag:](self, "setLockedKeyBag:", 1));
    }
    else
    {

    }
  }
}

- (void)handleCanceledAfterSuccess
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002140A4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_handleCanceledAfterSuccess
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded");
  if (v3)
  {
    -[SDAutoUnlockLockSession setCanceled:](self, "setCanceled:", 1);
    v4 = auto_unlock_log(-[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 14));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling cancel at end", buf, 2u);
    }

    -[SDAutoUnlockLockSession lockKeyBagIfNeeded](self, "lockKeyBagIfNeeded");
  }
  else
  {
    v6 = auto_unlock_log(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not cancelled", v8, 2u);
    }

  }
}

- (void)handleDecryptionFailure:(int64_t)a3
{
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  if (!-[SDAutoUnlockLockSession canceled](self, "canceled")
    && !-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded"))
  {
    switch(a3)
    {
      case 191:
        v5 = CFSTR("Watch Missing Encryption Key");
        break;
      case 198:
        v5 = CFSTR("Watch Missing IDS Device For BT UUID");
        break;
      case 195:
        v5 = CFSTR("Watch Not First Unlocked");
        break;
      default:
        v5 = CFSTR("Decryption failure");
        break;
    }
    v6 = SFAutoUnlockErrorDomain;
    v9 = NSLocalizedDescriptionKey;
    v10 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, a3, v7));

    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
  }
}

- (void)addObservers
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceConnected:", SFBluetoothNotificationNameConnected, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "displayConfigChanged:", CFSTR("com.apple.sharingd.ExternalDisplaysChanged"), 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "clamshellStateChanged:", CFSTR("com.apple.sharingd.ClamshellStatusChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)clamshellStateChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell", a3))
  {
    v4 = auto_unlock_log(-[SDAutoUnlockLockSession setConfigChangeType:](self, "setConfigChangeType:", 1));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clamshell changed", v6, 2u);
    }

    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }
}

- (void)displayConfigChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell", a3))
  {
    v4 = auto_unlock_log(-[SDAutoUnlockLockSession setConfigChangeType:](self, "setConfigChangeType:", 2));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Display config changed", v6, 2u);
    }

    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }
}

- (void)logResults
{
  _BOOL8 v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  unsigned int v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  int64_t v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  int64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  double v104;
  _BOOL8 v105;
  uint64_t v106;
  NSObject *v107;
  double v108;
  uint64_t v109;
  NSObject *v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  unsigned int v123;
  const __CFString *v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  int64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  const __CFString *v136;
  double v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  unsigned int v141;
  const __CFString *v142;
  uint64_t v143;
  uint64_t v144;
  const __CFString *v145;
  int v146;
  double v147;

  v3 = -[SDAutoUnlockLockSession attemptTimedOut](self, "attemptTimedOut");
  v4 = v3;
  v5 = auto_unlock_log(v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      LOWORD(v146) = 0;
      v8 = "Attempt timed out for session";
      v9 = v6;
      v10 = 2;
LABEL_84:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v146, v10);
    }
  }
  else
  {
    if (v7)
    {
      v11 = -[SDAutoUnlockLockSession usingProxy](self, "usingProxy");
      *(double *)&v12 = COERCE_DOUBLE(CFSTR("YES"));
      if (!v11)
        *(double *)&v12 = COERCE_DOUBLE(CFSTR("NO"));
      v146 = 138412290;
      v147 = *(double *)&v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Automation: Used Proxy Device %@", (uint8_t *)&v146, 0xCu);
    }

    v14 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchModelID](self, "watchModelID")));
      v146 = 138412290;
      v147 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Automation: Key Device Model %@", (uint8_t *)&v146, 0xCu);

    }
    v18 = auto_unlock_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel")));
      v146 = 138412290;
      v147 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Automation: Proxy Device Model %@", (uint8_t *)&v146, 0xCu);

    }
    v22 = auto_unlock_log(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
      v146 = 134217984;
      v147 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Automation: Phone Bluetooth Discovery %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v26 = auto_unlock_log(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
      v146 = 134217984;
      v147 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Automation: Phone Connection Time %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v30 = auto_unlock_log(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
      if (v32 == 0.0)
      {
        v38 = 0.0;
      }
      else
      {
        -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
        v34 = v33;
        -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
        v36 = v34 - v35;
        -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
        v38 = v36 - v37;
      }
      v146 = 134217984;
      v147 = v38;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Automation: Watch Bluetooth Discovery %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v40 = auto_unlock_log(v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession connectionWaitTime](self, "connectionWaitTime");
      v146 = 134217984;
      v147 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Automation: Watch Connection Wait Time %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v44 = auto_unlock_log(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession connectionTime](self, "connectionTime");
      v146 = 134217984;
      v147 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Automation: Watch Connection Time %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v48 = auto_unlock_log(v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession awdlInfoExchange](self, "awdlInfoExchange");
      v146 = 134217984;
      v147 = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Info Exchange %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v52 = auto_unlock_log(v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession keyRequestExchange](self, "keyRequestExchange");
      v146 = 134217984;
      v147 = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Key Exchange %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v56 = auto_unlock_log(v55);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession tokenExchange](self, "tokenExchange");
      v146 = 134217984;
      v147 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Token Exchange %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v60 = auto_unlock_log(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession confirmation](self, "confirmation");
      v146 = 134217984;
      v147 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Unlock Confirmation %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v64 = auto_unlock_log(v63);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
      v146 = 134217984;
      v147 = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Automation: AWDL Bring Up %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v68 = auto_unlock_log(v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
      v146 = 134217984;
      v147 = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Automation: Peer Found %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v72 = auto_unlock_log(v71);
    v73 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockAuthSession rangingInterval](self, "rangingInterval");
      v146 = 134217984;
      v147 = v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Automation: Ranging Results %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v76 = auto_unlock_log(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = -[SDAutoUnlockLockSession configChangeType](self, "configChangeType");
      v79 = 0.0;
      if (v78 == 2)
        -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime", 0.0);
      v146 = 134217984;
      v147 = v79;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Automation: Time Waiting For Display %0.2f", (uint8_t *)&v146, 0xCu);
    }

    v81 = auto_unlock_log(v80);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = -[SDAutoUnlockLockSession configChangeType](self, "configChangeType");
      v84 = 0.0;
      if (v83 == 1)
        -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime", 0.0);
      v146 = 134217984;
      v147 = v84;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Automation: Time Waiting For Clamshell %0.2f", (uint8_t *)&v146, 0xCu);
    }

    v86 = auto_unlock_log(v85);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession awdlTotal](self, "awdlTotal");
      v146 = 134217984;
      v147 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Automation: Wi-Fi Total %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v90 = auto_unlock_log(v89);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btBootstrap](self, "btBootstrap");
      v146 = 134217984;
      v147 = v92;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Bootstrap Total %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v94 = auto_unlock_log(v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btBootstrap](self, "btBootstrap");
      v97 = v96;
      -[SDAutoUnlockLockSession awdlTotal](self, "awdlTotal");
      v99 = v97 + v98;
      -[SDAutoUnlockLockSession confirmation](self, "confirmation");
      v146 = 134217984;
      v147 = v99 + v100;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Automation: Bootstrap + Wi-Fi Total + Confirmation %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v102 = auto_unlock_log(v101);
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btOverall](self, "btOverall");
      v146 = 134217984;
      v147 = v104;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Overall Total %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v105 = -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed");
    if (v105)
    {
      v106 = auto_unlock_log(v105);
      v107 = objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
        v146 = 134217984;
        v147 = v108;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Automation: Idle time due to prewarming %0.2fs", (uint8_t *)&v146, 0xCu);
      }

    }
    v109 = auto_unlock_log(v105);
    v110 = objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession completeExchange](self, "completeExchange");
      v146 = 134217984;
      v147 = v111;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Automation: Complete exchange %0.2fs", (uint8_t *)&v146, 0xCu);
    }

    v113 = auto_unlock_log(v112);
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      v115 = -[SDAutoUnlockLockSession watchRSSI](self, "watchRSSI");
      v146 = 67109120;
      LODWORD(v147) = v115;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Automation: Key Device RSSI %d", (uint8_t *)&v146, 8u);
    }

    v117 = auto_unlock_log(v116);
    v118 = objc_claimAutoreleasedReturnValue(v117);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v119 = -[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI");
      v146 = 67109120;
      LODWORD(v147) = v119;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Automation: Proxy Device RSSI %d", (uint8_t *)&v146, 8u);
    }

    v121 = auto_unlock_log(v120);
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      v123 = -[SDAutoUnlockAuthSession shouldUnlock](self, "shouldUnlock");
      *(double *)&v124 = COERCE_DOUBLE(CFSTR("YES"));
      if (!v123)
        *(double *)&v124 = COERCE_DOUBLE(CFSTR("NO"));
      v146 = 138412290;
      v147 = *(double *)&v124;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Automation: Within Range %@", (uint8_t *)&v146, 0xCu);
    }

    v126 = auto_unlock_log(v125);
    v127 = objc_claimAutoreleasedReturnValue(v126);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      v128 = -[SDAutoUnlockLockSession connectedBluetoothDevices](self, "connectedBluetoothDevices");
      v146 = 67109120;
      LODWORD(v147) = v128;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Automation: Already Connected Bluetooth Devices %d", (uint8_t *)&v146, 8u);
    }

    v130 = auto_unlock_log(v129);
    v131 = objc_claimAutoreleasedReturnValue(v130);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v132 = COERCE_DOUBLE((id)-[SDAutoUnlockLockSession timeSinceLastMachineWake](self, "timeSinceLastMachineWake"));
      v146 = 134217984;
      v147 = *(double *)&v132;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "Automation: Time Since Last Wake %ld seconds", (uint8_t *)&v146, 0xCu);
    }

    v134 = auto_unlock_log(v133);
    v135 = objc_claimAutoreleasedReturnValue(v134);
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession lastSleepType](self, "lastSleepType");
      v136 = sub_1000C92E0();
      v137 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue(v136));
      v146 = 138412290;
      v147 = v137;
      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Automation: Last Sleep Type %@", (uint8_t *)&v146, 0xCu);

    }
    v139 = auto_unlock_log(v138);
    v140 = objc_claimAutoreleasedReturnValue(v139);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    {
      v141 = -[SDAutoUnlockLockSession canceled](self, "canceled");
      *(double *)&v142 = COERCE_DOUBLE(CFSTR("YES"));
      if (!v141)
        *(double *)&v142 = COERCE_DOUBLE(CFSTR("NO"));
      v146 = 138412290;
      v147 = *(double *)&v142;
      _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "Automation: Cancelled %@", (uint8_t *)&v146, 0xCu);
    }

    v144 = auto_unlock_log(v143);
    v6 = objc_claimAutoreleasedReturnValue(v144);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v145 = COERCE_DOUBLE(CFSTR("NO"));
      if (-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded")
        && !-[SDAutoUnlockLockSession canceled](self, "canceled"))
      {
        *(double *)&v145 = COERCE_DOUBLE(CFSTR("YES"));
      }
      v146 = 138412290;
      v147 = *(double *)&v145;
      v8 = "Automation: Successful Session %@";
      v9 = v6;
      v10 = 12;
      goto LABEL_84;
    }
  }

}

- (id)attemptResults
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, SDAutoUnlockManagerMetricDeviceIDKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchModelID](self, "watchModelID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, SDAutoUnlockManagerMetricKeyDeviceModelKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchBuildVersion](self, "watchBuildVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, SDAutoUnlockManagerMetricWatchBuildVersionKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchOSVersion](self, "watchOSVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, SDAutoUnlockManagerMetricWatchOSVersionKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, SDAutoUnlockManagerMetricProxyDeviceModelKey);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDAutoUnlockLockSession usingProxy](self, "usingProxy")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, SDAutoUnlockManagerMetricUsingProxyDeviceKey);

  -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
  if (v11 == 0.0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_10074BFB8, SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey);
  }
  else
  {
    -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
    v13 = v12;
    -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
    v15 = v13 - v14;
    -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 - v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey);

  }
  -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);

  -[SDAutoUnlockLockSession connectionTime](self, "connectionTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, SDAutoUnlockManagerMetricBluetoothKeyConnectionKey);

  -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, SDAutoUnlockManagerMetricBluetoothProxyConnectionKey);

  -[SDAutoUnlockLockSession awdlInfoExchange](self, "awdlInfoExchange");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v21, SDAutoUnlockManagerMetricBluetoothAWDLExchangeKey);

  -[SDAutoUnlockLockSession keyRequestExchange](self, "keyRequestExchange");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v22, SDAutoUnlockManagerMetricBluetoothKeyRequestExchangeKey);

  -[SDAutoUnlockLockSession tokenExchange](self, "tokenExchange");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, SDAutoUnlockManagerMetricBluetoothTokenExchangeKey);

  -[SDAutoUnlockLockSession confirmation](self, "confirmation");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v24, SDAutoUnlockManagerMetricBluetoothConfirmationKey);

  if (-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded"))
    v25 = -[SDAutoUnlockLockSession canceled](self, "canceled") ^ 1;
  else
    v25 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v26, SDAutoUnlockManagerMetricSuccessKey);

  -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, SDAutoUnlockManagerMetricAWDLBringUpKey);

  -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v28, SDAutoUnlockManagerMetricAWDLPeerFoundKey);

  -[SDAutoUnlockAuthSession rangingInterval](self, "rangingInterval");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v29, SDAutoUnlockManagerMetricAWDLRangingKey);

  if ((id)-[SDAutoUnlockLockSession configChangeType](self, "configChangeType") == (id)2)
  {
    v30 = &SDAutoUnlockManagerMetricDisplayWaitKey;
  }
  else
  {
    if ((id)-[SDAutoUnlockLockSession configChangeType](self, "configChangeType") != (id)1)
      goto LABEL_14;
    v30 = &SDAutoUnlockManagerMetricClamshellWaitKey;
  }
  -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v31, *v30);

LABEL_14:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v33, "code")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v34, SDAutoUnlockManagerMetricErrorCodeKey);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "domain"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v36, SDAutoUnlockManagerMetricErrorDomainKey);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedDescription"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v38, SDAutoUnlockManagerMetricErrorStringKey);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockAuthSession errorType](self, "errorType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v39, SDAutoUnlockManagerMetricErrorTypeKey);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SDAutoUnlockLockSession watchRSSI](self, "watchRSSI")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v40, SDAutoUnlockManagerMetricKeyDeviceRSSIKey);

  if (-[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v41, SDAutoUnlockManagerMetricProxyDeviceRSSIKey);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession distance](self, "distance"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v42, SDAutoUnlockManagerMetricDistanceKey);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDAutoUnlockAuthSession shouldUnlock](self, "shouldUnlock")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v43, SDAutoUnlockManagerMetricWithinRangeKey);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v44, SDAutoUnlockManagerMetricPrewarmKey);

  -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v45, SDAutoUnlockManagerMetricPrewarmTimeKey);

  -[SDAutoUnlockLockSession attemptTime](self, "attemptTime");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v46, SDAutoUnlockManagerMetricAttemptTimeKey);

  -[SDAutoUnlockLockSession completeExchange](self, "completeExchange");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v47, SDAutoUnlockManagerMetricTimeKey);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRangingResults](self, "wifiRangingResults"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v48, SDAutoUnlockManagerMetricWiFiResultsKey);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SDAutoUnlockLockSession connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v49, SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockLockSession timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v50, SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockLockSession lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v51, SDAutoUnlockManagerMetricLastSleepTypeKey);

  return v3;
}

- (BOOL)isAcceptor
{
  return 0;
}

- (id)hintToken
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession")),
        v4 = objc_msgSend(v3, "sessionIsValid"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "generateACMContextData"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)usingProxy
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice"));
  if ((objc_msgSend(v3, "supportsAlwaysDirect") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
    v4 = v5 != 0;

  }
  return v4;
}

- (id)getAppName
{
  return 0;
}

- (void)updateImageData:(id)a3 imageHash:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
  if (v8 == 2)
  {
    v10 = SFMainQueue(2, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100215B34;
    block[3] = &unk_100715138;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = auto_unlock_log(v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10021C298();

  }
}

- (void)setChosenDevice:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = SFMainQueue(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100215E00;
  v7[3] = &unk_100715BB0;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100215F9C;
  v6[3] = &unk_100715BB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100216038;
  v6[3] = &unk_100715BB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)connectionActivated
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint8_t v11[16];

  kdebug_trace(725286920, 0, 0, 0, 0);
  if (-[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", objc_msgSend(v3, "canCreateTokenSessionForDeviceID:", v4));

    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to create token session, using escrow", v11, 2u);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDAutoUnlockLockSession setFirstSend:](self, "setFirstSend:", v8);

  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)1
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice")),
        v10 = objc_msgSend(v9, "supportsApproveIcon"),
        v9,
        (v10 & 1) == 0))
  {
    -[SDAutoUnlockAuthSession sendAWDLInfo](self, "sendAWDLInfo");
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)35));
  }
}

- (BOOL)handleFoundBLEDevice:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = sub_1000C7FF0(v4);
  LOBYTE(self) = -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:](self, "handleFoundBLEDevice:available:lockedOnWrist:", v4, v5, sub_1000C8048(v4));

  return (char)self;
}

- (BOOL)handleFoundBLEDevice:(id)a3 available:(BOOL)a4 lockedOnWrist:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSErrorUserInfoKey v26;
  __CFString *v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;

  v5 = a5;
  v6 = a4;
  v8 = auto_unlock_log(self);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice"));
    *(_DWORD *)buf = 138412802;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found Device {\n\tavailable: %@,\n\tlocked on wrist: %@\n\tdevice:%@\n}", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));

  if (!v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAutoUnlockLockSession setDiscoveryDate:](self, "setDiscoveryDate:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession aksPeerAvailable](self, "aksPeerAvailable"));
    if (v17)
    {
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
    }
    else
    {
      if (v6)
      {
        v14 = 1;
        -[SDAutoUnlockLockSession setFoundPeer:](self, "setFoundPeer:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
        objc_msgSend(v18, "sessionDidStartConnection:", self);

LABEL_20:
        return v14;
      }
      if (v5)
      {
        v19 = SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_ON_WRIST"), v16);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
        v21 = 135;
      }
      else
      {
        v20 = CFSTR("Watch Not On Wrist");
        v21 = 158;
      }
      v22 = SFAutoUnlockErrorDomain;
      v26 = NSLocalizedDescriptionKey;
      v27 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, v21, v23));
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v24);

    }
    v14 = 0;
    goto LABEL_20;
  }
  return 1;
}

- (void)deviceConnected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  void *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFBluetoothNotificationKeyPeerDevice));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAutoUnlockLockSession setConnectionDate:](self, "setConnectionDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFBluetoothNotificationKeyConnectStart));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
    objc_msgSend(v15, "timeIntervalSinceDate:", v14);
    -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
      objc_msgSend(v17, "timeIntervalSinceDate:", v14);
      -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFBluetoothNotificationKeyConnectTime));
      objc_msgSend(v18, "doubleValue");
      v20 = v19;
      -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
      v22 = v20 - v21;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFBluetoothNotificationKeyConnectTime));
      objc_msgSend(v18, "doubleValue");
    }
    -[SDAutoUnlockLockSession setConnectionTime:](self, "setConnectionTime:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
    objc_msgSend(v14, "timeIntervalSinceDate:", v23);
    -[SDAutoUnlockLockSession setConnectionWaitTime:](self, "setConnectionWaitTime:");

    -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 9);
    v24 = auto_unlock_log(-[SDAutoUnlockLockSession setConnected:](self, "setConnected:", 1));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device connected %@", (uint8_t *)&v26, 0xCu);
    }

  }
}

- (id)aksPeerAvailable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSErrorUserInfoKey v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteLTKForDeviceID:", v4));

  v6 = sub_10001D8AC(v5);
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    v9 = auto_unlock_log(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_10001DD10(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer not available %@", buf, 0xCu);

    }
    v14 = sub_1000C6218(v8, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SFAutoUnlockErrorDomain;
    v19 = NSLocalizedDescriptionKey;
    v20 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 128, v17));

  }
  return v7;
}

- (void)invalidateTimerIfReady
{
  if (-[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo"))
  {
    if (-[SDAutoUnlockLockSession receivedExchangeRequest](self, "receivedExchangeRequest"))
      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  }
}

- (void)handleTimerFired
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDate *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[8];
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timer fired", buf, 2u);
  }

  if (-[SDAutoUnlockLockSession onlyRanging](self, "onlyRanging"))
  {
    v5 = SFAutoUnlockErrorDomain;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));
      v8 = (uint64_t)objc_msgSend(v7, "code");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));

      v11 = CFSTR("Failed to Start AWDL");
      v5 = (id)v10;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingStart](self, "rangingStart"));

      if (v20)
      {
        v11 = CFSTR("Ranging Timeout: Results Not Returned");
        v8 = 137;
      }
      else
      {
        -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 6);
        v11 = CFSTR("Ranging Timeout: Couldn’t Find Peer");
        v8 = 138;
      }
    }
    v31 = NSLocalizedDescriptionKey;
    v32 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, v8, v23));

    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v24);
  }
  else
  {
    v12 = -[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell");
    if (v12)
    {
      v13 = auto_unlock_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Timeout while waiting for a display or clamshell", buf, 2u);
      }

      v15 = SFAutoUnlockErrorDomain;
      v29 = NSLocalizedDescriptionKey;
      v30 = CFSTR("Mac Clamshelled Without Display");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 145, v16));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v17);
      -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0);
      v18 = objc_opt_new(NSDate);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession displayOrClamshellWaitingDate](self, "displayOrClamshellWaitingDate"));
      -[NSDate timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v19);
      -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");

    }
    else
    {
      if (-[SDAutoUnlockLockSession foundPeer](self, "foundPeer"))
      {
        -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 3);
        v25.receiver = self;
        v25.super_class = (Class)SDAutoUnlockLockSession;
        -[SDAutoUnlockPairingSession handleTimerFired](&v25, "handleTimerFired");
        return;
      }
      v21 = SFAutoUnlockErrorDomain;
      v27 = NSLocalizedDescriptionKey;
      v28 = CFSTR("Apple Watch Not Found");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 131, v22));

      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
    }

  }
}

- (void)restartConfirmationTimer:(unint64_t)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[8];

  v6 = a4;
  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restarting confirmation timer", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  if (!v9)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v10 = &_dispatch_main_q;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100216E2C;
    v18 = &unk_100714468;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v6;
    v11 = sub_10019AAD8(0, &_dispatch_main_q, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[SDAutoUnlockLockSession setConfirmationTimer:](self, "setConfirmationTimer:", v12, v15, v16, v17, v18);

    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
    dispatch_resume(v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  sub_10019AB78(v14, a3);

}

- (void)invalidateConfirmationTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating confirmation timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockLockSession setConfirmationTimer:](self, "setConfirmationTimer:", 0);
  }
}

- (void)handleRangingResults:(id)a3 errorCode:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100216FF0;
  block[3] = &unk_100715D08;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (BOOL)peerInRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  SDAutoUnlockLockSession *v9;
  uint64_t v10;
  uint8_t v12[16];

  v4 = a3;
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("phoneAutoUnlockSkipRanging"));
    if ((_DWORD)v6)
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping ranging due to default phoneAutoUnlockSkipRanging", v12, 2u);
      }

      LOBYTE(v8) = 1;
      v9 = self;
      v10 = 1;
      goto LABEL_9;
    }

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "distanceMeters"));
  -[SDAutoUnlockAuthSession setDistance:](self, "setDistance:", v8);

  LODWORD(v8) = objc_msgSend(v5, "shouldUnlock");
  if ((_DWORD)v8)
  {
    v10 = (uint64_t)objc_msgSend(v5, "shouldUnlock");
    v9 = self;
LABEL_9:
    -[SDAutoUnlockAuthSession setShouldUnlock:](v9, "setShouldUnlock:", v10);
  }

  return (char)v8;
}

- (void)handlePeerInRange
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  __CFString *v7;
  NSDate *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  uint8_t buf[4];
  __CFString *v19;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (!v4)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (__CFString *)sub_1000CEB84(0);
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handlePeerInRange %@", buf, 0xCu);

    }
    v8 = objc_opt_new(NSDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v9);
    -[SDAutoUnlockLockSession setAwdlTotal:](self, "setAwdlTotal:");

    -[SDAutoUnlockLockSession setOnlyRanging:](self, "setOnlyRanging:", 0);
    if (-[SDAutoUnlockAuthSession isAuthenticatingForSiri](self, "isAuthenticatingForSiri"))
    {
      v10 = SFAutoUnlockErrorDomain;
      v16 = NSLocalizedDescriptionKey;
      v17 = CFSTR("Siri SPI Succeeded");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, 218, v11));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v12);
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);
LABEL_11:

      return;
    }
    if (-[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed"))
    {
      v13 = -[SDAutoUnlockLockSession shouldWaitToCompleteUnlock](self, "shouldWaitToCompleteUnlock");
      if (v13)
      {
        v14 = auto_unlock_log(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempt was prewarmed and not told to complete, waiting for trigger to complete unlock.", buf, 2u);
        }

        -[SDAutoUnlockLockSession setWaitingToCompleteUnlock:](self, "setWaitingToCompleteUnlock:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[SDAutoUnlockLockSession setPrewarmIdleStartDate:](self, "setPrewarmIdleStartDate:", v12);
        goto LABEL_11;
      }
    }
    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }
}

- (void)handlePeerOutOfRange
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSErrorUserInfoKey v15;
  void *v16;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  if (!-[SDAutoUnlockLockSession canceled](self, "canceled"))
  {
    v4 = SFAutoUnlockErrorDomain;
    if (-[SDAutoUnlockAuthSession rangingTimedOut](self, "rangingTimedOut"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingErrorString](self, "rangingErrorString"));
      v6 = -[SDAutoUnlockAuthSession wifiRangingErrorCode](self, "wifiRangingErrorCode");
      if (v6)
      {
        v7 = -[SDAutoUnlockAuthSession wifiRangingErrorCode](self, "wifiRangingErrorCode");
        v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiErrorDomain](self, "wifiErrorDomain"));

        v4 = (id)v8;
      }
      else
      {
        v7 = 139;
      }
    }
    else
    {
      -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 8);
      v10 = SFLocalizedStringForKey(CFSTR("UNLOCK_OUT_OF_RANGE"), v9);
      v6 = objc_claimAutoreleasedReturnValue(v10);
      v5 = (void *)v6;
      v7 = 130;
    }
    v11 = auto_unlock_log(v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10021C2F0();

    v15 = NSLocalizedDescriptionKey;
    v16 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, v7, v13));

    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v14);
  }
}

- (void)handleAWDLUp
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
  if (v3 && (v13 = v3, v4 = -[SDAutoUnlockLockSession awdlUp](self, "awdlUp"), v3 = v13, (v4 & 1) == 0))
  {
    -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
    v6 = v5;

    if (v6 == 0.0)
    {
      -[SDAutoUnlockLockSession setAwdlUp:](self, "setAwdlUp:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      -[SDAutoUnlockAuthSession setAwdlInterval:](self, "setAwdlInterval:");

      v10 = auto_unlock_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
        *(_DWORD *)buf = 134217984;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AWDL up (%.2f)", buf, 0xCu);
      }

    }
  }
  else
  {

  }
}

- (void)handlePeerFound:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  NSDate *v8;

  if (a3)
  {
    -[SDAutoUnlockLockSession setPeerFoundInterval:](self, "setPeerFoundInterval:", 0.0);
  }
  else
  {
    v8 = objc_opt_new(NSDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v4);
    v6 = v5;
    -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
    -[SDAutoUnlockLockSession setPeerFoundInterval:](self, "setPeerFoundInterval:", v6 - v7);

  }
}

- (void)handleRangingStarted
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDAutoUnlockAuthSession setRangingStart:](self, "setRangingStart:", v3);

  kdebug_trace(725286948, 0, 0, 0, 0);
  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("phoneAutoUnlockAWDLRangingTimeout"));
  if (v5)
  {
    v6 = (uint64_t)v5;
    v7 = auto_unlock_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10021C350();

    v9 = (double)v6;
  }
  else
  {
    v9 = 10.0;
  }
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(v9));

}

- (void)handleWiFiRequestInvalidated
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = auto_unlock_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WiFi request invalidated", v4, 2u);
  }

}

- (void)notifyDelegateWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));

  if (!v5)
    v6 = -[SDAutoUnlockAuthSession setAttemptError:](self, "setAttemptError:", v4);
  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Auth lock session notifying delegate with error: %@", (uint8_t *)&v18, 0xCu);
  }

  if (v4)
  {
    v10 = -[SDAutoUnlockLockSession otherSessionCancel](self, "otherSessionCancel");
    if (v10)
      goto LABEL_12;
    v11 = auto_unlock_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Automation: Session Dismissed: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    v14 = auto_unlock_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Automation: Success", (uint8_t *)&v18, 2u);
    }
  }

LABEL_12:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v16 = objc_opt_respondsToSelector(v15, "session:didCompleteWithError:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    objc_msgSend(v17, "session:didCompleteWithError:", self, v4);

  }
}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "messageType");
  switch((int)v5)
  {
    case 7:
      kdebug_trace(725286928, 0, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      -[SDAutoUnlockLockSession setKeyRequestExchange:](self, "setKeyRequestExchange:");

      v9 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionKeyExchangeRequest", buf, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v11);
      goto LABEL_18;
    case 8:
    case 10:
    case 12:
      goto LABEL_19;
    case 9:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession exchageResponseDate](self, "exchageResponseDate"));
      objc_msgSend(v15, "timeIntervalSinceDate:", v16);
      -[SDAutoUnlockLockSession setTokenExchange:](self, "setTokenExchange:");

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
      objc_msgSend(v17, "timeIntervalSinceDate:", v18);
      -[SDAutoUnlockLockSession setBtBootstrap:](self, "setBtBootstrap:");

      v19 = kdebug_trace(725286936, 0, 0, 0, 0);
      v20 = auto_unlock_log(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionAuthToken", v24, 2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockLockSession handleSessionAuthToken:](self, "handleSessionAuthToken:", v11);
      goto LABEL_18;
    case 11:
      -[SDAutoUnlockLockSession invalidateConfirmationTimer](self, "invalidateConfirmationTimer");
      -[SDAutoUnlockLockSession handleConfirmationACK](self, "handleConfirmationACK");
      goto LABEL_19;
    case 13:
      v22 = auto_unlock_log(v5);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptResponse", v26, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockLockSession handleAuthPromptResponse:](self, "handleAuthPromptResponse:", v11);
      goto LABEL_18;
    default:
      if ((_DWORD)v5 != 301)
        goto LABEL_19;
      kdebug_trace(725286924, 0, 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession connectionDate](self, "connectionDate"));
      v14 = v13;
      if (!v13)
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession firstSend](self, "firstSend"));
      objc_msgSend(v12, "timeIntervalSinceDate:", v14);
      -[SDAutoUnlockLockSession setAwdlInfoExchange:](self, "setAwdlInfoExchange:");
      if (!v13)

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockLockSession handleAWDLInfo:](self, "handleAWDLInfo:", v11);
LABEL_18:

LABEL_19:
      return;
  }
}

- (void)handleAWDLInfo:(id)a3
{
  id v4;
  SDAutoUnlockAWDLInfo *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  SDUnlockSessionKeyExchangeRequest *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSErrorUserInfoKey v37;
  SDUnlockSessionKeyExchangeRequest *v38;
  NSErrorUserInfoKey v39;
  SDUnlockSessionKeyExchangeRequest *v40;
  uint8_t buf[4];
  void *v42;

  v4 = a3;
  if (!-[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo"))
  {
    -[SDAutoUnlockLockSession setReceivedAWDLInfo:](self, "setReceivedAWDLInfo:", 1);
    if (!-[SDAutoUnlockLockSession sentExchangeResponse](self, "sentExchangeResponse"))
      -[SDAutoUnlockLockSession invalidateTimerIfReady](self, "invalidateTimerIfReady");
    v5 = -[SDAutoUnlockAWDLInfo initWithData:]([SDAutoUnlockAWDLInfo alloc], "initWithData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo awdlInfo](v5, "awdlInfo"));
    v7 = sub_1000C7E44(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received AWDL Info %@", buf, 0xCu);
    }

    if (!v8)
    {
      v28 = auto_unlock_log(v12);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10021C3B0();

      goto LABEL_36;
    }
    -[SDAutoUnlockAuthSession setRemoteAWDLInfo:](self, "setRemoteAWDLInfo:", v8);
    if (sub_1000CE8D0(CFSTR("AURestrictOldWatch"), 1)
      && -[SDAutoUnlockAWDLInfo version](v5, "version") < 3uLL)
    {
      -[SDAutoUnlockLockSession setOldWatch:](self, "setOldWatch:", 1);
      v13 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Watch using old protocol (version: %d)"), -[SDAutoUnlockAWDLInfo version](v5, "version")));
      v14 = auto_unlock_log(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10021C3DC();

      v16 = SFAutoUnlockErrorDomain;
      v39 = NSLocalizedDescriptionKey;
      v40 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v18 = v16;
      v19 = 126;
    }
    else
    {
      if (-[SDAutoUnlockAWDLInfo hasSupportsConfirmationACK](v5, "hasSupportsConfirmationACK"))
      {
        v20 = -[SDAutoUnlockAWDLInfo supportsConfirmationACK](v5, "supportsConfirmationACK");
        if (v20)
        {
          v21 = auto_unlock_log(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Session supports confirmation ACK", buf, 2u);
          }

          -[SDAutoUnlockLockSession setSupportsConfirmationACK:](self, "setSupportsConfirmationACK:", -[SDAutoUnlockAWDLInfo supportsConfirmationACK](v5, "supportsConfirmationACK"));
        }
      }
      if (-[SDAutoUnlockAWDLInfo hasKeyData](v5, "hasKeyData")
        || -[SDAutoUnlockAWDLInfo hasErrorCode](v5, "hasErrorCode"))
      {
        v13 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
        -[SDUnlockSessionKeyExchangeRequest setVersion:](v13, "setVersion:", -[SDAutoUnlockAWDLInfo version](v5, "version"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo keyData](v5, "keyData"));
        -[SDUnlockSessionKeyExchangeRequest setKey:](v13, "setKey:", v23);

        -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v13, "setUsingRecord:", -[SDAutoUnlockAWDLInfo useToken](v5, "useToken") ^ 1);
        if (-[SDAutoUnlockAWDLInfo hasErrorCode](v5, "hasErrorCode"))
          -[SDUnlockSessionKeyExchangeRequest setErrorCode:](v13, "setErrorCode:", -[SDAutoUnlockAWDLInfo errorCode](v5, "errorCode"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v13, "data"));
        -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v24);

        v26 = auto_unlock_log(v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using new protocol", buf, 2u);
        }

        goto LABEL_35;
      }
      v30 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
      if ((_DWORD)v30 == 1)
      {
        v31 = auto_unlock_log(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", buf, 2u);
        }

        -[SDAutoUnlockAuthSession setProtocol:](self, "setProtocol:", 0);
        goto LABEL_36;
      }
      v13 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received AWDL Info message missing information (info: %@)"), v5));
      v33 = auto_unlock_log(v13);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_10021C3DC();

      v35 = SFAutoUnlockErrorDomain;
      v37 = NSLocalizedDescriptionKey;
      v38 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v18 = v35;
      v19 = 103;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, v17));
    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v36);

LABEL_35:
LABEL_36:

  }
}

- (void)handleAuthPromptResponse:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  SDUnlockSessionKeyExchangeRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  SDUnlockSessionKeyExchangeRequest *v18;

  v4 = a3;
  v5 = -[SDAutoUnlockLockSession receivedAuthPromptResponse](self, "receivedAuthPromptResponse");
  if (v5)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10021C43C();
  }
  else
  {
    -[SDAutoUnlockLockSession setReceivedAuthPromptResponse:](self, "setReceivedAuthPromptResponse:", 1);
    v7 = -[SDAutoUnlockAuthPromptResponse initWithData:]([SDAutoUnlockAuthPromptResponse alloc], "initWithData:", v4);
    if ((-[NSObject hasKeyData](v7, "hasKeyData") & 1) != 0
      || -[NSObject hasErrorCode](v7, "hasErrorCode"))
    {
      v8 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
      -[SDUnlockSessionKeyExchangeRequest setVersion:](v8, "setVersion:", -[NSObject version](v7, "version"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject keyData](v7, "keyData"));
      -[SDUnlockSessionKeyExchangeRequest setKey:](v8, "setKey:", v9);

      -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v8, "setUsingRecord:", 1);
      -[SDAutoUnlockLockSession setNeedsNewImage:](self, "setNeedsNewImage:", -[NSObject needsImageData](v7, "needsImageData"));
      if (-[NSObject hasErrorCode](v7, "hasErrorCode"))
        -[SDUnlockSessionKeyExchangeRequest setErrorCode:](v8, "setErrorCode:", -[NSObject errorCode](v7, "errorCode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
      -[SDAutoUnlockLockSession sendAuthPromptImageDataIfReady:](self, "sendAuthPromptImageDataIfReady:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v8, "data"));
      -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v11);

    }
    else
    {
      v8 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received auth prompt response missing information: %@)"), v7));
      v12 = auto_unlock_log(v8);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10021C3DC();

      v14 = SFAutoUnlockErrorDomain;
      v17 = NSLocalizedDescriptionKey;
      v18 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 103, v15));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v16);

    }
  }

}

- (void)handleSessionKeyExchangeRequest:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  SDUnlockSessionKeyExchangeRequest *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  _BOOL8 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  unsigned int v49;
  id v50;
  id v51;
  uint8_t buf[8];
  NSErrorUserInfoKey v53;
  __CFString *v54;

  v4 = a3;
  -[SDAutoUnlockLockSession setReceivedExchangeRequest:](self, "setReceivedExchangeRequest:", 1);
  -[SDAutoUnlockLockSession invalidateTimerIfReady](self, "invalidateTimerIfReady");
  v5 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (!v5)
  {
    v7 = -[SDUnlockSessionKeyExchangeRequest initWithData:]([SDUnlockSessionKeyExchangeRequest alloc], "initWithData:", v4);
    if (!-[SDUnlockSessionKeyExchangeRequest hasErrorCode](v7, "hasErrorCode")
      && -[SDUnlockSessionKeyExchangeRequest hasKey](v7, "hasKey")
      && -[SDUnlockSessionKeyExchangeRequest hasUsingRecord](v7, "hasUsingRecord"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
      v9 = -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:](self, "handleFoundBLEDevice:available:lockedOnWrist:", v8, 1, 0);

      if ((v9 & 1) == 0)
      {
        v33 = auto_unlock_log(v10);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Found device is not available", buf, 2u);
        }
        goto LABEL_29;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));

      if (v11)
      {
        v13 = auto_unlock_log(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received fallback AKS session", buf, 2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        objc_msgSend(v15, "resetSession");

        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", 0);
      }
      if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)1)
      {
        v16 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
        v17 = -[SDUnlockSessionKeyExchangeRequest usingRecord](v7, "usingRecord");
        v18 = v16 == 2;
        if (v16 == 2)
          v19 = 0;
        else
          v19 = v17;
        v20 = objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:](v20, "aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:", v21, 0, v19, v18, 2));
        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v22);

      }
      else
      {
        v39 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
        if (v39 == 2)
        {
          v20 = objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "attemptExternalACMContext"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:](v20, "aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:", v40, 0, 0, v42, 3));
          -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v43);

        }
        else
        {
          v44 = auto_unlock_log(v39);
          v20 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_10021C4F4(self, v20);
        }
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v46 = objc_msgSend(v45, "sessionIsValid");

      if (v46)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest key](v7, "key"));
        v51 = 0;
        v49 = objc_msgSend(v47, "stepSessionWithData:outputData:", v48, &v51);
        v50 = v51;

        if (v49)
        {
          -[SDAutoUnlockLockSession sendKeyExchangeResponseWithData:](self, "sendKeyExchangeResponseWithData:", v50);
          v25 = 0;
          v27 = 0;
        }
        else
        {
          v27 = CFSTR("Exchange request step failed");
          v25 = 101;
        }

        goto LABEL_25;
      }
      v27 = CFSTR("Lock session invalid");
      v25 = 101;
LABEL_26:
      v28 = auto_unlock_log(v23);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10021C468();

      v30 = SFAutoUnlockErrorDomain;
      v53 = NSLocalizedDescriptionKey;
      v54 = v27;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, v25, v31));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v32);

LABEL_29:
      goto LABEL_30;
    }
    if (!-[SDUnlockSessionKeyExchangeRequest hasErrorCode](v7, "hasErrorCode"))
    {
      v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Key exhange request is missing information (request: %@)"), v7));
      v27 = (__CFString *)v23;
      v25 = 103;
      goto LABEL_25;
    }
    v23 = -[SDUnlockSessionKeyExchangeRequest errorCode](v7, "errorCode");
    v25 = v23;
    if ((int)v23 <= 183)
    {
      if ((int)v23 <= 118)
      {
        if ((_DWORD)v23 == 102)
        {
          v37 = auto_unlock_log(v23);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_10021C4C8();

          v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
          -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:](self, "handleFoundBLEDevice:available:lockedOnWrist:", v27, 0, 1);
          goto LABEL_29;
        }
        if ((_DWORD)v23 == 114)
        {
          v27 = CFSTR("Remote WiFi failure");
          v25 = 114;
          goto LABEL_26;
        }
      }
      else
      {
        switch((_DWORD)v23)
        {
          case 0x77:
            v27 = CFSTR("Watch not in state to perform Auto Unlock");
            v25 = 119;
            goto LABEL_26;
          case 0x9E:
            v27 = CFSTR("Watch off wrist");
            v25 = 158;
            goto LABEL_26;
          case 0x9F:
            v27 = CFSTR("Watch locked and off wrist");
            goto LABEL_26;
        }
      }
    }
    else if ((int)v23 > 209)
    {
      switch((_DWORD)v23)
      {
        case 0xD2:
          v27 = CFSTR("Not enough motion detected");
          v25 = 210;
          goto LABEL_26;
        case 0xD5:
          v27 = CFSTR("Watch Not Armed");
          v25 = 213;
          goto LABEL_26;
        case 0xD7:
          v27 = CFSTR("Phone needs to be unlocked after Watch unlocked and on wrist");
          v25 = 215;
          goto LABEL_26;
      }
    }
    else
    {
      switch((_DWORD)v23)
      {
        case 0xB8:
          v27 = CFSTR("Auth prompts disabled on remote");
          v25 = 184;
          goto LABEL_26;
        case 0xC7:
          if (SFIsGreenTeaDevice(v23, v24))
            v35 = CFSTR("UNLOCK_WATCH_WLAN_DISABLED");
          else
            v35 = CFSTR("UNLOCK_WATCH_WIFI_DISABLED");
          v36 = SFLocalizedStringForKey(v35, v34);
          v23 = objc_claimAutoreleasedReturnValue(v36);
          v27 = (__CFString *)v23;
          v25 = 199;
LABEL_25:
          if (!v27)
            goto LABEL_30;
          goto LABEL_26;
        case 0xCC:
          v26 = SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_IN_SLEEP_MODE"), v24);
          v23 = objc_claimAutoreleasedReturnValue(v26);
          v27 = (__CFString *)v23;
          v25 = 204;
          goto LABEL_25;
      }
    }
    v27 = CFSTR("Remote AKS session failed");
    goto LABEL_26;
  }
  v6 = auto_unlock_log(v5);
  v7 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Key exchange request: attempt cancelled", buf, 2u);
  }
LABEL_30:

}

- (void)handleSessionAuthToken:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSDate *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint8_t v30[8];
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v4 = a3;
  v5 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (v5)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auth token: attempt cancelled", v30, 2u);
    }
    goto LABEL_28;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));

  if (v8)
  {
    v10 = auto_unlock_log(v9);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10021C638();
    goto LABEL_28;
  }
  v7 = -[SDUnlockSessionAuthToken initWithData:]([SDUnlockSessionAuthToken alloc], "initWithData:", v4);
  if ((-[NSObject hasErrorCode](v7, "hasErrorCode") & 1) != 0
    || !-[NSObject hasAuthToken](v7, "hasAuthToken"))
  {
    v13 = -[NSObject hasErrorCode](v7, "hasErrorCode");
    if ((_DWORD)v13)
    {
      v13 = -[NSObject errorCode](v7, "errorCode");
      v14 = v13;
      if ((_DWORD)v13 == 179)
      {
        v15 = CFSTR("User denied authorization request");
        goto LABEL_25;
      }
      if ((_DWORD)v13 == 180)
      {
        v15 = CFSTR("Error posting authorization request");
        v14 = 180;
        goto LABEL_25;
      }
    }
    else
    {
      v14 = 103;
    }
    v15 = CFSTR("Auth token transfer failed");
    goto LABEL_25;
  }
  -[SDAutoUnlockLockSession setSessionAuthToken:](self, "setSessionAuthToken:", v7);
  v11 = objc_opt_new(NSDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
  -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v12);
  -[SDAutoUnlockLockSession setBtOverall:](self, "setBtOverall:");

  if (-[NSObject version](v7, "version") >= 2
    && (id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2)
  {
    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
    goto LABEL_28;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "generateSessionToken"));
  -[SDAutoUnlockAuthSession setSessionRangingKey:](self, "setSessionRangingKey:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
  if (v18)
  {
    -[SDAutoUnlockLockSession startAWDL](self, "startAWDL");
    -[SDAutoUnlockLockSession setOnlyRanging:](self, "setOnlyRanging:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = (uint64_t)objc_msgSend(v19, "integerForKey:", CFSTR("phoneAutoUnlockPeerDiscoveryTimeout"));
    if (v20 < 1)
    {
      v24 = 10.0;
    }
    else
    {
      v21 = v20;
      v22 = auto_unlock_log(v20);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        sub_10021C5D8();

      v24 = (double)v21;
    }
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(v24));

    goto LABEL_28;
  }
  v15 = CFSTR("Failed to generate ranging token");
  v14 = 101;
LABEL_25:
  v25 = auto_unlock_log(v13);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_10021C578();

  v27 = SFAutoUnlockErrorDomain;
  v31 = NSLocalizedDescriptionKey;
  v32 = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v27, v14, v28));
  -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v29);

LABEL_28:
}

- (void)handleConfirmationACK
{
  uint64_t v3;
  NSObject *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockSessionConfirmationACK", v16, 2u);
  }

  v5 = objc_opt_new(NSDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationSendDate](self, "confirmationSendDate"));
  -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
  -[SDAutoUnlockLockSession setConfirmation:](self, "setConfirmation:");

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  -[SDAutoUnlockLockSession setAttemptTime:](self, "setAttemptTime:");

  LODWORD(v7) = -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed");
  -[SDAutoUnlockLockSession attemptTime](self, "attemptTime");
  v10 = v9;
  if ((_DWORD)v7)
  {
    -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
    v10 = v10 - v11;
  }
  -[SDAutoUnlockLockSession setCompleteExchange:](self, "setCompleteExchange:", v10);
  -[SDAutoUnlockLockSession setUnlockSucceeded:](self, "setUnlockSucceeded:", 1);
  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2
    && -[SDAutoUnlockLockSession sentImageData](self, "sentImageData"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession iconTransferStore](self, "iconTransferStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageHash](self, "imageHash"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
    objc_msgSend(v12, "storeCachedImageForHash:device:appName:", v13, v14, v15);

  }
  -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0);
}

- (void)startAWDL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SDAutoUnlockRangingPeer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id WeakRetained;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  SDAutoUnlockWiFiRequest *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[16];
  id location[2];

  kdebug_trace(725286940, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession peerListFromAWDLInfo:](self, "peerListFromAWDLInfo:", v3));
  -[SDAutoUnlockLockSession setPeerList:](self, "setPeerList:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AWDL_IF_MAC_ADDRESS")));
  -[SDAutoUnlockLockSession setPeerMacAddress:](self, "setPeerMacAddress:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession localAWDLInfo](self, "localAWDLInfo"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("AWDL_INFO_SELF"));

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDAutoUnlockAuthSession setAwdlStart:](self, "setAwdlStart:", v10);

  v11 = objc_opt_new(SDAutoUnlockRangingPeer);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession peerList](self, "peerList"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  -[SDAutoUnlockRangingPeer setNiRangingPeer:](v11, "setNiRangingPeer:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession peerMacAddress](self, "peerMacAddress"));
  -[SDAutoUnlockRangingPeer setMacAddressData:](v11, "setMacAddressData:", v14);

  location[0] = 0;
  objc_initWeak(location, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("phoneAutoUnlockSkipRanging"));
  v17 = (int)v16;
  v18 = auto_unlock_log(v16);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_10021C664(v17, v19);

  if (v17)
  {
    v21 = auto_unlock_log(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Skipping ranging due to default phoneAutoUnlockSkipRanging", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "handleRangingResults:errorCode:", 0, 0);

  }
  else
  {
    v32 = v8;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100219964;
    v41[3] = &unk_10071C180;
    v41[4] = self;
    objc_copyWeak(&v42, location);
    v31 = objc_retainBlock(v41);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100219AF4;
    v39[3] = &unk_10071C1A8;
    objc_copyWeak(&v40, location);
    v24 = objc_retainBlock(v39);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100219BD0;
    v37[3] = &unk_1007145D0;
    objc_copyWeak(&v38, location);
    v25 = objc_retainBlock(v37);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100219C4C;
    v35[3] = &unk_10071C1D0;
    objc_copyWeak(&v36, location);
    v26 = objc_retainBlock(v35);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100219D04;
    v33[3] = &unk_1007145D0;
    objc_copyWeak(&v34, location);
    v27 = objc_retainBlock(v33);
    v28 = -[SDAutoUnlockWiFiRequest initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:]([SDAutoUnlockWiFiRequest alloc], "initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:", v32, 1, v11, &stru_10071C158, v31, v24, v25, v26, v27);
    -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
    objc_msgSend(v29, "scheduleWiFiRequest:", v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v42);
    v8 = v32;
  }

  objc_destroyWeak(location);
}

- (void)consumeAuthTokenIfReady
{
  void *v3;
  unsigned int v4;
  int v5;
  int v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSDate *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSDate *v37;
  void *v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "currentConsoleUser");

  v5 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  v6 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "isDisplayOff");

  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "isDisplayOff");

  }
  else
  {
    v11 = 0;
  }
  v12 = auto_unlock_log(v9);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v4)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (v5)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v55 = v15;
    if (v6)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v56 = 2112;
    v57 = v16;
    v58 = 2112;
    v59 = v17;
    if (v11)
      v14 = CFSTR("YES");
    v60 = 2112;
    v61 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current user: %@, clamshell closed: %@, display connected: %@ display off: %@", buf, 0x2Au);
  }

  if (((v4 & v5 & (v6 ^ 1) | v11) & 1) != 0)
  {
    if (v11)
    {
      v19 = SFAutoUnlockErrorDomain;
      v50 = NSLocalizedDescriptionKey;
      v51 = CFSTR("Device display is off");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 217, v20));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v21);
LABEL_41:

      return;
    }
    v35 = auto_unlock_log(v18);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Waiting for a display or clamshell change", buf, 2u);
    }

    if (!-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell"))
    {
      -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 1);
      v37 = objc_opt_new(NSDate);
      -[SDAutoUnlockLockSession setDisplayOrClamshellWaitingDate:](self, "setDisplayOrClamshellWaitingDate:", v37);

      -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(5.0));
    }
    return;
  }
  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell"))
  {
    v22 = objc_opt_new(NSDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession displayOrClamshellWaitingDate](self, "displayOrClamshellWaitingDate"));
    -[NSDate timeIntervalSinceDate:](v22, "timeIntervalSinceDate:", v23);
    -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");

  }
  v24 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
  if (!v24)
    return;
  v21 = (void *)v24;
  if (-[SDAutoUnlockAuthSession inRange](self, "inRange"))
  {

LABEL_25:
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockLockSession setDeviceWasLocked:](self, "setDeviceWasLocked:", objc_msgSend(v25, "deviceKeyBagUnlocked") ^ 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "authToken"));
    v29 = objc_msgSend(v26, "stepSessionWithData:outputData:", v28, 0);

    v31 = auto_unlock_log(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if (v29)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AKS Unlock succeeded", buf, 2u);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      objc_msgSend(v34, "addPreventExitForLocaleReason:", CFSTR("AutoUnlockConfirmationTimerPreventExitReason"));

      -[SDAutoUnlockAuthSession setAksSuccess:](self, "setAksSuccess:", 1);
      -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 13);
      if (!-[SDAutoUnlockLockSession doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"))
        -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 1, 0);
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10021C6D8(v33, v40, v41, v42, v43, v44, v45, v46);

      v47 = SFAutoUnlockErrorDomain;
      v52 = NSLocalizedDescriptionKey;
      v53 = CFSTR("Auth token failed");
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v47, 101, v48));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0, v49);

    }
    return;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
  if (objc_msgSend(v38, "version") <= 1)
  {

    goto LABEL_41;
  }
  v39 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");

  if (v39 == 2)
    goto LABEL_25;
}

- (void)sendAWDLInfoData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  uint8_t buf[4];
  unsigned int v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localDeviceID"));

  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:](self, "wrapPayload:withType:useProxy:senderID:", v8, v6, -[SDAutoUnlockLockSession useProxy](self, "useProxy"), v11));
    v14 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
      *(_DWORD *)buf = 67109120;
      v27 = objc_msgSend(v16, "useBTPipe");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending with useBTPipe %d", buf, 8u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10021A4B4;
    v22[3] = &unk_10071C1F8;
    v22[4] = self;
    v23 = v9;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:](self, "sendData:bleDevice:completionHandler:", v13, v17, v22);

    goto LABEL_9;
  }
  v18 = auto_unlock_log(v12);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10021C748();

  if (v9)
  {
    v20 = SFAutoUnlockErrorDomain;
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("Missing local IDS ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, 194, v13));
    (*((void (**)(id, void *))v9 + 2))(v9, v21);

LABEL_9:
  }

}

- (void)sendAuthPromptRequestWithImageHash:(id)a3 appName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SDAutoUnlockAuthPromptRequest *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[5];
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localDeviceID"));

  if (v9)
  {
    v11 = objc_opt_new(SDAutoUnlockAuthPromptRequest);
    -[SDAutoUnlockAuthPromptRequest setVersion:](v11, "setVersion:", 1);
    -[SDAutoUnlockAuthPromptRequest setIconHash:](v11, "setIconHash:", v6);
    -[SDAutoUnlockAuthPromptRequest setAppName:](v11, "setAppName:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession navBarTitle](self, "navBarTitle"));
    -[SDAutoUnlockAuthPromptRequest setNavBarTitle:](v11, "setNavBarTitle:", v12);

    v14 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10021C800();

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest data](v11, "data"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:](self, "wrapPayload:withType:useProxy:senderID:", v16, 12, 0, v9));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10021A7A4;
    v22[3] = &unk_1007147C8;
    v22[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:](self, "sendData:bleDevice:completionHandler:", v17, v18, v22);

  }
  else
  {
    v19 = auto_unlock_log(v10);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10021C7D4();

    v21 = SFAutoUnlockErrorDomain;
    v23 = NSLocalizedDescriptionKey;
    v24 = CFSTR("Missing local IDS ID");
    v11 = (SDAutoUnlockAuthPromptRequest *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 194, v11));
    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
  }

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(30.0));
}

- (void)sendAuthPromptImageDataIfReady:(id)a3
{
  id v4;
  int v5;
  unsigned int v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  __int128 v31;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  unint64_t v38;
  SDAutoUnlockAuthPromptImageData *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  _QWORD v47[5];
  uint8_t buf[4];
  _BYTE v49[18];
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;

  v4 = a3;
  v5 = sub_1000CE8D0(CFSTR("AUDisableIconCache"), 0);
  v6 = 0;
  if (!v5)
    v6 = -[SDAutoUnlockLockSession imageDataAlreadyCached](self, "imageDataAlreadyCached");
  v7 = -[SDAutoUnlockLockSession sentImageData](self, "sentImageData");
  if (v7)
    goto LABEL_10;
  v7 = -[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice");
  if (!v7)
    goto LABEL_10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
  v9 = v8;
  if (v8)
    v10 = v6;
  else
    v10 = 0;
  if (v10 == 1)
  {
    v11 = -[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage");

    if ((v11 & 1) == 0)
    {
LABEL_10:
      v12 = auto_unlock_log(v7);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (-[SDAutoUnlockLockSession sentImageData](self, "sentImageData"))
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        if (-[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice"))
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
        if (v16)
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        if (-[SDAutoUnlockLockSession imageDataAlreadyCached](self, "imageDataAlreadyCached"))
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        *(_DWORD *)buf = 138413314;
        if (-[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage"))
          v19 = CFSTR("YES");
        else
          v19 = CFSTR("NO");
        *(_QWORD *)v49 = v14;
        *(_WORD *)&v49[8] = 2112;
        *(_QWORD *)&v49[10] = v15;
        v50 = 2112;
        v51 = v17;
        v52 = 2112;
        v53 = v18;
        v54 = 2112;
        v55 = v19;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not sending image data (already sent %@, chosen: %@, data %@, already cached %@, needs new image: %@)", buf, 0x34u);

      }
      goto LABEL_28;
    }
  }
  else
  {

    if (!v9)
      goto LABEL_10;
  }
  v20 = auto_unlock_log(v7);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (-[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
    if (v23)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    if (v6)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    if (v5)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    if (-[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage"))
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    *(_QWORD *)v49 = v22;
    *(_WORD *)&v49[8] = 2112;
    *(_QWORD *)&v49[10] = v24;
    v50 = 2112;
    v51 = v25;
    v52 = 2112;
    v53 = v26;
    v54 = 2112;
    v55 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending image data (chosen: %@, data: %@, already cached: %@, cache disabled: %@ needs new image: %@)", buf, 0x34u);

  }
  v29 = 0;
  v30 = 1;
  *(_QWORD *)&v31 = 67109376;
  v46 = v31;
  do
  {
    v32 = auto_unlock_log(v28);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v49 = 10000;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Using max size %ld", buf, 0xCu);
    }

    v34 = (char *)objc_msgSend(v4, "length");
    if ((unint64_t)&v34[-v29] >= 0x2710)
      v35 = 10000;
    else
      v35 = (uint64_t)&v34[-v29];
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", v29, v35, v46));
    v37 = objc_msgSend(v36, "length");
    v38 = (unint64_t)objc_msgSend(v36, "length") >> 4;
    v39 = objc_opt_new(SDAutoUnlockAuthPromptImageData);
    -[SDAutoUnlockAuthPromptImageData setVersion:](v39, "setVersion:", 1);
    -[SDAutoUnlockAuthPromptImageData setImageData:](v39, "setImageData:", v36);
    v40 = auto_unlock_log(-[SDAutoUnlockAuthPromptImageData setFinalMessage:](v39, "setFinalMessage:", v38 < 0x271));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(v36, "length");
      *(_DWORD *)buf = v46;
      *(_DWORD *)v49 = v30;
      *(_WORD *)&v49[4] = 2048;
      *(_QWORD *)&v49[6] = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAuthPromptImageData (message count: %u, size: %ld)", buf, 0x12u);
    }
    v29 += v37;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData data](v39, "data"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v43, 14));

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10021AD48;
    v47[3] = &unk_1007147C8;
    v47[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:](self, "sendData:bleDevice:direct:completionHandler:", v44, v45, 1, v47);

    ++v30;
  }
  while (v38 > 0x270);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(30.0));
  -[SDAutoUnlockLockSession setSentImageData:](self, "setSentImageData:", 1);
LABEL_28:

}

- (void)sendKeyExchangeResponseWithData:(id)a3
{
  id v4;
  SDUnlockSessionKeyExchangeResponse *v5;
  NSDate *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_opt_new(SDUnlockSessionKeyExchangeResponse);
  -[SDUnlockSessionKeyExchangeResponse setVersion:](v5, "setVersion:", 2);
  -[SDUnlockSessionKeyExchangeResponse setKey:](v5, "setKey:", v4);

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 10);
  v6 = objc_opt_new(NSDate);
  -[SDAutoUnlockLockSession setExchageResponseDate:](self, "setExchageResponseDate:", v6);

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionKeyExchangeResponse", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse data](v5, "data"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10021B00C;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v10, 8, v11);

  kdebug_trace(725286932, 0, 0, 0, 0);
  -[SDAutoUnlockLockSession setSentExchangeResponse:](self, "setSentExchangeResponse:", 1);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)35));

}

- (void)completeAttemptPostNotification:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10021B174;
  v6[3] = &unk_100715BB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4
{
  -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:suppressNotification:](self, "sendUnlockConfirmation:withError:suppressNotification:", a3, a4, 0);
}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4 suppressNotification:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  SDUnlockSessionConfirmation *v13;
  NSDate *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  dispatch_time_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  SDAutoUnlockLockSession *v30;
  id v31;
  uint8_t buf[8];
  NSErrorUserInfoKey v33;
  const __CFString *v34;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (-[SDAutoUnlockLockSession connected](self, "connected")
    || -[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo")
    || (v9 = -[SDAutoUnlockLockSession receivedAuthPromptResponse](self, "receivedAuthPromptResponse")))
  {
    v10 = -[SDAutoUnlockLockSession sendingConfirmation](self, "sendingConfirmation");
    if (v10)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Already sending confirmation", buf, 2u);
      }

    }
    else
    {
      -[SDAutoUnlockLockSession setSendingConfirmation:](self, "setSendingConfirmation:", 1);
      v13 = objc_opt_new(SDUnlockSessionConfirmation);
      -[SDUnlockSessionConfirmation setVersion:](v13, "setVersion:", 1);
      -[SDUnlockSessionConfirmation setSuccess:](v13, "setSuccess:", v6);
      -[SDUnlockSessionConfirmation setSupportsACK:](v13, "setSupportsACK:", -[SDAutoUnlockLockSession supportsConfirmationACK](self, "supportsConfirmationACK"));
      -[SDUnlockSessionConfirmation setSuppressNotification:](v13, "setSuppressNotification:", v5);
      v14 = objc_opt_new(NSDate);
      -[SDAutoUnlockLockSession setConfirmationSendDate:](self, "setConfirmationSendDate:", v14);

      v16 = auto_unlock_log(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionConfirmation", buf, 2u);
      }

      v18 = SFAutoUnlockErrorDomain;
      v33 = NSLocalizedDescriptionKey;
      v34 = CFSTR("Confirmation failed");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, 136, v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionConfirmation data](v13, "data"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10021B4A8;
      v28[3] = &unk_1007147F0;
      v22 = v8;
      v29 = v22;
      v30 = self;
      v31 = v20;
      v23 = v20;
      -[SDAutoUnlockAuthSession sendData:type:completionHandler:](self, "sendData:type:completionHandler:", v21, 10, v28);

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      v24 = sub_10019AAC0(5.0);
      if (v22)
        v25 = v22;
      else
        v25 = v23;
      -[SDAutoUnlockLockSession restartConfirmationTimer:error:](self, "restartConfirmationTimer:error:", v24, v25);

    }
  }
  else
  {
    v26 = auto_unlock_log(v9);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Never connected, skipping confirmation", buf, 2u);
    }

    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
  }

}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothID, a3);
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (void)setUseProxy:(BOOL)a3
{
  self->_useProxy = a3;
}

- (BOOL)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(BOOL)a3
{
  self->_wifiState = a3;
}

- (BOOL)otherSessionCancel
{
  return self->_otherSessionCancel;
}

- (void)setOtherSessionCancel:(BOOL)a3
{
  self->_otherSessionCancel = a3;
}

- (BOOL)otherProviderCancel
{
  return self->_otherProviderCancel;
}

- (void)setOtherProviderCancel:(BOOL)a3
{
  self->_otherProviderCancel = a3;
}

- (BOOL)attemptTimedOut
{
  return self->_attemptTimedOut;
}

- (void)setAttemptTimedOut:(BOOL)a3
{
  self->_attemptTimedOut = a3;
}

- (BOOL)chosenDevice
{
  return self->_chosenDevice;
}

- (BOOL)unlockSucceeded
{
  return self->_unlockSucceeded;
}

- (void)setUnlockSucceeded:(BOOL)a3
{
  self->_unlockSucceeded = a3;
}

- (NSDate)attemptStartDate
{
  return self->_attemptStartDate;
}

- (void)setAttemptStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_attemptStartDate, a3);
}

- (NSDate)prewarmStartDate
{
  return self->_prewarmStartDate;
}

- (void)setPrewarmStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmStartDate, a3);
}

- (double)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(double)a3
{
  self->_discoveryTime = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSString)proxyDeviceModel
{
  return self->_proxyDeviceModel;
}

- (void)setProxyDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_proxyDeviceModel, a3);
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (unint64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(unint64_t)a3
{
  self->_connectedBluetoothDevices = a3;
}

- (int64_t)timeSinceLastMachineWake
{
  return self->_timeSinceLastMachineWake;
}

- (void)setTimeSinceLastMachineWake:(int64_t)a3
{
  self->_timeSinceLastMachineWake = a3;
}

- (int64_t)lastSleepType
{
  return self->_lastSleepType;
}

- (void)setLastSleepType:(int64_t)a3
{
  self->_lastSleepType = a3;
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (SFAutoUnlockDevice)autoUnlockDevice
{
  return self->_autoUnlockDevice;
}

- (void)setAutoUnlockDevice:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnlockDevice, a3);
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalACMContext, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
  objc_storeStrong((id *)&self->_imageHash, a3);
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
{
  objc_storeStrong((id *)&self->_iconTransferStore, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)oldWatch
{
  return self->_oldWatch;
}

- (void)setOldWatch:(BOOL)a3
{
  self->_oldWatch = a3;
}

- (BOOL)onlyRanging
{
  return self->_onlyRanging;
}

- (void)setOnlyRanging:(BOOL)a3
{
  self->_onlyRanging = a3;
}

- (BOOL)foundPeer
{
  return self->_foundPeer;
}

- (void)setFoundPeer:(BOOL)a3
{
  self->_foundPeer = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)lockedKeyBag
{
  return self->_lockedKeyBag;
}

- (void)setLockedKeyBag:(BOOL)a3
{
  self->_lockedKeyBag = a3;
}

- (BOOL)deviceWasLocked
{
  return self->_deviceWasLocked;
}

- (void)setDeviceWasLocked:(BOOL)a3
{
  self->_deviceWasLocked = a3;
}

- (BOOL)receivedAWDLInfo
{
  return self->_receivedAWDLInfo;
}

- (void)setReceivedAWDLInfo:(BOOL)a3
{
  self->_receivedAWDLInfo = a3;
}

- (BOOL)receivedAuthPromptResponse
{
  return self->_receivedAuthPromptResponse;
}

- (void)setReceivedAuthPromptResponse:(BOOL)a3
{
  self->_receivedAuthPromptResponse = a3;
}

- (BOOL)sendingConfirmation
{
  return self->_sendingConfirmation;
}

- (void)setSendingConfirmation:(BOOL)a3
{
  self->_sendingConfirmation = a3;
}

- (BOOL)sentExchangeResponse
{
  return self->_sentExchangeResponse;
}

- (void)setSentExchangeResponse:(BOOL)a3
{
  self->_sentExchangeResponse = a3;
}

- (BOOL)receivedExchangeRequest
{
  return self->_receivedExchangeRequest;
}

- (void)setReceivedExchangeRequest:(BOOL)a3
{
  self->_receivedExchangeRequest = a3;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  self->_supportsConfirmationACK = a3;
}

- (BOOL)waitingForDisplayOrClamshell
{
  return self->_waitingForDisplayOrClamshell;
}

- (void)setWaitingForDisplayOrClamshell:(BOOL)a3
{
  self->_waitingForDisplayOrClamshell = a3;
}

- (BOOL)sentImageData
{
  return self->_sentImageData;
}

- (void)setSentImageData:(BOOL)a3
{
  self->_sentImageData = a3;
}

- (BOOL)imageDataAlreadyCached
{
  return self->_imageDataAlreadyCached;
}

- (void)setImageDataAlreadyCached:(BOOL)a3
{
  self->_imageDataAlreadyCached = a3;
}

- (BOOL)needsNewImage
{
  return self->_needsNewImage;
}

- (void)setNeedsNewImage:(BOOL)a3
{
  self->_needsNewImage = a3;
}

- (BOOL)shouldWaitToCompleteUnlock
{
  return self->_shouldWaitToCompleteUnlock;
}

- (void)setShouldWaitToCompleteUnlock:(BOOL)a3
{
  self->_shouldWaitToCompleteUnlock = a3;
}

- (BOOL)isWaitingToCompleteUnlock
{
  return self->_waitingToCompleteUnlock;
}

- (void)setWaitingToCompleteUnlock:(BOOL)a3
{
  self->_waitingToCompleteUnlock = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSData)peerMacAddress
{
  return self->_peerMacAddress;
}

- (void)setPeerMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (SDUnlockSessionAuthToken)sessionAuthToken
{
  return self->_sessionAuthToken;
}

- (void)setSessionAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAuthToken, a3);
}

- (int)watchRSSI
{
  return self->_watchRSSI;
}

- (void)setWatchRSSI:(int)a3
{
  self->_watchRSSI = a3;
}

- (int64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(int64_t)a3
{
  self->_displayCount = a3;
}

- (int64_t)configChangeType
{
  return self->_configChangeType;
}

- (void)setConfigChangeType:(int64_t)a3
{
  self->_configChangeType = a3;
}

- (OS_dispatch_source)displayTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 496, 1);
}

- (void)setDisplayTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (OS_dispatch_source)confirmationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 504, 1);
}

- (void)setConfirmationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (BOOL)awdlUp
{
  return self->_awdlUp;
}

- (void)setAwdlUp:(BOOL)a3
{
  self->_awdlUp = a3;
}

- (NSString)watchModelID
{
  return self->_watchModelID;
}

- (void)setWatchModelID:(id)a3
{
  objc_storeStrong((id *)&self->_watchModelID, a3);
}

- (NSString)watchBuildVersion
{
  return self->_watchBuildVersion;
}

- (void)setWatchBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_watchBuildVersion, a3);
}

- (NSString)watchOSVersion
{
  return self->_watchOSVersion;
}

- (void)setWatchOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_watchOSVersion, a3);
}

- (NSDate)discoveryDate
{
  return self->_discoveryDate;
}

- (void)setDiscoveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryDate, a3);
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (void)setConnectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_connectionDate, a3);
}

- (NSDate)firstSend
{
  return self->_firstSend;
}

- (void)setFirstSend:(id)a3
{
  objc_storeStrong((id *)&self->_firstSend, a3);
}

- (NSDate)exchageResponseDate
{
  return self->_exchageResponseDate;
}

- (void)setExchageResponseDate:(id)a3
{
  objc_storeStrong((id *)&self->_exchageResponseDate, a3);
}

- (NSDate)displayOrClamshellWaitingDate
{
  return self->_displayOrClamshellWaitingDate;
}

- (void)setDisplayOrClamshellWaitingDate:(id)a3
{
  objc_storeStrong((id *)&self->_displayOrClamshellWaitingDate, a3);
}

- (NSDate)confirmationSendDate
{
  return self->_confirmationSendDate;
}

- (void)setConfirmationSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationSendDate, a3);
}

- (NSDate)prewarmIdleStartDate
{
  return self->_prewarmIdleStartDate;
}

- (void)setPrewarmIdleStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmIdleStartDate, a3);
}

- (double)btOverall
{
  return self->_btOverall;
}

- (void)setBtOverall:(double)a3
{
  self->_btOverall = a3;
}

- (double)btBootstrap
{
  return self->_btBootstrap;
}

- (void)setBtBootstrap:(double)a3
{
  self->_btBootstrap = a3;
}

- (double)awdlInfoExchange
{
  return self->_awdlInfoExchange;
}

- (void)setAwdlInfoExchange:(double)a3
{
  self->_awdlInfoExchange = a3;
}

- (double)keyRequestExchange
{
  return self->_keyRequestExchange;
}

- (void)setKeyRequestExchange:(double)a3
{
  self->_keyRequestExchange = a3;
}

- (double)tokenExchange
{
  return self->_tokenExchange;
}

- (void)setTokenExchange:(double)a3
{
  self->_tokenExchange = a3;
}

- (double)confirmation
{
  return self->_confirmation;
}

- (void)setConfirmation:(double)a3
{
  self->_confirmation = a3;
}

- (double)peerFoundInterval
{
  return self->_peerFoundInterval;
}

- (void)setPeerFoundInterval:(double)a3
{
  self->_peerFoundInterval = a3;
}

- (double)awdlTotal
{
  return self->_awdlTotal;
}

- (void)setAwdlTotal:(double)a3
{
  self->_awdlTotal = a3;
}

- (double)attemptTime
{
  return self->_attemptTime;
}

- (void)setAttemptTime:(double)a3
{
  self->_attemptTime = a3;
}

- (double)completeExchange
{
  return self->_completeExchange;
}

- (void)setCompleteExchange:(double)a3
{
  self->_completeExchange = a3;
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (double)connectionWaitTime
{
  return self->_connectionWaitTime;
}

- (void)setConnectionWaitTime:(double)a3
{
  self->_connectionWaitTime = a3;
}

- (double)displayClamshellWaitTime
{
  return self->_displayClamshellWaitTime;
}

- (void)setDisplayClamshellWaitTime:(double)a3
{
  self->_displayClamshellWaitTime = a3;
}

- (double)prewarmIdleTime
{
  return self->_prewarmIdleTime;
}

- (void)setPrewarmIdleTime:(double)a3
{
  self->_prewarmIdleTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmIdleStartDate, 0);
  objc_storeStrong((id *)&self->_confirmationSendDate, 0);
  objc_storeStrong((id *)&self->_displayOrClamshellWaitingDate, 0);
  objc_storeStrong((id *)&self->_exchageResponseDate, 0);
  objc_storeStrong((id *)&self->_firstSend, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_watchOSVersion, 0);
  objc_storeStrong((id *)&self->_watchBuildVersion, 0);
  objc_storeStrong((id *)&self->_watchModelID, 0);
  objc_storeStrong((id *)&self->_confirmationTimer, 0);
  objc_storeStrong((id *)&self->_displayTimer, 0);
  objc_storeStrong((id *)&self->_sessionAuthToken, 0);
  objc_storeStrong((id *)&self->_peerMacAddress, 0);
  objc_storeStrong((id *)&self->_peerList, 0);
  objc_storeStrong((id *)&self->_iconTransferStore, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_externalACMContext, 0);
  objc_storeStrong((id *)&self->_autoUnlockDevice, 0);
  objc_storeStrong((id *)&self->_proxyDeviceModel, 0);
  objc_storeStrong((id *)&self->_prewarmStartDate, 0);
  objc_storeStrong((id *)&self->_attemptStartDate, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
}

@end
