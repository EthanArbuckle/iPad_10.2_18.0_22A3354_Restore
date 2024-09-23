@implementation _NFUnifiedAccessSession

- (_NFUnifiedAccessSession)initWithRemoteObject:(id)a3 expressModeManager:(id)a4 driverWrapper:(id)a5 workQueue:(id)a6
{
  id v7;
  id v12;
  void *specific;
  id v14;
  id v15;
  id v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  id v21;
  id v22;
  const char *ClassName;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  char *v31;
  const char *v33;
  const char *Name;
  objc_super v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;

  v7 = a5;
  v12 = a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = a6;
  v15 = a4;
  v16 = a3;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    v21 = v7;
    v22 = v12;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v24 = 45;
    if (isMetaClass)
      v24 = 43;
    v33 = ClassName;
    v12 = v22;
    v7 = v21;
    v18(6, "%c[%{public}s %{public}s]:%i ", v24, v33, Name, 34);
  }
  v25 = a2;
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
    v37 = v30;
    v38 = 2082;
    v39 = object_getClassName(self);
    v40 = 2082;
    v41 = sel_getName(v25);
    v42 = 1024;
    v43 = 34;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v35.receiver = self;
  v35.super_class = (Class)_NFUnifiedAccessSession;
  v31 = -[_NFContactlessPaymentSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:hostCardEmulationSupport:](&v35, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:hostCardEmulationSupport:", v16, v14, v15, 0, 1);

  if (v31)
    objc_storeStrong((id *)(v31 + 363), v7);

  return (_NFUnifiedAccessSession *)v31;
}

- (BOOL)allowTransactionsInWiredMode
{
  return 1;
}

- (BOOL)willStartSession
{
  NFStepUpController *v3;
  void *v4;
  NFDriverWrapper *v5;
  void *v6;
  objc_super v8;

  v3 = [NFStepUpController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v5 = -[NFStepUpController initWithQueue:driverWrapper:](v3, "initWithQueue:driverWrapper:", v4, *(_QWORD *)(&self->super._transactionState + 1));
  v6 = *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3);
  *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3) = v5;

  v8.receiver = self;
  v8.super_class = (Class)_NFUnifiedAccessSession;
  return -[_NFContactlessSession willStartSession](&v8, "willStartSession");
}

- (void)startSTSNotificationListenerEndpoint:(id)a3
{
  id v5;
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
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;

  v5 = a3;
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
      v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 58, v13);

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
      v25 = v19;
      v26 = 2082;
      v27 = v20;
      v28 = 2082;
      v29 = v21;
      v30 = 1024;
      v31 = 58;
      v32 = 2114;
      v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
  }
  else
  {
    v23 = objc_msgSend(*(id *)((char *)&self->_driverWrapper + 3), "connectToNotificationListener:", v5);
  }

}

- (void)handleHostCardReaderDetected:(id)a3
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
  NSObject *v18;
  id v19;
  const char *Name;
  _QWORD block[5];
  id v22;
  SEL v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 80);
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
    v25 = v17;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 80;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F7154;
  block[3] = &unk_1002E5C80;
  block[4] = self;
  v22 = v5;
  v23 = a2;
  v19 = v5;
  dispatch_async(v18, block);

}

- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5
{
  objc_msgSend(*(id *)((char *)&self->_driverWrapper + 3), "handleStepUpEvent:transactionType:forApplet:", a3, *(_QWORD *)&a4, a5);
}

+ (id)validateEntitlements:(id)a3
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
  id v18;
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
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  const char *Name;
  const char *v41;
  _QWORD v42[4];
  _QWORD v43[4];
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v5 = a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 118);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(a1);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v45 = v17;
    v46 = 2082;
    v47 = object_getClassName(a1);
    v48 = 2082;
    v49 = sel_getName(a2);
    v50 = 1024;
    v51 = 118;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (objc_msgSend(v5, "seSessionAccess") && (objc_msgSend(v5, "hceAccess") & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFLogGetLogger(v19);
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(a1);
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(a1);
      v41 = sel_getName(a2);
      v25 = 45;
      if (v23)
        v25 = 43;
      v21(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v25, v24, v41, 120);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(a1);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(a1);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v45 = v30;
      v46 = 2082;
      v47 = v31;
      v48 = 2082;
      v49 = v32;
      v50 = 1024;
      v51 = 120;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    v33 = objc_alloc((Class)NSError);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v42[0] = NSLocalizedDescriptionKey;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v43[0] = v35;
    v43[1] = &off_100302F48;
    v42[1] = CFSTR("Line");
    v42[2] = CFSTR("Method");
    v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v43[2] = v36;
    v42[3] = NSDebugDescriptionErrorKey;
    v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 121);
    v43[3] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
    v18 = objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 32, v38);

  }
  return v18;
}

- (void)cleanup
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  v3 = NFSharedSignpostLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFUnifiedAccessSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup"))
    -[_NFUnifiedAccessSession _invalidateStepupController](self, "_invalidateStepupController");
  v8.receiver = self;
  v8.super_class = (Class)_NFUnifiedAccessSession;
  v5 = -[_NFContactlessPaymentSession cleanup](&v8, "cleanup");
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFUnifiedAccessSession", buf, 2u);
  }

}

- (BOOL)suspendWithInfo:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFUnifiedAccessSession;
  v4 = -[_NFContactlessPaymentSession suspendWithInfo:](&v6, "suspendWithInfo:", a3);
  if (v4 && -[_NFSession needsCleanup](self, "needsCleanup"))
    -[_NFUnifiedAccessSession _invalidateStepupController](self, "_invalidateStepupController");
  return v4;
}

- (void)_invalidateStepupController
{
  void *v3;

  objc_msgSend(*(id *)((char *)&self->_driverWrapper + 3), "invalidate");
  v3 = *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3);
  *(NFDriverWrapper **)((char *)&self->_driverWrapper + 3) = 0;

}

- (void)endSession:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_NFUnifiedAccessSession _invalidateStepupController](self, "_invalidateStepupController");
  v5.receiver = self;
  v5.super_class = (Class)_NFUnifiedAccessSession;
  -[_NFXPCSession endSession:](&v5, "endSession:", v4);

}

- (void)didStartSession:(id)a3
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
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
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
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  const char *Name;
  const char *v49;
  const char *v50;
  objc_super v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  id v61;

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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 164);
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
    v53 = v17;
    v54 = 2082;
    v55 = object_getClassName(self);
    v56 = 2082;
    v57 = sel_getName(a2);
    v58 = 1024;
    v59 = 164;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v51.receiver = self;
  v51.super_class = (Class)_NFUnifiedAccessSession;
  -[_NFContactlessPaymentSession didStartSession:](&v51, "didStartSession:", v5);
  if (v5)
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFLogGetLogger(v18);
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v46 = object_getClassName(self);
      v49 = sel_getName(a2);
      v23 = 45;
      if (v22)
        v23 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v23, v46, v49, 167, v5);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v53 = v28;
      v54 = 2082;
      v55 = v29;
      v56 = 2082;
      v57 = v30;
      v58 = 1024;
      v59 = 167;
      v60 = 2114;
      v61 = v5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v31, "didStartSession:", v5);
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_driverWrapper + 3), "startISO18013WithConnectionHandoverConfiguration"));
    if (v31)
    {
      v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v33 = NFLogGetLogger(v32);
      if (v33)
      {
        v34 = (void (*)(uint64_t, const char *, ...))v33;
        v35 = object_getClass(self);
        v36 = class_isMetaClass(v35);
        v47 = object_getClassName(self);
        v50 = sel_getName(a2);
        v37 = 45;
        if (v36)
          v37 = 43;
        v34(3, "%c[%{public}s %{public}s]:%i Reader start error: %{public}@", v37, v47, v50, 173, v31);
      }
      v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v39 = NFSharedLogGetLogger(v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v53 = v42;
        v54 = 2082;
        v55 = v43;
        v56 = 2082;
        v57 = v44;
        v58 = 1024;
        v59 = 173;
        v60 = 2114;
        v61 = v31;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader start error: %{public}@", buf, 0x2Cu);
      }

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v45, "didStartSession:", v31);

  }
}

- (void)waitForSafeTransactionCompletion
{
  objc_super v3;

  if (-[_NFContactlessPaymentSession dontWaitForEOT](self, "dontWaitForEOT"))
  {
    usleep(0x2710u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)_NFUnifiedAccessSession;
    -[_NFContactlessPaymentSession waitForSafeTransactionCompletion](&v3, "waitForSafeTransactionCompletion");
  }
}

- (NFDriverWrapper)driverWrapper
{
  return *(NFDriverWrapper **)(&self->super._transactionState + 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_storeStrong((id *)(&self->super._transactionState + 1), a3);
}

- (NFStepUpController)stepUpController
{
  return *(NFStepUpController **)((char *)&self->_driverWrapper + 3);
}

- (void)setStepUpController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), 0);
  objc_storeStrong((id *)(&self->super._transactionState + 1), 0);
}

@end
