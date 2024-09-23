@implementation RegisterAction

- (RegisterAction)initWithReason:(id)a3 force:(BOOL)a4 provider:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  RegisterAction *v10;
  RegisterAction *v11;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RegisterAction;
  v10 = -[RegisterAction init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[RegisterAction setProvider:](v10, "setProvider:", v9);
    -[RegisterAction setReason:](v11, "setReason:", v8);
    -[RegisterAction setForce:](v11, "setForce:", v6);
    -[RegisterAction setCancelled:](v11, "setCancelled:", 0);
  }

  return v11;
}

+ (id)sharedregisterDigestSerialQueue
{
  if (qword_100306920 != -1)
    dispatch_once(&qword_100306920, &stru_1002C4E38);
  return (id)qword_100306928;
}

- (id)actionType
{
  return CFSTR("RegisterAction");
}

- (void)runWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  __CFString *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint8_t buf[4];
  __CFString *v15;

  v4 = (void (**)(_QWORD))a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RegisterAction reason](self, "reason"));
  if (!v5)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RegisterAction _reasonForStartupRegister](self, "_reasonForStartupRegister"));
  if (-[RegisterAction force](self, "force"))
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Register %@ is being forced", buf, 0xCu);
    }

    if (v5)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Forced-%@"), v5));

      v5 = (__CFString *)v8;
    }
    else
    {
      v5 = CFSTR("Forced");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RegisterAction _lastForcedRegisterTimePrefKeyForAccount:](RegisterAction, "_lastForcedRegisterTimePrefKeyForAccount:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    +[FMPreferencesUtil setDate:forKey:inDomain:](FMPreferencesUtil, "setDate:forKey:inDomain:", v12, v11, kFMDNotBackedUpPrefDomain);

  }
  v13 = -[RegisterAction _registerDeviceWithCause:completion:](self, "_registerDeviceWithCause:completion:", v5, v4);
  if (v4 && (v13 & 1) == 0)
    v4[2](v4);

}

- (void)willCancelAction
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_claimAutoreleasedReturnValue(+[RegisterAction sharedregisterDigestSerialQueue](RegisterAction, "sharedregisterDigestSerialQueue"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B36AC;
  v3[3] = &unk_1002C1378;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  RegisterAction *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionType"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("RegisterAction"));
  if (qword_100306910)
    v7 = 0;
  else
    v7 = v6;

  if (v7)
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138413058;
      v14 = objc_opt_class(self, v10);
      v15 = 2048;
      v16 = self;
      v17 = 2112;
      v18 = objc_opt_class(v4, v11);
      v19 = 2048;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@(0x%lX) shouldCancelAction: %@(0x%lX)", (uint8_t *)&v13, 0x2Au);
    }

  }
  return v7;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  RegisterAction *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionType"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("RegisterAction"));

  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction reason](self, "reason"));
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@(0x%lX) RegisterAction shouldWaitForAction: %@", (uint8_t *)&v11, 0x20u);

    }
  }

  return v6;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Register(0x%p)"), self);
}

- (id)_reasonForStartupRegister
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  __CFString *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));

  v4 = v3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastUnregisterFailedTime"));
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastUnregisterFailedTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startTime"));
  v10 = objc_msgSend(v7, "compare:", v9);

  if (v10 == (id)1)
  {
    v11 = CFSTR("UnregisterFailure");
  }
  else
  {
LABEL_4:
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountAddTime"));
    if (!v12)
      goto LABEL_7;
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountAddTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startTime"));
    v17 = objc_msgSend(v14, "compare:", v16);

    if (v17 == (id)-1)
    {
LABEL_7:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
      v19 = objc_msgSend(v18, "isFirstRunAfterBoot");
      v20 = CFSTR("FMDRestart");
      if (v19)
        v20 = CFSTR("DeviceRestart");
      v11 = v20;

    }
    else
    {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AccountAdded")));
    }
  }

  return v11;
}

- (id)_extraRegistrationInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RegisterAction _lastForcedRegisterTimePrefKeyForAccount:](RegisterAction, "_lastForcedRegisterTimePrefKeyForAccount:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dateForKey:inDomain:](FMPreferencesUtil, "dateForKey:inDomain:", v5, kFMDNotBackedUpPrefDomain));
  if (v6)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v6));
  else
    v7 = CFSTR("null");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("lastForcedTime"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authToken"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("null");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("authToken"));

  return v4;
}

- (id)_registrationInformationDigest:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *context;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registrationDigestDeviceInfoForAccount:completedFirstRegister:", v7, v3));

  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("otherDevices")));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000B40A4;
  v38[3] = &unk_1002C4E60;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = v12;
  v36 = v11;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v38);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("otherDevices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_flattenedArrayWithParentIndices:", &off_1002D9308));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction _extraRegistrationInformation](self, "_extraRegistrationInformation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "fm_flattenedArrayWithParentIndices:", &off_1002D9320));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14));

  if (objc_msgSend(v15, "count"))
  {
    v34 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
    context = objc_autoreleasePoolPush();
    if (qword_100306938 != -1)
      dispatch_once(&qword_100306938, &stru_1002C4E80);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100306930, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), CFSTR("authToken_redacted,")));
    v18 = sub_1000031B8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating digest out of %@", buf, 0xCu);
    }

    v37 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, 0, &v37));
    v21 = v37;
    if (v21)
    {
      v32 = v7;
      v22 = v5;
      v23 = sub_1000031B8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10022D654(self, (uint64_t)v21, v24);

      v25 = sub_100052FCC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10022D5E0((uint64_t)v17, v26);

      v5 = v22;
      v7 = v32;
    }

    objc_autoreleasePoolPop(context);
    v9 = v34;
  }
  else
  {
    v20 = 0;
  }
  v27 = objc_retainAutorelease(v20);
  CC_SHA1(objc_msgSend(v27, "bytes"), (CC_LONG)objc_msgSend(v27, "length"), buf);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 20));
  v29 = sub_1000031B8();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_1002266B4((uint64_t)v28, v30);

  objc_autoreleasePoolPop(v5);
  return v28;
}

- (BOOL)_registerDeviceWithCause:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  BOOL v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  FMDActingRequestDecorator *v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  id v23;
  FMDRequestRegister *v24;
  void *v25;
  FMDRequestRegister *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  unsigned int v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  FMDActingRequestDecorator *v41;
  id v42;
  _QWORD v43[5];
  uint64_t (*v44)(uint64_t, uint64_t);
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  _QWORD block[5];
  uint64_t (*v57)(uint64_t, uint64_t);
  _BYTE *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint8_t v64[4];
  void *v65;
  __int16 v66;
  RegisterAction *v67;
  __int16 v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v42 = a4;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = objc_opt_class(self, v9);
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v71 = v6;
    v10 = *(id *)&buf[4];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request to send register %@", buf, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
  v12 = objc_msgSend(v11, "essentialServerInfoMissingError");
  if ((_DWORD)v12 == 1196379972)
  {
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v71 = sub_1000B4824;
    v72 = sub_1000B4834;
    v73 = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[RegisterAction sharedregisterDigestSerialQueue](RegisterAction, "sharedregisterDigestSerialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B483C;
    block[3] = &unk_1002C4EA8;
    block[4] = self;
    v58 = buf;
    v14 = v6;
    v57 = v14;
    v59 = &v60;
    dispatch_sync(v13, block);

    v15 = *((_BYTE *)v61 + 24) != 0;
    if (*((_BYTE *)v61 + 24))
    {
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_opt_class(self, v18);
        *(_DWORD *)v64 = 138412802;
        v65 = v19;
        v66 = 2048;
        v67 = self;
        v68 = 2112;
        v69 = v14;
        v20 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending register %@", v64, 0x20u);

      }
      v21 = [FMDActingRequestDecorator alloc];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000B4C40;
      v53[3] = &unk_1002C1D48;
      v54 = v11;
      v22 = v14;
      v55 = v22;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1000B4CB8;
      v51[3] = &unk_1002C1D20;
      v23 = v54;
      v52 = v23;
      v41 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v21, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v53, v51, 0, 0);
      v24 = [FMDRequestRegister alloc];
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "account"));
      v26 = -[FMDRequest initWithAccount:](v24, "initWithAccount:", v25);

      -[FMDRequest setDecorator:](v26, "setDecorator:", v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "account"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[RegisterAction _registerDigestPrefKeyForAccount:](RegisterAction, "_registerDigestPrefKeyForAccount:", v27));
      -[FMDRequestRegister setDigestKey:](v26, "setDigestKey:", v28);

      -[FMDRequestRegister setDigestData:](v26, "setDigestData:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      objc_initWeak((id *)v64, v23);
      objc_initWeak(&location, self);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000B4D20;
      v48[3] = &unk_1002C4ED0;
      objc_copyWeak(&v49, &location);
      -[FMDRequest setWillSendHandler:](v26, "setWillSendHandler:", v48);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000B4EFC;
      v43[3] = &unk_1002C4F18;
      objc_copyWeak(&v46, &location);
      objc_copyWeak(&v47, (id *)v64);
      v43[4] = self;
      v44 = v22;
      v45 = v42;
      -[FMDRequest setCompletionHandler:](v26, "setCompletionHandler:", v43);
      -[RegisterAction setRequest:](self, "setRequest:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serverInteractionController"));
      objc_msgSend(v29, "enqueueRequest:", v26);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)v64);

    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v30 = sub_1000031B8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFourCC:](NSString, "stringWithFourCC:", v12));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Ignoring register %@. Server info '%@' missing", buf, 0x16u);

    }
    v33 = (_DWORD)v12 == 1480675411;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    v35 = objc_msgSend(v34, "isInternalBuild");

    if (v33)
    {
      if (v35)
      {
        v36 = sub_1000031B8();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Service not functional. APS token unavailable.", buf, 2u);
        }

      }
    }
    else
    {
      if (v35)
      {
        v38 = sub_1000031B8();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Service not functional. Auth credentials unavailable.", buf, 2u);
        }

      }
      objc_msgSend(v11, "tryToFetchAuthToken");
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_shouldThrottleDeviceRestartRegister
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  void *v14;
  _BYTE *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  _DWORD v20[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("DeviceRestartRegisterInterval"), kFMDNotBackedUpPrefDomain));
  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[RegisterAction _deviceRestartRegisterIntervalConfigPrefKeyForAccount:](RegisterAction, "_deviceRestartRegisterIntervalConfigPrefKeyForAccount:", v5)), v5, v4, v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", v6, kFMDNotBackedUpPrefDomain)), v6, v3))
  {
    v7 = (double)(uint64_t)objc_msgSend(v3, "longLongValue");

  }
  else
  {
    v7 = 86400.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RegisterAction provider](self, "provider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RegisterAction _lastDeviceRestartRegisterTimePrefKeyForAccount:](RegisterAction, "_lastDeviceRestartRegisterTimePrefKeyForAccount:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dateForKey:inDomain:](FMPreferencesUtil, "dateForKey:inDomain:", v10, kFMDNotBackedUpPrefDomain));
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "fm_epoch");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = objc_msgSend(v14, "fm_epoch");

    v16 = (double)(v15 - v13) / 1000.0 < v7;
  }
  else
  {
    v16 = 0;
  }
  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Should throttle register on device restart : %i", (uint8_t *)v20, 8u);
  }

  return v16;
}

+ (id)_registerDigestPrefKeyForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authId"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RegisterDigest-%@-%@"), v5, v6));
  return v7;
}

+ (id)_lastForcedRegisterTimePrefKeyForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authId"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LastForcedRegisterTime-%@-%@"), v5, v6));
  return v7;
}

+ (id)_lastDeviceRestartRegisterTimePrefKeyForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authId"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LastDeviceRestartRegisterTime-%@-%@"), v5, v6));
  return v7;
}

+ (id)_deviceRestartRegisterIntervalConfigPrefKeyForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authId"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DeviceRestartRegisterIntervalConfig-%@-%@"), v5, v6));
  return v7;
}

+ (void)deleteRegisterDigestForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[RegisterAction sharedregisterDigestSerialQueue](RegisterAction, "sharedregisterDigestSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5D68;
  block[3] = &unk_1002C1328;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (FMDRequestRegister)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
