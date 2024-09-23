@implementation _NFSecureElementLoggingSession

+ (id)validateEntitlements:(id)a3
{
  id v5;
  id v6;
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
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  const char *Name;
  _QWORD v27[4];
  _QWORD v28[4];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v5 = a3;
  if ((objc_msgSend(v5, "seSessionAccess") & 1) != 0
    || (objc_msgSend(v5, "seLoggingSessionAccess") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", v13, ClassName, Name, 29);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v30 = v18;
      v31 = 2082;
      v32 = object_getClassName(a1);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 29;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v28[0] = v21;
    v28[1] = &off_100302DB0;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v28[2] = v22;
    v27[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 30);
    v28[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    v6 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v24);

  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 1);
}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  NFSecureElementWrapper *v6;
  NFSecureElementWrapper *embeddedSecureElementWrapper;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NFSecureElementLoggingSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v9, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager", v9.receiver, v9.super_class));
  v6 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secureElementWrapper"));
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v8, "didStartSession:", v4);

}

- (id)_getSecureElementWrapperForSEID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementLoggingSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  if (objc_msgSend(v7, "isEqualToString:", v5))
  {

LABEL_4:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementLoggingSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementLoggingSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "systemOSSerialNumber"));
  v10 = objc_msgSend(v9, "isEqualToString:", v5);

  if (v10)
    goto LABEL_4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v14(3, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", v17, ClassName, Name, 55, v5);
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67110146;
    v27 = v22;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 55;
    v34 = 2114;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", buf, 0x2Cu);
  }

  v11 = 0;
LABEL_15:

  return v11;
}

- (void)getLogs:(unsigned __int8)a3 forSEID:(id)a4 completion:(id)a5
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
  unsigned __int8 v19;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementLoggingSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001ED9A0;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  block[4] = self;
  v16 = v9;
  v19 = a3;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)clearLogs:(unsigned __int8)a3 forSEID:(id)a4 completion:(id)a5
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
  unsigned __int8 v19;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementLoggingSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EDF44;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  block[4] = self;
  v16 = v9;
  v19 = a3;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)getACLogWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementLoggingSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EE4A8;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)enableSMBLogging:(BOOL)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFSecureElementLoggingSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001EE944;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)getSMBLogWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementLoggingSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EF120;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)getAndClearAssertionLogsWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NFSecureElementLoggingSession;
  v5 = -[_NFSession workQueue](&v10, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001EF9B0;
  v8[3] = &unk_1002E6380;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 168, 1);
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end
