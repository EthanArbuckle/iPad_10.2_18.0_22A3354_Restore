@implementation SDAutoUnlockPairingKeySession

- (SDAutoUnlockPairingKeySession)initWithDevice:(id)a3 sessionID:(id)a4
{
  SDAutoUnlockPairingKeySession *v4;
  SDAutoUnlockPairingKeySession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockPairingKeySession;
  v4 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v7, "initWithDevice:sessionID:", a3, a4);
  v5 = v4;
  if (v4)
    -[SDAutoUnlockPairingKeySession addObservers](v4, "addObservers");
  return v5;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;

  v10.receiver = self;
  v10.super_class = (Class)SDAutoUnlockPairingKeySession;
  -[SDAutoUnlockPairingSession invalidate](&v10, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v5 = objc_msgSend(v4, "resetSession");

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C430;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onqueue_start
{
  SDUnlockSetupRequest *v3;
  void *v4;
  SDUnlockSetupRequest *v5;

  v3 = [SDUnlockSetupRequest alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession requestData](self, "requestData"));
  v5 = -[SDUnlockSetupRequest initWithData:](v3, "initWithData:", v4);
  -[SDAutoUnlockPairingKeySession setRequest:](self, "setRequest:", v5);

  -[SDAutoUnlockPairingKeySession handleSetupRequest](self, "handleSetupRequest");
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C510;
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

  if (!-[SDAutoUnlockPairingKeySession canceled](self, "canceled"))
  {
    -[SDAutoUnlockPairingKeySession setCanceled:](self, "setCanceled:", 1);
    v3 = SFAutoUnlockErrorDomain;
    v6 = NSLocalizedDescriptionKey;
    v7 = CFSTR("Pairing key session canceled");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 118, v4));
    -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);

  }
}

- (BOOL)canCreatePairing
{
  return 0;
}

- (BOOL)ltkHashMatches
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  v4 = objc_msgSend(v3, "hasLtkHash");

  if (v4)
  {
    v14 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ltkHash"));
    v9 = objc_msgSend(v5, "hashMatchesAnyRemoteLTKForDeviceID:ltkHash:isPreferred:", v6, v8, &v14);

    if (v9 && !v14)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_10002E1F8(v12);

    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)useAttestedProtocol
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  v3 = objc_msgSend(v2, "version") == 2;

  return v3;
}

- (void)handleTimerFired
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v3 = SFAutoUnlockErrorDomain;
  v20 = NSLocalizedDescriptionKey;
  v21 = CFSTR("Timeout waiting for response from Mac");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 197, v4));

  v6 = -[SDAutoUnlockPairingKeySession waitingForLTK](self, "waitingForLTK");
  if (v6)
  {
    v7 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002E234(v8, v9, v10, v11, v12, v13, v14, v15);

    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("Timeout waiting for LTKs");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v17 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 196, v16));

    -[SDAutoUnlockPairingKeySession sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:](self, "sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:", 0, 0, v17, 0, 0);
    v5 = (void *)v17;
  }
  -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);
  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");

}

- (void)addObservers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "keyBagLockStateChange:", CFSTR("com.apple.sharingd.KeyBagLockStatusChanged"), 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "watchLTKsChanged:", CFSTR("SDAutoUnlockAKSManagerWatchLTKsUpdatedNotification"), 0);

}

- (void)watchLTKsChanged:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  _BOOL8 v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)buf = 138412290;
    v36 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch LTKs changed (user info: %@)", buf, 0xCu);

  }
  if (-[SDAutoUnlockPairingKeySession waitingForLTK](self, "waitingForLTK"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

    if (v8)
    {
      -[SDAutoUnlockPairingKeySession setWaitingForLTK:](self, "setWaitingForLTK:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SDAutoUnlockAKSManagerCompanionViewSyncing")));

      if (v11)
        v12 = -[NSObject BOOLValue](v11, "BOOLValue") ^ 1;
      else
        v12 = 0;
      -[SDAutoUnlockPairingKeySession setCompanionViewNotSyncing:](self, "setCompanionViewNotSyncing:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SDAutoUnlockAKSManagerCompanionNeedsUnlock")));
      -[SDAutoUnlockPairingKeySession setCompanionNeedsUnlock:](self, "setCompanionNeedsUnlock:", objc_msgSend(v15, "BOOLValue"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SDAutoUnlockAKSManagerCompanionCurrentlySyncing")));
      -[SDAutoUnlockPairingKeySession setCompanionCurrentlySyncing:](self, "setCompanionCurrentlySyncing:", objc_msgSend(v17, "BOOLValue"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v20 = objc_msgSend(v18, "ltkExistsForKeyDevice:", v19);

      v21 = -[SDAutoUnlockPairingKeySession ltkHashMatches](self, "ltkHashMatches");
      if (-[SDAutoUnlockPairingKeySession companionViewNotSyncing](self, "companionViewNotSyncing")
        || -[SDAutoUnlockPairingKeySession companionNeedsUnlock](self, "companionNeedsUnlock")
        || (v22 = -[SDAutoUnlockPairingKeySession companionCurrentlySyncing](self, "companionCurrentlySyncing"))
        || (v20 & v21) != 0)
      {
        -[SDAutoUnlockPairingKeySession handleSetupRequest](self, "handleSetupRequest");
      }
      else
      {
        v23 = auto_unlock_log(v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v30 = (void *)v29;
          v31 = CFSTR("NO");
          if (v20)
            v32 = CFSTR("YES");
          else
            v32 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v36 = v29;
          v37 = 2112;
          v38 = v32;
          if (v21)
            v31 = CFSTR("YES");
          v39 = 2112;
          v40 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Incorrect LTK (deviceID: %@, ltk exists: %@, hashes match: %@)", buf, 0x20u);

        }
        if (v20)
          v25 = 129;
        else
          v25 = 125;
        v26 = SFAutoUnlockErrorDomain;
        v33 = NSLocalizedDescriptionKey;
        v34 = CFSTR("Incorrect LTK");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v25, v27));

        -[SDAutoUnlockPairingKeySession sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:](self, "sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:", 0, 0, v28, 0, 0);
        -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v28);
        -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");

      }
    }
    else
    {
      v13 = auto_unlock_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Response missing view syncing state", buf, 2u);
      }
    }

  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing key session notifying delegate with error: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "session:didCompleteWithError:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    objc_msgSend(v9, "session:didCompleteWithError:", self, v4);

  }
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a5;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v8);

  if (v5 == 2003 || v5 == 103)
  {
    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupCreateSecret", v12, 2u);
    }

    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    -[SDAutoUnlockPairingKeySession handleCreateEscrowSecret:](self, "handleCreateEscrowSecret:", v7);
  }

}

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  SDUnlockSetupCreateSecret *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[8];
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  v4 = a3;
  v5 = -[SDAutoUnlockPairingKeySession canceled](self, "canceled");
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v9 = objc_msgSend(v8, "deviceKeyBagUnlocked");

    v10 = -[SDUnlockSetupCreateSecret initWithData:]([SDUnlockSetupCreateSecret alloc], "initWithData:", v4);
    v7 = v10;
    if (v9)
    {
      if (v10
        && (v10 = (SDUnlockSetupCreateSecret *)-[SDUnlockSetupCreateSecret hasToken](v10, "hasToken"), (_DWORD)v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject token](v7, "token"));
        v44 = 0;
        v13 = objc_msgSend(v11, "stepSessionWithData:outputData:", v12, &v44);
        v14 = v44;

        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "generateSessionToken"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
            v19 = objc_msgSend(v17, "storeRangingKey:forDeviceID:", v16, v18);

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
              objc_msgSend(v20, "updateDynamicStoreEnabled");

              v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
              v22 = objc_msgSend(v21, "version");

              if (v22 != 1)
              {
                -[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:](self, "sendSetupCreateEscrowRecordStepData:error:", v14, 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
                objc_msgSend(v35, "confirmSession");

                v37 = auto_unlock_log(v36);
                v38 = objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                }

                -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0);
                goto LABEL_24;
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "generateEscrowSecret"));

              if (v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
                v43 = v24;
                v29 = objc_msgSend(v25, "storeEscrowSecret:pairingID:deviceID:requiresUnlock:", v24, v27, v28, 1);

                if (v29)
                {
                  v30 = auto_unlock_log(-[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:](self, "sendSetupCreateEscrowRecordStepData:error:", v14, 0));
                  v31 = objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                  }

                  -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0);
                  v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
                  objc_msgSend(v32, "updateDynamicStoreEnabled");

LABEL_24:
LABEL_33:

                  goto LABEL_34;
                }
                v33 = CFSTR("Failed to store escrow secret");
                v34 = 170;
                v24 = v43;
              }
              else
              {
                v33 = CFSTR("Failed to create escrow secret");
                v34 = 169;
              }

            }
            else
            {
              v33 = CFSTR("Failed to store session token");
              v34 = 166;
            }
          }
          else
          {
            v33 = CFSTR("Failed to create session token");
            v34 = 165;
          }

        }
        else
        {
          v33 = CFSTR("Could not complete step");
          v34 = 163;
        }

      }
      else
      {
        v33 = CFSTR("No remote step data in message");
        v34 = 160;
      }
    }
    else
    {
      v33 = CFSTR("Device locked");
      v34 = 102;
    }
    v39 = auto_unlock_log(v10);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_10002E264((uint64_t)v33, v40);

    v41 = SFAutoUnlockErrorDomain;
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Request failure");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v41, v34, v42));

    -[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:](self, "sendSetupCreateEscrowRecordStepData:error:", 0, v14);
    -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v14);
    goto LABEL_33;
  }
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pairing canceled for create secret", buf, 2u);
  }
LABEL_34:

}

- (void)sendKeyDeviceLocked
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  SDAutoUnlockKeyDeviceLocked *v11;

  v11 = objc_alloc_init(SDAutoUnlockKeyDeviceLocked);
  -[SDAutoUnlockKeyDeviceLocked setVersion:](v11, "setVersion:", 1);
  v3 = -[SDAutoUnlockPairingKeySession useAttestedProtocol](self, "useAttestedProtocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeyDeviceLocked data](v11, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 45));
  if (v3)
    v9 = 2005;
  else
    v9 = 105;
  v10 = objc_msgSend(v4, "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", v5, v6, v9, v7, 0, v8, &stru_1007148A0);

}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6 ltkSyncing:(id)a7
{
  id v11;
  int v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  SDUnlockSetupSessionCreated *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  uint8_t buf[4];
  const __CFString *v45;

  v42 = a3;
  v41 = a4;
  v40 = a5;
  v11 = a7;
  if (sub_1000CE8D0(CFSTR("AUUseOldProtocolVersion"), 0))
    v12 = 1;
  else
    v12 = 2;
  if (sub_1000CE8D0(CFSTR("AUUseNewWatchVersion"), 0))
    v13 = 3;
  else
    v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v15 = objc_msgSend(v14, "deviceRequiresNewRanging");

  if (v15)
    v17 = 3;
  else
    v17 = v13;
  v18 = auto_unlock_log(v16);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("NO");
    if (v15)
      v20 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v45 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device using new ranging: %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ltkHash"));
  v25 = objc_msgSend(v21, "ltkSyncStatusForDeviceID:hash:modern:", v22, v24, 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ltkHash"));
  v30 = objc_msgSend(v26, "ltkSyncStatusForDeviceID:hash:modern:", v27, v29, 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ltkHashForLocalLTK"));

  v33 = objc_alloc_init(SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v33, "setVersion:", v17);
  if (v42)
    -[SDUnlockSetupSessionCreated setLongTermKey:](v33, "setLongTermKey:");
  if (v41)
    -[SDUnlockSetupSessionCreated setToken:](v33, "setToken:");
  if (v40)
    -[SDUnlockSetupSessionCreated setErrorCode:](v33, "setErrorCode:", objc_msgSend(v40, "code"));
  if (a6)
    -[SDUnlockSetupSessionCreated setFailureReasons:](v33, "setFailureReasons:");
  if (v11)
    -[SDUnlockSetupSessionCreated setLtkSyncing:](v33, "setLtkSyncing:", objc_msgSend(v11, "BOOLValue"));
  if (v32)
    -[SDUnlockSetupSessionCreated setLtkHash:](v33, "setLtkHash:", v32);
  -[SDUnlockSetupSessionCreated setWatchOldLTKSyncStatus:](v33, "setWatchOldLTKSyncStatus:", v25);
  -[SDUnlockSetupSessionCreated setWatchNewLTKSyncStatus:](v33, "setWatchNewLTKSyncStatus:", v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v33, "data"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 45));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10002D970;
  v43[3] = &unk_1007147C8;
  v43[4] = self;
  objc_msgSend(v34, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v35, v36, 102, v37, v38, v43);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)60));
}

- (void)sendSetupSessionCreatedWithLocalAttestedKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  SDUnlockSetupSessionCreated *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];

  v6 = *(_QWORD *)&a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v13, "setVersion:", 4);
  -[SDUnlockSetupSessionCreated setLongTermKey:](v13, "setLongTermKey:", v12);

  -[SDUnlockSetupSessionCreated setToken:](v13, "setToken:", v11);
  if (v10)
    -[SDUnlockSetupSessionCreated setErrorCode:](v13, "setErrorCode:", objc_msgSend(v10, "code"));
  if ((_DWORD)v6)
    -[SDUnlockSetupSessionCreated setFailureReasons:](v13, "setFailureReasons:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v13, "data"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 45));
  v20[1] = 3221225472;
  v20[2] = sub_10002DC18;
  v20[3] = &unk_1007148C8;
  v20[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v19 = objc_msgSend(v14, "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", v15, v16, 2002, v17, 0, v18, v20);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)60));
}

- (void)sendSetupCreateEscrowRecordStepData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDUnlockSetupCreateRecord *v8;
  SDUnlockSetupCreateRecord *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  SDAutoUnlockPairingKeySession *v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SDUnlockSetupCreateRecord);
  v9 = v8;
  if (v6)
    -[SDUnlockSetupCreateRecord setToken:](v8, "setToken:", v6);
  if (v7)
    -[SDUnlockSetupCreateRecord setErrorCode:](v9, "setErrorCode:", objc_msgSend(v7, "code"));
  v10 = -[SDAutoUnlockPairingKeySession useAttestedProtocol](self, "useAttestedProtocol");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord data](v9, "data"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 45));
  v19 = 3221225472;
  v20 = sub_10002DE80;
  v21 = &unk_1007148C8;
  v22 = self;
  v18 = _NSConcreteStackBlock;
  if (v10)
    v16 = 2004;
  else
    v16 = 104;
  v17 = objc_msgSend(v11, "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", v12, v13, v16, v14, 0, v15, &v18, v18, v19, v20, v21, v22);

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
  v14[2] = sub_10002E030;
  v14[3] = &unk_1007145F8;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a5;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, v14);

}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (BOOL)waitingForUnlock
{
  return self->_waitingForUnlock;
}

- (void)setWaitingForUnlock:(BOOL)a3
{
  self->_waitingForUnlock = a3;
}

- (BOOL)waitingForLTK
{
  return self->_waitingForLTK;
}

- (void)setWaitingForLTK:(BOOL)a3
{
  self->_waitingForLTK = a3;
}

- (BOOL)requestedLTKForRemote
{
  return self->_requestedLTKForRemote;
}

- (void)setRequestedLTKForRemote:(BOOL)a3
{
  self->_requestedLTKForRemote = a3;
}

- (BOOL)companionViewNotSyncing
{
  return self->_companionViewNotSyncing;
}

- (void)setCompanionViewNotSyncing:(BOOL)a3
{
  self->_companionViewNotSyncing = a3;
}

- (BOOL)companionNeedsUnlock
{
  return self->_companionNeedsUnlock;
}

- (void)setCompanionNeedsUnlock:(BOOL)a3
{
  self->_companionNeedsUnlock = a3;
}

- (BOOL)companionCurrentlySyncing
{
  return self->_companionCurrentlySyncing;
}

- (void)setCompanionCurrentlySyncing:(BOOL)a3
{
  self->_companionCurrentlySyncing = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (SDUnlockSetupRequest)request
{
  return (SDUnlockSetupRequest *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_longTermKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermKey, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
