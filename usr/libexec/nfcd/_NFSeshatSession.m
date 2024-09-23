@implementation _NFSeshatSession

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

  if ((objc_msgSend(a3, "seshatAccess") & 1) != 0)
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
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring seshat access", v12, ClassName, Name, 33);
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
    v35 = 33;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring seshat access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_100303398;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 34);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
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
  v9.super_class = (Class)_NFSeshatSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v9, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager", v9.receiver, v9.super_class));
  v6 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secureElementWrapper"));
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v8, "didStartSession:", v4);

}

- (void)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  SEL v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  objc_super v23;

  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_NFSeshatSession;
  v13 = -[_NFSession workQueue](&v23, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100210F5C;
  block[3] = &unk_1002EBC00;
  v19 = v12;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  block[4] = self;
  v18 = v11;
  v15 = v11;
  v16 = v12;
  dispatch_async(v14, block);

}

- (void)derive:(unsigned __int8)a3 userHash:(id)a4 completion:(id)a5
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
  v20.super_class = (Class)_NFSeshatSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211950;
  block[3] = &unk_1002E6EC8;
  v19 = a3;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a2;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, block);

}

- (void)resetCounter:(unsigned __int8)a3 userToken:(id)a4 completion:(id)a5
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
  v20.super_class = (Class)_NFSeshatSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212324;
  block[3] = &unk_1002E6EC8;
  v19 = a3;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a2;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, block);

}

- (void)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  SEL v20;
  BOOL v21;
  unsigned __int8 v22;
  objc_super v23;

  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_NFSeshatSession;
  v13 = -[_NFSession workQueue](&v23, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212CE0;
  block[3] = &unk_1002EBC00;
  v21 = a3;
  v22 = a4;
  block[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = a2;
  v15 = v12;
  v16 = v11;
  dispatch_async(v14, block);

}

- (void)deleteSlot:(unsigned __int8)a3 completion:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  unsigned __int8 v14;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NFSeshatSession;
  v8 = -[_NFSession workQueue](&v15, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002136A4;
  v11[3] = &unk_1002E7E90;
  v12 = v7;
  v13 = a2;
  v14 = a3;
  v11[4] = self;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)getDataWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSeshatSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213FB4;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)getHashWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSeshatSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002148E0;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 completion:(id)a5
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
  v20.super_class = (Class)_NFSeshatSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215214;
  block[3] = &unk_1002E6EC8;
  v19 = a3;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a2;
  v13 = v10;
  v14 = v9;
  dispatch_async(v12, block);

}

- (void)obliterateWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSeshatSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215B90;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)maybeTTR:(unsigned int)a3 appletResult:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  BOOL v8;
  int v9;
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
  id v22;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (a3)
    v8 = a3 == 24;
  else
    v8 = 1;
  v9 = !v8;
  if (a4 == 36864 || a4 == 26277)
    v9 = 0;
  if (!(a3 | a4))
    v9 = 1;
  if (v9)
  {
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
      v12(6, "%c[%{public}s %{public}s]:%i Invoking TTR for %d 0x%x", v16, ClassName, Name, 526, v5, v4);
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
      *(_DWORD *)buf = 67110402;
      v25 = v21;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 526;
      v32 = 1024;
      v33 = v5;
      v34 = 1024;
      v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking TTR for %d 0x%x", buf, 0x2Eu);
    }

    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Result: %d Applet Result: %d"), v5, v4);
    sub_100187C44((uint64_t)NFBugCapture, CFSTR("Seshat Failure!"), v22, 0);
    +[NFExceptionsCALogger postAnalyticsSEFailureEvent:context:error:](NFExceptionsCALogger, "postAnalyticsSEFailureEvent:context:error:", 11, v22, 0);

  }
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
