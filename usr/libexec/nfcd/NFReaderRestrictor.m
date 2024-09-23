@implementation NFReaderRestrictor

- (NFReaderRestrictor)init
{

  return 0;
}

- (NFReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  NFReaderRestrictor *v9;
  NSLock *v10;
  NSLock *burnoutStateLock;
  NSMutableArray *v12;
  NSMutableArray *readerOperationTimes;
  NSDate *currentTestTime;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFReaderRestrictor;
  v9 = -[NFReaderRestrictor init](&v16, "init");
  if (v9)
  {
    v10 = objc_opt_new(NSLock);
    burnoutStateLock = v9->_burnoutStateLock;
    v9->_burnoutStateLock = v10;

    v12 = objc_opt_new(NSMutableArray);
    readerOperationTimes = v9->_readerOperationTimes;
    v9->_readerOperationTimes = v12;

    objc_storeStrong((id *)&v9->_thermalMonitor, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    currentTestTime = v9->_currentTestTime;
    v9->_currentTestTime = 0;

    v9->_burnoutProtectionState = 0;
  }

  return v9;
}

- (id)description
{
  NSMutableString *v3;
  const __CFString *v4;
  uint64_t burnoutProtectionState;

  v3 = objc_opt_new(NSMutableString);
  -[NSLock lock](self->_burnoutStateLock, "lock");
  if (-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    v4 = CFSTR("thermal = critical, ");
  }
  else if (-[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff"))
  {
    v4 = CFSTR("thermal = backoff, ");
  }
  else
  {
    if (!-[NFReaderRestrictor thermalPressureNominal](self, "thermalPressureNominal"))
      goto LABEL_8;
    v4 = CFSTR("thermal = nominal, ");
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", v4);
LABEL_8:
  burnoutProtectionState = (int)self->_burnoutProtectionState;
  if (burnoutProtectionState <= 3)
    -[NSMutableString appendFormat:](v3, "appendFormat:", *(&off_1002E7750 + burnoutProtectionState));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(", _currentTestTime = %@"), self->_currentTestTime);
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
  return v3;
}

- (void)stackLoaded:(id)a3
{
  id v4;
  id v5;
  NFTimer *v6;
  NFTimer *readermodeBurnoutProtectionTimer;
  id v8;
  NFTimer *v9;
  NFTimer *readermodeBurnoutProtectionDebounceTimer;
  NFThermalMonitor *thermalMonitor;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NSLock lock](self->_burnoutStateLock, "lock");
  self->_burnoutProtectionState = 0;
  v5 = objc_alloc((Class)NFTimer);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A4F50;
  v16[3] = &unk_1002E5C08;
  objc_copyWeak(&v17, &location);
  v6 = (NFTimer *)objc_msgSend(v5, "initWithCallback:queue:", v16, v4);
  readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
  self->_readermodeBurnoutProtectionTimer = v6;

  v8 = objc_alloc((Class)NFTimer);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A4FC4;
  v14[3] = &unk_1002E5C08;
  objc_copyWeak(&v15, &location);
  v9 = (NFTimer *)objc_msgSend(v8, "initWithCallback:queue:", v14, v4);
  readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
  self->_readermodeBurnoutProtectionDebounceTimer = v9;

  -[NSLock unlock](self->_burnoutStateLock, "unlock");
  thermalMonitor = self->_thermalMonitor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A5044;
  v12[3] = &unk_1002E7730;
  objc_copyWeak(&v13, &location);
  sub_100074C98((uint64_t)thermalMonitor, v12, v4);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)stackUnloaded
{
  NFTimer *readermodeBurnoutProtectionTimer;
  NFTimer *readermodeBurnoutProtectionDebounceTimer;

  -[NSLock lock](self->_burnoutStateLock, "lock");
  -[NFTimer stopTimer](self->_readermodeBurnoutProtectionTimer, "stopTimer");
  readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
  self->_readermodeBurnoutProtectionTimer = 0;

  -[NFTimer stopTimer](self->_readermodeBurnoutProtectionDebounceTimer, "stopTimer");
  readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
  self->_readermodeBurnoutProtectionDebounceTimer = 0;

  self->_burnoutProtectionState = 0;
  -[NSMutableArray removeAllObjects](self->_readerOperationTimes, "removeAllObjects");
  sub_100074D18((uint64_t)self->_thermalMonitor);
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
}

- (void)_tagDetectedWithDate:(id)a3
{
  NSLock *burnoutStateLock;
  id v5;
  NSMutableArray *readerOperationTimes;
  id *v7;
  void *v8;
  NFTimer *readermodeBurnoutProtectionTimer;
  double v10;
  double v11;
  NFTimer *v12;

  burnoutStateLock = self->_burnoutStateLock;
  v5 = a3;
  -[NSLock lock](burnoutStateLock, "lock");
  readerOperationTimes = self->_readerOperationTimes;
  v7 = sub_1000B3828((uint64_t)NFReaderOperation, CFSTR("ReaderStarted"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  -[NSMutableArray addObject:](readerOperationTimes, "addObject:", v8);
  if (-[NFReaderRestrictor _requiresThermalModeProtection](self, "_requiresThermalModeProtection")
    && -[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    self->_burnoutProtectionState = 1;
    readermodeBurnoutProtectionTimer = self->_readermodeBurnoutProtectionTimer;
    v10 = 0.0;
    v11 = 0.5;
LABEL_7:
    -[NFTimer startTimer:leeway:](readermodeBurnoutProtectionTimer, "startTimer:leeway:", v10, v11);
    goto LABEL_8;
  }
  if (-[NFReaderRestrictor _requiresReaderModeProtection](self, "_requiresReaderModeProtection")
    || -[NFReaderRestrictor _requiresThermalModeProtection](self, "_requiresThermalModeProtection"))
  {
    self->_burnoutProtectionState = 1;
    v12 = self->_readermodeBurnoutProtectionTimer;
    -[NFReaderRestrictor maxReaderTime](self, "maxReaderTime");
    v11 = 0.5;
    readermodeBurnoutProtectionTimer = v12;
    goto LABEL_7;
  }
LABEL_8:
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
}

- (void)tagDetected
{
  id v3;

  if (self->_currentTestTime)
  {
    -[NFReaderRestrictor _tagDetectedWithDate:](self, "_tagDetectedWithDate:");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
    -[NFReaderRestrictor _tagDetectedWithDate:](self, "_tagDetectedWithDate:", v3);

  }
}

- (BOOL)_readerModeStoppedShouldCooloffRun:(id)a3
{
  id v5;
  unsigned int burnoutProtectionState;
  BOOL v7;
  NFTimer *readermodeBurnoutProtectionDebounceTimer;
  double v9;
  double v10;
  double v11;
  double v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  NSMutableArray *readerOperationTimes;
  id *v26;
  void *v27;
  double v28;
  NSMutableArray *v29;
  id *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  _BOOL4 v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *Name;
  const char *v58;
  const char *v59;
  uint8_t buf[4];
  _BYTE v61[14];
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  double v67;

  v5 = a3;
  -[NSLock lock](self->_burnoutStateLock, "lock");
  if (!-[NFReaderRestrictor _requiresReaderModeProtection](self, "_requiresReaderModeProtection"))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_47;
  }
  burnoutProtectionState = self->_burnoutProtectionState;
  if (burnoutProtectionState == 2)
  {
    -[NFReaderRestrictor getCooloffTime](self, "getCooloffTime");
    v12 = v11;
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
      v15(6, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", v19, ClassName, Name, 243, *(_QWORD *)&v12);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v61 = v24;
      *(_WORD *)&v61[4] = 2082;
      *(_QWORD *)&v61[6] = object_getClassName(self);
      v62 = 2082;
      v63 = sel_getName(a2);
      v64 = 1024;
      v65 = 243;
      v66 = 2048;
      v67 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", buf, 0x2Cu);
    }

    readerOperationTimes = self->_readerOperationTimes;
    v26 = sub_1000B3828((uint64_t)NFReaderOperation, CFSTR("ReaderStopped"), v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableArray addObject:](readerOperationTimes, "addObject:", v27);

    goto LABEL_33;
  }
  if (burnoutProtectionState != 1)
  {
    if (!burnoutProtectionState && -[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
    {
      self->_burnoutProtectionState = 3;
      v7 = !self->_coolOffRunning;
      if (!self->_coolOffRunning)
        self->_coolOffRunning = 1;
      readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
      v9 = 3153600000.0;
      v10 = 0.5;
LABEL_36:
      -[NFTimer startTimer:leeway:](readermodeBurnoutProtectionDebounceTimer, "startTimer:leeway:", v9, v10);
      goto LABEL_47;
    }
    goto LABEL_9;
  }
  -[NFReaderRestrictor getCooloffTime](self, "getCooloffTime");
  v12 = v28;
  v29 = self->_readerOperationTimes;
  v30 = sub_1000B3828((uint64_t)NFReaderOperation, CFSTR("ReaderStopped"), v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  -[NSMutableArray addObject:](v29, "addObject:", v31);

  -[NFTimer stopTimer](self->_readermodeBurnoutProtectionTimer, "stopTimer");
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFLogGetLogger(v32);
  v34 = (void (*)(uint64_t, const char *, ...))v33;
  if (v12 > 0.0)
  {
    if (v33)
    {
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v37 = object_getClassName(self);
      v58 = sel_getName(a2);
      v38 = 45;
      if (v36)
        v38 = 43;
      v34(6, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", v38, v37, v58, 225, *(_QWORD *)&v12);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v61 = v43;
      *(_WORD *)&v61[4] = 2082;
      *(_QWORD *)&v61[6] = object_getClassName(self);
      v62 = 2082;
      v63 = sel_getName(a2);
      v64 = 1024;
      v65 = 225;
      v66 = 2048;
      v67 = v12;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting cooloff timer for %f seconds.", buf, 0x2Cu);
    }

    v45 = NFSharedSignpostLog(v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_signpost_enabled(v46))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v61 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for %0.2lf secs", buf, 0xCu);
    }

    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306240);
LABEL_33:
    self->_burnoutProtectionState = 3;
    v7 = !self->_coolOffRunning;
    if (!self->_coolOffRunning)
      self->_coolOffRunning = 1;
    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
    v10 = 0.5;
    v9 = v12;
    goto LABEL_36;
  }
  if (v33)
  {
    v47 = object_getClass(self);
    v48 = class_isMetaClass(v47);
    v49 = object_getClassName(self);
    v59 = sel_getName(a2);
    v50 = 45;
    if (v48)
      v50 = 43;
    v34(6, "%c[%{public}s %{public}s]:%i Cooloff not needed.", v50, v49, v59, 236);
  }
  v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v52 = NFSharedLogGetLogger(v51);
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = object_getClass(self);
    if (class_isMetaClass(v54))
      v55 = 43;
    else
      v55 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v61 = v55;
    *(_WORD *)&v61[4] = 2082;
    *(_QWORD *)&v61[6] = object_getClassName(self);
    v62 = 2082;
    v63 = sel_getName(a2);
    v64 = 1024;
    v65 = 236;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff not needed.", buf, 0x22u);
  }

  v7 = 0;
  self->_burnoutProtectionState = 0;
LABEL_47:
  -[NFReaderRestrictor _purgeOldOperations](self, "_purgeOldOperations");
  -[NFReaderRestrictor _validateStartStopSequence](self, "_validateStartStopSequence");
  -[NSLock unlock](self->_burnoutStateLock, "unlock");

  return v7;
}

- (BOOL)readerModeStoppedShouldCooloffRun
{
  void *v4;
  BOOL v5;

  if (self->_currentTestTime)
    return -[NFReaderRestrictor _readerModeStoppedShouldCooloffRun:](self, "_readerModeStoppedShouldCooloffRun:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  v5 = -[NFReaderRestrictor _readerModeStoppedShouldCooloffRun:](self, "_readerModeStoppedShouldCooloffRun:", v4);

  return v5;
}

- (BOOL)readerModeProtectionActive
{
  BOOL v3;

  -[NSLock lock](self->_burnoutStateLock, "lock");
  if (-[NFReaderRestrictor _requiresReaderModeProtection](self, "_requiresReaderModeProtection")
    && self->_burnoutProtectionState > 1)
  {
    v3 = 1;
  }
  else if (-[NFReaderRestrictor _requiresThermalModeProtection](self, "_requiresThermalModeProtection"))
  {
    v3 = -[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical");
  }
  else
  {
    v3 = 0;
  }
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
  return v3;
}

- (void)triggerBurnoutTimer
{
  -[NSLock lock](self->_burnoutStateLock, "lock");
  self->_burnoutProtectionState = 1;
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
  -[NFTimer startTimer:leeway:](self->_readermodeBurnoutProtectionTimer, "startTimer:leeway:", 0.0, 0.5);
}

- (id)state
{
  NSMutableArray *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSNumber *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = -[NSMutableArray copy](self->_readerOperationTimes, "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9), "description"));
        -[NSMutableArray addObject:](v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v11 = objc_alloc((Class)NSDictionary);
  v12 = -[NSMutableArray copy](v3, "copy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_burnoutProtectionState));
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_100074D78(self->_thermalMonitor));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, CFSTR("ReaderHistory"), v13, CFSTR("state"), v15, CFSTR("ThermalState"), 0, (_QWORD)v18);

  return v16;
}

- (id)readerOperations
{
  return self->_readerOperationTimes;
}

- (void)setCurrentTestTime:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentTestTime, a3);
  if (self->_burnoutProtectionState == 3
    && !-[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
    -[NFTimer stopTimer](self->_readermodeBurnoutProtectionDebounceTimer, "stopTimer");
    -[NFReaderRestrictor _handleReaderBurnoutProtectionDebounceTimer](self, "_handleReaderBurnoutProtectionDebounceTimer");
  }

}

- (NSDate)currentTestTime
{
  return self->_currentTestTime;
}

- (BOOL)thermalPressureCritical
{
  return (unint64_t)sub_100074D78(self->_thermalMonitor) > 2;
}

- (BOOL)thermalPressureBackoff
{
  return sub_100074D78(self->_thermalMonitor) == 2;
}

- (BOOL)thermalPressureNominal
{
  return !sub_100074D78(self->_thermalMonitor) || sub_100074D78(self->_thermalMonitor) == 1;
}

- (BOOL)_requiresThermalModeProtection
{
  return 1;
}

- (BOOL)_requiresReaderModeProtection
{
  void *v4;
  unsigned int v5;
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
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  if (!NFIsInternalBuild(self))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BurnoutTimerDisable"));

  if (!v5)
    return 1;
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
    v8(6, "%c[%{public}s %{public}s]:%i Disabling reader mode protection.", v12, ClassName, Name, 371);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v17;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 371;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling reader mode protection.", buf, 0x22u);
  }

  return 0;
}

- (void)_purgeOldOperations
{
  NSDate *currentTestTime;
  NSDate *v4;
  NSDate *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  NSMutableArray *readerOperationTimes;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  currentTestTime = self->_currentTestTime;
  if (currentTestTime)
    v4 = currentTestTime;
  else
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  v5 = v4;
  v6 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_readerOperationTimes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11);
        if (v12)
          v13 = *(void **)(v12 + 8);
        else
          v13 = 0;
        v14 = v13;
        -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v14, (_QWORD)v21);
        v16 = v15;
        -[NFReaderRestrictor maxOperationTimeSpan](self, "maxOperationTimeSpan");
        v18 = v17;

        if (v16 <= v18)
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 = v19;
    }
    while (v19);
  }

  readerOperationTimes = self->_readerOperationTimes;
  self->_readerOperationTimes = v6;

}

- (BOOL)_validateStartStopSequence
{
  id v3;
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  _QWORD *v9;
  _QWORD *v10;
  unsigned int v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const __CFString *v28;
  NSMutableArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  _BYTE v46[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_readerOperationTimes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    v6 = -1;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v7);
        if (v9)
          v9 = (_QWORD *)v9[2];
        v10 = v9;
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ReaderStopped"));
        v6 = v11 ^ 1;

        if ((v11 ^ 1) == v8)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v14 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            if (v11)
              v19 = CFSTR("Stop");
            else
              v19 = CFSTR("Start");
            v20 = 45;
            if (isMetaClass)
              v20 = 43;
            v14(3, "%c[%{public}s %{public}s]:%i Failed validation : last == current == %{public}@", v20, ClassName, Name, 406, v19);
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
            v26 = object_getClassName(self);
            v27 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v28 = CFSTR("Start");
            if (v11)
              v28 = CFSTR("Stop");
            v37 = v25;
            v38 = 2082;
            v39 = v26;
            v40 = 2082;
            v41 = v27;
            v42 = 1024;
            v43 = 406;
            v44 = 2114;
            v45 = v28;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed validation : last == current == %{public}@", buf, 0x2Cu);
          }

        }
        v7 = (char *)v7 + 1;
        v8 = v11 ^ 1;
      }
      while (v4 != v7);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v4);
  }

  return 1;
}

- (void)thermalStateChanged:(unint64_t)a3
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  unsigned int burnoutProtectionState;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *v52;
  _BOOL4 v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  NFTimer *readermodeBurnoutProtectionDebounceTimer;
  double v66;
  const char *ClassName;
  const char *Name;
  const char *v69;
  const char *v70;
  const char *v71;
  uint8_t buf[4];
  _BYTE v73[14];
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  unint64_t v79;

  -[NSLock lock](self->_burnoutStateLock, "lock");
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i New state : %lu", v11, ClassName, Name, 424, a3);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v73 = v16;
    *(_WORD *)&v73[4] = 2082;
    *(_QWORD *)&v73[6] = object_getClassName(self);
    v74 = 2082;
    v75 = sel_getName(a2);
    v76 = 1024;
    v77 = 424;
    v78 = 2048;
    v79 = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New state : %lu", buf, 0x2Cu);
  }

  if (a3 < 2)
  {
    if (self->_burnoutProtectionState != 3)
      goto LABEL_53;
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFLogGetLogger(v32);
    if (v33)
    {
      v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v37 = object_getClassName(self);
      v70 = sel_getName(a2);
      v38 = 45;
      if (v36)
        v38 = 43;
      v34(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now nominal, re-scheduling the timer.", v38, v37, v70, 432);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(self);
      v45 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v73 = v43;
      *(_WORD *)&v73[4] = 2082;
      *(_QWORD *)&v73[6] = v44;
      v74 = 2082;
      v75 = v45;
      v76 = 1024;
      v77 = 432;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now nominal, re-scheduling the timer.", buf, 0x22u);
    }

    v47 = NFSharedSignpostLog(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (!os_signpost_enabled(v48))
      goto LABEL_50;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v73 = 0x4014000000000000;
LABEL_49:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for %lf secs", buf, 0xCu);
LABEL_50:

    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionDebounceTimer;
    v66 = 5.0;
LABEL_52:
    -[NFTimer startTimer:leeway:](readermodeBurnoutProtectionDebounceTimer, "startTimer:leeway:", v66, 0.5);
    goto LABEL_53;
  }
  if (a3 - 3 >= 2)
  {
    if (a3 != 2 || self->_burnoutProtectionState != 3)
      goto LABEL_53;
    v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v50 = NFLogGetLogger(v49);
    if (v50)
    {
      v51 = (void (*)(uint64_t, const char *, ...))v50;
      v52 = object_getClass(self);
      v53 = class_isMetaClass(v52);
      v54 = object_getClassName(self);
      v71 = sel_getName(a2);
      v55 = 45;
      if (v53)
        v55 = 43;
      v51(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now moderate, re-scheduling the timer.", v55, v54, v71, 447);
    }
    v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v57 = NFSharedLogGetLogger(v56);
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = object_getClass(self);
      if (class_isMetaClass(v59))
        v60 = 43;
      else
        v60 = 45;
      v61 = object_getClassName(self);
      v62 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v73 = v60;
      *(_WORD *)&v73[4] = 2082;
      *(_QWORD *)&v73[6] = v61;
      v74 = 2082;
      v75 = v62;
      v76 = 1024;
      v77 = 447;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now moderate, re-scheduling the timer.", buf, 0x22u);
    }

    v64 = NFSharedSignpostLog(v63);
    v48 = objc_claimAutoreleasedReturnValue(v64);
    if (!os_signpost_enabled(v48))
      goto LABEL_50;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v73 = 0x4014000000000000;
    goto LABEL_49;
  }
  burnoutProtectionState = self->_burnoutProtectionState;
  if (!burnoutProtectionState)
  {
    readermodeBurnoutProtectionDebounceTimer = self->_readermodeBurnoutProtectionTimer;
    v66 = 0.0;
    goto LABEL_52;
  }
  if (burnoutProtectionState == 1)
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFLogGetLogger(v18);
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v23 = object_getClassName(self);
      v69 = sel_getName(a2);
      v24 = 45;
      if (v22)
        v24 = 43;
      v20(6, "%c[%{public}s %{public}s]:%i Thermal pressure is now heavy, re-scheduling the timer.", v24, v23, v69, 461);
    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v73 = v29;
      *(_WORD *)&v73[4] = 2082;
      *(_QWORD *)&v73[6] = v30;
      v74 = 2082;
      v75 = v31;
      v76 = 1024;
      v77 = 461;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Thermal pressure is now heavy, re-scheduling the timer.", buf, 0x22u);
    }

    -[NFTimer startTimer:](self->_readermodeBurnoutProtectionTimer, "startTimer:", 0.0);
  }
LABEL_53:
  -[NSLock unlock](self->_burnoutStateLock, "unlock");
}

- (void)_handleReaderBurnoutProtectionTimer
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
  void *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  -[NSLock lock](self->_burnoutStateLock, "lock");
  if (-[NFReaderRestrictor _requiresReaderModeProtection](self, "_requiresReaderModeProtection"))
  {
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
      v6(6, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", v10, ClassName, Name, 482);
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
      v25 = 482;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Burnout timer elapsed.", buf, 0x22u);
    }

    self->_burnoutProtectionState = 2;
    -[NSLock unlock](self->_burnoutStateLock, "unlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor delegate](self, "delegate"));
    objc_msgSend(v16, "handleReaderBurnoutTimer");

  }
  else
  {
    -[NSLock unlock](self->_burnoutStateLock, "unlock");
  }
}

- (void)_handleReaderBurnoutProtectionDebounceTimer
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
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  void *v31;
  const char *Name;
  const char *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  -[NSLock lock](self->_burnoutStateLock, "lock");
  if (-[NFReaderRestrictor _requiresThermalModeProtection](self, "_requiresThermalModeProtection")
    && -[NFReaderRestrictor thermalPressureCritical](self, "thermalPressureCritical"))
  {
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
      v6(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed but thermals is still too hot.", v10, ClassName, Name, 497);
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
      v35 = v15;
      v36 = 2082;
      v37 = object_getClassName(self);
      v38 = 2082;
      v39 = sel_getName(a2);
      v40 = 1024;
      v41 = 497;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed but thermals is still too hot.", buf, 0x22u);
    }

    v17 = NFSharedSignpostLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_COOLOFF", "starting timer for.. ever", buf, 2u);
    }

    -[NFTimer startTimer:leeway:](self->_readermodeBurnoutProtectionDebounceTimer, "startTimer:leeway:", 3153600000.0, 0.5);
    -[NSLock unlock](self->_burnoutStateLock, "unlock");
  }
  else if (-[NFReaderRestrictor _requiresReaderModeProtection](self, "_requiresReaderModeProtection"))
  {
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFLogGetLogger(v19);
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v33 = sel_getName(a2);
      v25 = 45;
      if (v23)
        v25 = 43;
      v21(6, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", v25, v24, v33, 507);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67109890;
      v35 = v30;
      v36 = 2082;
      v37 = object_getClassName(self);
      v38 = 2082;
      v39 = sel_getName(a2);
      v40 = 1024;
      v41 = 507;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cooloff timer elapsed.", buf, 0x22u);
    }

    self->_burnoutProtectionState = 0;
    -[NSLock unlock](self->_burnoutStateLock, "unlock");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NFReaderRestrictor delegate](self, "delegate"));
    objc_msgSend(v31, "handleReaderBurnoutCleared");

  }
  else
  {
    -[NSLock unlock](self->_burnoutStateLock, "unlock");
  }
}

- (NFReaderRestrictorDelegate)delegate
{
  return (NFReaderRestrictorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTestTime, 0);
  objc_storeStrong((id *)&self->_burnoutStateLock, 0);
  objc_storeStrong((id *)&self->_readerOperationTimes, 0);
  objc_storeStrong((id *)&self->_readermodeBurnoutProtectionDebounceTimer, 0);
  objc_storeStrong((id *)&self->_readermodeBurnoutProtectionTimer, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
}

- (double)maxOperationTimeSpan
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFReaderRestrictor.m"), 528, CFSTR("Not implemented"));

  return 300.0;
}

- (double)getCooloffTime
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFReaderRestrictor.m"), 534, CFSTR("Not implemented"));

  return 315360000.0;
}

- (double)maxReaderTime
{
  unsigned __int8 v3;
  double result;
  unsigned int v5;

  v3 = -[NFReaderRestrictor thermalPressureNominal](self, "thermalPressureNominal");
  result = 20.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[NFReaderRestrictor thermalPressureBackoff](self, "thermalPressureBackoff", 20.0);
    result = 0.0;
    if (v5)
      return 7.0;
  }
  return result;
}

@end
