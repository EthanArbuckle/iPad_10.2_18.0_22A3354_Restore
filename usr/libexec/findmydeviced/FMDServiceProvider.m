@implementation FMDServiceProvider

- (FMDAccount)account
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10009C318;
  v11 = sub_10009C328;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountReadWriteLock](self, "accountReadWriteLock"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003204;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithReadLock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FMDAccount *)v4;
}

- (FMReadWriteLock)accountReadWriteLock
{
  return self->_accountReadWriteLock;
}

+ (id)activeServiceProvider
{
  return (id)qword_100306890;
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  return self->_accessoryRegistry;
}

- (FMDServiceProvider)init
{
  FMDServiceProvider *v2;
  id v3;
  dispatch_queue_t v4;
  FMDDirectServerChannel *v5;
  FMDCadmiumServerChannel *v6;
  void *v7;
  FMDServerInteractionController *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v14.receiver = self;
  v14.super_class = (Class)FMDServiceProvider;
  v2 = -[FMDServiceProvider init](&v14, "init");
  if (v2)
  {
    v3 = +[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager");
    v4 = dispatch_queue_create("FMDServiceProvider", 0);
    -[FMDServiceProvider setSerialQueue:](v2, "setSerialQueue:", v4);

    v5 = objc_alloc_init(FMDDirectServerChannel);
    v15[0] = v5;
    v6 = objc_alloc_init(FMDCadmiumServerChannel);
    v15[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

    v8 = -[FMDServerInteractionController initWithChannels:delegate:]([FMDServerInteractionController alloc], "initWithChannels:delegate:", v7, v2);
    -[FMDServiceProvider setServerInteractionController:](v2, "setServerInteractionController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDServiceProvider setServerInteractionControllerByAccessory:](v2, "setServerInteractionControllerByAccessory:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    -[FMDServiceProvider setServerInteractionControllerByAccount:](v2, "setServerInteractionControllerByAccount:", v10);

    v11 = objc_msgSend(objc_alloc((Class)FMReadWriteLock), "initWithLockName:", CFSTR("serviceProvider-accountLock"));
    -[FMDServiceProvider setAccountReadWriteLock:](v2, "setAccountReadWriteLock:", v11);

    v12 = +[ActionManager sharedManager](ActionManager, "sharedManager");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FMDServiceProvider removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("account"));
  v3.receiver = self;
  v3.super_class = (Class)FMDServiceProvider;
  -[FMDServiceProvider dealloc](&v3, "dealloc");
}

+ (void)setActiveServiceProvider:(id)a3
{
  objc_storeStrong((id *)&qword_100306890, a3);
}

- (NSString)serviceName
{
  return 0;
}

- (void)start
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  WipeAction *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
    v21 = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting %@...", (uint8_t *)&v21, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountStore](self, "accountStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadAccount"));
  -[FMDServiceProvider setAccount:](self, "setAccount:", v7);

  if (+[FMDPreferencesMgr wipeState](FMDPreferencesMgr, "wipeState"))
  {
    v8 = -[WipeAction initWithProvider:]([WipeAction alloc], "initWithProvider:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v10 = objc_msgSend(v9, "enqueueAction:", v8);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

    if (v11)
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));
        v21 = 138412290;
        v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found FMIP account %@...", (uint8_t *)&v21, 0xCu);

      }
      -[FMDServiceProvider accountAdded](self, "accountAdded");
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  if (!v16)
  {
    v17 = sub_1000031B8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No FMIP account", (uint8_t *)&v21, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "apsHandlerForEnvironment:", CFSTR("production")));

    objc_msgSend(v20, "registerDelegate:forTopic:", self, CFSTR("com.apple.mobileme.fmip"));
  }
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountReadWriteLock](self, "accountReadWriteLock"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009C2E4;
  v9[3] = &unk_1002C1BA0;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "performWithWriteLock:", v9);

}

- (void)updateAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authId"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_1000031B8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10022C2D8(v5, v4);

    }
    if (objc_msgSend(v5, "activityState") != 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
      objc_msgSend(v11, "copyInfoFromAccount:", v4);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountStore](self, "accountStore"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
      objc_msgSend(v12, "saveAccount:", v13);

      -[FMDServiceProvider accountInfoDidChange](self, "accountInfoDidChange");
    }
  }
  else
  {
    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "updateAccount is adding a new account", v18, 2u);
    }

    -[FMDServiceProvider setAccount:](self, "setAccount:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountStore](self, "accountStore"));
    objc_msgSend(v16, "saveAccount:", v4);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
    objc_msgSend(v17, "eventDidOccur:", 0);

    -[FMDServiceProvider accountAdded](self, "accountAdded");
  }

}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    objc_msgSend(v9, "copyInfoFromAccount:", v6);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountStore](self, "accountStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    objc_msgSend(v10, "saveAccount:", v11);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009C6E8;
    v17[3] = &unk_1002C49E8;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    -[FMDServiceProvider accountRemoveRequestedWithCompletion:](self, "accountRemoveRequestedWithCompletion:", v17);

  }
  else
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022C36C(v6, v13);

    v14 = kFMDErrorDomain;
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("No existing account found");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, -1, v15));

    if (v7)
      (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (void)removeAccountPreferences
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to clean prefs %@", (uint8_t *)&v7, 0xCu);

  }
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("needsLostModeExitAuth"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("LastUpdated"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("FMIPInfo"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("LastALCompletionInfo"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("ClientLostModeInfo"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDNotBackedUpPrefDomain);
  +[FMDPreferencesMgr cleanAccountKeys](FMDPreferencesMgr, "cleanAccountKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  objc_msgSend(v6, "clearCache");

}

- (void)reinitializeProviderWithAccount:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FMDServiceProvider setAccount:](self, "setAccount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accountStore](self, "accountStore"));
  objc_msgSend(v4, "saveAccount:", 0);

  -[FMDServiceProvider addAccount:](self, "addAccount:", v5);
}

- (void)accountInfoDidChange
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v4 = objc_msgSend(v3, "activityState");

  if (v4 == 1)
  {
    -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("AccountChange"), 0);
  }
  else
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to start %@ again because account changed", (uint8_t *)&v8, 0xCu);

    }
    -[FMDServiceProvider makeProviderActive](self, "makeProviderActive");
  }
}

- (void)accountAdded
{
  -[FMDServiceProvider makeProviderInactive](self, "makeProviderInactive");
  -[FMDServiceProvider makeProviderActive](self, "makeProviderActive");
}

- (void)accountRemoveRequestedWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccessories"));
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &stru_1002C4A28);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  objc_msgSend(v6, "clearSupportedAccessoryRegistry");

  -[FMDServiceProvider setSupportedAccessoryRegistry:](self, "setSupportedAccessoryRegistry:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v7, "clearAccessoryRegistry");

  -[FMDServiceProvider setAccessoryRegistry:](self, "setAccessoryRegistry:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryLocationStore](self, "accessoryLocationStore"));
  objc_msgSend(v8, "clearAccessoryLocationStore");

  -[FMDServiceProvider setAccessoryLocationStore:](self, "setAccessoryLocationStore:", 0);
  -[FMDServiceProvider clearFutures](self, "clearFutures");
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v9 = v10;
  }

}

- (void)removeAccount
{
  -[FMDServiceProvider setAccount:](self, "setAccount:", 0);
}

- (void)registerAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  FMDInternalLocalFindableAccessory *v10;
  void *v11;
  AccessoryRegisterAction *v12;
  void *v13;
  void *v14;
  AccessoryRegisterAction *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  int v22;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Now Registering Accessory - %@", (uint8_t *)&v22, 0xCu);
  }

  v10 = -[FMDInternalLocalFindableAccessory initWithLocalFindableAccessory:]([FMDInternalLocalFindableAccessory alloc], "initWithLocalFindableAccessory:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v11, "updateAccessory:", v10);

  v12 = [AccessoryRegisterAction alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v10));
  v15 = -[AccessoryRegisterAction initWithAccount:accessory:cause:force:serverInteractionController:](v12, "initWithAccount:accessory:cause:force:serverInteractionController:", v13, v10, CFSTR("deviceDidPair"), 0, v14);

  -[AccessoryRegisterAction setIncludeDeviceState:](v15, "setIncludeDeviceState:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory accessoryIdentifier](v10, "accessoryIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
  v19 = objc_msgSend(v16, "addAction:forIdentifier:", v15, v18);

  if (v19)
  {
    v7[2](v7, 0);
  }
  else
  {
    v20 = objc_alloc((Class)NSError);
    v21 = objc_msgSend(v20, "initWithDomain:code:userInfo:", kFMDErrorDomain, 1, 0);
    ((void (**)(id, id))v7)[2](v7, v21);

  }
}

- (void)unregisterAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  FMDInternalLocalFindableAccessory *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Now Unregistering Accessory - %@", (uint8_t *)&v12, 0xCu);
  }

  v10 = -[FMDInternalLocalFindableAccessory initWithLocalFindableAccessory:]([FMDInternalLocalFindableAccessory alloc], "initWithLocalFindableAccessory:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v11, "removeAccessory:", v10);

  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("deviceDidUnpair"), 1);
  v7[2](v7, 0);

}

- (BOOL)isActivationLocked
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v9[2];
  __int16 v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastIdentityTime"));
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastIdentityTime"));
    v9[0] = 67109376;
    v9[1] = v4 != 0;
    v10 = 2048;
    v11 = objc_msgSend(v7, "fm_epoch");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "isActivationLocked returned %i, %lli", (uint8_t *)v9, 0x12u);

  }
  return v4 != 0;
}

- (void)activationLockAuthInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  if (v5)
  {
    v6 = objc_alloc_init((Class)FMDActivationLockAuthInfo);
    objc_msgSend(v6, "setIsFindMyON:", 1);
    objc_msgSend(v6, "setIsSignedIntoICloud:", 1);
    objc_msgSend(v6, "setIsActivationLockEnabled:", -[FMDServiceProvider isActivationLocked](self, "isActivationLocked"));
    v7 = -[FMDServiceProvider _accountSecurityLevel](self, "_accountSecurityLevel");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "adsid"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dsid"));

      objc_msgSend(v6, "setDsid:", v12);
      objc_msgSend(v6, "setAltDsid:", v10);
      objc_msgSend(v6, "setIsAccountHSA2:", v8 == 4);
      LODWORD(v11) = objc_msgSend(v6, "isAccountHSA2");
      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v11)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "account is HSA2 - requesting pet", buf, 2u);
        }

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10009D358;
        v28[3] = &unk_1002C4A50;
        v29 = v6;
        v30 = v4;
        -[FMDServiceProvider petForUserWithCompletion:](self, "petForUserWithCompletion:", v28);

      }
      else
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Account is non-HSA2. Not requesting PET - returning immediately", buf, 2u);
        }

        (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v6, 0);
      }

    }
    else
    {
      v18 = sub_1000031B8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10022C490(v19, v20, v21, v22, v23, v24, v25, v26);

      v27 = objc_alloc((Class)NSError);
      v10 = objc_msgSend(v27, "initWithDomain:code:userInfo:", kFMDErrorDomain, 5, 0);
      (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v10);
    }

  }
  else
  {
    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No FMIP account for authinfo. Returning status as Find My OFF", buf, 2u);
    }

    v6 = objc_alloc_init((Class)FMDActivationLockAuthInfo);
    objc_msgSend(v6, "setIsFindMyON:", 0);
    objc_msgSend(v6, "setPet:", 0);
    (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v6, 0);
  }

}

- (void)petForUserWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  if (v5)
  {
    v6 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "adsid"));

      objc_msgSend(v6, "setAltDSID:", v8);
      objc_msgSend(v6, "setAuthenticationType:", 1);
      objc_msgSend(v6, "setIsUsernameEditable:", 0);
      objc_msgSend(v6, "setServiceType:", 1);
      objc_msgSend(v6, "setShouldSkipSettingsLaunchAlert:", 1);
      objc_msgSend(v6, "setShouldPromptForPasswordOnly:", 1);
      objc_msgSend(v6, "setShouldUpdatePersistentServiceTokens:", 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10009D6C8;
      v15[3] = &unk_1002C31C0;
      v16 = v4;
      objc_msgSend(v5, "authenticateWithContext:completion:", v6, v15);

    }
    else
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authContext", buf, 2u);
      }

      v14 = objc_alloc((Class)NSError);
      v8 = objc_msgSend(v14, "initWithDomain:code:userInfo:", kFMDErrorDomain, 5, 0);
      (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v8);
    }

  }
  else
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authController", buf, 2u);
    }

    v11 = objc_alloc((Class)NSError);
    v6 = objc_msgSend(v11, "initWithDomain:code:userInfo:", kFMDErrorDomain, 5, 0);
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

- (unint64_t)_accountSecurityLevel
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  int v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "adsid"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v5 = v4;
    if (v4)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[NSObject authKitAccountWithAltDSID:](v4, "authKitAccountWithAltDSID:", v3));
      if (v6)
      {
        v7 = -[NSObject securityLevelForAccount:](v5, "securityLevelForAccount:", v6);
        v8 = sub_1000031B8();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 134217984;
          v22 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "securityLevel %lu", (uint8_t *)&v21, 0xCu);
        }
      }
      else
      {
        v19 = sub_1000031B8();
        v9 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to retrieve account", (uint8_t *)&v21, 2u);
        }
        v7 = 0;
      }

    }
    else
    {
      v18 = sub_1000031B8();
      v6 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to instantiate accountManager", (uint8_t *)&v21, 2u);
      }
      v7 = 0;
    }

  }
  else
  {
    v10 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10022C4C0(v5, v11, v12, v13, v14, v15, v16, v17);
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (void)makeProviderActive
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  FMDSupportedAccessoryRegistry *v13;
  FMDAccessoryRegistry *v14;
  FMDAccessoryRegistryDelegateAdaptor *v15;
  void *v16;
  FMDAccessoryRegistryDelegateAdaptor *v17;
  FMDBluetoothManager *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  FMDExtAccessoryManager *v25;
  _BOOL4 v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  FMDAccessoryLocationStore *v33;
  void *v34;
  void *v35;
  FMDAccessoryLocationStore *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  unsigned int v53;
  dispatch_time_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD block[4];
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "activityState") == 1)
    goto LABEL_36;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v74 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#start Making %@ active...", buf, 0xCu);

  }
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
    *(_DWORD *)buf = 138412290;
    v74 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#start Found account: %@", buf, 0xCu);

  }
  if (-[FMDServiceProvider willMakeProviderActive](self, "willMakeProviderActive"))
  {
    -[FMDServiceProvider setWaitingToMakeProviderActive:](self, "setWaitingToMakeProviderActive:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDServiceProvider setFuturesByCommandId:](self, "setFuturesByCommandId:", v12);

    v13 = -[FMDSupportedAccessoryRegistry initWithDelegate:]([FMDSupportedAccessoryRegistry alloc], "initWithDelegate:", self);
    -[FMDServiceProvider setSupportedAccessoryRegistry:](self, "setSupportedAccessoryRegistry:", v13);

    v14 = -[FMDAccessoryRegistry initWithSupportDelete:]([FMDAccessoryRegistry alloc], "initWithSupportDelete:", self);
    -[FMDServiceProvider setAccessoryRegistry:](self, "setAccessoryRegistry:", v14);

    v15 = [FMDAccessoryRegistryDelegateAdaptor alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    v17 = -[FMDAccessoryRegistryDelegateAdaptor initWithAccessoryRegistry:](v15, "initWithAccessoryRegistry:", v16);
    -[FMDServiceProvider setAccessoryRegistryDelegateAdaptor:](self, "setAccessoryRegistryDelegateAdaptor:", v17);

    v18 = objc_alloc_init(FMDBluetoothManager);
    -[FMDServiceProvider setBluetoothManager:](self, "setBluetoothManager:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v20, "setSupportedAccessoryRegistry:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistryDelegateAdaptor](self, "accessoryRegistryDelegateAdaptor"));
    v22 = objc_claimAutoreleasedReturnValue(-[FMDServiceProvider bluetoothManager](self, "bluetoothManager"));
    objc_msgSend((id)v22, "setDelegate:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v11, "addObject:", v23);

    LOBYTE(v22) = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableFindkit"), kFMDNotBackedUpPrefDomain);
    v24 = sub_1000530AC();
    v25 = (FMDExtAccessoryManager *)objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEFAULT);
    if ((v22 & 1) != 0)
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v25->super, OS_LOG_TYPE_DEFAULT, "Findkit Disabled", buf, 2u);
      }
    }
    else
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v25->super, OS_LOG_TYPE_DEFAULT, "Findkit Enabled", buf, 2u);
      }

      v30 = +[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance");
      v25 = objc_alloc_init(FMDExtAccessoryManager);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
      -[FMDExtAccessoryManager setAccessoryRegistry:](v25, "setAccessoryRegistry:", v31);

      -[FMDServiceProvider setExtAccessoryManager:](self, "setExtAccessoryManager:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider extAccessoryManager](self, "extAccessoryManager"));
      objc_msgSend(v11, "addObject:", v32);

    }
    v33 = [FMDAccessoryLocationStore alloc];
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    v36 = -[FMDAccessoryLocationStore initWithSupportedAccessoryRegistry:accessoryRegistry:](v33, "initWithSupportedAccessoryRegistry:accessoryRegistry:", v34, v35);
    -[FMDServiceProvider setAccessoryLocationStore:](self, "setAccessoryLocationStore:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    objc_msgSend(v37, "registerDelegate:", self);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryLocationStore](self, "accessoryLocationStore"));
    objc_msgSend(v38, "registerDelegate:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistryDelegateAdaptor](self, "accessoryRegistryDelegateAdaptor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCompanionRegistryFactory companionRegistryWithDelegate:](FMDCompanionRegistryFactory, "companionRegistryWithDelegate:", v40));

    objc_msgSend(v11, "addObject:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    objc_msgSend(v42, "addDataSources:", v11);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    if (objc_msgSend(v43, "isInternalBuild"))
    {
      v44 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("AlertOnAccessoryConnect"), kFMDNotBackedUpPrefDomain);

      if (!v44)
      {
LABEL_21:
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "apsEnvironmentConstant"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "apsHandlerForEnvironment:", v47));

        objc_msgSend(v48, "registerDelegate:forTopic:", self, CFSTR("com.apple.mobileme.fmip"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "apsToken"));

        if (v49)
        {
          -[FMDServiceProvider _sendStartupRegister](self, "_sendStartupRegister");
        }
        else
        {
          v50 = sub_1000031B8();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "No APS token yet", buf, 2u);
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
          v53 = objc_msgSend(v52, "isInternalBuild");

          if (v53)
          {
            objc_initWeak((id *)buf, self);
            v54 = dispatch_time(0, 5000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10009E228;
            block[3] = &unk_1002C11E8;
            objc_copyWeak(&v72, (id *)buf);
            v71 = v48;
            dispatch_after(v54, (dispatch_queue_t)&_dispatch_main_q, block);

            objc_destroyWeak(&v72);
            objc_destroyWeak((id *)buf);
          }
        }
        -[FMDServiceProvider didMakeProviderActive](self, "didMakeProviderActive");
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        objc_msgSend(v55, "setActivityState:", 1);

        v56 = -[FMDServiceProvider authInvalidError](self, "authInvalidError");
        if ((_DWORD)v56 != 1196379972)
        {
          v57 = sub_1000031B8();
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serviceName](self, "serviceName"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFourCC:](NSString, "stringWithFourCC:", v56));
            *(_DWORD *)buf = 138412802;
            v74 = v59;
            v75 = 2112;
            v76 = v60;
            v77 = 2112;
            v78 = v61;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%@: Account %@ is invalid due to '%@'", buf, 0x20u);

          }
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
          v63 = objc_msgSend(v62, "isInternalBuild");

          if (v63)
          {
            v64 = sub_1000031B8();
            v65 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v66 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serviceName](self, "serviceName"));
              *(_DWORD *)buf = 138412290;
              v74 = v66;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);

            }
          }
          -[FMDServiceProvider tryToFetchAuthToken](self, "tryToFetchAuthToken");
        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
        objc_initWeak((id *)buf, self);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_10009E30C;
        v68[3] = &unk_1002C1378;
        objc_copyWeak(&v69, (id *)buf);
        objc_msgSend(v67, "setStatsChangeHandler:", v68);
        objc_msgSend(v67, "refreshBeaconStats");
        objc_destroyWeak(&v69);
        objc_destroyWeak((id *)buf);

        goto LABEL_36;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[FMDInternalAccessoryConnectionMonitor sharedMonitor](FMDInternalAccessoryConnectionMonitor, "sharedMonitor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
      objc_msgSend(v45, "registerDelegate:", v43);

    }
    goto LABEL_21;
  }
  v27 = sub_1000031B8();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v74 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not making %@ active now", buf, 0xCu);

  }
  -[FMDServiceProvider setWaitingToMakeProviderActive:](self, "setWaitingToMakeProviderActive:", 1);
LABEL_36:

}

- (BOOL)willMakeProviderActive
{
  return 1;
}

- (void)makeProviderInactive
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider fm_logID](self, "fm_logID"));
    v22 = 138412290;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Making %@ inactive...", (uint8_t *)&v22, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  objc_msgSend(v7, "setActivityState:", 2);

  -[FMDServiceProvider willMakeProviderInactive](self, "willMakeProviderInactive");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionController](self, "serverInteractionController"));
  objc_msgSend(v8, "cancelAllRequests");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  objc_msgSend(v9, "cancelAllActions");

  v10 = objc_claimAutoreleasedReturnValue(-[FMDServiceProvider standardLocator](self, "standardLocator"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider standardLocator](self, "standardLocator"));
    v13 = objc_msgSend(v12, "locatorRunning");

    if (v13)
    {
      v14 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stopping standard locate...", (uint8_t *)&v22, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider standardLocator](self, "standardLocator"));
      objc_msgSend(v16, "stopLocator");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider standardLocator](self, "standardLocator"));
      objc_msgSend(v17, "setStoppedLocatorBlock:", 0);

    }
  }
  -[FMDServiceProvider setStandardLocator:](self, "setStandardLocator:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "apsEnvironmentConstant"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "apsHandlerForEnvironment:", v19));

  objc_msgSend(v20, "deregisterDelegate:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSPStatusUtil sharedInstance](FMDSPStatusUtil, "sharedInstance"));
  objc_msgSend(v21, "setStatsChangeHandler:", 0);
  objc_msgSend(v21, "cancelRefresh");
  -[FMDServiceProvider didMakeProviderInactive](self, "didMakeProviderInactive");

}

- (void)_sendStartupRegister
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E674;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)queueAccessoryActionsIfNeeded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  AccessoryAction *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  id v20;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider checking if we need to QC for accessory", (uint8_t *)&v19, 2u);
  }

  if (!v4)
  {
    v18 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider Skipping QC due to nil accessory.", (uint8_t *)&v19, 2u);
    }
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandContext"));
  v8 = objc_msgSend(v7, "pendingAction");

  if (v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider QC required for %@", (uint8_t *)&v19, 0xCu);
    }

    v11 = [AccessoryAction alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v4));
    v14 = -[AccessoryAction initWithAccount:accessory:requiresConnectivity:serverInteractionController:](v11, "initWithAccount:accessory:requiresConnectivity:serverInteractionController:", v12, v4, 1, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    objc_msgSend(v15, "registerDelegate:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v17 = objc_msgSend(v16, "enqueueAction:", v14);

LABEL_10:
  }

}

- (void)registerCommonNotifications
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "deviceNameChanged:", CFSTR("FMDDeviceNameChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "passcodeStateChanged:", CFSTR("FMDPasscodeStateChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "allowPasscodeModificationChanged:", CFSTR("FMDAllowPasscodeModificationChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "locationServicesStateChanged:", CFSTR("FMDLocationServicesStateChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "localeChanged:", CFSTR("FMDLocaleChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "searchPartyBeaconsChanged:", CFSTR("kFMDDeviceSPSelfBeaconChangeNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleAccessoryDidPairNotification:", CFSTR("kFMDAccessoryDidPairLocalNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v4, "addObserver:selector:name:object:", v3, "refetchBauuids:", CFSTR("kFMDAccessoryDidPairLocalNotification"), 0);

}

- (void)deregisterCommonNotifications
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDDeviceNameChangedNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDPasscodeStateChangedNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDAllowPasscodeModificationChangedNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDLocationServicesStateChangedNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDLocaleChangedNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("kFMDDeviceSPSelfBeaconChangeNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("kFMDAccessoryDidPairLocalNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v4, "removeObserver:name:object:", v3, CFSTR("kFMDAccessoryDidPairLocalNotification"), 0);

}

- (id)urlForRequestType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RequestTemplateURL *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServerConfig sharedInstance](FMDServerConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlTemplateForRequestType:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));

    v9 = objc_alloc_init(RequestTemplateURL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v9, "urlFromTemplate:account:udid:", v6, v10, v8));

  }
  else
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Did not find a url template for request type : %@", (uint8_t *)&v15, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (id)serverInteractionControllerForAccessory:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = sub_10009C318;
    v17 = sub_10009C328;
    v18 = 0;
    v6 = objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009EF0C;
    block[3] = &unk_1002C18B8;
    p_buf = &buf;
    block[4] = self;
    v12 = v5;
    dispatch_sync(v6, block);

    v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to get serverInteractionController by accessory since accessoryIdentifier was nil. Accessory: %@.", (uint8_t *)&buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)serverInteractionControllerForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authId")), v6, v6))
  {
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = sub_10009C318;
    v19 = sub_10009C328;
    v20 = 0;
    v7 = objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009F1E8;
    block[3] = &unk_1002C18B8;
    v14 = buf;
    block[4] = self;
    v13 = v5;
    dispatch_sync(v7, block);

    v8 = *((id *)v16 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unable to get serverinteractioncontroller by account since account or authID (DSID) was nil", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  RegisterAction *v9;

  v4 = a4;
  v6 = a3;
  v9 = -[RegisterAction initWithReason:force:provider:]([RegisterAction alloc], "initWithReason:force:provider:", v6, v4, self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  v8 = objc_msgSend(v7, "enqueueAction:", v9);

}

- (unsigned)essentialServerInfoMissingError
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[FMDServiceProvider authInvalidError](self, "authInvalidError");
  if (v3 == 1196379972)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apsEnvironmentConstant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "apsHandlerForEnvironment:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "apsToken"));
    if (v8)
      v3 = 1196379972;
    else
      v3 = 1480675411;

  }
  return v3;
}

- (unsigned)authInvalidError
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  if (!v3)
    return 1480672067;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 1481986898;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authToken"));
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    return 1481920331;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authId"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
    return 1196379972;
  else
    return 1482639684;
}

- (void)tryToFetchAuthToken
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authToken"));
  objc_msgSend(v2, "length");

}

- (id)newLocationManager
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationManagerFactory sharedInstance](FMDLocationManagerFactory, "sharedInstance"));
  v3 = objc_msgSend(v2, "newLocationManager");

  return v3;
}

- (void)showAlertFromServerResponse:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  dispatch_time_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  _QWORD block[4];
  id v39;
  _QWORD v40[4];
  __CFString *v41;
  id v42;
  _QWORD v43[4];
  __CFString *v44;
  id v45;
  uint8_t buf[4];
  double v47;

  v3 = a3;
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10022C4F0();

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonURL")));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonAction")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("delay")));
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (v6)
  {
    v37 = v9;
    v17 = v8;
    v18 = +[FMDPreferencesMgr accessibilityFontSizeEnabled](FMDPreferencesMgr, "accessibilityFontSizeEnabled");
    v19 = objc_alloc_init((Class)FMAlert);
    objc_msgSend(v19, "setCategory:", 2);
    if ((v18 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_stringByReplacingNonBreakingSpaces"));
      objc_msgSend(v19, "setMsgTitle:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_stringByReplacingNonBreakingSpaces"));
      objc_msgSend(v19, "setMsgText:", v21);

    }
    else
    {
      objc_msgSend(v19, "setMsgTitle:", v6);
      objc_msgSend(v19, "setMsgText:", v7);
    }
    objc_msgSend(v19, "setShowMsgInLockScreen:", 1, v6, v7);
    objc_msgSend(v19, "setDismissMsgOnUnlock:", 0);
    objc_msgSend(v19, "setDismissMsgOnLock:", 0);
    v8 = v17;
    objc_msgSend(v19, "setDefaultButtonTitle:", v17);
    if (v37)
      v22 = v10 == 0;
    else
      v22 = 0;
    if (v22)
      v10 = CFSTR("open-url");
    if (v12)
      v23 = v13 == 0;
    else
      v23 = 0;
    if (v23)
      v13 = CFSTR("open-url");
    if (v10)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v10));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10009FB38;
      v43[3] = &unk_1002C13E8;
      v44 = v10;
      v45 = v24;
      v25 = v24;
      objc_msgSend(v19, "setDefaultButtonAction:", v43);

      v8 = v17;
    }
    objc_msgSend(v19, "setAlternateButtonTitle:", v11);
    if (v13)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v13, v12));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10009FBEC;
      v40[3] = &unk_1002C13E8;
      v41 = v13;
      v42 = v26;
      v27 = v26;
      objc_msgSend(v19, "setAlternateButtonAction:", v40);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "defaultButtonTitle"));
    v6 = v34;
    v7 = v35;
    if (!v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alternateButtonTitle"));

      if (v29)
        goto LABEL_24;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FMD_DEFAULT_ALERT_BUTTON"), "fmd_localizedString"));
      objc_msgSend(v19, "setDefaultButtonTitle:", v28);
    }

LABEL_24:
    if (v16 <= 0.0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
      objc_msgSend(v33, "activateAlert:", v19);
    }
    else
    {
      v30 = sub_1000031B8();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v47 = v16;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      v32 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009FCA0;
      block[3] = &unk_1002C1328;
      v39 = v19;
      dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
      v33 = v39;
    }

    v9 = v37;
  }

}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  return 0;
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serviceName](self, "serviceName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ - Auth failure received for account %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)didReceiveServerAlertForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertFromServerResponse"));

  if (v5)
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10022C550(v4, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertFromServerResponse"));
    -[FMDServiceProvider showAlertFromServerResponse:](self, "showAlertFromServerResponse:", v8);

  }
}

- (void)deviceNameChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Register for device name change", v6, 2u);
  }

  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("DeviceNameChanged"), 0);
}

- (void)passcodeStateChanged:(id)a3
{
  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("PasscodeStateChanged"), 0);
}

- (void)allowPasscodeModificationChanged:(id)a3
{
  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("PasscodeRestrictionChanged"), 0);
}

- (void)locationServicesStateChanged:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("LocationServicesStateChanged"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v5 = objc_msgSend(v4, "isLocationServicesEnabled");

  if ((v5 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryLocationStore](self, "accessoryLocationStore"));
    objc_msgSend(v6, "clearAccessoryLocationStore");

  }
}

- (void)localeChanged:(id)a3
{
  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("LocaleChanged"), 0);
}

- (void)searchPartyBeaconsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Register for search Party Beacons Changed", buf, 2u);
  }

  v6 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A005C;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleAccessoryDidPairNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_handleAccessoryDidPairNotification", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  objc_msgSend(v6, "reloadData");

}

- (void)accessoryDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AccessoryRegisterAction *v7;
  void *v8;
  void *v9;
  AccessoryRegisterAction *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "category") == (id)1 || objc_msgSend(v4, "category") == (id)3)
  {
    v5 = sub_100052F5C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10022C5F4();

    v7 = [AccessoryRegisterAction alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v4));
    v10 = -[AccessoryRegisterAction initWithAccount:accessory:cause:force:serverInteractionController:](v7, "initWithAccount:accessory:cause:force:serverInteractionController:", v8, v4, CFSTR("accessoryRegistryUpdate"), 0, v9);

    -[AccessoryRegisterAction setIncludeDeviceState:](v10, "setIncludeDeviceState:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
    objc_msgSend(v11, "addAction:forIdentifier:", v10, v13);

  }
}

- (void)accessoryDidConnect:(id)a3
{
  -[FMDServiceProvider queueAccessoryActionsIfNeeded:](self, "queueAccessoryActionsIfNeeded:", a3);
}

- (void)accessoryDidPair:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory did pair : sending a register: %@", (uint8_t *)&v15, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  objc_msgSend(v7, "resetSupportedAccessoriesVersion");

  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("deviceDidPair"), 0);
  +[AccessoryRegisterAction cleanupContextForAccessory:](AccessoryRegisterAction, "cleanupContextForAccessory:", v4);
  v8 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___FMDAudioAccessory);
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Audio Accessory did pair", (uint8_t *)&v15, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetsForAccessory:", v4));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    objc_msgSend(v14, "updateAccessory:assets:", v4, v13);

  }
  else
  {
    if (v11)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Internal Accessory did pair", (uint8_t *)&v15, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
    objc_msgSend(v13, "forceUpdateAccessory:", v4);
  }

}

- (void)accessoryDidUnpair:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory did un-pair : sending a register.", v8, 2u);
  }

  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("deviceDidUnpair"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandContext"));
  objc_msgSend(v7, "cleanupContexts");

  +[AccessoryRegisterAction cleanupContextForAccessory:](AccessoryRegisterAction, "cleanupContextForAccessory:", v4);
}

- (BOOL)supportsAccessory:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10022C654();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v8 = objc_msgSend(v7, "isAccessorySupported:", v4);

  return v8;
}

- (void)supportedAccessoryRegistryDidUpdateSupportedAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  FMDServiceProvider *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allAccessories"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A05F0;
  v8[3] = &unk_1002C4A78;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

- (BOOL)enqueueRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  LOBYTE(self) = -[FMDServiceProvider enqueueRequest:account:](self, "enqueueRequest:account:", v4, v5);

  return (char)self;
}

- (BOOL)enqueueRequest:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  int v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authId"));
    v12 = objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v11);

    if (v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccount:](self, "serverInteractionControllerForAccount:", v8));
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionController](self, "serverInteractionController"));
    v18 = v13;
    v17 = objc_msgSend(v13, "enqueueRequest:", v6);

  }
  else
  {
    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
      v20 = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not sending request %@ to server since there is no account. This seems like a stray request that escaped the deinitialization process", (uint8_t *)&v20, 0xCu);

    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)enqueueRequest:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  id v15;
  int v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  if (!v8)
  {
    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
      v17 = 138412290;
      v18 = v13;
      v14 = "Not sending request %@ to server since there is no account. This seems like a stray request that escaped the"
            " deinitialization process";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0xCu);

    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    v15 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
      v17 = 138412290;
      v18 = v13;
      v14 = "Not sending request %@ to server since there is no accessory. This seems like a stray request that escaped t"
            "he deinitialization process";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v7));
  v10 = objc_msgSend(v9, "enqueueRequest:", v6);

LABEL_10:
  return v10;
}

- (void)didReceiveAPSMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  FMDServiceProvider *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id obj;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  _BYTE v66[14];

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v66 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Push message received %@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fmipIntents")));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fmipAccessoryIntents")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fmipId")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverContext")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v10, "isInternalBuild"))
  {
    v11 = +[FMDPreferencesMgr disablePush](FMDPreferencesMgr, "disablePush");

    if (v11)
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Pushes are disabled", buf, 2u);
      }
LABEL_14:

      goto LABEL_65;
    }
  }
  else
  {

  }
  if (!-[FMDServiceProvider _handleSecureLocationsPush:](self, "_handleSecureLocationsPush:", v4))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

    if (!v14)
    {
      v17 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10022C6B4(v13, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    if (objc_msgSend(v15, "isInternalBuild"))
      v16 = +[FMDPreferencesMgr disableIntents](FMDPreferencesMgr, "disableIntents");
    else
      v16 = 0;

    if (v7 | v8 && v16)
    {
      v25 = sub_1000031B8();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Intents are disabled", buf, 2u);
      }

    }
    if ((((v7 | v8) == 0) | v16) == 1)
    {
      -[FMDServiceProvider _handlePushWithoutIntents:](self, "_handlePushWithoutIntents:", v58);
    }
    else
    {
      v27 = -[FMDServiceProvider _isValidIntentAccountId:](self, "_isValidIntentAccountId:", v9);
      v28 = sub_1000031B8();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = v27;
        *(_WORD *)&v66[4] = 2112;
        *(_QWORD *)&v66[6] = v9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "isValidIntentAccount %d for intentAccountId %@", buf, 0x12u);
      }

      if (v27)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        if (v8)
        {
          v53 = v9;
          v54 = v8;
          v55 = v7;
          v56 = v4;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          obj = (id)v8;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(_QWORD *)v61 != v32)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("id")));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("type")));
                if (objc_msgSend(v36, "isEqualToString:", CFSTR("SND")))
                {
                  -[FMDServiceProvider _handleSoundIntent:serverContext:](self, "_handleSoundIntent:serverContext:", v34, v58);
                }
                else if (objc_msgSend(v36, "isEqualToString:", CFSTR("LOC")))
                {
                  -[FMDServiceProvider _handleLocateIntent:serverContext:](self, "_handleLocateIntent:serverContext:", v34, v58);
                }
                else if (objc_msgSend(v36, "isEqualToString:", CFSTR("QC")))
                {
                  -[FMDServiceProvider _handleQCIntent:serverContext:](self, "_handleQCIntent:serverContext:", v34, v58);
                }
                objc_msgSend(v59, "addObject:", v35);

              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
            }
            while (v31);
          }

          v7 = v55;
          v4 = v56;
          v9 = v53;
          v8 = v54;
        }
        if (v7)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "objectForKey:", CFSTR("SND")));
          v38 = v37;
          if (v37)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("id")));
            if ((objc_msgSend(v59, "containsObject:", v39) & 1) != 0)
            {
              v40 = sub_1000031B8();
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                sub_10022C6E4();

            }
            else
            {
              -[FMDServiceProvider _handleSoundIntent:serverContext:](self, "_handleSoundIntent:serverContext:", v38, v58);
            }

          }
          v42 = self;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "objectForKey:", CFSTR("LOC")));
          v44 = v43;
          if (v43)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("id")));
            if ((objc_msgSend(v59, "containsObject:", v45) & 1) != 0)
            {
              v46 = sub_1000031B8();
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                sub_10022C6E4();

            }
            else
            {
              -[FMDServiceProvider _handleLocateIntent:serverContext:](v42, "_handleLocateIntent:serverContext:", v44, v58);
            }

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "objectForKey:", CFSTR("QC")));
          v49 = v48;
          if (v48)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("id")));
            if ((objc_msgSend(v59, "containsObject:", v50) & 1) != 0)
            {
              v51 = sub_1000031B8();
              v52 = objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                sub_10022C6E4();

            }
            else
            {
              -[FMDServiceProvider _handleQCIntent:serverContext:](v42, "_handleQCIntent:serverContext:", v49, v58);
            }

          }
        }

      }
    }
  }
LABEL_65:

}

- (void)didReceiveAPSToken:(id)a3
{
  if (-[FMDServiceProvider completedStartupRegister](self, "completedStartupRegister", a3))
    -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("APSTokenReceived"), 0);
  else
    -[FMDServiceProvider _sendStartupRegister](self, "_sendStartupRegister");
}

- (void)_handlePushWithoutIntents:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  FMDActingRequestDecorator *v8;
  FMDActingRequestDecorator *v9;
  QCAction *v10;
  void *v11;
  void *v12;
  QCAction *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling push without intent %@", buf, 0xCu);
  }

  v7 = -[FMDServiceProvider essentialServerInfoMissingError](self, "essentialServerInfoMissingError");
  if ((_DWORD)v7 == 1196379972)
  {
    v8 = [FMDActingRequestDecorator alloc];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000A1340;
    v25[3] = &unk_1002C1D20;
    v25[4] = self;
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_1000A13A8;
    v23 = &unk_1002C1D20;
    v24 = v4;
    v9 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v8, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C4A98, v25, &v20, 0);
    v10 = [QCAction alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account", v20, v21, v22, v23));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionController](self, "serverInteractionController"));
    v13 = -[QCAction initWithAccount:shutdownActivityPending:serverInteractionController:](v10, "initWithAccount:shutdownActivityPending:serverInteractionController:", v11, 0, v12);

    -[QCAction setRequestDecorator:](v13, "setRequestDecorator:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v15 = objc_msgSend(v14, "enqueueAction:", v13);

  }
  else
  {
    v16 = v7;
    v17 = sub_1000031B8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFourCC:](NSString, "stringWithFourCC:", v16));
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring APS message since some essential server info is missing - '%@'", buf, 0xCu);

    }
    -[FMDServiceProvider tryToFetchAuthToken](self, "tryToFetchAuthToken");
  }

}

- (void)_handleLocateIntent:(id)a3 serverContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  AccessoryAction *v19;
  void *v20;
  void *v21;
  AccessoryAction *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("id")));
  if (v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Locate command intent found", (uint8_t *)&v26, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("udid")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_nullToNil"));

    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessoryForIdentifier:", v13));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandContext"));
        objc_msgSend(v16, "setPendingActionIntent:", v6);

        v17 = sub_1000031B8();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138412546;
          v27 = v15;
          v28 = 2112;
          v29 = v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", (uint8_t *)&v26, 0x16u);
        }

        v19 = [AccessoryAction alloc];
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v15));
        v22 = -[AccessoryAction initWithAccount:accessory:requiresConnectivity:serverInteractionController:](v19, "initWithAccount:accessory:requiresConnectivity:serverInteractionController:", v20, v15, 0, v21);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
        objc_msgSend(v23, "registerDelegate:", v22);

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
        v25 = objc_msgSend(v24, "enqueueAction:", v22);

      }
    }
    else
    {
      -[FMDServiceProvider _handlePushWithoutIntents:](self, "_handlePushWithoutIntents:", v7);
    }

  }
}

- (void)_handleQCIntent:(id)a3 serverContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  AccessoryAction *v21;
  void *v22;
  void *v23;
  AccessoryAction *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("id")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("udid")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fm_nullToNil"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("waitForConnect")));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v8)
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "QC intent found", buf, 2u);
    }

    if (objc_msgSend(v10, "length"))
    {
      v15 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessoryForIdentifier:", v15));

      if (v17)
      {
        v28 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "commandContext"));
        objc_msgSend(v18, "setPendingActionIntent:", v6);

        v19 = sub_1000031B8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v17;
          v31 = 2112;
          v32 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", buf, 0x16u);
        }

        v21 = [AccessoryAction alloc];
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v17));
        v24 = -[AccessoryAction initWithAccount:accessory:requiresConnectivity:serverInteractionController:](v21, "initWithAccount:accessory:requiresConnectivity:serverInteractionController:", v22, v17, v12, v23);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
        objc_msgSend(v25, "registerDelegate:", v24);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
        v27 = objc_msgSend(v26, "enqueueAction:", v24);

        v15 = v28;
      }

    }
    else
    {
      -[FMDServiceProvider _handlePushWithoutIntents:](self, "_handlePushWithoutIntents:", v7);
    }
  }

}

- (id)futureForCommandId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider futuresByCommandId](self, "futuresByCommandId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)setFuture:(id)a3 commandId:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider futuresByCommandId](self, "futuresByCommandId"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
}

- (void)removeFutureForCommandId:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider futuresByCommandId](self, "futuresByCommandId"));
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (void)clearFutures
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider futuresByCommandId](self, "futuresByCommandId"));
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_handleSoundIntent:(id)a3 serverContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  FMDAccessoryPlaySoundAction *v40;
  void *v41;
  void *v42;
  FMDAccessoryPlaySoundAction *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  AccessoryAction *v49;
  void *v50;
  void *v51;
  AccessoryAction *v52;
  void *v53;
  double v54;
  TimedWaitAction *v55;
  void *v56;
  TimedWaitAction *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  id v62;
  unsigned int v63;
  unsigned int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("id")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("maxDurationInSeconds")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("udid")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_nullToNil"));

  if (v6)
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "doubleValue");
      *(_DWORD *)buf = 134217984;
      v76 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Play sound intent found, playing sound for %f seconds...", buf, 0xCu);
    }

    if (objc_msgSend(v9, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("rampUpDurationInSeconds")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("rampDownDurationInSeconds")));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("channels")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("userConfirmedSafetyWarning")));
      v64 = objc_msgSend(v15, "BOOLValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("forceConnection")));
      v63 = objc_msgSend(v16, "BOOLValue");

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scanDurationInSeconds")));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("intentEpochTime")));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("intentExpiryInSeconds")));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("delayIntervalInSeconds")));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("inEarDetectionTimeout")));
      v18 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
      v69 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accessoryForIdentifier:", v18));

      v21 = sub_1000031B8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        v68 = v7;
        if (v23)
        {
          *(_DWORD *)buf = 138412546;
          v76 = v20;
          v77 = 2112;
          v78 = v9;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found accessory %@ from push for id %@", buf, 0x16u);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "commandContext"));
        objc_msgSend(v24, "setPendingActionIntent:", v5);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
        objc_msgSend(v25, "downloadAssetsIfNeededForAccessory:", v20);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
        v62 = objc_msgSend(v26, "defaultTimeoutAudioSafetyStatusForAccessory:", v20);

        v22 = objc_claimAutoreleasedReturnValue(+[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", objc_msgSend(v74, "integerValue")));
        v66 = v17;
        v67 = v14;
        v65 = v13;
        if (!v73)
          goto LABEL_11;
        objc_msgSend(v73, "doubleValue");
        if (v27 <= 0.0)
          goto LABEL_11;
        objc_msgSend(v73, "doubleValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v22, "dateByAddingTimeInterval:"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v29, "timeIntervalSinceReferenceDate");
        v31 = v30;
        objc_msgSend(v28, "timeIntervalSinceReferenceDate");
        v33 = v32;

        if (v31 < v33)
        {
LABEL_11:
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider futureForCommandId:](self, "futureForCommandId:", v6));

          if (v34)
          {
            v35 = sub_1000031B8();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDServiceProvider handling for command id has already started", buf, 2u);
            }
          }
          else
          {
            -[FMDServiceProvider clearFutures](self, "clearFutures");
            v61 = objc_alloc_init((Class)FMFuture);
            -[FMDServiceProvider setFuture:commandId:](self, "setFuture:commandId:", v61, v6);
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
            v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "playbackChannelNamesForAccessory:commandChannels:", v20, v71));

            v40 = [FMDAccessoryPlaySoundAction alloc];
            v41 = v13;
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
            v43 = -[FMDAccessoryPlaySoundAction initWithAccessory:accessoryRegistry:channels:](v40, "initWithAccessory:accessoryRegistry:channels:", v20, v42, v39);

            -[FMDAccessoryPlaySoundAction setDuration:](v43, "setDuration:", v68);
            -[FMDAccessoryPlaySoundAction setTimeout:](v43, "setTimeout:", v66);
            v44 = v41;
            v36 = v61;
            -[FMDAccessoryPlaySoundAction setRampUpDuration:](v43, "setRampUpDuration:", v44);
            -[FMDAccessoryPlaySoundAction setRampDownDuration:](v43, "setRampDownDuration:", v67);
            -[FMDAccessoryPlaySoundAction setDefaultAudioSafetyStatus:](v43, "setDefaultAudioSafetyStatus:", v62);
            -[FMDAccessoryPlaySoundAction setFuture:](v43, "setFuture:", v61);
            -[FMDAccessoryPlaySoundAction setForceConnection:](v43, "setForceConnection:", v63);
            -[FMDAccessoryPlaySoundAction setBypassInEarCheck:](v43, "setBypassInEarCheck:", v64);
            -[FMDAccessoryPlaySoundAction setInEarDetectionTimeout:](v43, "setInEarDetectionTimeout:", v70);
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider bluetoothManager](self, "bluetoothManager"));
            -[FMDAccessoryPlaySoundAction setBluetoothManager:](v43, "setBluetoothManager:", v45);

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
            objc_msgSend(v46, "registerDelegate:", v43);

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
            v48 = objc_msgSend(v47, "enqueueAction:", v43);

            v71 = (void *)v39;
          }

        }
        v49 = [AccessoryAction alloc];
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionControllerForAccessory:](self, "serverInteractionControllerForAccessory:", v20));
        v52 = -[AccessoryAction initWithAccount:accessory:requiresConnectivity:serverInteractionController:](v49, "initWithAccount:accessory:requiresConnectivity:serverInteractionController:", v50, v20, 0, v51);

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
        objc_msgSend(v53, "registerDelegate:", v52);

        objc_msgSend(v72, "doubleValue");
        if (v54 <= 0.0)
        {
          v57 = (TimedWaitAction *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
          v60 = -[TimedWaitAction enqueueAction:](v57, "enqueueAction:", v52);
        }
        else
        {
          v55 = [TimedWaitAction alloc];
          objc_msgSend(v72, "doubleValue");
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));
          v57 = -[TimedWaitAction initWithAction:executeAt:](v55, "initWithAction:executeAt:", v52, v56);

          v58 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
          v59 = objc_msgSend(v58, "enqueueAction:", v57);

        }
        v14 = v67;
        v7 = v68;
        v13 = v65;

        v17 = v66;
      }
      else if (v23)
      {
        *(_DWORD *)buf = 138412290;
        v76 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No accessory found with id %@. Ignoring the push", buf, 0xCu);
      }

    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
      objc_msgSend(v37, "eventDidOccur:", 4);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-id"), CFSTR("message")));
      +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", v6, v13, kFMDPrefDomain);
      +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", v6, CFSTR("lastCommandId"), kFMDNotBackedUpPrefDomain);
    }

  }
}

- (BOOL)_isValidIntentAccountId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  unsigned __int8 v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  unsigned __int8 md[32];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "adsid"));

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4)));
  CC_SHA256(objc_msgSend(v7, "bytes"), (CC_LONG)objc_msgSend(v7, "length"), md);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Comparing ADSIDs (_isValidIntentAccountId) %@ : %@", (uint8_t *)&v14, 0x16u);
  }

  v12 = objc_msgSend(v4, "isEqualToString:", v9);
  return v12;
}

- (void)_accountDidChangeFrom:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if (v13 && !v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
    v7 = v6;
    v8 = 1;
LABEL_8:
    objc_msgSend(v6, "eventDidOccur:", v8);

    goto LABEL_9;
  }
  if (v13)
  {
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "authId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authId"));
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
        objc_msgSend(v12, "eventDidOccur:", 1);

        v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
        v7 = v6;
        v8 = 0;
        goto LABEL_8;
      }
    }
  }
LABEL_9:

}

- (BOOL)_handleSecureLocationsPush:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("findmyws")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    objc_msgSend(v5, "beginTransaction:", CFSTR("MDSecureLocationsHandlePushTransaction"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("locationPayload")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("cmd")));
    v19 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v19));
    v9 = v19;
    v10 = v9 == 0;
    if (v9)
    {
      v11 = sub_10005318C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error creating json data to send to searchparty %@", buf, 0xCu);
      }
    }
    else if (v6)
    {
      v13 = sub_10005318C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received Location Payload Push %@", buf, 0xCu);
      }

      v12 = objc_alloc_init((Class)SPSecureLocationsManager);
      -[NSObject receivedLocationPayload:completion:](v12, "receivedLocationPayload:completion:", v8, &stru_1002C4AB8);
    }
    else
    {
      if (!v7)
      {
LABEL_15:
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
        objc_msgSend(v17, "endTransaction:", CFSTR("MDSecureLocationsHandlePushTransaction"));

        goto LABEL_16;
      }
      v15 = sub_10005318C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received Location Command Push %@", buf, 0xCu);
      }

      v12 = objc_alloc_init((Class)SPSecureLocationsManager);
      -[NSObject receivedLocationCommand:completion:](v12, "receivedLocationCommand:completion:", v8, &stru_1002C4AD8);
    }

    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void)startLocationMonitoringIfNeeded
{
  void *v3;
  FMDSecureLocationMonitor *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider locationMonitor](self, "locationMonitor"));

  if (!v3)
  {
    v4 = objc_alloc_init(FMDSecureLocationMonitor);
    -[FMDServiceProvider setLocationMonitor:](self, "setLocationMonitor:", v4);

  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider locationMonitor](self, "locationMonitor"));
  objc_msgSend(v5, "startLocationMonitorAfterRestart");

}

- (id)apsToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "apsEnvironmentConstant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apsHandlerForEnvironment:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "apsToken"));
    return v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "apsHandlerForEnvironment:", CFSTR("production")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "apsToken"));
    v13 = sub_10005318C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No FMIP account. Defaulting to aps token for PROD env", v15, 2u);
    }

    return v12;
  }
}

- (FMDAccountStore)accountStore
{
  return self->_accountStore;
}

- (FMDLocator)standardLocator
{
  return self->_standardLocator;
}

- (void)setStandardLocator:(id)a3
{
  objc_storeStrong((id *)&self->_standardLocator, a3);
}

- (BOOL)waitingToMakeProviderActive
{
  return self->_waitingToMakeProviderActive;
}

- (void)setWaitingToMakeProviderActive:(BOOL)a3
{
  self->_waitingToMakeProviderActive = a3;
}

- (NSString)serviceIdentifierInURL
{
  return self->_serviceIdentifierInURL;
}

- (void)setAccessoryRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRegistry, a3);
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return self->_supportedAccessoryRegistry;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, a3);
}

- (FMDAccessoryLocationStore)accessoryLocationStore
{
  return self->_accessoryLocationStore;
}

- (void)setAccessoryLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLocationStore, a3);
}

- (FMDAccessoryRegistryDataSource)extAccessoryManager
{
  return self->_extAccessoryManager;
}

- (void)setExtAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_extAccessoryManager, a3);
}

- (FMDExtConfigurationRegistry)extConfigRegistry
{
  return self->_extConfigRegistry;
}

- (FMDBluetoothManaging)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManager, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (FMDSecureLocationMonitor)locationMonitor
{
  return self->_locationMonitor;
}

- (void)setLocationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_locationMonitor, a3);
}

- (NSData)locationPayloadReceived
{
  return self->_locationPayloadReceived;
}

- (void)setLocationPayloadReceived:(id)a3
{
  objc_storeStrong((id *)&self->_locationPayloadReceived, a3);
}

- (NSData)locationCommandReceived
{
  return self->_locationCommandReceived;
}

- (void)setLocationCommandReceived:(id)a3
{
  objc_storeStrong((id *)&self->_locationCommandReceived, a3);
}

- (BOOL)completedStartupRegister
{
  return self->_completedStartupRegister;
}

- (void)setCompletedStartupRegister:(BOOL)a3
{
  self->_completedStartupRegister = a3;
}

- (void)setAccountReadWriteLock:(id)a3
{
  objc_storeStrong((id *)&self->_accountReadWriteLock, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSMutableDictionary)serverInteractionControllerByAccessory
{
  return self->_serverInteractionControllerByAccessory;
}

- (void)setServerInteractionControllerByAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccessory, a3);
}

- (NSMutableDictionary)serverInteractionControllerByAccount
{
  return self->_serverInteractionControllerByAccount;
}

- (void)setServerInteractionControllerByAccount:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccount, a3);
}

- (NSMutableDictionary)futuresByCommandId
{
  return self->_futuresByCommandId;
}

- (void)setFuturesByCommandId:(id)a3
{
  objc_storeStrong((id *)&self->_futuresByCommandId, a3);
}

- (FMDAccessoryRegistryDelegateAdaptor)accessoryRegistryDelegateAdaptor
{
  return self->_accessoryRegistryDelegateAdaptor;
}

- (void)setAccessoryRegistryDelegateAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRegistryDelegateAdaptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRegistryDelegateAdaptor, 0);
  objc_storeStrong((id *)&self->_futuresByCommandId, 0);
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccount, 0);
  objc_storeStrong((id *)&self->_serverInteractionControllerByAccessory, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accountReadWriteLock, 0);
  objc_storeStrong((id *)&self->_locationCommandReceived, 0);
  objc_storeStrong((id *)&self->_locationPayloadReceived, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_extConfigRegistry, 0);
  objc_storeStrong((id *)&self->_extAccessoryManager, 0);
  objc_storeStrong((id *)&self->_accessoryLocationStore, 0);
  objc_storeStrong((id *)&self->_supportedAccessoryRegistry, 0);
  objc_storeStrong((id *)&self->_accessoryRegistry, 0);
  objc_storeStrong((id *)&self->_serviceIdentifierInURL, 0);
  objc_storeStrong((id *)&self->_standardLocator, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
