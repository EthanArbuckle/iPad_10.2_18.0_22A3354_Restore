@implementation SDAutoUnlockPairingLockSession

- (SDAutoUnlockPairingLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v6;
  SDAutoUnlockPairingLockSession *v7;
  SDAutoUnlockPairingLockSession *v8;
  void *v9;
  uint64_t v10;
  NSString *keyDeviceModel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *watchBuildVersion;
  id v19;
  uint64_t v20;
  NSString *watchOSVersion;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSString *v25;
  NSString *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  int64_t responseTimeout;
  const __CFString *v31;
  int64_t messageTimeout;
  int64_t messageTimeoutFromServer;
  const __CFString *v34;
  unsigned __int8 v36;
  uint64_t v37[3];
  objc_super v38;
  uint8_t buf[4];
  int64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  const __CFString *v46;

  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SDAutoUnlockPairingLockSession;
  v7 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v38, "initWithDevice:sessionID:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_sendState = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifierForDeviceID:", v6));
    keyDeviceModel = v8->_keyDeviceModel;
    v8->_keyDeviceModel = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceForUniqueID:", v13));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", v14, 0, 0));

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "productBuildVersion"));
      watchBuildVersion = v8->_watchBuildVersion;
      v8->_watchBuildVersion = (NSString *)v17;

      objc_msgSend(v14, "operatingSystemVersion");
      v19 = sub_1000C8CB4(v37);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      watchOSVersion = v8->_watchOSVersion;
      v8->_watchOSVersion = (NSString *)v20;

      v23 = auto_unlock_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v8->_watchOSVersion;
        v26 = v8->_watchBuildVersion;
        *(_DWORD *)buf = 138412802;
        v40 = (int64_t)v25;
        v41 = 2112;
        v42 = (const __CFString *)v26;
        v43 = 2112;
        v44 = (int64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Created session (OS version: %@, build: %@, device: %@)", buf, 0x20u);
      }

    }
    v36 = 0;
    v8->_responseTimeout = (int64_t)sub_1000C8EE4((char *)&v36);
    v8->_responseTimeoutFromServer = v36;
    v36 = 0;
    v27 = sub_1000C91D4((char *)&v36);
    v8->_messageTimeout = (int64_t)v27;
    v8->_messageTimeoutFromServer = v36;
    v28 = auto_unlock_log(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      responseTimeout = v8->_responseTimeout;
      v31 = CFSTR("YES");
      messageTimeout = v8->_messageTimeout;
      messageTimeoutFromServer = v8->_messageTimeoutFromServer;
      if (v8->_responseTimeoutFromServer)
        v34 = CFSTR("YES");
      else
        v34 = CFSTR("NO");
      *(_DWORD *)buf = 134218754;
      if (!messageTimeoutFromServer)
        v31 = CFSTR("NO");
      v40 = responseTimeout;
      v41 = 2112;
      v42 = v34;
      v43 = 2048;
      v44 = messageTimeout;
      v45 = 2112;
      v46 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updated timeouts (responseTimeout: %ld, responseTimeoutFromServer: %@, messageTimeout: %ld, messageTimeoutFromServer: %@)", buf, 0x2Au);
    }

    v8->_watchOldLTKSyncStatus = -1;
    v8->_watchNewLTKSyncStatus = -1;

  }
  return v8;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000347FC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onqueue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint8_t v51[8];
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession generatedError](self, "generatedError"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceForUniqueID:", v5));

    v7 = objc_msgSend(v6, "isConnected");
    if ((_DWORD)v7 && (v7 = objc_msgSend(v6, "isNearby"), (_DWORD)v7))
    {
      v8 = -[SDAutoUnlockPairingLockSession placeholder](self, "placeholder");
      if (!v8)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
        if ((objc_msgSend(v23, "viewSyncing") & 1) != 0)
        {

        }
        else
        {
          v26 = +[SDAutoUnlockAKSManager useKeychainForLTKSyncing](SDAutoUnlockAKSManager, "useKeychainForLTKSyncing");

          if ((v26 & 1) != 0)
          {
            v28 = auto_unlock_log(v27);
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              sub_100039B98();

            v30 = SFAutoUnlockErrorDomain;
            v52 = NSLocalizedDescriptionKey;
            v53 = CFSTR("View not syncing");
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
            v16 = v30;
            v17 = 121;
            goto LABEL_14;
          }
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v32 = objc_msgSend(v31, "internetSharingEnabled");

        if ((v32 & 1) != 0)
        {
          v34 = auto_unlock_log(v33);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            sub_100039A94();

          v36 = SFAutoUnlockErrorDomain;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForInternetSharing](self, "userInfoForInternetSharing"));
          v16 = v36;
          v17 = 146;
        }
        else
        {
          v37 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
          if (v37
            && (v38 = (void *)v37,
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode")),
                v40 = objc_msgSend(v39, "length"),
                v39,
                v38,
                v40))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
            v42 = -[SDAutoUnlockPairingLockSession validatePasscode:](self, "validatePasscode:", v41);

            if (v42)
            {
              -[SDAutoUnlockPairingLockSession sendSetupRequest](self, "sendSetupRequest");
              v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
              objc_msgSend(v44, "reloadPairingRecordsIfNeeded");

              goto LABEL_15;
            }
            v48 = auto_unlock_log(v43);
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              sub_100039B6C();

            v50 = SFAutoUnlockErrorDomain;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForKeychainMismatch](self, "userInfoForKeychainMismatch"));
            v16 = v50;
            v17 = 174;
          }
          else
          {
            v45 = auto_unlock_log(v37);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              sub_100039AC0(self, v46);

            v47 = SFAutoUnlockErrorDomain;
            v54 = NSLocalizedDescriptionKey;
            v55 = CFSTR("No password");
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
            v16 = v47;
            v17 = 112;
          }
        }
LABEL_14:
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, v17, v15));
        -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v22);

LABEL_15:
        goto LABEL_16;
      }
      v9 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device is placeholder", v51, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      v12 = objc_msgSend(v11, "localDeviceIDSRegistered");

      if (v12)
      {
        v14 = SFAutoUnlockErrorDomain;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForWatchNotSignedIn](self, "userInfoForWatchNotSignedIn"));
        v16 = v14;
        v17 = 150;
        goto LABEL_14;
      }
      v24 = auto_unlock_log(v13);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Mac not IDS registered", v51, 2u);
      }

      v20 = SFAutoUnlockErrorDomain;
      v21 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMacNotSignedIn](self, "userInfoForMacNotSignedIn"));
    }
    else
    {
      v18 = auto_unlock_log(v7);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100039BC4(v6, v19);

      v20 = SFAutoUnlockErrorDomain;
      v21 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoCommunincation](self, "userInfoForNoCommunincation"));
    }
    v15 = (void *)v21;
    v16 = v20;
    v17 = 178;
    goto LABEL_14;
  }
  -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v3);
LABEL_16:

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034D88;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onqueue_cancel
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  if (!-[SDAutoUnlockPairingLockSession canceled](self, "canceled"))
  {
    -[SDAutoUnlockPairingLockSession setCanceled:](self, "setCanceled:", 1);
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    v3 = SFAutoUnlockErrorDomain;
    v6 = NSLocalizedDescriptionKey;
    v7 = CFSTR("Pairing lock session canceled");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 118, v4));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);

  }
}

- (void)updateForCloudPairing
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034EEC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onqueue_updateForCloudPairing
{
  if (!-[SDAutoUnlockPairingLockSession canceled](self, "canceled")
    && !-[SDAutoUnlockPairingLockSession unlockEnabled](self, "unlockEnabled"))
  {
    if (-[SDAutoUnlockPairingLockSession waitingForCloudPairing](self, "waitingForCloudPairing"))
      -[SDAutoUnlockPairingLockSession handleSuccessfulPairing](self, "handleSuccessfulPairing");
  }
}

- (void)invalidate
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  objc_super v9;
  uint8_t buf[4];
  const __CFString *v11;

  v9.receiver = self;
  v9.super_class = (Class)SDAutoUnlockPairingLockSession;
  -[SDAutoUnlockPairingSession invalidate](&v9, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v4 = objc_msgSend(v3, "resetSession");

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }

}

- (id)generatedError
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = sub_1000CE8D0(CFSTR("AUGenerateNoPasscode"), 0);
  v4 = sub_1000CE8D0(CFSTR("AUGenerateNoWristDetection"), 0);
  v5 = sub_1000CE8D0(CFSTR("AUGenerateNoCommunication"), 0);
  if (v3 && v4)
  {
    v6 = SFAutoUnlockErrorDomain;
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoWristDetectionNoPasscode](self, "userInfoForNoWristDetectionNoPasscode"));
  }
  else if (v4)
  {
    v6 = SFAutoUnlockErrorDomain;
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoWristDetection](self, "userInfoForNoWristDetection"));
  }
  else if (v3)
  {
    v6 = SFAutoUnlockErrorDomain;
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoPasscode](self, "userInfoForNoPasscode"));
  }
  else
  {
    if (!v5)
    {
      v9 = 0;
      return v9;
    }
    v6 = SFAutoUnlockErrorDomain;
    v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoCommunincation](self, "userInfoForNoCommunincation"));
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 119, v7));

  return v9;
}

- (void)handleTimerFired
{
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[8];
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response timer fired", v11, 2u);
  }

  -[SDAutoUnlockPairingLockSession setErrorType:](self, "setErrorType:", 1);
  if ((id)-[SDAutoUnlockPairingLockSession sendState](self, "sendState") == (id)1)
  {
    v5 = CFSTR("Timeout waiting for response to initial request");
    v6 = 153;
  }
  else
  {
    v7 = -[SDAutoUnlockPairingLockSession sendState](self, "sendState");
    v5 = CFSTR("Request timeout");
    if (v7 == 2)
    {
      v5 = CFSTR("Timeout waiting for response to token exchange request");
      v6 = 154;
    }
    else
    {
      v6 = 103;
    }
  }
  v12 = NSLocalizedDescriptionKey;
  v13 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  if (-[SDAutoUnlockPairingLockSession waitingForCloudPairing](self, "waitingForCloudPairing"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNotCloudPaired](self, "userInfoForNotCloudPaired"));

    v6 = 134;
    v8 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, v6, v8));
  -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v10);

}

- (BOOL)validatePasscode:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  _DWORD v16[2];

  v3 = a3;
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Validating passcode", (uint8_t *)v16, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  v7 = MKBUnlockDevice(v6, 0);
  v8 = v7;
  v9 = auto_unlock_log(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v16[0] = 67109120;
      v16[1] = v8;
      v12 = "Passcode invalid (error: %d)";
      v13 = v10;
      v14 = 8;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v16, v14);
    }
  }
  else if (v11)
  {
    LOWORD(v16[0]) = 0;
    v12 = "Passcode validated";
    v13 = v10;
    v14 = 2;
    goto LABEL_8;
  }

  return v8 == 0;
}

+ (int64_t)setupRequestVersion
{
  return 2;
}

- (BOOL)useAttestedProtocol
{
  return 1;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned int v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned int v37;
  void *v38;
  void *v39;
  unsigned int v40;
  unsigned __int8 v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  void *v49;
  unsigned int v50;
  unsigned int v51;
  _BOOL4 v52;
  unsigned int v53;
  void *v54;
  uint8_t buf[4];
  id v56;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing lock session notifying delegate with error: %@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "code") == (id)134)
  {
    v7 = IsAppleInternalBuild() != 0;
    if (!v4)
      goto LABEL_23;
  }
  else
  {
    v7 = 0;
    if (!v4)
      goto LABEL_23;
  }
  if (objc_msgSend(v4, "code") != (id)119
    && objc_msgSend(v4, "code") != (id)150
    && objc_msgSend(v4, "code") != (id)178
    && objc_msgSend(v4, "code") != (id)148
    && objc_msgSend(v4, "code") != (id)125
    && objc_msgSend(v4, "code") != (id)129
    && objc_msgSend(v4, "code") != (id)146
    && objc_msgSend(v4, "code") != (id)173
    && objc_msgSend(v4, "code") != (id)174
    && objc_msgSend(v4, "code") != (id)177
    && objc_msgSend(v4, "code") != (id)196)
  {
    v8 = objc_msgSend(v4, "code") == (id)205 || v7;
    if ((v8 & 1) == 0)
    {
      v9 = SFAutoUnlockErrorDomain;
      v10 = objc_msgSend(v4, "code");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoCommunincation](self, "userInfoForNoCommunincation"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, v10, v11));

      v4 = (id)v12;
    }
  }
LABEL_23:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "session:didCompleteWithError:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    objc_msgSend(v15, "session:didCompleteWithError:", self, v4);

  }
  v16 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession setupError](self, "setupError"));
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v4;
  v19 = v18;

  if (objc_msgSend(v4, "code") == (id)150)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "watchExistedInUnlockList"));
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastSeenWatchDate"));
    else
      v23 = 0;
    v54 = (void *)v23;

    v53 = v22;
  }
  else
  {
    v54 = 0;
    v53 = 1;
  }
  v52 = v4 == 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));
  v51 = objc_msgSend(v24, "ltkSyncStatusForDeviceID:hash:modern:", v25, v26, 0) != 0;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));
  v50 = objc_msgSend(v27, "ltkSyncStatusForDeviceID:hash:modern:", v28, v29, 1) != 0;

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession keyDeviceModel](self, "keyDeviceModel"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession companionDeviceModel](self, "companionDeviceModel"));
  -[SDAutoUnlockPairingLockSession keyExchangeInterval](self, "keyExchangeInterval");
  v31 = v30;
  -[SDAutoUnlockPairingLockSession tokenExchangeInterval](self, "tokenExchangeInterval");
  v33 = v32;
  v47 = -[SDAutoUnlockPairingLockSession keyDeviceLocked](self, "keyDeviceLocked");
  v46 = -[SDAutoUnlockPairingLockSession errorType](self, "errorType");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
  v44 = objc_msgSend(v19, "code");
  v41 = -[SDAutoUnlockPairingLockSession upsellDevice](self, "upsellDevice");
  v40 = -[SDAutoUnlockPairingLockSession responseTimeout](self, "responseTimeout");
  LOBYTE(v27) = -[SDAutoUnlockPairingLockSession responseTimeoutFromServer](self, "responseTimeoutFromServer") != 0;
  v34 = -[SDAutoUnlockPairingLockSession messageTimeout](self, "messageTimeout");
  v35 = -[SDAutoUnlockPairingLockSession messageTimeoutFromServer](self, "messageTimeoutFromServer") != 0;
  v43 = v19;
  v36 = -[SDAutoUnlockPairingLockSession setupRetryDevice](self, "setupRetryDevice");
  LODWORD(v29) = -[SDAutoUnlockPairingLockSession watchOldLTKSyncStatus](self, "watchOldLTKSyncStatus");
  v42 = v4;
  v37 = -[SDAutoUnlockPairingLockSession watchNewLTKSyncStatus](self, "watchNewLTKSyncStatus");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession watchBuildVersion](self, "watchBuildVersion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession watchOSVersion](self, "watchOSVersion"));
  sub_1000C76C4(v49, v48, v47, v52, v46, v45, v44, v53, v31, v33, v54, v41, v40, v27, v34, v35, v36, v51, v50,
    v29,
    v37,
    v38,
    v39,
    -[SDAutoUnlockPairingLockSession receivedSetupACK](self, "receivedSetupACK"),
    -[SDAutoUnlockPairingLockSession receivedTokenACK](self, "receivedTokenACK"));

}

- (void)notifyDelegateKeyDeviceIsLocked
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "sessionDidReceiveKeyDeviceLocked:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    objc_msgSend(v5, "sessionDidReceiveKeyDeviceLocked:", self);

  }
}

- (void)restartLTKTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting LTK timer", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  if (!v5)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100035BC4;
    v12[3] = &unk_1007145D0;
    objc_copyWeak(&v13, (id *)buf);
    v7 = sub_10019AAD8(0, v6, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDAutoUnlockPairingLockSession setLtkTimer:](self, "setLtkTimer:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
    dispatch_resume(v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  v11 = sub_10019AAC0(15.0);
  sub_10019AB78(v10, v11);

}

- (void)invalidateLTKTimer
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidate LTK timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockPairingLockSession setLtkTimer:](self, "setLtkTimer:", 0);
  }
}

- (void)handleLTKTimerFired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  objc_msgSend(v3, "checkRemoteLTKForDeviceID:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  objc_msgSend(v5, "updatePreferredRemoteLTKForDeviceID:", v6);

  v7 = -[SDAutoUnlockPairingLockSession ltkHashMatches](self, "ltkHashMatches");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteLTKForDeviceID:", v9));

  if (v10 && v7)
  {
    -[SDAutoUnlockPairingLockSession handleEscrowSessionRequest](self, "handleEscrowSessionRequest");
  }
  else
  {
    v11 = -[SDAutoUnlockPairingLockSession ltkTimerRetryCount](self, "ltkTimerRetryCount");
    if (v11 > 4)
    {
      v12 = auto_unlock_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Timed out waiting for LTK to sync", v17, 2u);
      }

      v14 = SFAutoUnlockErrorDomain;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 176, v15));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);

    }
    else
    {
      -[SDAutoUnlockPairingLockSession setLtkTimerRetryCount:](self, "setLtkTimerRetryCount:", (char *)-[SDAutoUnlockPairingLockSession ltkTimerRetryCount](self, "ltkTimerRetryCount") + 1);
      -[SDAutoUnlockPairingLockSession restartLTKTimer](self, "restartLTKTimer");
    }
  }
}

- (BOOL)ltkHashMatches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));

  if (v3)
  {
    v12 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));
    v7 = objc_msgSend(v4, "hashMatchesAnyRemoteLTKForDeviceID:ltkHash:isPreferred:", v5, v6, &v12);

    if (v7 && !v12)
    {
      v9 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_100039C94();

    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSDate *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSDate *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v10);

  if (v5 > 2001)
  {
    if (v5 != 2002)
    {
      if (v5 != 2004)
      {
        if (v5 != 2005)
          goto LABEL_18;
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  else if (v5 != 102)
  {
    if (v5 != 104)
    {
      if (v5 != 105)
        goto LABEL_18;
LABEL_9:
      v11 = auto_unlock_log(-[SDAutoUnlockPairingLockSession setKeyDeviceLocked:](self, "setKeyDeviceLocked:", 1));
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypePairingKeyDeviceLocked", buf, 2u);
      }

      -[SDAutoUnlockPairingLockSession handleKeyDeviceLocked](self, "handleKeyDeviceLocked");
      goto LABEL_18;
    }
LABEL_15:
    v18 = objc_opt_new(NSDate);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession tokenExchangeDate](self, "tokenExchangeDate"));
    -[NSDate timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v19);
    -[SDAutoUnlockPairingLockSession setTokenExchangeInterval:](self, "setTokenExchangeInterval:");

    v21 = auto_unlock_log(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupCreateRecord", v23, 2u);
    }

    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    -[SDAutoUnlockPairingLockSession handleSetupCreateRecord:](self, "handleSetupCreateRecord:", v8);
    goto LABEL_18;
  }
  v13 = objc_opt_new(NSDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession keyExchangeDate](self, "keyExchangeDate"));
  -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", v14);
  -[SDAutoUnlockPairingLockSession setKeyExchangeInterval:](self, "setKeyExchangeInterval:");

  v16 = auto_unlock_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupSessionCreated", v24, 2u);
  }

  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  -[SDAutoUnlockPairingLockSession handleSetupSessionCreated:fromDeviceID:](self, "handleSetupSessionCreated:fromDeviceID:", v8, v9);
LABEL_18:

}

- (void)handleKeyDeviceLocked
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v3)
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not notified of locked device, session canceled", buf, 2u);
    }

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForWatchLocked](self, "userInfoForWatchLocked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, 119, v7));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v6);

  }
}

- (void)handleSetupSessionCreated:(id)a3 fromDeviceID:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  SDUnlockSetupSessionCreated *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  SDAutoUnlockPairingLockSession *v54;
  uint64_t v55;
  void *v56;
  unsigned __int8 v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  unsigned __int8 v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  int v73;
  void *v74;

  v6 = a3;
  v7 = a4;
  v8 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v8)
  {
    v9 = auto_unlock_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v73) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session created", (uint8_t *)&v73, 2u);
    }

    goto LABEL_52;
  }
  v11 = -[SDUnlockSetupSessionCreated initWithData:]([SDUnlockSetupSessionCreated alloc], "initWithData:", v6);
  -[SDAutoUnlockPairingLockSession setSessionCreatedMessage:](self, "setSessionCreatedMessage:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  v13 = objc_msgSend(v12, "hasErrorCode");

  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v16 = objc_msgSend(v15, "errorCode");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v18 = objc_msgSend(v17, "hasFailureReasons");

    if (!v18)
      goto LABEL_32;
    v20 = auto_unlock_log(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      v73 = 67109120;
      LODWORD(v74) = objc_msgSend(v22, "failureReasons");
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received failure reasons %d", (uint8_t *)&v73, 8u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v24 = objc_msgSend(v23, "failureReasons");

    if ((v24 & 4) != 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoCompanionViewNotSyncing](self, "userInfoCompanionViewNotSyncing"));
      v54 = self;
      v55 = 7;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      if ((objc_msgSend(v25, "failureReasons") & 1) != 0)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        v57 = objc_msgSend(v56, "failureReasons");

        if ((v57 & 2) != 0)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoWristDetectionNoPasscode](self, "userInfoForNoWristDetectionNoPasscode"));
          v54 = self;
          v55 = 4;
          goto LABEL_48;
        }
      }
      else
      {

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      v59 = objc_msgSend(v58, "failureReasons");

      if ((v59 & 1) != 0)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoPasscode](self, "userInfoForNoPasscode"));
        v54 = self;
        v55 = 2;
      }
      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        v61 = objc_msgSend(v60, "failureReasons");

        if ((v61 & 2) == 0)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
          v63 = objc_msgSend(v62, "failureReasons");

          if ((v63 & 8) == 0)
          {
LABEL_32:
            switch(v16)
            {
              case 0x7Du:
                v66 = auto_unlock_log(v19);
                v67 = objc_claimAutoreleasedReturnValue(v66);
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                  sub_100039D5C();

                v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                v53 = v19;
                v16 = 125;
                break;
              case 0x81u:
                v68 = auto_unlock_log(v19);
                v69 = objc_claimAutoreleasedReturnValue(v68);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                  sub_100039D88();

                v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                v53 = v19;
                v16 = 129;
                break;
              case 0xC4u:
                v64 = auto_unlock_log(v19);
                v65 = objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  sub_100039D30();

                v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                v53 = v19;
                v16 = 196;
                break;
              default:
                v53 = 0;
                break;
            }
            goto LABEL_49;
          }
          v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForiPhoneNeedsUnlock](self, "userInfoForiPhoneNeedsUnlock"));
          v53 = v19;
          v16 = 177;
LABEL_49:
          v70 = auto_unlock_log(v19);
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            sub_100039CC0(v16, v71);

          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, v16, v53));
          -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v72);

          goto LABEL_52;
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoWristDetection](self, "userInfoForNoWristDetection"));
        v54 = self;
        v55 = 3;
      }
    }
LABEL_48:
    v19 = -[SDAutoUnlockPairingLockSession setErrorType:](v54, "setErrorType:", v55);
    v16 = 119;
    goto LABEL_49;
  }
  v26 = auto_unlock_log(v14);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v73 = 67109120;
    LODWORD(v74) = objc_msgSend(v28, "version");
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Pairing session version is %d", (uint8_t *)&v73, 8u);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  v30 = objc_msgSend(v29, "version");

  if (v30 == 4)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "longTermKey"));
    objc_msgSend(v31, "signAndStoreRemoteLTK:forDeviceID:", v33, v7);

    -[SDAutoUnlockPairingLockSession handleDeviceAuthenticationSetupRequest](self, "handleDeviceAuthenticationSetupRequest");
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v35 = objc_msgSend(v34, "hasWatchOldLTKSyncStatus");

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      -[SDAutoUnlockPairingLockSession setWatchOldLTKSyncStatus:](self, "setWatchOldLTKSyncStatus:", objc_msgSend(v36, "watchOldLTKSyncStatus"));

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v38 = objc_msgSend(v37, "hasWatchNewLTKSyncStatus");

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      -[SDAutoUnlockPairingLockSession setWatchNewLTKSyncStatus:](self, "setWatchNewLTKSyncStatus:", objc_msgSend(v39, "watchNewLTKSyncStatus"));

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v41 = objc_msgSend(v40, "hasLtkHash");

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "ltkHash"));
      -[SDAutoUnlockPairingLockSession setRemoteLTKHash:](self, "setRemoteLTKHash:", v43);

      v45 = auto_unlock_log(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));
        v73 = 138412290;
        v74 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Remote LTK Hash: %@", (uint8_t *)&v73, 0xCu);

      }
    }
    if (!-[SDAutoUnlockPairingLockSession ltkHashMatches](self, "ltkHashMatches"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      objc_msgSend(v48, "checkRemoteLTKForDeviceID:", v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      objc_msgSend(v50, "updatePreferredRemoteLTKForDeviceID:", v51);

    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    objc_msgSend(v52, "updateLTKs");

    -[SDAutoUnlockPairingLockSession handleEscrowSessionRequest](self, "handleEscrowSessionRequest");
  }
LABEL_52:

}

- (void)handleEscrowSessionRequest
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  uint64_t v62;
  NSErrorUserInfoKey v63;
  const __CFString *v64;
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  NSErrorUserInfoKey v69;
  const __CFString *v70;

  v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v3)
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
    }

    return;
  }
  if (sub_1000CE8D0(CFSTR("AURestrictOldWatch"), 1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v7 = objc_msgSend(v6, "version");

    if (v7 < 2uLL)
    {
      v9 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        *(_DWORD *)buf = 67109120;
        LODWORD(v66) = objc_msgSend(v11, "version");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setup received response from old watch (version: %d)", buf, 8u);

      }
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForOldProtocol](self, "userInfoForOldProtocol"));
      v13 = SFAutoUnlockErrorDomain;
      v14 = 126;
LABEL_14:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, v14, v12));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v21);

      goto LABEL_15;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  v16 = objc_msgSend(v15, "version");

  if (v16 > 3uLL)
  {
    v18 = auto_unlock_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      *(_DWORD *)buf = 67109120;
      LODWORD(v66) = objc_msgSend(v20, "version");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setup received response from new watch (version: %d)", buf, 8u);

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNewProtocol](self, "userInfoForNewProtocol"));
    v13 = SFAutoUnlockErrorDomain;
    v14 = 173;
    goto LABEL_14;
  }
  v62 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  v23 = objc_msgSend(v22, "hasToken");

  if (!v23)
  {
    v62 = 155;
    v36 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    if (objc_msgSend(v36, "hasToken"))
      v38 = CFSTR("YES");
    else
      v38 = CFSTR("NO");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "token"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Auto Unlock: Missing information for escrow session (has token = %@, token = %@)"), v38, v40));

    goto LABEL_27;
  }
  v24 = -[SDAutoUnlockPairingLockSession ltkHashMatches](self, "ltkHashMatches");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "remoteLTKForDeviceID:", v26));

  if (v27 && v24)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "aksPairingSessionForDeviceID:originator:errorCode:requiresAttestation:requiresEscrow:", v29, 0, &v62, 1, 0));
    -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    LODWORD(v29) = objc_msgSend(v31, "sessionIsValid");

    if (!(_DWORD)v29)
    {
      if (v62 == 148)
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
      }
      else
      {
        v69 = NSLocalizedDescriptionKey;
        v70 = CFSTR("Invalid AKS session");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
        v59 = auto_unlock_log(v12);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          sub_100039E14();

      }
      v13 = SFAutoUnlockErrorDomain;
      v14 = v62;
      goto LABEL_14;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "token"));
    v61 = 0;
    v35 = objc_msgSend(v32, "stepSessionWithData:outputData:", v34, &v61);
    v36 = v61;

    if (v35)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:](self, "sendCreateSecretWithStepData:sessionID:", v36, objc_msgSend(v37, "sessionID"));

      v12 = 0;
    }
    else
    {
      v62 = 162;
      v12 = CFSTR("Could not setup escrow session");
    }
LABEL_27:

    if (!v12)
      return;
    v42 = auto_unlock_log(v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_100039DB4();

    v44 = SFAutoUnlockErrorDomain;
    v45 = v62;
    v63 = NSLocalizedDescriptionKey;
    v64 = CFSTR("Request failure");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v44, v45, v46));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v47);

LABEL_15:
    return;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  v49 = objc_msgSend(v48, "ltkSyncing");

  if (v49)
  {
    -[SDAutoUnlockPairingLockSession restartLTKTimer](self, "restartLTKTimer");
  }
  else
  {
    v51 = auto_unlock_log(v50);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = CFSTR("NO");
      if (v27)
        v54 = CFSTR("YES");
      else
        v54 = CFSTR("NO");
      if (v24)
        v53 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v66 = v54;
      v67 = 2112;
      v68 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "LTK invalid (exists: %@, hash matches: %@)", buf, 0x16u);
    }

    if (v27)
      v55 = 193;
    else
      v55 = 148;
    v62 = v55;
    v56 = SFAutoUnlockErrorDomain;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v56, v55, v57));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v58);

  }
}

- (void)handleDeviceAuthenticationSetupRequest
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint8_t buf[8];
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;

  v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (!v3)
  {
    *(_QWORD *)buf = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v7 = objc_msgSend(v6, "hasToken");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteLTKForDeviceID:", v9));

      if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aksPairingSessionForDeviceID:originator:errorCode:requiresAttestation:requiresEscrow:", v13, 0, buf, 1, 0));
        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        LODWORD(v13) = objc_msgSend(v15, "sessionIsValid");

        if ((_DWORD)v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "token"));
          v40 = 0;
          v19 = objc_msgSend(v16, "stepSessionWithData:outputData:", v18, &v40);
          v20 = v40;

          if (v19)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
            -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:](self, "sendCreateSecretWithStepData:sessionID:", v20, objc_msgSend(v21, "sessionID"));

            v22 = 0;
          }
          else
          {
            *(_QWORD *)buf = 162;
            v22 = CFSTR("Could not setup device authentication session");
          }
LABEL_14:

          if (!v22)
            return;
          v27 = auto_unlock_log(v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            sub_100039DB4();

          v29 = SFAutoUnlockErrorDomain;
          v30 = *(_QWORD *)buf;
          v42 = NSLocalizedDescriptionKey;
          v43 = CFSTR("Request failure");
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v29, v30, v31));
          -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v32);

          goto LABEL_29;
        }
        if (*(_QWORD *)buf == 148)
        {
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
        }
        else
        {
          v44 = NSLocalizedDescriptionKey;
          v45 = CFSTR("Invalid AKS session");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
          v38 = auto_unlock_log(v22);
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            sub_100039E14();

        }
        v36 = SFAutoUnlockErrorDomain;
        v37 = *(_QWORD *)buf;
      }
      else
      {
        v33 = auto_unlock_log(v11);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          sub_100039E40();

        v35 = SFAutoUnlockErrorDomain;
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
        v36 = v35;
        v37 = 148;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v36, v37, v22));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v31);
LABEL_29:

      return;
    }
    *(_QWORD *)buf = 155;
    v20 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    if (objc_msgSend(v20, "hasToken"))
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "token"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Auto Unlock: Missing information for escrow session (has token = %@, token = %@)"), v23, v25));

    goto LABEL_14;
  }
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
  }

}

- (void)handleSetupCreateRecord:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  SDUnlockSetupCreateRecord *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[8];
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  NSErrorUserInfoKey v45;
  const __CFString *v46;
  NSErrorUserInfoKey v47;
  const __CFString *v48;

  v4 = a3;
  v5 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v5)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
    }
    goto LABEL_15;
  }
  v8 = -[SDUnlockSetupCreateRecord initWithData:]([SDUnlockSetupCreateRecord alloc], "initWithData:", v4);
  v7 = v8;
  if (v8
    && -[SDUnlockSetupCreateRecord hasToken](v8, "hasToken")
    && (-[NSObject hasErrorCode](v7, "hasErrorCode") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject token](v7, "token"));
    v19 = objc_msgSend(v17, "stepSessionWithData:outputData:", v18, 0);

    if (!v19)
    {
      v11 = CFSTR("Final step failed");
      v9 = 164;
      goto LABEL_11;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
    v9 = (uint64_t)objc_msgSend(v20, "finalizeEscrowPairing:", v21);

    if (v9)
    {
      v11 = CFSTR("Finalizing pairing failed");
LABEL_11:
      v12 = auto_unlock_log(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100039E6C();

      v14 = SFAutoUnlockErrorDomain;
      v43 = NSLocalizedDescriptionKey;
      v44 = CFSTR("Record failure");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, v9, v15));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);

      goto LABEL_14;
    }
    v10 = (__CFString *)-[NSObject hasPairedDeviceID](v7, "hasPairedDeviceID");
    if (!(_DWORD)v10)
    {
      v11 = CFSTR("Pairing response missing companion device ID");
      v9 = 156;
      goto LABEL_11;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pairedDeviceID](v7, "pairedDeviceID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    objc_msgSend(v22, "setCompanionID:forWatchID:", v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    objc_msgSend(v25, "setPairingID:forWatchID:", v27, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pairedDeviceID](v7, "pairedDeviceID"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "idsDeviceForUniqueID:", v30));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString modelIdentifier](v11, "modelIdentifier"));
    -[SDAutoUnlockPairingLockSession setCompanionDeviceModel:](self, "setCompanionDeviceModel:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "generateSessionToken"));

    if (v15)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v35 = objc_msgSend(v33, "storeRangingKey:forDeviceID:", v15, v34);

      if (v35)
      {
        -[SDAutoUnlockPairingLockSession handleSuccessfulPairing](self, "handleSuccessfulPairing");
LABEL_14:

        goto LABEL_15;
      }
      v40 = SFAutoUnlockErrorDomain;
      v47 = NSLocalizedDescriptionKey;
      v48 = CFSTR("Failed to store session token");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
      v38 = v40;
      v39 = 168;
    }
    else
    {
      v36 = SFAutoUnlockErrorDomain;
      v45 = NSLocalizedDescriptionKey;
      v46 = CFSTR("Failed to create session token");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
      v38 = v36;
      v39 = 167;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v38, v39, v37));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v41);

    goto LABEL_14;
  }
  if (-[NSObject hasErrorCode](v7, "hasErrorCode"))
    v9 = -[NSObject errorCode](v7, "errorCode");
  else
    v9 = 171;
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Auto Unlock: Creating escrow record failed (error code: %d)"), -[NSObject errorCode](v7, "errorCode")));
  v11 = v10;
  if (v10)
    goto LABEL_11;
LABEL_15:

}

- (void)handleSuccessfulPairing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  uint8_t buf[4];
  NSMutableArray *v45;
  __int16 v46;
  void *v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceForUniqueID:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", v5, 0, 0));

  if (objc_msgSend(v7, "unlockEnabled"))
  {
    -[SDAutoUnlockPairingLockSession setUnlockEnabled:](self, "setUnlockEnabled:", 1);
    v8 = auto_unlock_log(-[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0));
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    goto LABEL_30;
  }
  if (!objc_msgSend(v7, "unlockEnabled"))
    goto LABEL_11;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothID"));
  if (!v10)
    goto LABEL_11;
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proxyBluetoothID"));
  if (v12)
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v7, "supportsAlwaysDirect");

  if (!v13)
  {
LABEL_11:
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothID"));
    if (v16
      && (v17 = (void *)v16,
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proxyBluetoothID")),
          v18,
          v17,
          v18))
    {
      v19 = auto_unlock_log(v16);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100039EF8();

      v21 = SFAutoUnlockErrorDomain;
      v42 = NSLocalizedDescriptionKey;
      v43 = CFSTR("Unlock not enabled after pairing");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 133, v9));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v22);

    }
    else
    {
      v23 = auto_unlock_log(v16);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothID"));
        v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proxyBluetoothID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
        *(_DWORD *)buf = 138412546;
        v45 = v26;
        v46 = 2112;
        v47 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for cloud pairing (Watch ID: %@, Companion ID: %@)", buf, 0x16u);

      }
      -[SDAutoUnlockPairingLockSession setWaitingForCloudPairing:](self, "setWaitingForCloudPairing:", 1);
      v9 = objc_opt_new(NSMutableArray);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothID"));

      if (!v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        -[NSMutableArray addObject:](v9, "addObject:", v30);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proxyBluetoothID"));

      if (!v31)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "companionIDForWatchID:", v34));

        if (v35)
        {
          -[NSMutableArray addObject:](v9, "addObject:", v35);
        }
        else
        {
          v37 = auto_unlock_log(v36);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            sub_100039ECC();

        }
      }
      v39 = auto_unlock_log(v32);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v9;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Retrying cloud pairing for specific devices %@", buf, 0xCu);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      objc_msgSend(v41, "triggerCloudPairRetryWithShortRetryDeviceIDs:", v9);

      -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(480.0));
    }
    goto LABEL_30;
  }
LABEL_9:
  -[SDAutoUnlockPairingLockSession setUnlockEnabled:](self, "setUnlockEnabled:", 1);
  v14 = auto_unlock_log(-[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0));
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEFAULT))
  {
LABEL_10:
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    *(_DWORD *)buf = 138412290;
    v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, &v9->super.super, OS_LOG_TYPE_DEFAULT, "Enabled for device: %@", buf, 0xCu);

  }
LABEL_30:

}

- (void)sendSetupRequest
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037FC4;
  v7[3] = &unk_1007149D8;
  v7[4] = self;
  v2 = objc_retainBlock(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100038308;
  v5[3] = &unk_100714A00;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "generateLocalAttestedLTKIfNeccessaryWithCompletion:", v5);

}

- (void)sendCreateSecretWithStepData:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  SDUnlockSetupCreateSecret *v9;
  NSDate *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  SDAutoUnlockPairingLockSession *v23;
  uint8_t buf[16];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSetupCreateSecret", buf, 2u);
  }

  -[SDAutoUnlockPairingLockSession setSendState:](self, "setSendState:", 2);
  v9 = objc_alloc_init(SDUnlockSetupCreateSecret);
  -[SDUnlockSetupCreateSecret setSessionID:](v9, "setSessionID:", v4);
  -[SDUnlockSetupCreateSecret setToken:](v9, "setToken:", v6);

  v10 = objc_opt_new(NSDate);
  -[SDAutoUnlockPairingLockSession setTokenExchangeDate:](self, "setTokenExchangeDate:", v10);

  v11 = -[SDAutoUnlockPairingLockSession useAttestedProtocol](self, "useAttestedProtocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret data](v9, "data"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockPairingLockSession messageTimeout](self, "messageTimeout")));
  v20 = 3221225472;
  v21 = sub_100038510;
  v22 = &unk_1007148C8;
  v23 = self;
  v19 = _NSConcreteStackBlock;
  if (v11)
    v17 = 2003;
  else
    v17 = 103;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", v13, v14, v17, v15, 0, v16, &v19, v19, v20, v21, v22, v23));
  -[SDAutoUnlockPairingLockSession setTokenMessageIdentifier:](self, "setTokenMessageIdentifier:", v18);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)-[SDAutoUnlockPairingLockSession responseTimeout](self, "responseTimeout")));
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unsigned __int16 v17;

  v9 = a4;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000386D4;
  v14[3] = &unk_1007145F8;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a5;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, v14);

}

- (void)transport:(id)a3 didReceiveMessageACKForIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = a4;
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession setupMessageIdentifier](self, "setupMessageIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession tokenMessageIdentifier](self, "tokenMessageIdentifier"));
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received ACK (identifier: %@, setup ID: %@, token ID: %@)", (uint8_t *)&v12, 0x20u);

  }
  if (-[SDAutoUnlockPairingLockSession receivedSetupACK](self, "receivedSetupACK"))
  {
    -[SDAutoUnlockPairingLockSession setReceivedSetupACK:](self, "setReceivedSetupACK:", 1);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession setupMessageIdentifier](self, "setupMessageIdentifier"));
    -[SDAutoUnlockPairingLockSession setReceivedSetupACK:](self, "setReceivedSetupACK:", objc_msgSend(v5, "isEqualToString:", v10));

  }
  if (-[SDAutoUnlockPairingLockSession receivedTokenACK](self, "receivedTokenACK"))
  {
    -[SDAutoUnlockPairingLockSession setReceivedTokenACK:](self, "setReceivedTokenACK:", 1);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession tokenMessageIdentifier](self, "tokenMessageIdentifier"));
    -[SDAutoUnlockPairingLockSession setReceivedTokenACK:](self, "setReceivedTokenACK:", objc_msgSend(v5, "isEqualToString:", v11));

  }
}

- (id)userInfoForiPhoneNeedsUnlock
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_UNLOCK_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_UNLOCK_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForKeychainMismatch
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_KEYCHAIN_MISMATCH_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_KEYCHAIN_MISMATCH_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForInternetSharing
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_INTERNET_SHARING_SETUP_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_INTERNET_SHARING_SETUP_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForMissingLTK
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_FAILED_COMMUNICATION_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_FAILED_COMMUNICATION_KEY_SYNC_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForWatchNotSignedIn
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_PHONE_NOT_SIGNED_IN_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_PHONE_NOT_SIGNED_IN_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForMacNotSignedIn
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_PHONE_NOT_SIGNED_IN_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_PHONE_NOT_SIGNED_IN_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNotCloudPaired
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = NSLocalizedDescriptionKey;
  v3[1] = SFAutoUnlockManagerErrorTitleKey;
  v4[0] = CFSTR("[Internal] Bluetooth cloud pairing in progress.");
  v4[1] = CFSTR("[Internal] Bluetooth cloud pairing in progress.");
  v3[2] = SFAutoUnlockManagerErrorBodyKey;
  v4[2] = CFSTR("Auto Unlock can't be set up when your Mac is bluetooth cloud pairing to your Apple Watch. Please try again later.");
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
}

- (id)userInfoForWatchLocked
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_BODY_PHONE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoCompanionViewNotSyncing
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_SIGN_IN_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_SIGN_IN_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNoWristDetectionNoPasscode
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_AND_WRIST_DETECTION_REQUIRED_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_AND_WRIST_DETECTION_REQUIRED_BODY_PHONE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNoWristDetection
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_WRIST_DETECTION_REQUIRED_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_WRIST_DETECTION_REQUIRED_BODY_PHONE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNoPasscode
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_REQUIRED_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_REQUIRED_BODY_PHONE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNoCommunincation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_FAILED_COMMUNICATION_TITLE_PHONE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_FAILED_COMMUNICATION_BODY_PHONE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForOldProtocol
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_OLD_PROTOCOL_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_OLD_PROTOCOL_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)userInfoForNewProtocol
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_NEW_PROTOCOL_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_NEW_PROTOCOL_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)upsellDevice
{
  return self->_upsellDevice;
}

- (void)setUpsellDevice:(BOOL)a3
{
  self->_upsellDevice = a3;
}

- (BOOL)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(BOOL)a3
{
  self->_setupRetryDevice = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)waitingForCloudPairing
{
  return self->_waitingForCloudPairing;
}

- (void)setWaitingForCloudPairing:(BOOL)a3
{
  self->_waitingForCloudPairing = a3;
}

- (int64_t)sendState
{
  return self->_sendState;
}

- (void)setSendState:(int64_t)a3
{
  self->_sendState = a3;
}

- (NSString)keyDeviceModel
{
  return self->_keyDeviceModel;
}

- (void)setKeyDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_keyDeviceModel, a3);
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

- (NSString)companionDeviceModel
{
  return self->_companionDeviceModel;
}

- (void)setCompanionDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_companionDeviceModel, a3);
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
  objc_storeStrong((id *)&self->_setupError, a3);
}

- (BOOL)keyDeviceLocked
{
  return self->_keyDeviceLocked;
}

- (void)setKeyDeviceLocked:(BOOL)a3
{
  self->_keyDeviceLocked = a3;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (OS_dispatch_source)ltkTimer
{
  return self->_ltkTimer;
}

- (void)setLtkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ltkTimer, a3);
}

- (unsigned)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(unsigned int)a3
{
  self->_errorType = a3;
}

- (SDUnlockSetupSessionCreated)sessionCreatedMessage
{
  return self->_sessionCreatedMessage;
}

- (void)setSessionCreatedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sessionCreatedMessage, a3);
}

- (int64_t)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(int64_t)a3
{
  self->_responseTimeout = a3;
}

- (int64_t)responseTimeoutFromServer
{
  return self->_responseTimeoutFromServer;
}

- (void)setResponseTimeoutFromServer:(int64_t)a3
{
  self->_responseTimeoutFromServer = a3;
}

- (int64_t)messageTimeout
{
  return self->_messageTimeout;
}

- (void)setMessageTimeout:(int64_t)a3
{
  self->_messageTimeout = a3;
}

- (int64_t)messageTimeoutFromServer
{
  return self->_messageTimeoutFromServer;
}

- (void)setMessageTimeoutFromServer:(int64_t)a3
{
  self->_messageTimeoutFromServer = a3;
}

- (int64_t)ltkTimerRetryCount
{
  return self->_ltkTimerRetryCount;
}

- (void)setLtkTimerRetryCount:(int64_t)a3
{
  self->_ltkTimerRetryCount = a3;
}

- (NSDate)keyExchangeDate
{
  return self->_keyExchangeDate;
}

- (void)setKeyExchangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_keyExchangeDate, a3);
}

- (NSDate)tokenExchangeDate
{
  return self->_tokenExchangeDate;
}

- (void)setTokenExchangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_tokenExchangeDate, a3);
}

- (double)keyExchangeInterval
{
  return self->_keyExchangeInterval;
}

- (void)setKeyExchangeInterval:(double)a3
{
  self->_keyExchangeInterval = a3;
}

- (double)tokenExchangeInterval
{
  return self->_tokenExchangeInterval;
}

- (void)setTokenExchangeInterval:(double)a3
{
  self->_tokenExchangeInterval = a3;
}

- (NSData)remoteLTKHash
{
  return self->_remoteLTKHash;
}

- (void)setRemoteLTKHash:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLTKHash, a3);
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  self->_watchOldLTKSyncStatus = a3;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  self->_watchNewLTKSyncStatus = a3;
}

- (BOOL)receivedSetupACK
{
  return self->_receivedSetupACK;
}

- (void)setReceivedSetupACK:(BOOL)a3
{
  self->_receivedSetupACK = a3;
}

- (BOOL)receivedTokenACK
{
  return self->_receivedTokenACK;
}

- (void)setReceivedTokenACK:(BOOL)a3
{
  self->_receivedTokenACK = a3;
}

- (NSString)setupMessageIdentifier
{
  return self->_setupMessageIdentifier;
}

- (void)setSetupMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_setupMessageIdentifier, a3);
}

- (NSString)tokenMessageIdentifier
{
  return self->_tokenMessageIdentifier;
}

- (void)setTokenMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tokenMessageIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_setupMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteLTKHash, 0);
  objc_storeStrong((id *)&self->_tokenExchangeDate, 0);
  objc_storeStrong((id *)&self->_keyExchangeDate, 0);
  objc_storeStrong((id *)&self->_sessionCreatedMessage, 0);
  objc_storeStrong((id *)&self->_ltkTimer, 0);
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_companionDeviceModel, 0);
  objc_storeStrong((id *)&self->_watchOSVersion, 0);
  objc_storeStrong((id *)&self->_watchBuildVersion, 0);
  objc_storeStrong((id *)&self->_keyDeviceModel, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
