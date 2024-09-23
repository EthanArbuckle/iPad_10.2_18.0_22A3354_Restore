@implementation _NFACSession

- (_NFACSession)init
{
  return -[_NFACSession initWithRemoteObject:workQueue:](self, "initWithRemoteObject:workQueue:", 0, 0);
}

- (_NFACSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  _NFACSession *v9;
  _NFACSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  v12.receiver = self;
  v12.super_class = (Class)_NFACSession;
  v9 = -[_NFACSession init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_remoteObject, a3);
    v10->_workQueue = v8;
    v10->_isEnding = 0;
    v10->_driverOpen = 0;
  }

  return v10;
}

- (void)releaseRemoteObject
{
  id remoteObject;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

}

- (BOOL)isEnding
{
  _NFACSession *v2;
  BOOL isEnding;

  v2 = self;
  objc_sync_enter(v2);
  isEnding = v2->_isEnding;
  objc_sync_exit(v2);

  return isEnding;
}

- (BOOL)didEnd
{
  _NFACSession *v2;
  BOOL didEnd;

  v2 = self;
  objc_sync_enter(v2);
  didEnd = v2->_didEnd;
  objc_sync_exit(v2);

  return didEnd;
}

- (id)_powerAssertionIdentifier
{
  __CFString *v3;
  __CFString *v4;
  id v5;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFACSession clientName](self, "clientName"));
  v4 = v3;
  if (!v3 || !-[__CFString length](v3, "length"))
  {

    v4 = CFSTR("unavailable");
  }
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("process:%@,pid:%d,%s,sessionID:%lu"), v4, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), object_getClassName(self), self->_sessionID);

  return v5;
}

- (id)clientName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](self, "connection"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](self, "connection")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_userInfo")),
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClientName"))),
        v5,
        v4,
        !v6))
  {
    v6 = &stru_1002ED8A8;
  }
  return v6;
}

- (BOOL)needsCleanup
{
  _BOOL4 v3;

  v3 = -[_NFACSession didStart](self, "didStart");
  if (v3)
    LOBYTE(v3) = !-[_NFACSession didEnd](self, "didEnd");
  return v3;
}

- (void)cleanup
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
  _NFACSession *v16;
  _BOOL4 driverOpen;
  NFACDriverWrapper *driverWrapper;
  void *v19;
  void *v20;
  void *v21;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 99);
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
    v24 = v15;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 99;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = self;
  objc_sync_enter(v16);
  driverOpen = v16->_driverOpen;
  v16->_driverOpen = 0;
  objc_sync_exit(v16);

  if (driverOpen)
  {
    driverWrapper = v16->_driverWrapper;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession _powerAssertionIdentifier](v16, "_powerAssertionIdentifier"));
    -[NFACDriverWrapper closeSession:](driverWrapper, "closeSession:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession _powerAssertionIdentifier](v16, "_powerAssertionIdentifier"));
  objc_msgSend(v20, "releasePowerAssertion:", v21);

}

- (void)didEndSession:(id)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  _NFACSession *v17;
  void *v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  objc_class *v31;
  NSString *v32;
  uint64_t v33;
  void *v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  _NFACSession *v52;
  const char *Name;
  id v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  unsigned int v66;
  __int16 v67;
  uint64_t v68;

  v54 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 117);
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
    *(_DWORD *)buf = 67109890;
    v56 = v16;
    v57 = 2082;
    v58 = object_getClassName(self);
    v59 = 2082;
    v60 = sel_getName(a2);
    v61 = 1024;
    v62 = 117;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v17 = self;
  objc_sync_enter(v17);
  if (v17->_didEnd)
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v18);
    if (v19)
    {
      v20 = object_getClass(v17);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(v17);
      v23 = sel_getName(a2);
      v19(6, "%c[%{public}s %{public}s]:%i Session already ended", v21, v22, v23, 120);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = object_getClass(v17);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      v29 = object_getClassName(v17);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v56 = v28;
      v57 = 2082;
      v58 = v29;
      v59 = 2082;
      v60 = v30;
      v61 = 1024;
      v62 = 120;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended", buf, 0x22u);
    }

    objc_sync_exit(v17);
  }
  else
  {
    objc_sync_exit(v17);

    v31 = (objc_class *)objc_opt_class(v17);
    v32 = NSStringFromClass(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v34);
    if (v35)
    {
      v36 = object_getClass(v17);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(v17);
      v39 = sel_getName(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession clientName](v17, "clientName"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](v17, "connection"));
      v35(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", v37, v38, v39, 126, v40, objc_msgSend(v41, "processIdentifier"), v33, v54);

    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = object_getClass(v17);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      v47 = object_getClassName(v17);
      v48 = sel_getName(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession clientName](v17, "clientName"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](v17, "connection"));
      v51 = objc_msgSend(v50, "processIdentifier");
      *(_DWORD *)buf = 67110658;
      v56 = v46;
      v57 = 2082;
      v58 = v47;
      v59 = 2082;
      v60 = v48;
      v61 = 1024;
      v62 = 126;
      v63 = 2114;
      v64 = v49;
      v65 = 1024;
      v66 = v51;
      v67 = 2114;
      v68 = v33;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) ended %{public}@", buf, 0x3Cu);

    }
    -[_NFACSession cleanup](v17, "cleanup");
    v52 = v17;
    objc_sync_enter(v52);
    v17->_didEnd = 1;
    objc_sync_exit(v52);

    v17 = (_NFACSession *)v33;
  }

}

- (BOOL)willStartSession
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
  void *v17;
  NFACDriverWrapper *driverWrapper;
  void *v19;
  id v20;
  _NFACSession *v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v35;
  const char *Name;
  const char *v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  id v47;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 136);
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
    v39 = v15;
    v40 = 2082;
    v41 = object_getClassName(self);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 136;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession _powerAssertionIdentifier](self, "_powerAssertionIdentifier"));
  objc_msgSend(v16, "holdPowerAssertion:onBehalfOf:", v17, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));

  driverWrapper = self->_driverWrapper;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession _powerAssertionIdentifier](self, "_powerAssertionIdentifier"));
  v20 = -[NFACDriverWrapper openSession:](driverWrapper, "openSession:", v19);

  if (v20 == (id)1)
  {
    v21 = self;
    objc_sync_enter(v21);
    v21->_driverOpen = 1;
    objc_sync_exit(v21);
  }
  else
  {
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFLogGetLogger(v22);
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(self);
      v26 = class_isMetaClass(v25);
      v35 = object_getClassName(self);
      v37 = sel_getName(a2);
      v27 = 45;
      if (v26)
        v27 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v27, v35, v37, 143, v20);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v21 = (_NFACSession *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v39 = v31;
      v40 = 2082;
      v41 = v32;
      v42 = 2082;
      v43 = v33;
      v44 = 1024;
      v45 = 143;
      v46 = 2048;
      v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, &v21->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }
  }

  return v20 == (id)1;
}

- (void)didStartSession:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  void *v42;

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](self, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ClientName")));

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](self, "connection"));
    v28 = objc_msgSend(v18, "processIdentifier");
    v19 = 43;
    if (!isMetaClass)
      v19 = 45;
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@", v19, ClassName, Name, 158, v10, v28, v7);

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
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](self, "connection"));
    *(_DWORD *)buf = 67110658;
    v30 = v24;
    v31 = 2082;
    v32 = v25;
    v33 = 2082;
    v34 = v26;
    v35 = 1024;
    v36 = 158;
    v37 = 2114;
    v38 = v10;
    v39 = 1024;
    v40 = objc_msgSend(v27, "processIdentifier");
    v41 = 2114;
    v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) started %{public}@", buf, 0x3Cu);

  }
  self->_didStart = 1;

}

- (void)internalEndSession:(id)a3
{
  void (**v5)(_QWORD);
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
  _NFACSession *v18;
  _BOOL4 didEnd;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  const char *Name;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;

  v5 = (void (**)(_QWORD))a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 166);
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
    v47 = v17;
    v48 = 2082;
    v49 = object_getClassName(self);
    v50 = 2082;
    v51 = sel_getName(a2);
    v52 = 1024;
    v53 = 166;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = self;
  objc_sync_enter(v18);
  didEnd = v18->_didEnd;
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (didEnd)
  {
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v20);
    if (v21)
    {
      v22 = object_getClass(v18);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(v18);
      v25 = sel_getName(a2);
      v21(6, "%c[%{public}s %{public}s]:%i Already ended", v23, v24, v25, 169);
    }
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFSharedLogGetLogger(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(v18);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(v18);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v47 = v30;
      v48 = 2082;
      v49 = v31;
      v50 = 2082;
      v51 = v32;
      v52 = 1024;
      v53 = 169;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }
  }
  else
  {
    v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v20);
    if (v33)
    {
      v34 = object_getClass(v18);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(v18);
      v37 = sel_getName(a2);
      v33(6, "%c[%{public}s %{public}s]:%i ", v35, v36, v37, 171);
    }
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFSharedLogGetLogger(v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = object_getClass(v18);
      if (class_isMetaClass(v41))
        v42 = 43;
      else
        v42 = 45;
      v43 = object_getClassName(v18);
      v44 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v47 = v42;
      v48 = 2082;
      v49 = v43;
      v50 = 2082;
      v51 = v44;
      v52 = 1024;
      v53 = 171;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    v28 = objc_claimAutoreleasedReturnValue(-[_NFACSession queue](v18, "queue"));
    -[NSObject dequeueSession:](v28, "dequeueSession:", v18);
  }

  objc_sync_exit(v18);
  if (v5)
    v5[2](v5);

}

- (void)endSession:(id)a3
{
  void (**v5)(_QWORD);
  _NFACSession *v6;
  _BOOL4 didEnd;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  _QWORD block[5];
  void (**v22)(_QWORD);
  SEL v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v5 = (void (**)(_QWORD))a3;
  v6 = self;
  objc_sync_enter(v6);
  didEnd = v6->_didEnd;
  if (v6->_didEnd)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Already ended", v11, ClassName, Name, 182);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(v6);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v25 = v18;
      v26 = 2082;
      v27 = object_getClassName(v6);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 182;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Already ended", buf, 0x22u);
    }

  }
  else
  {
    v6->_isEnding = 1;
    v19 = objc_claimAutoreleasedReturnValue(-[_NFACSession workQueue](v6, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100148D2C;
    block[3] = &unk_1002E5D28;
    block[4] = v6;
    v23 = a2;
    v22 = v5;
    dispatch_async(v19, block);

  }
  objc_sync_exit(v6);

  if (v5)
    v20 = !didEnd;
  else
    v20 = 1;
  if (!v20)
    v5[2](v5);

}

- (_NFSessionQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (_NFSessionQueue *)a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NFACDriverWrapper)driverWrapper
{
  return (NFACDriverWrapper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  self->_workQueue = (OS_dispatch_queue *)a3;
}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 64, 1);
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

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionName, 0);
}

@end
