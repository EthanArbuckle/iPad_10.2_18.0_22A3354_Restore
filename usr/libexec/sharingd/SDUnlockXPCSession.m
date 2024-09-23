@implementation SDUnlockXPCSession

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v4, "cancelEnablingAllDevices");

    -[SDUnlockXPCSession cancelAutoUnlock:](self, "cancelAutoUnlock:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    objc_msgSend(v5, "handleDelegateInvalidated");

  }
  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)repairCloudPairing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v2, "repairCloudPairing");

}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession bundleID](self, "bundleID"));
    location = 0;
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C18A4;
    v9[3] = &unk_100716AC0;
    v10 = v4;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "eligibleDevicesRequestFromBundleID:withCompletionHandler:", v5, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("This process does not have permission to perform this action");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, 111, v7));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4 clientProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  SDUnlockXPCSession *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    -[SDUnlockXPCSession setEnableDevice:](self, "setEnableDevice:", v8);
    -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v10);

    v12 = auto_unlock_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding observer for enabling device %@", (uint8_t *)&v18, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v14, "registerObserver:", self);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v15, "enableAutoUnlockWithDevice:passcode:", v8, v9);
  }
  else
  {
    v16 = SFAutoUnlockErrorDomain;
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("This process does not have permission to perform this action");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 111, v17));

    objc_msgSend(v10, "failedToEnableDevice:error:", v8, v15);
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v4, "cancelEnablingAutoUnlockForDevice:", v5);

  }
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v7))
  {
    location = 0;
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C1C34;
    v9[3] = &unk_100716AE8;
    v10 = v7;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "disableAutoUnlockForDevice:completionHandler:", v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)prewarmAutoUnlock
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v2, "prewarmAutoUnlock");

}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v4, "donateDeviceUnlockedWithMask:", v3);

}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v4, "clearPhoneAutoUnlockNotification:", v3);

}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v4, "completeAutoUnlockWithNotification:", v3);

}

- (void)attemptAutoUnlockWithClientProxy:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  SDUnlockXPCSession *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v7, "registerObserver:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v8, "attemptAutoUnlockForType:", 1);
  }
  else
  {
    v9 = SFAutoUnlockErrorDomain;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("This process does not have permission to perform this action");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, 111, v10));

    objc_msgSend(v4, "failedUnlockWithError:", v8);
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  SDUnlockXPCSession *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt without notifying watch %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v7, "registerObserver:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v8, "attemptAutoUnlockWithoutNotifyingWatch");
  }
  else
  {
    v9 = SFAutoUnlockErrorDomain;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("This process does not have permission to perform this action");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, 111, v10));

    objc_msgSend(v4, "failedUnlockWithError:", v8);
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)attemptAutoUnlockForSiriWithClientProxy:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  SDUnlockXPCSession *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt for Siri %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v7, "registerObserver:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v8, "attemptAutoUnlockForSiri");
  }
  else
  {
    v9 = SFAutoUnlockErrorDomain;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("This process does not have permission to perform this action");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, 111, v10));

    objc_msgSend(v4, "failedUnlockWithError:", v8);
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)cancelAutoUnlock
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = -[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0);
  if (v3)
  {
    -[SDUnlockXPCSession cancelAutoUnlock:](self, "cancelAutoUnlock:", 1);
  }
  else
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel Auto Unlock: This process does not have permission to perform this action", v6, 2u);
    }

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)cancelAutoUnlock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v5, "cancelAutoUnlock");

  if (v3)
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)requestRelock
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  v3 = -[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0);
  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v6, "requestRelock");

  }
  else
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request relock Auto Unlock: This process does not have permission to perform this action", buf, 2u);
    }

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v5, "autoUnlockStateWithCompletionHandler:", v4);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
  else
  {
    v6 = SFAutoUnlockErrorDomain;
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("This process does not have permission to perform this action");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 111, v7));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v5, "authPromptInfoWithCompletionHandler:", v4);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
  else
  {
    v6 = SFAutoUnlockErrorDomain;
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("This process does not have permission to perform this action");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 111, v7));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)notifyDelegate
{
  if ((objc_opt_respondsToSelector(self->_delegate, "unlockSessionDidFinish:") & 1) != 0)
    -[SDUnlockXPCSesssionDelegate unlockSessionDidFinish:](self->_delegate, "unlockSessionDidFinish:", self);
}

- (void)session:(id)a3 didReceiveKeyDeviceLocked:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "keyDeviceLocked:", v5);

}

- (void)session:(id)a3 didEnableWithDevice:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession enableDevice](self, "enableDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueID"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    objc_msgSend(v9, "enabledDevice:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v10, "unregisterObserver:", self);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)session:(id)a3 didFailToEnableDevice:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession enableDevice](self, "enableDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    objc_msgSend(v12, "failedToEnableDevice:error:", v14, v7);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
    objc_msgSend(v13, "unregisterObserver:", self);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)session:(id)a3 didBeginAttemptWithDevice:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a4;
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Began: Calling client proxy %@", (uint8_t *)&v10, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "beganAttemptWithDevice:", v5);

}

- (void)session:(id)a3 didCompleteUnlockWithDevice:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a4;
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Completed: Calling client proxy %@", (uint8_t *)&v11, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "completedUnlockWithDevice:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v10, "unregisterObserver:", self);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)session:(id)a3 didFailUnlockWithResults:(id)a4 error:(id)a5 incrementedAttempt:(BOOL)a6
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v8, "failedUnlockWithError:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v9, "unregisterObserver:", self);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD, void *);
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v12))
  {
    if (a4)
    {
      v13 = SFUnlockErrorDomian;
      v19 = NSLocalizedDescriptionKey;
      v20 = CFSTR("Enabling from the key side is not yet supported");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, 111, v14));
      v12[2](v12, 0, v15);

      -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockLockManager sharedLockManager](SDUnlockLockManager, "sharedLockManager"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000C2CD8;
      v17[3] = &unk_100716B10;
      v17[4] = self;
      v18 = v12;
      objc_msgSend(v16, "enableUnlockWithDevice:passcode:completionHandler:", v10, v11, v17);

    }
  }

}

- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C2DC0;
    v9[3] = &unk_100716B10;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "disableUnlockWithDevice:completionHandler:", v6, v9);

  }
}

- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, id, _QWORD);

  v6 = (void (**)(id, id, _QWORD))a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
    v6[2](v6, objc_msgSend(v5, "unlockEnabled"), 0);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C2F0C;
    v6[3] = &unk_100716B10;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "establishStashBagWithCompletionHandler:", v6);

  }
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C2FF4;
    v9[3] = &unk_100716B10;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "establishStashBagWithManifest:completionHandler:", v6, v9);

  }
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C31A0;
    v12[3] = &unk_100716B38;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v8, "unlockStateForDevice:completionHandler:", v6, v12);

  }
  else
  {
    v9 = SFUnlockErrorDomian;
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("This process does not have permission to perform this action");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, 111, v10));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)listEligibleDevicesForAuthenticationType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C32C0;
    v11[3] = &unk_100716B88;
    v13 = a3;
    v12 = v6;
    dispatch_async(v8, v11);

  }
  else
  {
    v9 = authentications_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)enableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 passcode:(id)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  unint64_t v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v16 = authentications_log();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
  -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v18, "setDelegate:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000C34DC;
  v24[3] = &unk_100716BB0;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = a4;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  dispatch_async(v20, v24);

}

- (void)disableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    objc_msgSend(v13, "setDelegate:", self);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C3684;
    block[3] = &unk_100715D08;
    v21 = a4;
    v19 = v11;
    v20 = v12;
    dispatch_async(v15, block);

  }
  else
  {
    v16 = authentications_log();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)authenticateUsingClientProxy:(id)a3 type:(unint64_t)a4 sessionID:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    objc_msgSend(v13, "setDelegate:", self);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C3828;
    block[3] = &unk_100715D08;
    v21 = a4;
    v19 = v11;
    v20 = v12;
    dispatch_async(v15, block);

  }
  else
  {
    v16 = authentications_log();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)cancelAuthenticationSessionWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C395C;
    block[3] = &unk_1007146D8;
    v10 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = authentications_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)registerForApprovalRequestsUsingClientProxy:(id)a3 forType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v6 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    objc_msgSend(v7, "setDelegate:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C3AB0;
    block[3] = &unk_100715590;
    block[4] = a4;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = authentications_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)startObservingAuthentationStateChangesWithObserver:(id)a3 forIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C3BBC;
  v11[3] = &unk_100714860;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

- (void)stopObservingAuthentationStateChangesForIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3CA8;
  block[3] = &unk_1007146D8;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)reportUserApprovalWithACMToken:(id)a3 error:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C3E20;
    block[3] = &unk_100715138;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = authentications_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C44E0();

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

}

- (void)manager:(id)a3 didEnableAuthenticationFor:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "enabledAuthenticationSessionWithID:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v7, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didDisableAuthenticationFor:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "disabledAuthenticationSessionWithID:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v7, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didCompleteAuthenticationFor:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "completedAuthenticationSessionWithID:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v7, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didFailToEnableDeviceFor:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "failedToEnableDeviceForSessionID:error:", v8, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v10, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didFailToDisableDeviceFor:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "failedToDisableDeviceForSessionID:error:", v8, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v10, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didFailAuthenticationFor:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "failedAuthenticationSessionWithID:error:", v8, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAuthenticationManager shared](_TtC16DaemoniOSLibrary23SDAuthenticationManager, "shared"));
  objc_msgSend(v10, "setDelegate:", 0);

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)manager:(id)a3 didStartAuthenticationFor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v6, "startedAuthenticationSessionWithID:", v5);

}

- (void)manager:(id)a3 didReceiveApproveRequestFor:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "receivedApproveRequestForSessionID:info:", v8, v7);

}

- (BOOL)checkEntitlementWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = objc_msgSend(v5, "_connectionHasEntitlement:", CFSTR("com.apple.private.sharing.unlock-manager"));

  if ((v6 & 1) != 0)
  {
    v9 = auto_unlock_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession bundleID](self, "bundleID"));
      v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client bundle ID: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    v12 = paired_unlock_log(v7, v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C450C(self, v13);

    if (v4)
    {
      v19 = NSLocalizedDescriptionKey;
      v20 = CFSTR("This process does not have permission to perform this action");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFUnlockErrorDomian"), 111, v14));
      v4[2](v4, 0, v15);

      -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
    }
  }

  return v6;
}

- (NSString)bundleID
{
  NSString *bundleID;
  void *v4;
  void *v5;
  id v6;
  NSString *v7;
  void *v8;
  NSString *v9;

  bundleID = self->_bundleID;
  if (!bundleID)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_xpcConnection"));
    v6 = sub_10019CD60(v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("application-identifier")));

    }
    v9 = self->_bundleID;
    self->_bundleID = v7;

    bundleID = self->_bundleID;
  }
  return bundleID;
}

- (SDUnlockXPCSesssionDelegate)delegate
{
  return (SDUnlockXPCSesssionDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFUnlockClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (SFAutoUnlockDevice)enableDevice
{
  return self->_enableDevice;
}

- (void)setEnableDevice:(id)a3
{
  objc_storeStrong((id *)&self->_enableDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableDevice, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
