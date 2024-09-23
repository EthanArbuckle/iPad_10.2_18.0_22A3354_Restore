@implementation _NFHCESession

- (_NFHCESession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  _NFHCESession *v6;
  _NFHCESession *v7;
  _NFHCESession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NFHCESession;
  v6 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v10, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_connected = 0;
    v8 = v6;
  }

  return v7;
}

- (NSData)effectiveECPFrame
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
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
  const char *v20;
  void *v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *ClassName;
  const char *v33;
  const char *Name;
  const char *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
    v6 = (void *)v5;
    if (v5)
      v7 = *(void **)(v5 + 16);
    else
      v7 = 0;
    v8 = v7;

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
      v11(5, "%c[%{public}s %{public}s]:%i Enabling FD & ECP Broadcast %@", v14, ClassName, Name, 74, v8);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67110146;
    v37 = v19;
    v38 = 2082;
    v39 = object_getClassName(self);
    v40 = 2082;
    v41 = sel_getName(a2);
    v42 = 1024;
    v43 = 74;
    v44 = 2112;
    v45 = v8;
    v20 = "%c[%{public}s %{public}s]:%i Enabling FD & ECP Broadcast %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0x2Cu);
LABEL_14:

    return (NSData *)v8;
  }
  if ((id)-[_NFSession backgroundTagReadEcpOption](self, "backgroundTagReadEcpOption") != (id)2)
  {
    v8 = 0;
    return (NSData *)v8;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_NFSession backgroundTagReadCustomECP](self, "backgroundTagReadCustomECP"));

  if (v8)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[_NFSession backgroundTagReadCustomECP](self, "backgroundTagReadCustomECP"));
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFLogGetLogger(v21);
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v33 = object_getClassName(self);
      v35 = sel_getName(a2);
      v26 = 45;
      if (v25)
        v26 = 43;
      v23(5, "%c[%{public}s %{public}s]:%i Enabling FD & custom ECP %@", v26, v33, v35, 78, v8);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v17 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v29 = object_getClass(self);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    *(_DWORD *)buf = 67110146;
    v37 = v30;
    v38 = 2082;
    v39 = object_getClassName(self);
    v40 = 2082;
    v41 = sel_getName(a2);
    v42 = 1024;
    v43 = 78;
    v44 = 2112;
    v45 = v8;
    v20 = "%c[%{public}s %{public}s]:%i Enabling FD & custom ECP %@";
    goto LABEL_13;
  }
  return (NSData *)v8;
}

- (id)caLogger
{
  return self->_hceCALogger;
}

+ (id)validateEntitlements:(id)a3
{
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  const char *Name;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  if ((objc_msgSend(a3, "hceAccess") & 1) != 0)
    return 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v12, ClassName, Name, 91);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(a1);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v17;
    v30 = 2082;
    v31 = object_getClassName(a1);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 91;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FE400;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 92);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
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
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  NSDate *suspendAssertionDeadline;
  NFTimer *emuAssertionTimer;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  const char *Name;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFHCESession", buf, 2u);
  }

  if (-[_NFSession didStart](self, "didStart") && !-[_NFSession isSuspended](self, "isSuspended"))
  {
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
      v8(6, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", v12, ClassName, Name, 102);
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
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v17;
      v34 = 2082;
      v35 = v18;
      v36 = 2082;
      v37 = v19;
      v38 = 1024;
      v39 = 102;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", buf, 0x22u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
    v22 = objc_msgSend(v20, "setRoutingConfig:", v21);

  }
  suspendAssertionDeadline = self->_suspendAssertionDeadline;
  self->_suspendAssertionDeadline = 0;

  -[NFTimer stopTimer](self->_emuAssertionTimer, "stopTimer");
  emuAssertionTimer = self->_emuAssertionTimer;
  self->_emuAssertionTimer = 0;

  v25 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  sub_10019CC08((uint64_t)v26);
  v31.receiver = self;
  v31.super_class = (Class)_NFHCESession;
  v27 = -[_NFSession cleanup](&v31, "cleanup");
  v28 = NFSharedSignpostLog(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFHCESession", buf, 2u);
  }

}

- (void)_syncStartAssertionTimer:(double)a3
{
  id v6;
  void *v7;
  NFTimer *v8;
  NFTimer *emuAssertionTimer;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  const char *Name;
  _QWORD v25[6];
  _QWORD v26[6];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  double v36;

  if (!self->_emuAssertionTimer)
  {
    v6 = objc_alloc((Class)NFTimer);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000856A0;
    v26[3] = &unk_1002E5C30;
    v26[4] = self;
    v26[5] = a2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
    v8 = (NFTimer *)objc_msgSend(v6, "initWithCallback:queue:", v26, v7);
    emuAssertionTimer = self->_emuAssertionTimer;
    self->_emuAssertionTimer = v8;

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10008597C;
  v25[3] = &unk_1002E5C30;
  v25[4] = self;
  *(double *)&v25[5] = a3;
  os_unfair_lock_lock(&self->_lock);
  sub_10008597C((uint64_t)v25);
  os_unfair_lock_unlock(&self->_lock);
  -[NFTimer startTimer:](self->_emuAssertionTimer, "startTimer:", a3);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v12(5, "%c[%{public}s %{public}s]:%i Assertion timer (%{public}fs) started", v16, ClassName, Name, 140, *(_QWORD *)&a3);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v28 = v21;
    v29 = 2082;
    v30 = v22;
    v31 = 2082;
    v32 = v23;
    v33 = 1024;
    v34 = 140;
    v35 = 2050;
    v36 = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assertion timer (%{public}fs) started", buf, 0x2Cu);
  }

}

- (BOOL)suspendWithInfo:(id)a3
{
  _BOOL4 v4;
  NFHostCardEmulationDeviceHandle *remoteDev;
  id v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NFHCESession;
  v4 = -[_NFXPCSession suspendWithInfo:](&v10, "suspendWithInfo:", a3);
  if (v4)
  {
    remoteDev = self->_remoteDev;
    self->_remoteDev = 0;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100085AA4;
    v9[3] = &unk_1002E5C58;
    v9[4] = self;
    os_unfair_lock_lock(&self->_lock);
    sub_100085AA4((uint64_t)v9);
    os_unfair_lock_unlock(&self->_lock);
    sub_10001D8D4((uint64_t)self->_hceCALogger);
    v6 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    sub_10019CC08((uint64_t)v7);

  }
  return v4;
}

- (void)resume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  -[_NFXPCSession resume](&v3, "resume");
  sub_10001D878((uint64_t)self->_hceCALogger);
}

- (id)_routingConfigWithECPBroadcastInHCE
{
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  _DWORD *v6;
  BOOL v7;
  _DWORD *v8;
  unint64_t v9;
  double v10;
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
  const char *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t);
  void *v37;
  _NFHCESession *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  p_lock = &self->_lock;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v36 = sub_10008618C;
  v37 = &unk_1002E5EA8;
  v38 = self;
  v39 = &v40;
  v5 = v35;
  os_unfair_lock_lock(p_lock);
  v36((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  if (!*((_BYTE *)v41 + 24))
  {
    v6 = (_DWORD *)objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
    if (v6)
    {
      v7 = v6[3] == 0;

      if (!v7)
      {
        v8 = (_DWORD *)objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
        if (v8)
        {
          LODWORD(v9) = v8[3];
          v10 = (double)v9;
        }
        else
        {
          v10 = 0.0;
        }

        -[_NFHCESession _syncStartAssertionTimer:](self, "_syncStartAssertionTimer:", v10 / 1000.0);
      }
    }
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v14 = 43;
    else
      v14 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i ECP broadcast in HCE enabled", v14, ClassName, Name, 205);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v45 = v21;
    v46 = 2082;
    v47 = v22;
    v48 = 2082;
    v49 = v23;
    v50 = 1024;
    v51 = 205;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ECP broadcast in HCE enabled", buf, 0x22u);
  }

  v24 = -[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart");
  v25 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  v26 = (void *)v25;
  if (v25)
    v27 = *(void **)(v25 + 16);
  else
    v27 = 0;
  v28 = v27;
  v29 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  v30 = (void *)v29;
  if (v29)
    v31 = *(unsigned int *)(v29 + 8);
  else
    v31 = 0;
  v32 = sub_100085B54(self, v24, v28, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  _Block_object_dispose(&v40, 8);
  return v33;
}

- (id)initialRoutingConfigWithField:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  const char *ClassName;
  const char *Name;
  const char *v69;
  const char *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  unsigned int v85;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));

  if (!v6)
  {
    v36 = sub_100085B54(self, -[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart"), 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    goto LABEL_50;
  }
  v7 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("disableECPBroadcastInHCE")));
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i disableECPBroadcastInHCE override=%d", v16, ClassName, Name, 226, v10);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v77 = v21;
      v78 = 2082;
      v79 = v22;
      v80 = 2082;
      v81 = v23;
      v82 = 1024;
      v83 = 226;
      v84 = 1024;
      v85 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i disableECPBroadcastInHCE override=%d", buf, 0x28u);
    }

    if ((v10 & 1) != 0)
      goto LABEL_26;
  }
  v24 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  if (v24)
  {
    v25 = v24[3];

    if (v25)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v26 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
      v27 = (void *)v26;
      if (v26)
        v28 = *(void **)(v26 + 24);
      else
        v28 = 0;
      v29 = v28;

      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v72;
        while (2)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v72 != v32)
              objc_enumerationMutation(v29);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i), "isEqual:", v5))
            {
              v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v39 = NFLogGetLogger(v38);
              if (v39)
              {
                v40 = (void (*)(uint64_t, const char *, ...))v39;
                v41 = object_getClass(self);
                v42 = class_isMetaClass(v41);
                v43 = object_getClassName(self);
                v69 = sel_getName(a2);
                v44 = 45;
                if (v42)
                  v44 = 43;
                v40(6, "%c[%{public}s %{public}s]:%i Broadcast field matches", v44, v43, v69, 238);
              }
              v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v46 = NFSharedLogGetLogger(v45);
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = object_getClass(self);
                if (class_isMetaClass(v48))
                  v49 = 43;
                else
                  v49 = 45;
                v50 = object_getClassName(self);
                v51 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v77 = v49;
                v78 = 2082;
                v79 = v50;
                v80 = 2082;
                v81 = v51;
                v82 = 1024;
                v83 = 238;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Broadcast field matches", buf, 0x22u);
              }

              v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHCESession _routingConfigWithECPBroadcastInHCE](self, "_routingConfigWithECPBroadcastInHCE"));
              goto LABEL_49;
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
          if (v31)
            continue;
          break;
        }
      }

LABEL_26:
      v34 = sub_100085B54(self, -[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart"), 0, 0);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      goto LABEL_48;
    }
  }
  v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v53 = NFLogGetLogger(v52);
  if (v53)
  {
    v54 = (void (*)(uint64_t, const char *, ...))v53;
    v55 = object_getClass(self);
    v56 = class_isMetaClass(v55);
    v57 = object_getClassName(self);
    v70 = sel_getName(a2);
    v58 = 45;
    if (v56)
      v58 = 43;
    v54(6, "%c[%{public}s %{public}s]:%i Broadcast field match rules unavailable", v58, v57, v70, 232);
  }
  v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v60 = NFSharedLogGetLogger(v59);
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = object_getClass(self);
    if (class_isMetaClass(v62))
      v63 = 43;
    else
      v63 = 45;
    v64 = object_getClassName(self);
    v65 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v77 = v63;
    v78 = 2082;
    v79 = v64;
    v80 = 2082;
    v81 = v65;
    v82 = 1024;
    v83 = 232;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Broadcast field match rules unavailable", buf, 0x22u);
  }

  v35 = objc_claimAutoreleasedReturnValue(-[_NFHCESession _routingConfigWithECPBroadcastInHCE](self, "_routingConfigWithECPBroadcastInHCE"));
LABEL_48:
  v37 = (void *)v35;
LABEL_49:

LABEL_50:
  return v37;
}

- (id)initialRoutingConfig
{
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = -[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart");
  v4 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 16);
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  v9 = (void *)v8;
  if (v8)
    v10 = *(unsigned int *)(v8 + 8);
  else
    v10 = 0;
  v11 = sub_100085B54(self, v3, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (id)initialECPConfig
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 16);
  else
    v5 = 0;
  v6 = v5;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[_NFHCESession ecpBroadcastConfig](self, "ecpBroadcastConfig"));
    v8 = (void *)v7;
    if (v7)
      v9 = *(void **)(v7 + 16);
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)willStartSession
{
  objc_super v4;

  sub_10023B69C((uint64_t)NFSecureElementWrapper);
  v4.receiver = self;
  v4.super_class = (Class)_NFHCESession;
  return -[_NFSession willStartSession](&v4, "willStartSession");
}

- (void)endSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  -[_NFXPCSession endSession:](&v3, "endSession:", a3);
}

- (void)prioritizeSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFHCESession;
  -[_NFXPCSession prioritizeSessionWithCompletion:](&v3, "prioritizeSessionWithCompletion:", a3);
}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  NFHostCardEmulationDeviceHandle *remoteDev;
  NFHceTagReadCALogger *v7;
  NFHceTagReadCALogger *hceCALogger;
  NFHceTagReadCALogger *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NFHCESession;
  v4 = a3;
  -[_NFSession didStartSession:](&v10, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject", v10.receiver, v10.super_class));
  objc_msgSend(v5, "didStartSession:", v4);

  if (!v4)
  {
    remoteDev = self->_remoteDev;
    self->_remoteDev = 0;

    os_unfair_lock_lock(&self->_lock);
    self->_connected = 0;
    os_unfair_lock_unlock(&self->_lock);
    v7 = objc_alloc_init(NFHceTagReadCALogger);
    hceCALogger = self->_hceCALogger;
    self->_hceCALogger = v7;

    sub_10001D878((uint64_t)self->_hceCALogger);
    if ((-[_NFSession backgroundTagReadEcpOption](self, "backgroundTagReadEcpOption") & 1) != 0)
    {
      v9 = self->_hceCALogger;
      if (v9)
        v9->_isConnectionHandover = 1;
    }
  }
}

- (void)didEndSession:(id)a3
{
  id v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  NFHceTagReadCALogger *hceCALogger;
  objc_super v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;

  v5 = a3;
  if (!-[_NFSession didEnd](self, "didEnd"))
  {
    Logger = NFLogGetLogger(2);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v13, ClassName, Name, 309, v12);

    }
    v14 = NFSharedLogGetLogger(2);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 1024;
      v30 = 309;
      v31 = 2112;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);

    }
    sub_10001D5C4((uint64_t)self->_hceCALogger);
    sub_10001D8D4((uint64_t)self->_hceCALogger);
    hceCALogger = self->_hceCALogger;
    self->_hceCALogger = 0;

  }
  v22.receiver = self;
  v22.super_class = (Class)_NFHCESession;
  -[_NFSession didEndSession:](&v22, "didEndSession:", v5);

}

- (void)suspensionStateUpdate:(BOOL)a3 triggeredByField:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (!v4)
  {
    v6 = (id)-[_NFHCESession disableAutoStartOnField](self, "disableAutoStartOnField");
    if ((_DWORD)v6)
      v6 = -[_NFHCESession setSessionResumeField:](self, "setSessionResumeField:", v7);
  }
  v8 = NFSharedSignpostLog(v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    v11[0] = 67240192;
    v11[1] = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SESSION_SUSPEND_STATE_UPDATE", "started=%{public,signpost.description:attribute}d", (uint8_t *)v11, 8u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v10, "suspensionStateUpdate:triggeredByField:", v4, v7);

}

- (void)stopEmulationAndConfigWithRouting:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16[2];
  objc_super v17;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v17.receiver = self;
  v17.super_class = (Class)_NFHCESession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100086E70;
  v13[3] = &unk_1002E6E00;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  v14 = v7;
  v15 = v8;
  v13[4] = self;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (BOOL)validateReceivedAPDU:(id)a3
{
  return 1;
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  unsigned int v15;

  v6 = a3;
  objc_storeStrong((id *)&self->_remoteDev, a3);
  os_unfair_lock_lock(&self->_lock);
  self->_connected = 1;
  os_unfair_lock_unlock(&self->_lock);
  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67240192;
    v15 = -[_NFHCESession readOnConnected](self, "readOnConnected");
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READER_DETECTED", "readOnConnected=%{public,signpost.description:attribute}d", buf, 8u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v10, "didConnectToReader");

  v11 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  sub_10019D630((uint64_t)v12);
  sub_10001D4E0((uint64_t)self->_hceCALogger);
  if (-[_NFHCESession readOnConnected](self, "readOnConnected"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000875B4;
    v13[3] = &unk_1002E6E28;
    v13[4] = self;
    v13[5] = a2;
    -[_NFHCESession _asyncReadWithCompletion:](self, "_asyncReadWithCompletion:", v13);
  }

}

- (void)handleFieldNotification:(id)a3
{
  id v5;
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
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;

  v5 = a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 396, v5);
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
    v25 = v16;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 396;
    v32 = 2112;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  v18 = NFSharedSignpostLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    v20 = -[_NFHCESession emulationOnSessionStart](self, "emulationOnSessionStart");
    *(_DWORD *)buf = 67240192;
    v25 = v20;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_FIELD_NTF", "emulationOnSessionStart=%{public,signpost.description:attribute}d", buf, 8u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v21, "didReceiveField:", v5);

}

- (void)_didLoseTarget:(BOOL)a3 suspendAssertion:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
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
  const char *v25;
  const char *v26;
  const char *Name;
  _QWORD v28[6];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v7, "didDisconnectFromReader");

    v9 = NFSharedSignpostLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_TARGET_LOST", "onRFStateChange", buf, 2u);
    }

  }
  v11 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  sub_10019CC08((uint64_t)v12);
  if (-[_NFHCESession suspendOnDisconnect](self, "suspendOnDisconnect")
    && !a4
    && !-[_NFSession isSuspended](self, "isSuspended"))
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
      v15(6, "%c[%{public}s %{public}s]:%i Suspending", v19, ClassName, Name, 419);
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
      v25 = object_getClassName(self);
      v26 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v30 = v24;
      v31 = 2082;
      v32 = v25;
      v33 = 2082;
      v34 = v26;
      v35 = 1024;
      v36 = 419;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspending", buf, 0x22u);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100087C44;
    v28[3] = &unk_1002E6E28;
    v28[4] = self;
    v28[5] = a2;
    -[_NFXPCSession createHandoffTokenWithCompletion:](self, "createHandoffTokenWithCompletion:", v28);
  }

}

- (void)handleFieldChanged:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(_QWORD *);
  void *v8;
  _NFHCESession *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  if (!a3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    p_lock = &self->_lock;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v7 = (void (*)(_QWORD *))sub_100087F3C;
    v8 = &unk_1002E6E50;
    v9 = self;
    v10 = &v16;
    v11 = &v12;
    v5 = v6;
    os_unfair_lock_lock(p_lock);
    v7(v5);
    os_unfair_lock_unlock(p_lock);

    -[_NFHCESession _didLoseTarget:suspendAssertion:](self, "_didLoseTarget:suspendAssertion:", *((unsigned __int8 *)v17 + 24), *((unsigned __int8 *)v13 + 24));
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
}

- (void)handleHceTargetLost
{
  NFHostCardEmulationDeviceHandle *remoteDev;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  NFHceTagReadCALogger *hceCALogger;
  _QWORD v9[2];
  void (*v10)(_QWORD *);
  void *v11;
  _NFHCESession *v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  remoteDev = self->_remoteDev;
  self->_remoteDev = 0;

  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_TARGET_LOST", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v10 = (void (*)(_QWORD *))sub_100088130;
  v11 = &unk_1002E6E50;
  v12 = self;
  v13 = buf;
  v14 = &v15;
  v7 = v9;
  os_unfair_lock_lock(&self->_lock);
  v10(v7);
  os_unfair_lock_unlock(&self->_lock);

  -[_NFHCESession _didLoseTarget:suspendAssertion:](self, "_didLoseTarget:suspendAssertion:", v20[24], *((unsigned __int8 *)v16 + 24));
  sub_10001D5C4((uint64_t)self->_hceCALogger);
  sub_10001D8D4((uint64_t)self->_hceCALogger);
  hceCALogger = self->_hceCALogger;
  self->_hceCALogger = 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_syncStartEmulationWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *specific;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  void *v64;
  NSErrorUserInfoKey v65;
  void *v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;

  v5 = (void (**)(id, _QWORD))a3;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v28 = kdebug_trace(724566224, 0, 0, 0, 0);
    v29 = NFSharedSignpostLog(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION", ", buf, 2u);
    }

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v33 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v39 = 45;
      if (isMetaClass)
        v39 = 43;
      v33(6, "%c[%{public}s %{public}s]:%i %{public}@", v39, ClassName, Name, 487, v38);

    }
    v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFSharedLogGetLogger(v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = object_getClass(self);
      if (class_isMetaClass(v43))
        v44 = 43;
      else
        v44 = 45;
      v45 = object_getClassName(self);
      v46 = sel_getName(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v68 = v44;
      v69 = 2082;
      v70 = v45;
      v71 = 2082;
      v72 = v46;
      v73 = 1024;
      v74 = 487;
      v75 = 2114;
      v76 = v47;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig hostCardEmulation](NFRoutingConfig, "hostCardEmulation"));
    v50 = objc_msgSend(v48, "setRoutingConfig:", v49);

    if (v5)
      v5[2](v5, 0);
    v51 = NFLogGetLogger(2);
    if (v51)
    {
      v52 = (void (*)(uint64_t, const char *, ...))v51;
      v53 = object_getClass(self);
      v54 = class_isMetaClass(v53);
      v55 = object_getClassName(self);
      v56 = sel_getName(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      v58 = 45;
      if (v54)
        v58 = 43;
      v52(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", v58, v55, v56, 492, v57);

    }
    v59 = NFSharedLogGetLogger(2);
    v24 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v60 = object_getClass(self);
      if (class_isMetaClass(v60))
        v61 = 43;
      else
        v61 = 45;
      v62 = object_getClassName(self);
      v63 = sel_getName(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
      *(_DWORD *)buf = 67110146;
      v68 = v61;
      v69 = 2082;
      v70 = v62;
      v71 = 2082;
      v72 = v63;
      v73 = 1024;
      v74 = 492;
      v75 = 2112;
      v76 = v64;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", buf, 0x2Cu);

    }
    goto LABEL_15;
  }
  v6 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = NFLogGetLogger(v6);
  if (v7)
  {
    v8 = (void (*)(uint64_t, const char *, ...))v7;
    v9 = object_getClass(self);
    v10 = class_isMetaClass(v9);
    v11 = object_getClassName(self);
    v12 = sel_getName(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v14 = 45;
    if (v10)
      v14 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, v11, v12, 483, v13);

  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110146;
    v68 = v19;
    v69 = 2082;
    v70 = v20;
    v71 = 2082;
    v72 = v21;
    v73 = 1024;
    v74 = 483;
    v75 = 2114;
    v76 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v5)
  {
    v23 = objc_alloc((Class)NSError);
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v65 = NSLocalizedDescriptionKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v66 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
    v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 54, v26);
    ((void (**)(id, id))v5)[2](v5, v27);

LABEL_15:
  }

}

- (void)startEmulationWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = kdebug_trace(724566220, 0, 0, 0, 0);
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", ", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)_NFHCESession;
  v8 = -[_NFSession workQueue](&v13, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000888B8;
  v11[3] = &unk_1002E6380;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)stopEmulationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
  -[_NFHCESession stopEmulationAndConfigWithRouting:completion:](self, "stopEmulationAndConfigWithRouting:completion:", v5, v4);

}

- (void)sendAPDU:(id)a3 startReadOnCompletion:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  SEL v18;
  BOOL v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFHCESession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088A0C;
  block[3] = &unk_1002E6EC8;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a2;
  v19 = a4;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, block);

}

- (void)readAPDUWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFHCESession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089ABC;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)asyncReadAPDUWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFHCESession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A40C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)_asyncReadWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, id);
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NFHostCardEmulationDeviceHandle *remoteDev;
  _QWORD v34[5];
  void (**v35)(id, _QWORD, id);
  _QWORD v36[5];
  NSErrorUserInfoKey v37;
  void *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;

  v5 = (void (**)(id, _QWORD, id))a3;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 651, v13);

    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v40 = v19;
      v41 = 2082;
      v42 = v20;
      v43 = 2082;
      v44 = v21;
      v45 = 1024;
      v46 = 651;
      v47 = 2114;
      v48 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
    if (v5)
    {
      v23 = objc_alloc((Class)NSError);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v37 = NSLocalizedDescriptionKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
      v38 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 54, v26);
      v5[2](v5, 0, v27);

    }
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10008ABE4;
    v36[3] = &unk_1002E6E78;
    v36[4] = self;
    os_unfair_lock_lock(&self->_lock);
    v28 = sub_10008ABE4((uint64_t)v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    os_unfair_lock_unlock(&self->_lock);
    if (v29)
    {
      v5[2](v5, 0, v29);
    }
    else
    {
      v31 = NFSharedSignpostLog(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ", ", buf, 2u);
      }

      remoteDev = self->_remoteDev;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10008ACFC;
      v34[3] = &unk_1002E6F18;
      v34[4] = self;
      v35 = v5;
      -[NFHostCardEmulationDeviceHandle readAPDUWithCompletion:](remoteDev, "readAPDUWithCompletion:", v34);

    }
  }

}

- (void)requestEmulationAssertion:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFHCESession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008B0F4;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)resumeSessionFromWaitingOnFieldWithCompletion:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFHCESession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C000;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)restartDiscovery
{
  OS_dispatch_queue *v4;
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFHCESession;
  v4 = -[_NFSession workQueue](&v7, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008C458;
  v6[3] = &unk_1002E5C30;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

- (BOOL)readOnConnected
{
  return self->_readOnConnected;
}

- (void)setReadOnConnected:(BOOL)a3
{
  self->_readOnConnected = a3;
}

- (BOOL)emulationOnSessionStart
{
  return self->_emulationOnSessionStart;
}

- (void)setEmulationOnSessionStart:(BOOL)a3
{
  self->_emulationOnSessionStart = a3;
}

- (BOOL)suspendOnDisconnect
{
  return self->_suspendOnDisconnect;
}

- (void)setSuspendOnDisconnect:(BOOL)a3
{
  self->_suspendOnDisconnect = a3;
}

- (BOOL)disableAutoStartOnField
{
  return self->_disableAutoStartOnField;
}

- (void)setDisableAutoStartOnField:(BOOL)a3
{
  self->_disableAutoStartOnField = a3;
}

- (NFFieldNotification)sessionResumeField
{
  return self->_sessionResumeField;
}

- (void)setSessionResumeField:(id)a3
{
  objc_storeStrong((id *)&self->_sessionResumeField, a3);
}

- (NFHCEBroadcastECPConfig)ecpBroadcastConfig
{
  return self->_ecpBroadcastConfig;
}

- (void)setEcpBroadcastConfig:(id)a3
{
  objc_storeStrong((id *)&self->_ecpBroadcastConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecpBroadcastConfig, 0);
  objc_storeStrong((id *)&self->_sessionResumeField, 0);
  objc_storeStrong((id *)&self->_hceCALogger, 0);
  objc_storeStrong((id *)&self->_suspendAssertionDeadline, 0);
  objc_storeStrong((id *)&self->_emuAssertionTimer, 0);
  objc_storeStrong((id *)&self->_remoteDev, 0);
}

@end
