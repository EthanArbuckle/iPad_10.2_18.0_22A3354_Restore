@implementation SDAutoUnlockRegistrationKeySession

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100131898;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onQueue_start
{
  NSObject *v3;
  SDAutoUnlockDeviceRegistrationRequest *v4;
  void *v5;
  SDAutoUnlockDeviceRegistrationRequest *v6;
  _BOOL8 v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = [SDAutoUnlockDeviceRegistrationRequest alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationKeySession requestData](self, "requestData"));
  v6 = -[SDAutoUnlockDeviceRegistrationRequest initWithData:](v4, "initWithData:", v5);

  if (v6 || (v7 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v9 = objc_msgSend(v8, "deviceKeyBagUnlocked");

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aksRegistrationSessionForDeviceID:originator:", v12, 1));
      -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      LODWORD(v12) = objc_msgSend(v14, "sessionIsValid");

      if ((_DWORD)v12)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        v31 = 0;
        v17 = objc_msgSend(v16, "stepSessionWithData:outputData:", 0, &v31);
        v18 = v31;

        if (v17)
        {
          v20 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated");
          v21 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated");
          v22 = (uint64_t *)&unk_1005CBE50;
          if (!v21)
            v22 = &qword_1005CBE48;
          v23 = *(double *)v22;
          if (v20)
            v24 = 505;
          else
            v24 = 502;
          -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:](self, "sendStepData:type:errorCode:", v18, v24, 0);
          -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(v23));
          goto LABEL_27;
        }
        v29 = auto_unlock_log(v19);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_1001321C8();

      }
      else
      {
        v27 = auto_unlock_log(v15);
        v18 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1001321F4();
      }
      v26 = 101;
    }
    else
    {
      v25 = auto_unlock_log(v10);
      v18 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100132220();
      v26 = 102;
    }
  }
  else
  {
    v28 = auto_unlock_log(v7);
    v18 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10013224C();
    v26 = 212;
  }

  if (!-[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated"))
  {
    -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:](self, "sendStepData:type:errorCode:", 0, 502, v26);
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(20.0));
  }
  v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, v26, 0));
  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
LABEL_27:

}

- (void)sendStepData:(id)a3 type:(unsigned __int16)a4 errorCode:(int64_t)a5
{
  uint64_t v6;
  id v8;
  SDAutoUnlockDeviceRegistrationStep *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
  -[SDAutoUnlockDeviceRegistrationStep setStepData:](v9, "setStepData:", v8);

  -[SDAutoUnlockDeviceRegistrationStep setErrorCode:](v9, "setErrorCode:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100131CB4;
  v14[3] = &unk_1007147C8;
  v14[4] = self;
  objc_msgSend(v10, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v11, v12, v6, v13, &off_10074B928, v14);

}

- (void)handleStepData:(id)a3
{
  id v4;
  SDAutoUnlockDeviceRegistrationStep *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  SDAutoUnlockDeviceRegistrationStep *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint8_t v28[8];
  id v29;

  v4 = a3;
  v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]([SDAutoUnlockDeviceRegistrationStep alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
  if (!v6)
  {
    v22 = auto_unlock_log(v7);
    v14 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100132278();
    v23 = 211;
    goto LABEL_19;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v9 = objc_msgSend(v8, "deviceKeyBagUnlocked");

  if (!v9)
  {
    v24 = auto_unlock_log(v10);
    v14 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100132220();
    v23 = 102;
    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
  v29 = 0;
  v13 = objc_msgSend(v11, "stepSessionWithData:outputData:", v12, &v29);
  v14 = v29;

  if (!v13)
  {
    v25 = auto_unlock_log(v15);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1001321C8();
    goto LABEL_18;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v17 = objc_msgSend(v16, "confirmSession");

  if (!v17)
  {
    v27 = auto_unlock_log(v18);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1001322A4();
LABEL_18:

    v23 = 101;
LABEL_19:

    -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:](self, "sendStepData:type:errorCode:", 0, 504, v23);
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(20.0));
    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, v23, 0));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v14);
    goto LABEL_20;
  }
  v19 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
  -[SDAutoUnlockDeviceRegistrationStep setStepData:](v19, "setStepData:", v14);
  -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:](self, "sendStepData:type:errorCode:", v14, 504, 0);
  v20 = auto_unlock_log(-[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer"));
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully registered local device", v28, 2u);
  }

  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0);
LABEL_20:

}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned __int16 v13;

  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001320E8;
  block[3] = &unk_100715FD0;
  v13 = a5;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (BOOL)isLocallyGenerated
{
  return self->_locallyGenerated;
}

- (void)setLocallyGenerated:(BOOL)a3
{
  self->_locallyGenerated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
