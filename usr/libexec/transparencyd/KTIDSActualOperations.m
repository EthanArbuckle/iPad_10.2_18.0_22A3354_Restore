@implementation KTIDSActualOperations

- (KTIDSActualOperations)initWithIDSAccountController:(id)a3 lockStateTracker:(id)a4
{
  id v6;
  id v7;
  KTIDSActualOperations *v8;
  id v9;
  dispatch_queue_t v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KTNearFutureScheduler *v20;
  KTNearFutureScheduler *v21;
  void *v22;
  KTIDSActualOperations *v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)KTIDSActualOperations;
  v8 = -[KTIDSActualOperations init](&v31, "init");
  if (v8)
  {
    v9 = objc_alloc_init((Class)IDSKeyTransparencyManager);
    -[KTIDSActualOperations setManager:](v8, "setManager:", v9);

    v10 = dispatch_queue_create("KTIDSActualOperations", 0);
    -[KTIDSActualOperations setIdsQueue:](v8, "setIdsQueue:", v10);

    v11 = dispatch_queue_create("KTIDSActualOperations-idsController", 0);
    -[KTIDSActualOperations setIdsControllerQueue:](v8, "setIdsControllerQueue:", v11);

    v12 = dispatch_queue_create("KTIDSActualOperations-work", 0);
    -[KTIDSActualOperations setWorkQueue:](v8, "setWorkQueue:", v12);

    v13 = objc_alloc((Class)IDSSignInController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](v8, "idsQueue"));
    v15 = objc_msgSend(v13, "initWithQueue:", v14);
    -[KTIDSActualOperations setIdsSignInController:](v8, "setIdsSignInController:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](v8, "idsSignInController"));
    objc_msgSend(v16, "setDelegate:forService:", v8, 1);

    -[KTIDSActualOperations setCheckIDSTimeoutSeconds:](v8, "setCheckIDSTimeoutSeconds:", 90.0);
    -[KTIDSActualOperations setSleepTimeBetweenIDSCheckups:](v8, "setSleepTimeBetweenIDSCheckups:", 10.0);
    -[KTIDSActualOperations setAccountController:](v8, "setAccountController:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](v8, "accountController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](v8, "idsQueue"));
    objc_msgSend(v17, "addDelegate:queue:", v8, v18);

    -[KTIDSActualOperations setRegisteredDelegate:](v8, "setRegisteredDelegate:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[KTIDSActualOperations setIdsAccounts:](v8, "setIdsAccounts:", v19);

    -[KTIDSActualOperations setLockStateTracker:](v8, "setLockStateTracker:", v7);
    location = 0;
    objc_initWeak(&location, v8);
    v20 = [KTNearFutureScheduler alloc];
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_10016F2C4;
    v28 = &unk_10023A970;
    objc_copyWeak(&v29, &location);
    v21 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v20, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("KTIDSAccountChecker"), 1000000000, 60000000000, 0, 0, &v25, 1.2);
    -[KTIDSActualOperations setCheckAccountNFS:](v8, "setCheckAccountNFS:", v21, v25, v26, v27, v28);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](v8, "checkAccountNFS"));
    objc_msgSend(v22, "trigger");

    v23 = v8;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)drain
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsControllerQueue](self, "idsControllerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016F3E4;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_sync(v4, &stru_10024A0B0);

}

- (void)onQueueDrain
{
  void *v3;
  void *v4;
  id v5;

  if (-[KTIDSActualOperations registeredDelegate](self, "registeredDelegate"))
  {
    -[KTIDSActualOperations setRegisteredDelegate:](self, "setRegisteredDelegate:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v3, "cancel");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](self, "accountController"));
    objc_msgSend(v4, "removeDelegate:", self);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](self, "idsSignInController"));
    objc_msgSend(v5, "removeDelegateForService:", 1);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[KTIDSActualOperations onQueueDrain](self, "onQueueDrain");
  v3.receiver = self;
  v3.super_class = (Class)KTIDSActualOperations;
  -[KTIDSActualOperations dealloc](&v3, "dealloc");
}

- (void)checkAccountChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  KTIDSAccountHolder *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id location;
  _BYTE v19[128];

  location = 0;
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsControllerQueue](self, "idsControllerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](self, "accountController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accounts"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = -[KTIDSAccountHolder initWithIDSAccount:]([KTIDSAccountHolder alloc], "initWithIDSAccount:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  -[KTIDSActualOperations setIdsAccounts:](self, "setIdsAccounts:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](self, "idsSignInController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016F70C;
  v12[3] = &unk_10024A118;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v11, "statusOfUsersOnService:withCompletion:", 1, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (BOOL)ktVerifyError:(id)a3 code:(int64_t)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (objc_msgSend(v6, "isEqual:", CFSTR("TransparencyErrorVerify")))
    v7 = objc_msgSend(v5, "code") == (id)a4;
  else
    v7 = 0;

  return v7;
}

+ (id)healableError:(id)a3 selfValidationResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v5 = a4;
  v6 = objc_alloc_init((Class)KTSelfVerificationHealableErrors);
  objc_msgSend(v6, "addHealableState:", 1);
  if (!v5)
    objc_msgSend(v6, "addAccountHealableError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultError"));
  v8 = objc_msgSend(a1, "ktVerifyError:code:", v7, -271);

  if ((v8 & 1) != 0)
  {
    v9 = 2;
LABEL_7:
    objc_msgSend(v6, "addAccountHealableError:", v9);
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultError"));
  v11 = objc_msgSend(a1, "ktVerifyError:code:", v10, -289);

  if (v11)
  {
    v9 = 7;
    goto LABEL_7;
  }
LABEL_8:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loggableData", v5));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v13)
    goto LABEL_33;
  v14 = v13;
  v15 = *(_QWORD *)v42;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));

      if (v18)
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "signature"));
        if (!v19
          || (v20 = (void *)v19,
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure")),
              v22 = objc_msgSend(v21, "code"),
              v21,
              v20,
              v22 == (id)-286))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          objc_msgSend(v6, "addDeviceHealableError:deviceId:", 3, v23);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        v25 = objc_msgSend(v24, "code");

        if (v25 == (id)-272)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          objc_msgSend(v6, "addDeviceHealableError:deviceId:", 4, v26);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        v28 = objc_msgSend(v27, "code");

        if (v28 == (id)-101)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          objc_msgSend(v6, "addDeviceHealableError:deviceId:", 6, v29);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        if (objc_msgSend(v30, "code") == (id)-94)
          goto LABEL_26;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        if (objc_msgSend(v31, "code") == (id)-93)
          goto LABEL_25;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        if (objc_msgSend(v32, "code") == (id)-95)
        {

LABEL_25:
LABEL_26:

LABEL_27:
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          objc_msgSend(v6, "addDeviceHealableError:deviceId:", 5, v33);

          goto LABEL_28;
        }
        v34 = v15;
        v35 = v12;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "failure"));
        v40 = objc_msgSend(v36, "code");

        v12 = v35;
        v15 = v34;

        if (v40 == (id)-96)
          goto LABEL_27;
      }
LABEL_28:
      v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v14 = v37;
  }
  while (v37);
LABEL_33:

  return v6;
}

- (void)triggerIDSCheck:(id)a3 selfValidationResult:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend((id)objc_opt_class(self, v11), "healableError:selfValidationResult:", v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "verificationInfoProviderIdForApplication:", v10));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016FF30;
  v17[3] = &unk_10024A160;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "healSelf:completionBlock:", v13, v17);

}

- (void)fetchPeerVerificationInfos:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verificationInfoProviderIdForApplication:", v10));

  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100170138;
    v13[3] = &unk_10023E238;
    v14 = v9;
    objc_msgSend(v12, "fetchPeerVerificationInfos:completionBlock:", v8, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)fetchSelfVerificationInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "verificationInfoProviderIdForApplication:", v7));

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100170218;
    v10[3] = &unk_10024A188;
    v11 = v6;
    objc_msgSend(v9, "fetchSelfVerificationInfo:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v8, "getKeyTransparencyOptInEligiblityForApplication:withCompletion:", v7, v6);

}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init((Class)IDSKTOptInOutRequest);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100170378;
  v11[3] = &unk_10024A1B0;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(v10, "setApplicationsToOptInStatusData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v9, "sendOptInUpdateRequest:withCompletion:", v10, v6);

}

- (void)registrationDataNeedsUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A1D0);
  v5 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "registrationDataNeedsUpdate reason: %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v6, "registrationDataNeedsUpdate");

}

- (void)fetchKTRegistrationStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v5, "fetchKTRegistrationStatusWithCompletion:", v4);

}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v5, "peerVerificationFinishedWithResults:", v4);

}

- (void)cacheClearRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  objc_msgSend(v5, "cacheClearRequest:", v4);

}

- (BOOL)haveIDSAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("D:%@"), a3));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsAccounts](self, "idsAccounts"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "accountType") == 1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDSID"));
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (unint64_t)idsAccountType
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t result;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));
    v6 = objc_msgSend(v5, "status");

    if (v6 == (id)3)
      return 3;
  }
  result = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastPhoneAccountStatus](self, "lastPhoneAccountStatus"));
  if (result)
  {
    v8 = (void *)result;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastPhoneAccountStatus](self, "lastPhoneAccountStatus"));
    v10 = objc_msgSend(v9, "status");

    if (v10 == (id)3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));

      if (v11)
        return 2;
      else
        return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)onQueueProcessStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  KTIDSActualOperations *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "type"))
  {
    if (objc_msgSend(v4, "type") == (id)1)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastMessagesStatus](self, "lastMessagesStatus"));
      if (v6
        && (v7 = (void *)v6,
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastMessagesStatus](self, "lastMessagesStatus")),
            v9 = objc_msgSend(v8, "status"),
            v10 = objc_msgSend(v4, "status"),
            v8,
            v7,
            v9 == v10))
      {
        if (qword_1002A7988 != -1)
          dispatch_once(&qword_1002A7988, &stru_10024A1F0);
        v11 = qword_1002A7990;
        if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no change", buf, 2u);
        }
      }
      else
      {
        -[KTIDSActualOperations setLastMessagesStatus:](self, "setLastMessagesStatus:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsObserver](self, "idsObserver"));

        if (v12)
        {
          v13 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations workQueue](self, "workQueue"));
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100170A58;
          v14[3] = &unk_10023B3A8;
          v15 = v4;
          v16 = self;
          dispatch_async(v13, v14);

        }
      }
    }
  }
  else
  {
    -[KTIDSActualOperations setLastPhoneAccountStatus:](self, "setLastPhoneAccountStatus:", v4);
  }

}

- (void)signInController:(id)a3 service:(unint64_t)a4 didChangeStatus:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A230);
  v10 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "signInController:service:didChangeStatus: %d/%@", (uint8_t *)v12, 0x12u);
  }
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_assert_queue_V2(v11);

}

- (unint64_t)_serviceTypeForName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", IDSServiceNameFaceTime) ^ 1;
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A250);
  v8 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountAdded: %@", (uint8_t *)&v12, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v11, "trigger");

  }
}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A270);
  v8 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountUpdated: %@", (uint8_t *)&v12, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v11, "trigger");

  }
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A290);
  v8 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountRemoved: %@", (uint8_t *)&v12, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v11, "trigger");

  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A2B0);
  v8 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountEnabled: %@", (uint8_t *)&v12, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v11, "trigger");

  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7988 != -1)
    dispatch_once(&qword_1002A7988, &stru_10024A2D0);
  v8 = qword_1002A7990;
  if (os_log_type_enabled((os_log_t)qword_1002A7990, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountDisabled: %@", (uint8_t *)&v12, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    objc_msgSend(v11, "trigger");

  }
}

- (double)checkIDSTimeoutSeconds
{
  return self->checkIDSTimeoutSeconds;
}

- (void)setCheckIDSTimeoutSeconds:(double)a3
{
  self->checkIDSTimeoutSeconds = a3;
}

- (double)sleepTimeBetweenIDSCheckups
{
  return self->sleepTimeBetweenIDSCheckups;
}

- (void)setSleepTimeBetweenIDSCheckups:(double)a3
{
  self->sleepTimeBetweenIDSCheckups = a3;
}

- (id)idsObserver
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsObserver:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDate)timeOfLastUpsell
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimeOfLastUpsell:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)idsAccounts
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTIDSSignInServiceUserInfo)lastPhoneAccountStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastPhoneAccountStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (KTVerificationInfoProvider)provider
{
  return (KTVerificationInfoProvider *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTIDSSignInServiceUserInfo)lastMessagesStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastMessagesStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (IDSKeyTransparencyManager)manager
{
  return (IDSKeyTransparencyManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)idsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)idsControllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdsControllerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (IDSSignInController)idsSignInController
{
  return (IDSSignInController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdsSignInController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)registeredDelegate
{
  return self->_registeredDelegate;
}

- (void)setRegisteredDelegate:(BOOL)a3
{
  self->_registeredDelegate = a3;
}

- (IDSAccountControllerProtocol)accountController
{
  return (IDSAccountControllerProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccountController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTNearFutureScheduler)checkAccountNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCheckAccountNFS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkAccountNFS, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_idsSignInController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_idsControllerQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_lastMessagesStatus, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->lastPhoneAccountStatus, 0);
  objc_storeStrong((id *)&self->idsAccounts, 0);
  objc_storeStrong((id *)&self->timeOfLastUpsell, 0);
  objc_storeStrong(&self->idsObserver, 0);
}

@end
