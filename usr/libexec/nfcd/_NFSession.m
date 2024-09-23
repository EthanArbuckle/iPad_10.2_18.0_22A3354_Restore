@implementation _NFSession

- (_NFSession)initWithWorkQueue:(id)a3 expressModeManager:(id)a4 allowsBackgroundMode:(BOOL)a5
{
  OS_dispatch_queue *v8;
  id v9;
  _NFSession *v10;
  _NFSession *v11;
  uint64_t v12;
  NSDate *creation;
  id v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  NSString *sessionUID;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  objc_super v25;

  v8 = (OS_dispatch_queue *)a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_NFSession;
  v10 = -[_NFSession init](&v25, "init");
  v11 = v10;
  if (v10)
  {
    v10->_workQueue = v8;
    v10->_isEnding = 0;
    v10->_allowsBackgroundMode = a5;
    objc_storeStrong((id *)&v10->_expressModeManager, a4);
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    creation = v11->_creation;
    v11->_creation = (NSDate *)v12;

    v14 = objc_alloc((Class)NSString);
    v15 = (objc_class *)objc_opt_class(v11);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v19 = (NSString *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%lf"), v17, v18);
    sessionUID = v11->_sessionUID;
    v11->_sessionUID = v19;

    v22 = NFSharedSignpostLog(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v11->_signpostId = os_signpost_id_generate(v23);

    v11->_serviceType = 1;
  }

  return v11;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 1);
}

- (id)initialECPConfig
{
  return 0;
}

+ (id)validateEntitlements:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[_NFSession releaseObjects](self, "releaseObjects");
  v3.receiver = self;
  v3.super_class = (Class)_NFSession;
  -[_NFSession dealloc](&v3, "dealloc");
}

- (BOOL)isEnding
{
  _NFSession *v2;
  BOOL isEnding;

  v2 = self;
  objc_sync_enter(v2);
  isEnding = v2->_isEnding;
  objc_sync_exit(v2);

  return isEnding;
}

- (BOOL)didEnd
{
  _NFSession *v2;
  BOOL didEnd;

  v2 = self;
  objc_sync_enter(v2);
  didEnd = v2->_didEnd;
  objc_sync_exit(v2);

  return didEnd;
}

- (void)holdAssertion
{
  void *v3;
  void *v4;

  if (!self->_hasAssertion)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession powerAssertionIdentifier](self, "powerAssertionIdentifier"));
    objc_msgSend(v3, "holdPowerAssertion:onBehalfOf:", v4, -[_NFSession processIdentifier](self, "processIdentifier"));

    self->_hasAssertion = 1;
  }
}

- (void)releaseAssertion
{
  void *v3;
  void *v4;

  if (self->_hasAssertion)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession powerAssertionIdentifier](self, "powerAssertionIdentifier"));
    objc_msgSend(v3, "releasePowerAssertion:", v4);

    self->_hasAssertion = 0;
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v5;
  _NFSession *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v25;
  const char *ClassName;
  const char *Name;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  _BOOL4 isSuspended;
  void *v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  int v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  NSString *sessionUID;
  NSData *token;
  BOOL v57;
  void *v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  void *v64;
  uint64_t v65;
  objc_class *v66;
  int v67;
  uint8_t buf[4];
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  NSString *v78;
  __int16 v79;
  NSData *v80;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_numberForKey:", CFSTR("ReasonCode")));
  v8 = v7;
  if (!v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v25 = 43;
      else
        v25 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Missing reason code", v25, ClassName, Name, 117);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v18 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    v30 = object_getClass(v6);
    if (class_isMetaClass(v30))
      v31 = 43;
    else
      v31 = 45;
    *(_DWORD *)buf = 67109890;
    v70 = v31;
    v71 = 2082;
    v72 = object_getClassName(v6);
    v73 = 2082;
    v74 = sel_getName(a2);
    v75 = 1024;
    v76 = 117;
    v21 = "%c[%{public}s %{public}s]:%i Missing reason code";
    goto LABEL_58;
  }
  if (objc_msgSend(v7, "integerValue"))
  {
    if (objc_msgSend(v8, "integerValue") == (id)2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Field")));

      if (!v9)
      {
        v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v10);
        if (v11)
        {
          v12 = object_getClass(v6);
          if (class_isMetaClass(v12))
            v13 = 43;
          else
            v13 = 45;
          v14 = object_getClassName(v6);
          v15 = sel_getName(a2);
          v11(3, "%c[%{public}s %{public}s]:%i Missing field", v13, v14, v15, 129);
        }
        v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v17 = NFSharedLogGetLogger(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        v19 = object_getClass(v6);
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        *(_DWORD *)buf = 67109890;
        v70 = v20;
        v71 = 2082;
        v72 = object_getClassName(v6);
        v73 = 2082;
        v74 = sel_getName(a2);
        v75 = 1024;
        v76 = 129;
        v21 = "%c[%{public}s %{public}s]:%i Missing field";
LABEL_58:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x22u);
LABEL_59:

        v57 = 0;
        goto LABEL_60;
      }
    }
  }
  else if (!v6->_token)
  {
    v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v58);
    if (v59)
    {
      v60 = object_getClass(v6);
      if (class_isMetaClass(v60))
        v61 = 43;
      else
        v61 = 45;
      v62 = object_getClassName(v6);
      v63 = sel_getName(a2);
      v59(3, "%c[%{public}s %{public}s]:%i Missing token", v61, v62, v63, 123);
    }
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFSharedLogGetLogger(v64);
    v18 = objc_claimAutoreleasedReturnValue(v65);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    v66 = object_getClass(v6);
    if (class_isMetaClass(v66))
      v67 = 43;
    else
      v67 = 45;
    *(_DWORD *)buf = 67109890;
    v70 = v67;
    v71 = 2082;
    v72 = object_getClassName(v6);
    v73 = 2082;
    v74 = sel_getName(a2);
    v75 = 1024;
    v76 = 123;
    v21 = "%c[%{public}s %{public}s]:%i Missing token";
    goto LABEL_58;
  }
  isSuspended = v6->_isSuspended;
  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (isSuspended)
  {
    v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v33);
    if (v34)
    {
      v35 = object_getClass(v6);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      v37 = object_getClassName(v6);
      v38 = sel_getName(a2);
      v34(4, "%c[%{public}s %{public}s]:%i Already in suspended state", v36, v37, v38, 135);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v18 = objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    v41 = object_getClass(v6);
    if (class_isMetaClass(v41))
      v42 = 43;
    else
      v42 = 45;
    *(_DWORD *)buf = 67109890;
    v70 = v42;
    v71 = 2082;
    v72 = object_getClassName(v6);
    v73 = 2082;
    v74 = sel_getName(a2);
    v75 = 1024;
    v76 = 135;
    v21 = "%c[%{public}s %{public}s]:%i Already in suspended state";
    goto LABEL_58;
  }
  v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v33);
  if (v43)
  {
    v44 = object_getClass(v6);
    if (class_isMetaClass(v44))
      v45 = 43;
    else
      v45 = 45;
    v46 = object_getClassName(v6);
    v47 = sel_getName(a2);
    v43(6, "%c[%{public}s %{public}s]:%i Suspending session %{public}@ using token %{public}@", v45, v46, v47, 139, v6->_sessionUID, v6->_token);
  }
  v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v49 = NFSharedLogGetLogger(v48);
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = object_getClass(v6);
    if (class_isMetaClass(v51))
      v52 = 43;
    else
      v52 = 45;
    v53 = object_getClassName(v6);
    v54 = sel_getName(a2);
    sessionUID = v6->_sessionUID;
    token = v6->_token;
    *(_DWORD *)buf = 67110402;
    v70 = v52;
    v71 = 2082;
    v72 = v53;
    v73 = 2082;
    v74 = v54;
    v75 = 1024;
    v76 = 139;
    v77 = 2114;
    v78 = sessionUID;
    v79 = 2114;
    v80 = token;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspending session %{public}@ using token %{public}@", buf, 0x36u);
  }

  v57 = 1;
  v6->_isSuspended = 1;
  -[_NFSession releaseAssertion](v6, "releaseAssertion");
LABEL_60:

  objc_sync_exit(v6);
  return v57;
}

- (void)resume
{
  _NFSession *v3;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v7;
  const char *ClassName;
  const char *Name;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  NSString *sessionUID;
  NSData *token;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  NSString *v28;

  v3 = self;
  objc_sync_enter(v3);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(v3);
    if (class_isMetaClass(Class))
      v7 = 43;
    else
      v7 = 45;
    ClassName = object_getClassName(v3);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Resuming session %{public}@", v7, ClassName, Name, 150, v3->_sessionUID);
  }
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(v3);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(v3);
    v16 = sel_getName(a2);
    sessionUID = v3->_sessionUID;
    *(_DWORD *)buf = 67110146;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 2082;
    v24 = v16;
    v25 = 1024;
    v26 = 150;
    v27 = 2114;
    v28 = sessionUID;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming session %{public}@", buf, 0x2Cu);
  }

  v3->_isSuspended = 0;
  token = v3->_token;
  v3->_token = 0;

  -[_NFSession holdAssertion](v3, "holdAssertion");
  objc_sync_exit(v3);

}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 0;
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
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
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Unimplemented", v12, ClassName, Name, 164);
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
    v26 = 164;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unimplemented", buf, 0x22u);
  }

}

- (id)powerAssertionIdentifier
{
  __CFString *v3;
  __CFString *v4;
  id v5;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFSession clientName](self, "clientName"));
  v4 = v3;
  if (!v3 || !-[__CFString length](v3, "length"))
  {

    v4 = CFSTR("unavailable");
  }
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("process:%@, %s,sessionID:%d"), v4, object_getClassName(self), self->_sessionID);

  return v5;
}

- (id)clientName
{
  return CFSTR("nfcd");
}

- (int)processIdentifier
{
  return 0;
}

- (BOOL)isSessionSEOnly
{
  return 0;
}

- (BOOL)isFeatureSupported:(unint64_t)a3
{
  char v4;
  unsigned int v5;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  if (a3)
  {
    v4 = a3;
    if ((a3 & 1) == 0)
    {
      v5 = 1;
      if ((a3 & 2) == 0)
        return v5;
      goto LABEL_16;
    }
    v5 = -[_NFSession allowsBackgroundMode](self, "allowsBackgroundMode");
    if ((v4 & 2) != 0)
LABEL_16:
      v5 &= -[_NFSession forceExpressExit](self, "forceExpressExit");
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Invalid input", v13, ClassName, Name, 200);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(self);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 200;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid input", buf, 0x22u);
    }

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)needsCleanup
{
  _BOOL4 v3;

  v3 = -[_NFSession didStart](self, "didStart");
  if (v3)
    LOBYTE(v3) = !-[_NFSession didEnd](self, "didEnd");
  return v3;
}

- (void)didEndSession:(id)a3
{
  id v5;
  _NFSession *v6;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void *v33;
  unsigned int v34;
  NSString *sessionUID;
  _NFSession *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  NSString *v40;
  uint8_t buf[4];
  _BYTE v42[24];
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  NSString *v50;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_didEnd)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v10 = 43;
      else
        v10 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Session has ended previously", v10, ClassName, Name, 235);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(v6);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v42 = v17;
      *(_WORD *)&v42[4] = 2082;
      *(_QWORD *)&v42[6] = object_getClassName(v6);
      *(_WORD *)&v42[14] = 2082;
      *(_QWORD *)&v42[16] = sel_getName(a2);
      v43 = 1024;
      v44 = 235;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has ended previously", buf, 0x22u);
    }

    objc_sync_exit(v6);
LABEL_13:

    goto LABEL_14;
  }
  objc_sync_exit(v6);

  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFLogGetLogger(v18);
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(v6);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    v23 = object_getClassName(v6);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession clientName](v6, "clientName"));
    v20(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", v22, v23, v24, 240, v25, -[_NFSession processIdentifier](v6, "processIdentifier"), v6->_sessionUID);

  }
  v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFSharedLogGetLogger(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = object_getClass(v6);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(v6);
    v32 = sel_getName(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession clientName](v6, "clientName"));
    v34 = -[_NFSession processIdentifier](v6, "processIdentifier");
    sessionUID = v6->_sessionUID;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v42 = v30;
    *(_WORD *)&v42[4] = 2082;
    *(_QWORD *)&v42[6] = v31;
    *(_WORD *)&v42[14] = 2082;
    *(_QWORD *)&v42[16] = v32;
    v43 = 1024;
    v44 = 240;
    v45 = 2114;
    v46 = v33;
    v47 = 1024;
    v48 = v34;
    v49 = 2114;
    v50 = sessionUID;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", buf, 0x3Cu);

  }
  -[_NFSession cleanup](v6, "cleanup");
  v36 = v6;
  objc_sync_enter(v36);
  v6->_didEnd = 1;
  objc_sync_exit(v36);

  if (v36->_didStart)
  {
    v38 = NFSharedSignpostLog(v37);
    v6 = (_NFSession *)objc_claimAutoreleasedReturnValue(v38);
    v39 = -[_NFSession signpostId](v36, "signpostId");
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&v6->super))
    {
      v40 = v36->_sessionUID;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v42 = v40;
      *(_WORD *)&v42[8] = 2112;
      *(_QWORD *)&v42[10] = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, &v6->super, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v39, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)willStartSession
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSDate *v7;
  NSDate *dequeueDate;
  uint8_t v10[16];

  v3 = NFSharedSignpostLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = -[_NFSession signpostId](self, "signpostId");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, v6, "WILL_START_SESSION", ", v10, 2u);
    }
  }

  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  dequeueDate = self->_dequeueDate;
  self->_dequeueDate = v7;

  return 1;
}

- (void)didStartSession:(id)a3
{
  __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSString *sessionUID;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  unsigned int v30;
  NSString *v31;
  int sessionID;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  os_signpost_id_t v38;
  NSString *v39;
  uint8_t buf[4];
  _BYTE v41[24];
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const __CFString *v53;

  v5 = (__CFString *)a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      sessionUID = self->_sessionUID;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v41 = sessionUID;
      *(_WORD *)&v41[8] = 2112;
      *(_QWORD *)&v41[10] = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
    }
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession clientName](self, "clientName"));
    v19 = -[_NFSession processIdentifier](self, "processIdentifier");
    if (v5)
      v20 = v5;
    else
      v20 = &stru_1002ED8A8;
    v21 = 43;
    if (!isMetaClass)
      v21 = 45;
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@ ID:%d %@", v21, ClassName, Name, 263, v18, v19, self->_sessionUID, self->_sessionID, v20);

  }
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFSharedLogGetLogger(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(self);
    v28 = sel_getName(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession clientName](self, "clientName"));
    v30 = -[_NFSession processIdentifier](self, "processIdentifier");
    v31 = self->_sessionUID;
    sessionID = self->_sessionID;
    if (v5)
      v33 = v5;
    else
      v33 = &stru_1002ED8A8;
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)v41 = v26;
    *(_WORD *)&v41[4] = 2082;
    *(_QWORD *)&v41[6] = v27;
    *(_WORD *)&v41[14] = 2082;
    *(_QWORD *)&v41[16] = v28;
    v42 = 1024;
    v43 = 263;
    v44 = 2114;
    v45 = v29;
    v46 = 1024;
    v47 = v30;
    v48 = 2114;
    v49 = v31;
    v50 = 1024;
    v51 = sessionID;
    v52 = 2112;
    v53 = v33;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@ ID:%d %@", buf, 0x4Cu);

  }
  self->_didStart = 1;
  if (v5)
  {
    self->_didEnd = 1;
    v35 = NFSharedSignpostLog(v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = -[_NFSession signpostId](self, "signpostId");
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v38 = v37;
      if (os_signpost_enabled(v36))
      {
        v39 = self->_sessionUID;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v41 = v39;
        *(_WORD *)&v41[8] = 2112;
        *(_QWORD *)&v41[10] = v5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v38, "Session_Start_End_Time", "_sessionUID=%@ error=%@", buf, 0x16u);
      }
    }

  }
}

- (void)internalEndSession:(id)a3
{
  void (**v5)(_QWORD);
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  _NFSession *v10;
  _BOOL4 didEnd;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  NSString *sessionUID;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  NSString *v47;

  v5 = (void (**)(_QWORD))a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "INTERNAL_END_SESSION", ", buf, 2u);
    }
  }

  v10 = self;
  objc_sync_enter(v10);
  didEnd = v10->_didEnd;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (didEnd)
  {
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v10);
      if (class_isMetaClass(Class))
        v15 = 43;
      else
        v15 = 45;
      ClassName = object_getClassName(v10);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Already ended", v15, ClassName, Name, 278);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(v10);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(v10);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v39 = v22;
      v40 = 2082;
      v41 = v23;
      v42 = 2082;
      v43 = v24;
      v44 = 1024;
      v45 = 278;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (v25)
    {
      v26 = object_getClass(v10);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(v10);
      v29 = sel_getName(a2);
      v25(6, "%c[%{public}s %{public}s]:%i %{public}@", v27, v28, v29, 280, v10->_sessionUID);
    }
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(v10);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      v35 = object_getClassName(v10);
      v36 = sel_getName(a2);
      sessionUID = v10->_sessionUID;
      *(_DWORD *)buf = 67110146;
      v39 = v34;
      v40 = 2082;
      v41 = v35;
      v42 = 2082;
      v43 = v36;
      v44 = 1024;
      v45 = 280;
      v46 = 2114;
      v47 = sessionUID;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v20 = objc_claimAutoreleasedReturnValue(-[_NFSession queue](v10, "queue"));
    -[NSObject dequeueSession:](v20, "dequeueSession:", v10);
  }

  objc_sync_exit(v10);
  if (v5)
    v5[2](v5);

}

- (void)endSession:(id)a3
{
  void (**v5)(_QWORD);
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  _NFSession *v10;
  _BOOL4 didEnd;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  BOOL v26;
  _QWORD block[5];
  void (**v28)(_QWORD);
  SEL v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;

  v5 = (void (**)(_QWORD))a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "END_SESSION", ", buf, 2u);
    }
  }

  v10 = self;
  objc_sync_enter(v10);
  didEnd = v10->_didEnd;
  if (v10->_didEnd)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v10);
      if (class_isMetaClass(Class))
        v15 = 43;
      else
        v15 = 45;
      ClassName = object_getClassName(v10);
      Name = sel_getName(a2);
      Logger(4, "%c[%{public}s %{public}s]:%i Already ended", v15, ClassName, Name, 295);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(v10);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(v10);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v31 = v22;
      v32 = 2082;
      v33 = v23;
      v34 = 2082;
      v35 = v24;
      v36 = 1024;
      v37 = 295;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }

  }
  else
  {
    v10->_isEnding = 1;
    v25 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](v10, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E538;
    block[3] = &unk_1002E5D28;
    block[4] = v10;
    v29 = a2;
    v28 = v5;
    dispatch_async(v25, block);

  }
  objc_sync_exit(v10);

  if (v5)
    v26 = !didEnd;
  else
    v26 = 1;
  if (!v26)
    v5[2](v5);

}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E778;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)activateWithToken:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004EB60;
  v12[3] = &unk_1002E5D50;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

- (void)createHandoffTokenWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, id);
  _NFSession *v6;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSData *v39;
  NSData *token;
  void *v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  NSString *sessionUID;
  NSData *v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  NSString *v65;
  __int16 v66;
  NSData *v67;
  _BYTE __buf[16];
  NSErrorUserInfoKey v69;
  void *v70;
  NSErrorUserInfoKey v71;
  void *v72;

  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_token)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v10 = 43;
      else
        v10 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Token already exists.", v10, ClassName, Name, 335);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(v6);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v57 = v17;
      v58 = 2082;
      v59 = object_getClassName(v6);
      v60 = 2082;
      v61 = sel_getName(a2);
      v62 = 1024;
      v63 = 335;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Token already exists.", buf, 0x22u);
    }

    v18 = objc_alloc((Class)NSError);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v71 = NSLocalizedDescriptionKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v72 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
    v22 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 12, v21);
    v5[2](v5, 0, v22);

  }
  else if (v6->_isSuspended || !v6->_didStart || v6->_didEnd)
  {
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v23);
    if (v24)
    {
      v25 = object_getClass(v6);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(v6);
      v28 = sel_getName(a2);
      v24(3, "%c[%{public}s %{public}s]:%i Session not active", v26, v27, v28, 341);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(v6);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      *(_DWORD *)buf = 67109890;
      v57 = v33;
      v58 = 2082;
      v59 = object_getClassName(v6);
      v60 = 2082;
      v61 = sel_getName(a2);
      v62 = 1024;
      v63 = 341;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

    v34 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v69 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v70 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
    v38 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 54, v37);
    v5[2](v5, 0, v38);

  }
  else
  {
    arc4random_buf(__buf, 0x10uLL);
    v39 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", __buf, 16);
    token = v6->_token;
    v6->_token = v39;

    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v41);
    if (v42)
    {
      v43 = object_getClass(v6);
      if (class_isMetaClass(v43))
        v44 = 43;
      else
        v44 = 45;
      v45 = object_getClassName(v6);
      v46 = sel_getName(a2);
      v42(6, "%c[%{public}s %{public}s]:%i Session %{public}@ created token %{public}@", v44, v45, v46, 349, v6->_sessionUID, v6->_token);
    }
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFSharedLogGetLogger(v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = object_getClass(v6);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      v52 = object_getClassName(v6);
      v53 = sel_getName(a2);
      sessionUID = v6->_sessionUID;
      v55 = v6->_token;
      *(_DWORD *)buf = 67110402;
      v57 = v51;
      v58 = 2082;
      v59 = v52;
      v60 = 2082;
      v61 = v53;
      v62 = 1024;
      v63 = 349;
      v64 = 2114;
      v65 = sessionUID;
      v66 = 2114;
      v67 = v55;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session %{public}@ created token %{public}@", buf, 0x36u);
    }

    ((void (**)(id, NSData *, id))v5)[2](v5, v6->_token, 0);
  }
  objc_sync_exit(v6);

}

- (_NFSessionQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (_NFSessionQueue *)a3;
}

- (NFExpressModeManager)expressModeManager
{
  return (NFExpressModeManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)startOnFieldList
{
  return self->_startOnFieldList;
}

- (void)setStartOnFieldList:(id)a3
{
  objc_storeStrong((id *)&self->_startOnFieldList, a3);
}

- (NSMutableArray)suspendOnFieldList
{
  return self->_suspendOnFieldList;
}

- (void)setSuspendOnFieldList:(id)a3
{
  objc_storeStrong((id *)&self->_suspendOnFieldList, a3);
}

- (NSString)sessionUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)creation
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)dequeueDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)parentToken
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setParentToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)backgroundTagReadCustomECP
{
  return self->_backgroundTagReadCustomECP;
}

- (void)setBackgroundTagReadCustomECP:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTagReadCustomECP, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  self->_workQueue = (OS_dispatch_queue *)a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (unint64_t)backgroundTagReadEcpOption
{
  return self->_backgroundTagReadEcpOption;
}

- (void)setBackgroundTagReadEcpOption:(unint64_t)a3
{
  self->_backgroundTagReadEcpOption = a3;
}

- (unint64_t)fieldHandlingInSuspension
{
  return self->_fieldHandlingInSuspension;
}

- (void)setFieldHandlingInSuspension:(unint64_t)a3
{
  self->_fieldHandlingInSuspension = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (BOOL)priority
{
  return self->_priority;
}

- (void)setPriority:(BOOL)a3
{
  self->_priority = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (BOOL)allowsBackgroundMode
{
  return self->_allowsBackgroundMode;
}

- (BOOL)forceExpressExit
{
  return self->_forceExpressExit;
}

- (void)setForceExpressExit:(BOOL)a3
{
  self->_forceExpressExit = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (int)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(int)a3
{
  self->_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTagReadCustomECP, 0);
  objc_storeStrong((id *)&self->_parentToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_dequeueDate, 0);
  objc_storeStrong((id *)&self->_creation, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_suspendOnFieldList, 0);
  objc_storeStrong((id *)&self->_startOnFieldList, 0);
  objc_storeStrong((id *)&self->_expressModeManager, 0);
}

@end
