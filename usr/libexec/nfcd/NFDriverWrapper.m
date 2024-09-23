@implementation NFDriverWrapper

- (BOOL)isJCOPTooOld:(unsigned __int8)a3 prod:(BOOL)a4 version:(unsigned __int16)a5
{
  if ((int)a3 > 199)
  {
    if (a3 != 200 && a3 != 210)
      return 0;
    return a5 < 0x424u;
  }
  if (a3 == 100)
    return a5 < 0x424u;
  return a3 == 115 && a5 < 0x31Bu;
}

- (int)_getRestoreStateAndRunBlockIfUnlocked:(id)a3
{
  uint64_t (**v5)(_QWORD);
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  int v9;
  int v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  const char *Name;
  int valuePtr;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v5 = (uint64_t (**)(_QWORD))a3;
  v6 = (const __CFDictionary *)MKBGetDeviceLockStateInfo(0);
  if (!v6)
    goto LABEL_19;
  v7 = v6;
  Value = (const __CFNumber *)CFDictionaryGetValue(v6, kMKBInfoBagState);
  if (!Value)
  {
    CFRelease(v7);
    goto LABEL_19;
  }
  valuePtr = 0;
  v9 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  CFRelease(v7);
  if (!v9)
  {
LABEL_19:
    v10 = -1;
    goto LABEL_20;
  }
  if ((~valuePtr & 0xA000) != 0 && ((valuePtr & 0x2000) != 0 || (valuePtr & 6) == 0))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i Can't query MSU", v17, ClassName, Name, 69);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v29 = v22;
      v30 = 2082;
      v31 = v23;
      v32 = 2082;
      v33 = v24;
      v34 = 1024;
      v35 = 69;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Can't query MSU", buf, 0x22u);
    }

    goto LABEL_19;
  }
  v10 = v5[2](v5);
LABEL_20:

  return v10;
}

- (void)_recoverySucceeded
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NFDriverWrapperDelegate *delegate;
  NFDriverWrapperDelegate *v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Recovered from failed restore", v10, ClassName, Name, 77);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v20 = v15;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 77;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Recovered from failed restore", buf, 0x22u);
  }

  -[NFDriverWrapper _storeFailForwardRecovery:](self, "_storeFailForwardRecovery:", 1);
  if (self)
  {
    self->_isInDlMode = 0;
    +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:](NFGeneralStatisticsCALogger, "updateGeneralDeviceStatistic:", &off_1003067E0);
    delegate = self->_delegate;
  }
  else
  {
    +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:](NFGeneralStatisticsCALogger, "updateGeneralDeviceStatistic:", &off_1003067E0);
    delegate = 0;
  }
  v17 = delegate;
  -[NFDriverWrapperDelegate handleHWRecoveryCompletion:](v17, "handleHWRecoveryCompletion:", 1);

}

- (void)_recoveryFailed
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NFDriverWrapperDelegate *delegate;
  NFDriverWrapperDelegate *v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Failed to restore FW", v10, ClassName, Name, 86);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v20 = v15;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 86;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore FW", buf, 0x22u);
  }

  -[NFDriverWrapper _storeFailForwardRecovery:](self, "_storeFailForwardRecovery:", 0);
  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  v17 = delegate;
  -[NFDriverWrapperDelegate handleHWRecoveryCompletion:](v17, "handleHWRecoveryCompletion:", 0);

}

- (int)_checkFailForwardState
{
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int restoreState;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  void *v20;
  void *v21;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v44;
  const char *Name;
  const char *v46;
  unsigned int v47;
  _QWORD v48[5];
  id v49;
  SEL v50;
  _QWORD v51[6];
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("FuryRecoveryNeeded")));
  v6 = (void *)v5;
  restoreState = self->_restoreState;
  v8 = restoreState != -1 && v5 == 0;
  if (!v8)
  {
    v9 = NFBuildVersion();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RecoveredOS")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RecoveryNeeded")));
    v13 = v12;
    if (v10)
    {
      v14 = objc_msgSend(v12, "isEqualToString:", v10);
      v15 = objc_msgSend(v6, "isEqualToString:", v10);
      if (v14)
      {
        v47 = v15;
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v18 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          v20 = v13;
          v21 = v11;
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v8 = !isMetaClass;
          v11 = v21;
          v13 = v20;
          v24 = 45;
          if (!v8)
            v24 = 43;
          v18(6, "%c[%{public}s %{public}s]:%i Nearfield failed during restore", v24, ClassName, Name, 192);
        }
        v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v26 = NFSharedLogGetLogger(v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = object_getClass(self);
          v29 = v13;
          v30 = v11;
          if (class_isMetaClass(v28))
            v31 = 43;
          else
            v31 = 45;
          *(_DWORD *)buf = 67109890;
          v53 = v31;
          v11 = v30;
          v13 = v29;
          v54 = 2082;
          v55 = object_getClassName(self);
          v56 = 2082;
          v57 = sel_getName(a2);
          v58 = 1024;
          v59 = 192;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nearfield failed during restore", buf, 0x22u);
        }

        if (v47)
          restoreState = 1;
        else
          restoreState = 2;
        self->_restoreState = restoreState;
        goto LABEL_34;
      }
      if (v15)
      {
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_10014A36C;
        v51[3] = &unk_1002E9040;
        v51[4] = self;
        v51[5] = a2;
        restoreState = -[NFDriverWrapper _getRestoreStateAndRunBlockIfUnlocked:](self, "_getRestoreStateAndRunBlockIfUnlocked:", v51);
LABEL_34:

        goto LABEL_35;
      }
      if (objc_msgSend(v11, "isEqualToString:", v10))
      {
        v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v33 = NFLogGetLogger(v32);
        if (v33)
        {
          v34 = (void (*)(uint64_t, const char *, ...))v33;
          v35 = object_getClass(self);
          v36 = class_isMetaClass(v35);
          v44 = object_getClassName(self);
          v46 = sel_getName(a2);
          v37 = 45;
          if (v36)
            v37 = 43;
          v34(6, "%c[%{public}s %{public}s]:%i Nearfield already recovered on %{public}@", v37, v44, v46, 208, v10);
        }
        v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v39 = NFSharedLogGetLogger(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = object_getClass(self);
          if (class_isMetaClass(v41))
            v42 = 43;
          else
            v42 = 45;
          *(_DWORD *)buf = 67110146;
          v53 = v42;
          v54 = 2082;
          v55 = object_getClassName(self);
          v56 = 2082;
          v57 = sel_getName(a2);
          v58 = 1024;
          v59 = 208;
          v60 = 2114;
          v61 = v10;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nearfield already recovered on %{public}@", buf, 0x2Cu);
        }

        restoreState = 0;
        self->_restoreState = 0;
        self->_failForwardRecoveryStored = 1;
        goto LABEL_34;
      }
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10014A4F8;
    v48[3] = &unk_1002E9068;
    v48[4] = self;
    v49 = v4;
    v50 = a2;
    restoreState = -[NFDriverWrapper _getRestoreStateAndRunBlockIfUnlocked:](self, "_getRestoreStateAndRunBlockIfUnlocked:", v48);

    goto LABEL_34;
  }
LABEL_35:

  return restoreState;
}

- (void)_storeFailForwardRecovery:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v6;
  void *v7;
  NFDriverWrapper *v8;
  void *v9;
  void *v10;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v14;
  const char *ClassName;
  const char *Name;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  void *v23;
  NFDriverWrapperDelegate *delegate;
  NFDriverWrapperDelegate *v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 isMetaClass;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;

  v3 = a3;
  v6 = NFBuildVersion();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = v9;
    if (v3)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class))
          v14 = 43;
        else
          v14 = 45;
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i Storing OS as recovered : %{public}@", v14, ClassName, Name, 246, v7);
      }
      v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v18 = NFSharedLogGetLogger(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = object_getClass(v8);
        if (class_isMetaClass(v20))
          v21 = 43;
        else
          v21 = 45;
        *(_DWORD *)buf = 67110146;
        v42 = v21;
        v43 = 2082;
        v44 = object_getClassName(v8);
        v45 = 2082;
        v46 = sel_getName(a2);
        v47 = 1024;
        v48 = 246;
        v49 = 2114;
        v50 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Storing OS as recovered : %{public}@", buf, 0x2Cu);
      }

      objc_msgSend(v10, "removeObjectForKey:", CFSTR("RecoveryNeeded"));
      objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RecoveredOS"));
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("FuryRecoveryNeeded"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      if (v8)
        objc_setProperty_atomic(v8, v22, v23, 288);

      sub_10014ABB8((uint64_t)v8, 0);
      if (v8)
        delegate = v8->_delegate;
      else
        delegate = 0;
      v25 = delegate;
      -[NFDriverWrapperDelegate handleFailForwardCompleted](v25, "handleFailForwardCompleted");

      v8->_failForwardRecoveryStored = 1;
      v8->_restoreState = 0;
    }
    else
    {
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("RecoveredOS"));
      objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RecoveryNeeded"));
      objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("FuryRecoveryNeeded"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("RecoveryAttempts")));
      v38 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v37, v38) & 1) == 0)
      {

        v37 = 0;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v37, "intValue") + 1));

      objc_msgSend(v10, "setObject:forKey:", v39, CFSTR("RecoveryAttempts"));
      sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("failForwardRestoreAttemptFailureCount"));
      v8->_restoreState = 1;

    }
    objc_sync_exit(v8);
  }
  else
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      isMetaClass = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v40 = sel_getName(a2);
      v32 = 45;
      if (isMetaClass)
        v32 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i Failed to query build", v32, v31, v40, 238);
    }
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger(v33);
    v8 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      *(_DWORD *)buf = 67109890;
      v42 = v36;
      v43 = 2082;
      v44 = object_getClassName(self);
      v45 = 2082;
      v46 = sel_getName(a2);
      v47 = 1024;
      v48 = 238;
      _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query build", buf, 0x22u);
    }
  }

}

- (double)nextRetryTime
{
  uint64_t retryIndex;

  retryIndex = self->_retryIndex;
  if (retryIndex > 0xD)
    return 86400.0;
  else
    return (double)dword_10026A4E8[retryIndex];
}

- (id)_attemptNFCCRecovery
{
  time_t v3;
  _NFDriver *driver;
  id v5;
  NFDriverWrapper *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  int retryIndex;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  NFDriverWrapperDelegate *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *specific;
  uint64_t Logger;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  SEL v85;
  void *v86;
  NFDriverWrapperDelegate *v87;
  const char *v89;
  const char *Name;
  time_t v91;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  NSErrorUserInfoKey v97;
  void *v98;
  uint8_t buf[4];
  int v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  int v106;
  _QWORD v107[4];
  _QWORD v108[4];

  v3 = time(0);
  if (self)
  {
    driver = self->_driver;
    if (self->_hwState == 4)
    {
      if (driver)
      {
        v5 = objc_alloc((Class)NSError);
        v6 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v107[0] = NSLocalizedDescriptionKey;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFCC is in Download mode. NCI not available."));
        v108[0] = v7;
        v108[1] = &off_1002FFB88;
        v107[1] = CFSTR("Line");
        v107[2] = CFSTR("Method");
        v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v108[2] = v8;
        v107[3] = NSDebugDescriptionErrorKey;
        v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 365);
        v108[3] = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v108, v107, 4));
        v11 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 56, v10);

        goto LABEL_62;
      }
    }
    else if (driver)
    {
      __assert_rtn("-[NFDriverWrapper(Recovery) _attemptNFCCRecovery]", "NFDriverWrapper+Recovery.m", 368, "[self isDriverOpened] == false");
    }
  }
  v91 = v3;
  if (NFIsInternalBuild(v3))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("skipNFCCrecovery")));

    if (v6)
    {
      v13 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0
        && !-[NFDriverWrapper isEqualToString:](v6, "isEqualToString:", CFSTR("Success")))
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v65 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v69 = 45;
          if (isMetaClass)
            v69 = 43;
          v65(4, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery with failure", v69, ClassName, Name, 378);
        }
        v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v71 = NFSharedLogGetLogger(v70);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v73 = object_getClass(self);
          if (class_isMetaClass(v73))
            v74 = 43;
          else
            v74 = 45;
          *(_DWORD *)buf = 67109890;
          v100 = v74;
          v101 = 2082;
          v102 = object_getClassName(self);
          v103 = 2082;
          v104 = sel_getName(a2);
          v105 = 1024;
          v106 = 378;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery with failure", buf, 0x22u);
        }

        v75 = objc_alloc((Class)NSError);
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v97 = NSLocalizedDescriptionKey;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
        v98 = v77;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
        v11 = objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 14, v78);

      }
      else
      {
        v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v15 = NFLogGetLogger(v14);
        if (v15)
        {
          v16 = (void (*)(uint64_t, const char *, ...))v15;
          v17 = object_getClass(self);
          v18 = class_isMetaClass(v17);
          v19 = object_getClassName(self);
          v89 = sel_getName(a2);
          v20 = 45;
          if (v18)
            v20 = 43;
          v16(4, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery", v20, v19, v89, 375);
        }
        v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v22 = NFSharedLogGetLogger(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = object_getClass(self);
          if (class_isMetaClass(v24))
            v25 = 43;
          else
            v25 = 45;
          *(_DWORD *)buf = 67109890;
          v100 = v25;
          v101 = 2082;
          v102 = object_getClassName(self);
          v103 = 2082;
          v104 = sel_getName(a2);
          v105 = 1024;
          v106 = 375;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping NFCC recovery", buf, 0x22u);
        }

        v11 = 0;
      }
      goto LABEL_62;
    }
  }
  v6 = self;
  objc_sync_enter(v6);
  retryIndex = v6->_retryIndex;
  if ((retryIndex + 1) <= 0xD)
    ++retryIndex;
  v6->_retryIndex = retryIndex;
  sub_10014ABB8((uint64_t)v6, 1);
  v28 = NFSharedSignpostLog(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_signpost_enabled(v29))
  {
    v30 = v6->_retryIndex;
    *(_DWORD *)buf = 67109120;
    v100 = v30;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "fail-forward; retryIndex=%d",
      buf,
      8u);
  }

  v31 = (void *)objc_opt_new(NFRestoreService);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "runService:", &off_1003068D0));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "valueForKey:", CFSTR("Error")));
  if (!v33)
  {
    v41 = NFSharedSignpostLog(0);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "success", buf, 2u);
    }
    v43 = 0;
    v11 = 0;
    goto LABEL_58;
  }
  sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("failForwardRestoreAttemptFailureCount"));
  v35 = NFSharedSignpostLog(v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "restore failure", buf, 2u);
  }

  v37 = objc_alloc((Class)NSError);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v39 = objc_msgSend(v33, "code");
  v95[0] = NSLocalizedDescriptionKey;
  if ((uint64_t)objc_msgSend(v33, "code") > 70)
    v40 = 71;
  else
    v40 = (uint64_t)objc_msgSend(v33, "code");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E9088[v40]));
  v96[0] = v44;
  v96[1] = v33;
  v95[1] = NSUnderlyingErrorKey;
  v95[2] = CFSTR("Line");
  v96[2] = &off_1002FFBA0;
  v95[3] = CFSTR("Method");
  v45 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v96[3] = v45;
  v95[4] = NSDebugDescriptionErrorKey;
  v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 400);
  v96[4] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v96, v95, 5));
  v11 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, v39, v47);

  if ((NFProductAllowsWiredInDLMode(0) & 1) == 0)
  {
    v48 = v6->_delegate;
    -[NFDriverWrapperDelegate stopFury](v48, "stopFury");

    v50 = NFSharedSignpostLog(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_signpost_enabled(v51))
    {
      v52 = v6->_retryIndex;
      *(_DWORD *)buf = 67109120;
      v100 = v52;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "fail-forward (full restore); retryIndex=%d",
        buf,
        8u);
    }

    v53 = (void *)objc_opt_new(NFRestoreService);
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "runService:", &off_1003068F8));

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "valueForKey:", CFSTR("Error")));
    if (v43)
    {
      sub_10020CAC8((uint64_t)NFDailyStatisticsCALogger, CFSTR("failForwardRestoreAttemptFailureCount"));
      v57 = NFSharedSignpostLog(v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_signpost_enabled(v58))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "restore failure", buf, 2u);
      }

      v59 = objc_alloc((Class)NSError);
      v42 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v60 = objc_msgSend(v43, "code");
      v93[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)objc_msgSend(v43, "code") > 70)
        v61 = 71;
      else
        v61 = (uint64_t)objc_msgSend(v43, "code");
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E9088[v61]));
      v94[0] = v79;
      v94[1] = v43;
      v93[1] = NSUnderlyingErrorKey;
      v93[2] = CFSTR("Line");
      v94[2] = &off_1002FFBB8;
      v93[3] = CFSTR("Method");
      v80 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v94[3] = v80;
      v93[4] = NSDebugDescriptionErrorKey;
      v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 422);
      v94[4] = v81;
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 5));
      v11 = objc_msgSend(v59, "initWithDomain:code:userInfo:", v42, v60, v82);

    }
    else
    {
      v62 = NFSharedSignpostLog(v55);
      v42 = objc_claimAutoreleasedReturnValue(v62);
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RESTORE_NFCC", "sucess", buf, 2u);
      }
      v43 = 0;
      v11 = 0;
    }
    v32 = v54;
LABEL_58:

    goto LABEL_59;
  }
  v43 = v33;
LABEL_59:
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v83, "removeObjectForKey:", CFSTR("RecoveryInProgress"));

  if (!v11)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_setProperty_atomic(v6, v85, v84, 288);

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v86, "removeObjectForKey:", CFSTR("FuryRecoveryNeeded"));

    v87 = v6->_delegate;
    -[NFDriverWrapperDelegate handleFailForwardCompleted](v87, "handleFailForwardCompleted");

  }
  v6->_lastRetry = v91;

  objc_sync_exit(v6);
LABEL_62:

  return v11;
}

- (BOOL)_isEMVPolling
{
  return (self->_driver->var6 - 1) < 3;
}

- (id)_getExtendedIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v9;

  v3 = a3;
  v4 = arc4random();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tagID"));
  v6 = objc_msgSend(v5, "hash");
  v7 = objc_msgSend(v3, "type");

  v9 = (v7 + v6) | (unint64_t)(v4 << 32);
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v9, 8);
}

- (id)_refreshTagInfo:(id)a3 update:(_NFDriverRemoteTag *)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NFTagInternal), "initWithNFTag:", v5);
  if (a4 && objc_msgSend(v5, "type") == 3 && a4->var2.var0.var4)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", a4->var2.var6.var3, a4->var2.var0.var4);
    objc_msgSend(v6, "_setHistoricalBytes:", v7);

  }
  return v6;
}

- (void)_cardRemovalDetect:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v5 = sub_10017E7EC((uint64_t)self, a3);
  while (!-[NFReaderRestrictor readerModeProtectionActive](self->_readerPolicy, "readerModeProtectionActive"))
  {
    if (NFDriverRemoteDevCheckPresence(self->_driver, v5))
      return;
    usleep(0x3D090u);
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(4, "%c[%{public}s %{public}s]:%i Burnout occurred", v12, ClassName, Name, 138);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v20 = v17;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 138;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Burnout occurred", buf, 0x22u);
  }

}

- (BOOL)enableHeadlessMode:(BOOL)a3 shutdown:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  BOOL v8;
  id v9;
  void *v10;
  NFDriverWrapper *v11;
  char v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  const char *v24;
  void *v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  id v36;
  void *v37;
  id v38;
  _BYTE *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  const char *Name;
  const char *v68;
  uint8_t buf[4];
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;

  v4 = a3;
  if (a4)
  {
    v7 = 1;
    byte_10032AAD1 = 1;
  }
  else
  {
    v7 = byte_10032AAD1;
  }
  if (v7)
    v8 = !a3;
  else
    v8 = 1;
  if (!v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v19 = 45;
      if (isMetaClass)
        v19 = 43;
      v15(3, "%c[%{public}s %{public}s]:%i Something trying to turn LPM ON after user shutdown. Denying.", v19, ClassName, Name, 254);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v11 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    *(_DWORD *)buf = 67109890;
    v70 = v23;
    v71 = 2082;
    v72 = object_getClassName(self);
    v73 = 2082;
    v74 = sel_getName(a2);
    v75 = 1024;
    v76 = 254;
    v24 = "%c[%{public}s %{public}s]:%i Something trying to turn LPM ON after user shutdown. Denying.";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_ERROR, v24, buf, 0x22u);
LABEL_24:
    v12 = 0;
    goto LABEL_59;
  }
  if (a3)
  {
    v9 = sub_100203984((uint64_t)NFHeadlessModeController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (!v10)
    {
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFLogGetLogger(v41);
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(self);
        v45 = class_isMetaClass(v44);
        v46 = object_getClassName(self);
        v68 = sel_getName(a2);
        v47 = 45;
        if (v45)
          v47 = 43;
        v43(3, "%c[%{public}s %{public}s]:%i LPEM not enabled", v47, v46, v68, 259);
      }
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger(v48);
      v11 = (NFDriverWrapper *)objc_claimAutoreleasedReturnValue(v49);
      if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v50 = object_getClass(self);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      *(_DWORD *)buf = 67109890;
      v70 = v51;
      v71 = 2082;
      v72 = object_getClassName(self);
      v73 = 2082;
      v74 = sel_getName(a2);
      v75 = 1024;
      v76 = 259;
      v24 = "%c[%{public}s %{public}s]:%i LPEM not enabled";
      goto LABEL_23;
    }
  }
  v11 = self;
  objc_sync_enter(v11);
  if (v11 && v11->_isClosing)
  {
    v12 = 0;
  }
  else
  {
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v4)
    {
      v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v25);
      if (v26)
      {
        v27 = object_getClass(v11);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName(v11);
        v30 = sel_getName(a2);
        v26(6, "%c[%{public}s %{public}s]:%i Enabling LPEM", v28, v29, v30, 269);
      }
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFSharedLogGetLogger(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(v11);
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        *(_DWORD *)buf = 67109890;
        v70 = v35;
        v71 = 2082;
        v72 = object_getClassName(v11);
        v73 = 2082;
        v74 = sel_getName(a2);
        v75 = 1024;
        v76 = 269;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling LPEM", buf, 0x22u);
      }

      v36 = sub_100203984((uint64_t)NFHeadlessModeController);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      sub_100206CD8((uint64_t)v37);

      v38 = sub_100203984((uint64_t)NFHeadlessModeController);
      v39 = (_BYTE *)objc_claimAutoreleasedReturnValue(v38);
      v40 = sub_100203FD8(v39);
    }
    else
    {
      v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v25);
      if (v52)
      {
        v53 = object_getClass(v11);
        if (class_isMetaClass(v53))
          v54 = 43;
        else
          v54 = 45;
        v55 = object_getClassName(v11);
        v56 = sel_getName(a2);
        v52(6, "%c[%{public}s %{public}s]:%i Disabling LPEM", v54, v55, v56, 273);
      }
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger(v57);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = object_getClass(v11);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        *(_DWORD *)buf = 67109890;
        v70 = v61;
        v71 = 2082;
        v72 = object_getClassName(v11);
        v73 = 2082;
        v74 = sel_getName(a2);
        v75 = 1024;
        v76 = 273;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling LPEM", buf, 0x22u);
      }

      v62 = sub_100203984((uint64_t)NFHeadlessModeController);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      sub_100206E80((uint64_t)v63);

      v64 = sub_100203984((uint64_t)NFHeadlessModeController);
      v39 = (_BYTE *)objc_claimAutoreleasedReturnValue(v64);
      v65 = sub_100203F98(v39);
    }

    v12 = NFDriverSetHeadlessMode(v11->_driver, v4);
  }
  objc_sync_exit(v11);
LABEL_59:

  return v12;
}

- (int)_ntag5DriverRateFromTagRate:(int)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v3 = *(_QWORD *)&a3;
  if (a3 > 211)
  {
    if (a3 != 212)
    {
      if (a3 != 424 && a3 != 848)
        return 0;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", v14, ClassName, Name, 29, v3);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v23 = v19;
        v24 = 2082;
        v25 = object_getClassName(self);
        v26 = 2082;
        v27 = sel_getName(a2);
        v28 = 1024;
        v29 = 29;
        v30 = 1024;
        v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NTAG5 rate %d is too high - using 212kbps", buf, 0x28u);
      }

    }
    return 4;
  }
  if (a3 == 106)
    v4 = 3;
  else
    v4 = 0;
  if (a3 == 52)
    v5 = 2;
  else
    v5 = v4;
  if (a3 == 26)
    return 1;
  else
    return v5;
}

- (int)_typeADriverRateFromTagRate:(int)a3
{
  uint64_t v3;
  int v7;
  int v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v3 = *(_QWORD *)&a3;
  if (a3 > 211)
  {
    if (a3 == 848)
      v7 = 4;
    else
      v7 = 0;
    if (a3 == 424)
      v8 = 3;
    else
      v8 = v7;
    if (a3 == 212)
      return 2;
    else
      return v8;
  }
  else
  {
    if (a3 == 26 || a3 == 52)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", v14, ClassName, Name, 68, v3);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        *(_DWORD *)buf = 67110146;
        v23 = v19;
        v24 = 2082;
        v25 = object_getClassName(self);
        v26 = 2082;
        v27 = sel_getName(a2);
        v28 = 1024;
        v29 = 68;
        v30 = 1024;
        v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag rate %d is too low for type A - using 106kbps", buf, 0x28u);
      }

    }
    else if (a3 != 106)
    {
      return 0;
    }
    return 1;
  }
}

- (void)handleReaderBurnoutTimer
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NFDriverWrapperDelegate *delegate;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", v10, ClassName, Name, 1917);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 1917;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", buf, 0x22u);
  }

  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  -[NFDriverWrapperDelegate handleReaderBurnoutTimer](delegate, "handleReaderBurnoutTimer");
}

- (void)handleReaderBurnoutCleared
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NFDriverWrapperDelegate *delegate;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", v10, ClassName, Name, 1924);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 1924;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", buf, 0x22u);
  }

  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  -[NFDriverWrapperDelegate handleReaderBurnoutCleared](delegate, "handleReaderBurnoutCleared");
  sub_1001FABB8(self, CFSTR("Cooloff"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hammerfestLastRecoveryTime, 0);
  objc_storeStrong((id *)&self->_chipscopeConfig, 0);
  objc_storeStrong((id *)&self->_workqueue, 0);
  objc_storeStrong((id *)&self->_currentRouting, 0);
  objc_storeStrong((id *)&self->_sessionOwners, 0);
  objc_storeStrong((id *)&self->_ctConnection, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_temperaturePollTimer, 0);
  objc_storeStrong((id *)&self->_fieldCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_fieldAssertionTimer, 0);
  objc_storeStrong((id *)&self->_fieldPresentLock, 0);
  objc_storeStrong((id *)&self->_readerPolicy, 0);
  objc_storeStrong((id *)&self->_temperatureReporter, 0);
  objc_storeStrong((id *)&self->_lastPowerStateQuery, 0);
  objc_storeStrong((id *)&self->_remoteTags, 0);
  objc_storeStrong((id *)&self->_tagRemovedSemaphore, 0);
  objc_storeStrong((id *)&self->_failForwardRetryTimer, 0);
}

@end
