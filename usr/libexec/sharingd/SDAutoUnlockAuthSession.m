@implementation SDAutoUnlockAuthSession

- (SDAutoUnlockAuthSession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9;
  SDAutoUnlockAuthSession *v10;
  SDAutoUnlockAuthSession *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockAuthSession;
  v10 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v13, "initWithDevice:sessionID:", a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_useAKSToken = 0;
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    v11->_protocol = 1;
  }

  return v11;
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
  v9.super_class = (Class)SDAutoUnlockAuthSession;
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

- (id)getAppName
{
  return 0;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ACB78;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_start
{
  -[SDAutoUnlockAuthSession connectionActivated](self, "connectionActivated");
}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 errorHandler:(id)a5
{
  uint64_t v5;
  id v7;
  _QWORD v8[4];
  SDAutoUnlockAuthSession *v9;
  id v10;

  v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001ACC18;
  v8[3] = &unk_100719F90;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[SDAutoUnlockAuthSession sendData:type:completionHandler:](v9, "sendData:type:completionHandler:", a3, v5, v8);

}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", a3, v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:](self, "sendData:bleDevice:completionHandler:", v10, v9, v8);

}

- (void)sendAWDLInfo
{
  -[SDAutoUnlockAuthSession sendAWDLInfo:](self, "sendAWDLInfo:", 0);
}

- (void)sendAWDLInfo:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  SDAutoUnlockAWDLInfo *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[8];
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlInfoData](self, "awdlInfoData"));
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
    }

    v9 = objc_alloc_init(SDAutoUnlockAWDLInfo);
    -[SDAutoUnlockAWDLInfo setVersion:](v9, "setVersion:", 4);
    -[SDAutoUnlockAWDLInfo setAwdlInfo:](v9, "setAwdlInfo:", v5);
    -[SDAutoUnlockAWDLInfo setUseToken:](v9, "setUseToken:", -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession lastLocalUnlockDate](self, "lastLocalUnlockDate"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[SDAutoUnlockAWDLInfo setPhoneUnlockDate:](v9, "setPhoneUnlockDate:");

    -[SDAutoUnlockAWDLInfo setSkipMotionCheck:](v9, "setSkipMotionCheck:", -[SDAutoUnlockAuthSession skipMotionCheck](self, "skipMotionCheck"));
    -[SDAutoUnlockAWDLInfo setIsAuthenticatingForSiri:](v9, "setIsAuthenticatingForSiri:", -[SDAutoUnlockAuthSession isAuthenticatingForSiri](self, "isAuthenticatingForSiri"));
    v11 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
    -[SDAutoUnlockAWDLInfo setAuthPrompt:](v9, "setAuthPrompt:", v11 == 2);
    if (v11 == 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession getAppName](self, "getAppName"));
      if (v12)
        -[SDAutoUnlockAWDLInfo setAppName:](v9, "setAppName:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo data](v9, "data"));
    if (!a3)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001ACFF0;
      v18[3] = &unk_1007147C8;
      v18[4] = self;
      -[SDAutoUnlockAuthSession sendAWDLInfoData:type:completionHandler:](self, "sendAWDLInfoData:type:completionHandler:", v13, 301, v18);

      goto LABEL_15;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v13, 301));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001AD11C;
    v17[3] = &unk_1007147C8;
    v17[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:](self, "sendData:bleDevice:completionHandler:", v14, v15, v17);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001AE0FC(v8);

    v16 = SFAutoUnlockErrorDomain;
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("AWDL info retrieval failed");
    v9 = (SDAutoUnlockAWDLInfo *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 103, v9));
    -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v14);
  }

LABEL_15:
}

- (NSData)awdlInfoData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "awdlInfo"));

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using AWDL info %@", (uint8_t *)&v11, 0xCu);
  }

  -[SDAutoUnlockAuthSession setLocalAWDLInfo:](self, "setLocalAWDLInfo:", v4);
  v8 = sub_1000C7CE0(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSData *)v9;
}

- (void)sendData:(id)a3 bleDevice:(id)a4 completionHandler:(id)a5
{
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:](self, "sendData:bleDevice:direct:completionHandler:", a3, a4, 0, a5);
}

- (void)sendData:(id)a3 bleDevice:(id)a4 direct:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  SDAutoUnlockSessionWrapper *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[SDAutoUnlockAuthSession useEncryption](self, "useEncryption");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));

    v16 = auto_unlock_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Encryption start", buf, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v39 = 0;
      v40 = 0;
      v38 = 0;
      v21 = objc_msgSend(v19, "encryptMessageData:deviceID:encryptedMessage:authTag:nonce:", v10, v20, &v40, &v39, &v38);
      v18 = v40;
      v37 = v39;
      v22 = v38;

      if (v21 && v18 && v37 && v22)
      {
        v24 = objc_opt_new(SDAutoUnlockSessionWrapper);
        -[SDAutoUnlockSessionWrapper setVersion:](v24, "setVersion:", 2);
        -[SDAutoUnlockSessionWrapper setEncryptedPayload:](v24, "setEncryptedPayload:", v18);
        -[SDAutoUnlockSessionWrapper setAuthTag:](v24, "setAuthTag:", v37);
        -[SDAutoUnlockSessionWrapper setNonce:](v24, "setNonce:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" with wrapper %@ sessionID: %@"), v24, v25));

        v28 = auto_unlock_log(v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Using encryption%{private}@", buf, 0xCu);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v24, "data"));
        if (v7)
          objc_msgSend(v30, "sendUnlockDataDirect:toBLEDevice:completion:", v31, v11, v12);
        else
          objc_msgSend(v30, "sendUnlockData:toBLEDevice:completion:", v31, v11, v12);

      }
      else
      {
        v34 = auto_unlock_log(v23);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v10;
          v45 = 2112;
          v46 = v37;
          v47 = 2112;
          v48 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error encrypting message (data: %@, authTag: %@, nonce: %@)", buf, 0x20u);
        }

        v36 = SFAutoUnlockErrorDomain;
        v41 = NSLocalizedDescriptionKey;
        v42 = CFSTR("Encryption failed");
        v24 = (SDAutoUnlockSessionWrapper *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v36, 189, v24));
        -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v26);
      }

    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      sub_1001AE13C(v18);
    }
  }
  else
  {
    v32 = auto_unlock_log(v13);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Using BLE encryption", buf, 2u);
    }

    v18 = objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    -[NSObject sendUnlockData:toBLEDevice:completion:](v18, "sendUnlockData:toBLEDevice:completion:", v10, v11, v12);
  }

}

- (id)peerListFromAWDLInfo:(id)a3
{
  void *v4;
  _NIRangingPeer *v5;
  void *v6;
  _NIRangingPeer *v7;
  void *v8;
  _NIRangingPeer *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AWDL_IF_MAC_ADDRESS")));
  if (v4
    && (v5 = [_NIRangingPeer alloc],
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingKey](self, "rangingKey")),
        v7 = -[_NIRangingPeer initWithMacAddressAsData:secureRangingKeyID:](v5, "initWithMacAddressAsData:secureRangingKeyID:", v4, v6), v6, v7))
  {
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)rangingKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  int v12;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  int v24;
  _QWORD v25[2];

  if (-[SDAutoUnlockAuthSession useRealRangingKey](self, "useRealRangingKey"))
  {
    if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") == (id)1
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey")),
          v3,
          v3))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rangingKeyForDeviceID:", v7));

    }
    v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", v4);
    v8 = auto_unlock_log(v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("YES");
      if (!v5)
        v10 = CFSTR("NO");
      v24 = 138412290;
      v25[0] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ranging key exists %@", (uint8_t *)&v24, 0xCu);
    }

  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 64);
  }
  v11 = objc_msgSend(v5, "length");
  if (v11 <= 0x3F)
  {
    v12 = (_DWORD)v11 - 64;
    do
    {
      LOBYTE(v24) = 48;
      v11 = objc_msgSend(v5, "appendBytes:length:", &v24, 1);
    }
    while (!__CFADD__(v12++, 1));
  }
  v14 = auto_unlock_log(v11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v5, "length");
    v17 = -[SDAutoUnlockAuthSession useRealRangingKey](self, "useRealRangingKey");
    v18 = CFSTR("NO");
    if (v17)
      v18 = CFSTR("YES");
    v24 = 67109378;
    LODWORD(v25[0]) = v16;
    WORD2(v25[0]) = 2112;
    *(_QWORD *)((char *)v25 + 6) = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using ranging key (size: %d, realKey %@)", (uint8_t *)&v24, 0x12u);
  }

  v20 = auto_unlock_log(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_1001AE17C((uint64_t)v5, v21);

  v22 = objc_msgSend(v5, "copy");
  return (NSData *)v22;
}

- (BOOL)useRealRangingKey
{
  return sub_1000CE8D0(CFSTR("AUUseRangingKey"), 1) != 0;
}

- (BOOL)rangingDisabled
{
  return sub_1000CE8D0(CFSTR("DisableRanging"), 0) != 0;
}

- (BOOL)useAKSToken
{
  return self->_useAKSToken;
}

- (void)setUseAKSToken:(BOOL)a3
{
  self->_useAKSToken = a3;
}

- (BOOL)inRange
{
  return self->_inRange;
}

- (void)setInRange:(BOOL)a3
{
  self->_inRange = a3;
}

- (BOOL)shouldUnlock
{
  return self->_shouldUnlock;
}

- (void)setShouldUnlock:(BOOL)a3
{
  self->_shouldUnlock = a3;
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (void)setAwdlInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isAcceptor
{
  return self->_acceptor;
}

- (void)setAcceptor:(BOOL)a3
{
  self->_acceptor = a3;
}

- (NSDate)awdlStart
{
  return self->_awdlStart;
}

- (void)setAwdlStart:(id)a3
{
  objc_storeStrong((id *)&self->_awdlStart, a3);
}

- (double)awdlInterval
{
  return self->_awdlInterval;
}

- (void)setAwdlInterval:(double)a3
{
  self->_awdlInterval = a3;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (void)setRangingKey:(id)a3
{
  objc_storeStrong((id *)&self->_rangingKey, a3);
}

- (BOOL)rangingTimedOut
{
  return self->_rangingTimedOut;
}

- (void)setRangingTimedOut:(BOOL)a3
{
  self->_rangingTimedOut = a3;
}

- (NSString)rangingErrorString
{
  return self->_rangingErrorString;
}

- (void)setRangingErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_rangingErrorString, a3);
}

- (BOOL)aksSuccess
{
  return self->_aksSuccess;
}

- (void)setAksSuccess:(BOOL)a3
{
  self->_aksSuccess = a3;
}

- (NSDate)rangingStart
{
  return self->_rangingStart;
}

- (void)setRangingStart:(id)a3
{
  objc_storeStrong((id *)&self->_rangingStart, a3);
}

- (double)rangingInterval
{
  return self->_rangingInterval;
}

- (void)setRangingInterval:(double)a3
{
  self->_rangingInterval = a3;
}

- (NSError)attemptError
{
  return self->_attemptError;
}

- (void)setAttemptError:(id)a3
{
  objc_storeStrong((id *)&self->_attemptError, a3);
}

- (NSDictionary)remoteAWDLInfo
{
  return self->_remoteAWDLInfo;
}

- (void)setRemoteAWDLInfo:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAWDLInfo, a3);
}

- (NSDictionary)localAWDLInfo
{
  return self->_localAWDLInfo;
}

- (void)setLocalAWDLInfo:(id)a3
{
  objc_storeStrong((id *)&self->_localAWDLInfo, a3);
}

- (NSData)sessionRangingKey
{
  return self->_sessionRangingKey;
}

- (void)setSessionRangingKey:(id)a3
{
  objc_storeStrong((id *)&self->_sessionRangingKey, a3);
}

- (unint64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (NSString)wifiErrorDomain
{
  return self->_wifiErrorDomain;
}

- (void)setWifiErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_wifiErrorDomain, a3);
}

- (int64_t)wifiRangingErrorCode
{
  return self->_wifiRangingErrorCode;
}

- (void)setWifiRangingErrorCode:(int64_t)a3
{
  self->_wifiRangingErrorCode = a3;
}

- (NSArray)wifiRangingResults
{
  return self->_wifiRangingResults;
}

- (void)setWifiRangingResults:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRangingResults, a3);
}

- (NSError)startAWDLError
{
  return self->_startAWDLError;
}

- (void)setStartAWDLError:(id)a3
{
  objc_storeStrong((id *)&self->_startAWDLError, a3);
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(int64_t)a3
{
  self->_errorType = a3;
}

- (SDAutoUnlockWiFiRequest)wifiRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWifiRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSData)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
  objc_storeStrong((id *)&self->_appIcon, a3);
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  self->_skipMotionCheck = a3;
}

- (NSDate)lastLocalUnlockDate
{
  return self->_lastLocalUnlockDate;
}

- (void)setLastLocalUnlockDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocalUnlockDate, a3);
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_navBarTitle, a3);
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  self->_isAuthenticatingForSiri = a3;
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setAwdlNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_awdlNetwork, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_lastLocalUnlockDate, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_wifiRequest, 0);
  objc_storeStrong((id *)&self->_startAWDLError, 0);
  objc_storeStrong((id *)&self->_wifiRangingResults, 0);
  objc_storeStrong((id *)&self->_wifiErrorDomain, 0);
  objc_storeStrong((id *)&self->_sessionRangingKey, 0);
  objc_storeStrong((id *)&self->_localAWDLInfo, 0);
  objc_storeStrong((id *)&self->_remoteAWDLInfo, 0);
  objc_storeStrong((id *)&self->_attemptError, 0);
  objc_storeStrong((id *)&self->_rangingStart, 0);
  objc_storeStrong((id *)&self->_rangingErrorString, 0);
  objc_storeStrong((id *)&self->_rangingKey, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_awdlStart, 0);
  objc_storeStrong((id *)&self->_awdlInfoData, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
}

@end
