@implementation SDAutoUnlockRegistrationLockSession

- (SDAutoUnlockRegistrationLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  SDAutoUnlockRegistrationLockSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDAutoUnlockRegistrationLockSession;
  result = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v5, "initWithDevice:sessionID:", a3, a4);
  if (result)
    result->_state = 0;
  return result;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D400;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onQueue_start
{
  NSObject *v3;
  void *v4;
  id v5;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationLockSession requestData](self, "requestData"));
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationLockSession requestData](self, "requestData"));
    -[SDAutoUnlockRegistrationLockSession handleInitialResponse:](self, "handleInitialResponse:", v5);

  }
  else
  {
    -[SDAutoUnlockRegistrationLockSession sendInitialRequest](self, "sendInitialRequest");
  }
}

- (void)sendInitialRequest
{
  NSObject *v3;
  SDAutoUnlockDeviceRegistrationRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(SDAutoUnlockDeviceRegistrationRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationRequest data](v4, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10020D5AC;
  v9[3] = &unk_1007147C8;
  v9[4] = self;
  objc_msgSend(v5, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v6, v7, 501, v8, &off_10074BFA0, v9);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(20.0));
}

- (void)handleInitialResponse:(id)a3
{
  id v4;
  SDAutoUnlockDeviceRegistrationStep *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  SDAutoUnlockDeviceRegistrationStep *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v4 = a3;
  v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]([SDAutoUnlockDeviceRegistrationStep alloc], "initWithData:", v4);

  if (-[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode"))
  {
    v6 = SFAutoUnlockErrorDomain;
    v7 = -[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode");
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Error during registration");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v7, v8));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v9);

  }
  else if (-[SDAutoUnlockDeviceRegistrationStep hasStepData](v5, "hasStepData"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aksRegistrationSessionForDeviceID:originator:", v11, 0));
    -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    LODWORD(v11) = objc_msgSend(v13, "sessionIsValid");

    if ((_DWORD)v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
      v28 = 0;
      v16 = objc_msgSend(v14, "stepSessionWithData:outputData:", v15, &v28);
      v17 = v28;

      if (v16)
      {
        v18 = objc_alloc_init(SDAutoUnlockDeviceRegistrationStep);
        -[SDAutoUnlockDeviceRegistrationStep setStepData:](v18, "setStepData:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep data](v18, "data"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10020DA20;
        v27[3] = &unk_1007147C8;
        v27[4] = self;
        objc_msgSend(v19, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v20, v21, 503, v22, &off_10074BFA0, v27);

        -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0(20.0));
      }
      else
      {
        v18 = (SDAutoUnlockDeviceRegistrationStep *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, 101, 0));
        -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
      }

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, 101, 0));
      -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v26);

    }
  }
  else
  {
    v23 = SFAutoUnlockErrorDomain;
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Registration Token missing");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 211, v24));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v25);

  }
}

- (void)handleFinalize:(id)a3
{
  id v4;
  SDAutoUnlockDeviceRegistrationStep *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;
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
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  SDAutoUnlockRegistrationLockSession *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const __CFString *v53;
  void *v54;
  int v55;
  void *v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;

  v4 = a3;
  v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]([SDAutoUnlockDeviceRegistrationStep alloc], "initWithData:", v4);

  if (!-[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode"))
  {
    v10 = -[SDAutoUnlockDeviceRegistrationStep hasStepData](v5, "hasStepData");
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
      v13 = objc_msgSend(v11, "stepSessionWithData:outputData:", v12, 0);

      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        v16 = objc_msgSend(v15, "finalizeRegistration");

        if (!v16)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "remoteLTKForDeviceID:", v49));

          v50 = sub_10001D8AC(v8);
          v51 = auto_unlock_log(v50);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = sub_10001DD10(v50);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v55 = 138412290;
            v56 = v54;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Device has been registered (peer state is %@)", (uint8_t *)&v55, 0xCu);

          }
          v46 = self;
          v47 = 0;
          goto LABEL_17;
        }
        v18 = auto_unlock_log(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_10020E068((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);

      }
      else
      {
        v37 = auto_unlock_log(v14);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_10020E0D0(v38, v39, v40, v41, v42, v43, v44, v45);

      }
      v35 = SFAutoUnlockErrorDomain;
      v36 = 101;
    }
    else
    {
      v26 = auto_unlock_log(v10);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10020E104(v27, v28, v29, v30, v31, v32, v33, v34);

      v35 = SFAutoUnlockErrorDomain;
      v36 = 211;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, v36, 0));
    v46 = self;
    v47 = v8;
LABEL_17:
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](v46, "notifyDelegateWithError:", v47);
    goto LABEL_18;
  }
  v6 = SFAutoUnlockErrorDomain;
  v7 = -[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode");
  v57 = NSLocalizedDescriptionKey;
  v58 = CFSTR("Error during registration");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v7, v8));
  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v9);

LABEL_18:
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
  block[2] = sub_10020DEC0;
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

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
