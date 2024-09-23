@implementation _NFLPEMConfigSession

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

  if ((objc_msgSend(a3, "lpemConfigSessionAccess") & 1) != 0)
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
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring LPEM Config session access", v12, ClassName, Name, 30);
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
    v35 = 30;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring LPEM Config session access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FF930;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 31);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFLPEMConfigSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v6, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject", v6.receiver, v6.super_class));
  objc_msgSend(v5, "didStartSession:", v4);

}

- (void)configureHardwareForLPEMWithCompletion:(id)a3
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
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  v5 = a3;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    sub_10018F3F4((uint64_t)v24, v5);
    goto LABEL_15;
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
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 44, v13);

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
    v31 = v19;
    v32 = 2082;
    v33 = v20;
    v34 = 2082;
    v35 = v21;
    v36 = 1024;
    v37 = 44;
    v38 = 2114;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v5)
  {
    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v28 = NSLocalizedDescriptionKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v29 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 54, v26);
    (*((void (**)(id, id))v5 + 2))(v5, v27);

LABEL_15:
  }

}

- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  void (**v7)(id, id);
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;

  v7 = (void (**)(id, id))a4;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    objc_msgSend(v26, "disableLPEMFeature:completion:", a3, v7);
    goto LABEL_15;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v10(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v16, ClassName, Name, 51, v15);

  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110146;
    v33 = v21;
    v34 = 2082;
    v35 = v22;
    v36 = 2082;
    v37 = v23;
    v38 = 1024;
    v39 = 51;
    v40 = 2114;
    v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v7)
  {
    v25 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v30 = NSLocalizedDescriptionKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v31 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v29 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 54, v28);
    v7[2](v7, v29);

LABEL_15:
  }

}

- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;

  v7 = a4;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    sub_10018ADF4((uint64_t)v26, a3, 1, v7);
    goto LABEL_15;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v10(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v16, ClassName, Name, 59, v15);

  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    *(_DWORD *)buf = 67110146;
    v33 = v21;
    v34 = 2082;
    v35 = v22;
    v36 = 2082;
    v37 = v23;
    v38 = 1024;
    v39 = 59;
    v40 = 2114;
    v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v7)
  {
    v25 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v30 = NSLocalizedDescriptionKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v31 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v29 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 54, v28);
    (*((void (**)(id, id))v7 + 2))(v7, v29);

LABEL_15:
  }

}

- (void)getLPEMFeaturesWithCompletion:(id)a3
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
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  v5 = a3;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    sub_10018BE3C((uint64_t)v24, v5);
    goto LABEL_15;
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
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 66, v13);

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
    v31 = v19;
    v32 = 2082;
    v33 = v20;
    v34 = 2082;
    v35 = v21;
    v36 = 1024;
    v37 = 66;
    v38 = 2114;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v5)
  {
    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v28 = NSLocalizedDescriptionKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v29 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 54, v26);
    (*((void (**)(id, id, _QWORD))v5 + 2))(v5, v27, 0);

LABEL_15:
  }

}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (void)getLPEMBluetoothLog:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void (**v7)(id, id, NSDictionary *);
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSDictionary *v30;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;

  v4 = a3;
  v7 = (void (**)(id, id, NSDictionary *))a4;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v16, ClassName, Name, 79, v15);

    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v34 = v21;
      v35 = 2082;
      v36 = v22;
      v37 = 2082;
      v38 = v23;
      v39 = 1024;
      v40 = 79;
      v41 = 2114;
      v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
    if (v7)
    {
      v25 = objc_alloc((Class)NSError);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v31 = NSLocalizedDescriptionKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
      v32 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v29 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 54, v28);
      v30 = objc_opt_new(NSDictionary);
      v7[2](v7, v29, v30);

    }
  }
  else
  {
    -[_NFLPEMConfigSession getLPEMBluetoothLog:callback:](self, "getLPEMBluetoothLog:callback:", v4, v7);
  }

}

- (void)getLPEMBluetoothLog:(BOOL)a3 callback:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100137408;
  v11[3] = &unk_1002E8A90;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v14 = a3;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (BOOL)_dumpLPEMAppletLogs
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *v9;
  _BOOL4 v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  NSMutableDictionary *v54;
  NSString *v55;
  void *v56;
  NSObject *v57;
  BOOL v58;
  id v59;
  NSString *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unsigned __int8 v68;
  void *v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  void *v83;
  uint64_t v84;
  void (*v85)(uint64_t, const char *, ...);
  objc_class *v86;
  _BOOL4 v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void (*v101)(uint64_t, const char *, ...);
  objc_class *v102;
  _BOOL4 v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  objc_class *v109;
  int v110;
  const char *v111;
  const char *v112;
  _UNKNOWN **v113;
  void *v114;
  uint64_t v115;
  void (*v116)(uint64_t, const char *, ...);
  objc_class *v117;
  _BOOL4 v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  objc_class *v124;
  int v125;
  const char *v126;
  const char *v127;
  void *v128;
  uint64_t v129;
  void (*v130)(uint64_t, const char *, ...);
  objc_class *v131;
  _BOOL4 v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  objc_class *v137;
  int v138;
  const char *v139;
  const char *v140;
  id v141;
  void *v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  NSObject *v146;
  const char *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *Name;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  NSObject *v159;
  NSObject *v160;
  void *v161;
  id v162;
  uint8_t buf[4];
  int v164;
  __int16 v165;
  const char *v166;
  __int16 v167;
  const char *v168;
  __int16 v169;
  int v170;
  __int16 v171;
  NSObject *v172;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", ", buf, 2u);
  }

  if (byte_10032A9F9 != 1)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "setRoutingConfig:", v22));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    v28 = (void (*)(uint64_t, const char *, ...))Logger;
    if (v25)
    {
      if (Logger)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v32 = 45;
        if (isMetaClass)
          v32 = 43;
        v28(6, "%c[%{public}s %{public}s]:%i Failed to set routing to retrieve LPEM logs", v32, ClassName, Name, 205);
      }
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFSharedLogGetLogger(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = object_getClass(self);
        if (class_isMetaClass(v36))
          v37 = 43;
        else
          v37 = 45;
        v38 = object_getClassName(self);
        v39 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v164 = v37;
        v165 = 2082;
        v166 = v38;
        v167 = 2082;
        v168 = v39;
        v169 = 1024;
        v170 = 205;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to set routing to retrieve LPEM logs", buf, 0x22u);
      }

      v41 = NFSharedSignpostLog(v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", ", buf, 2u);
      }
      v23 = 0;
      goto LABEL_111;
    }
    if (Logger)
    {
      v43 = object_getClass(self);
      v44 = class_isMetaClass(v43);
      v45 = object_getClassName(self);
      v153 = sel_getName(a2);
      v46 = 45;
      if (v44)
        v46 = 43;
      v28(6, "%c[%{public}s %{public}s]:%i reading logs from applet", v46, v45, v153, 210);
    }
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFSharedLogGetLogger(v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v164 = v51;
      v165 = 2082;
      v166 = v52;
      v167 = 2082;
      v168 = v53;
      v169 = 1024;
      v170 = 210;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i reading logs from applet", buf, 0x22u);
    }

    v54 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "secureElementWrapper"));
    v162 = 0;
    v55 = sub_1000993E4(v54, 4, &v162);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = v162;
    v42 = v57;
    if (v56)
      v58 = 1;
    else
      v58 = v57 == 0;
    v23 = !v58;

    if (!v23)
    {
      v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v84 = NFLogGetLogger(v83);
      if (v84)
      {
        v85 = (void (*)(uint64_t, const char *, ...))v84;
        v86 = object_getClass(self);
        v87 = class_isMetaClass(v86);
        v88 = object_getClassName(self);
        v155 = sel_getName(a2);
        v89 = 45;
        if (v87)
          v89 = 43;
        v148 = v88;
        v25 = 0;
        v85(6, "%c[%{public}s %{public}s]:%i Failed to log Applet LPEM Log", v89, v148, v155, 216);
      }
      v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v91 = NFSharedLogGetLogger(v90);
      v92 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        v93 = object_getClass(self);
        if (class_isMetaClass(v93))
          v94 = 43;
        else
          v94 = 45;
        v95 = object_getClassName(self);
        v96 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v164 = v94;
        v165 = 2082;
        v166 = v95;
        v167 = 2082;
        v168 = v96;
        v169 = 1024;
        v170 = 216;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to log Applet LPEM Log", buf, 0x22u);
      }

      v98 = NFSharedSignpostLog(v97);
      v62 = objc_claimAutoreleasedReturnValue(v98);
      if (os_signpost_enabled(v62))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", ", buf, 2u);
      }
      goto LABEL_110;
    }
    v59 = objc_alloc((Class)NSString);
    v60 = NSHomeDirectory();
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v62 = objc_msgSend(v59, "initWithFormat:", CFSTR("%@%@"), v61, CFSTR("/Library/Logs/nfcd_lpem.bin"));

    if (!v62)
    {
      v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v100 = NFLogGetLogger(v99);
      if (v100)
      {
        v101 = (void (*)(uint64_t, const char *, ...))v100;
        v102 = object_getClass(self);
        v103 = class_isMetaClass(v102);
        v104 = object_getClassName(self);
        v156 = sel_getName(a2);
        v58 = !v103;
        v62 = 0;
        v105 = 45;
        if (!v58)
          v105 = 43;
        v149 = v104;
        v25 = 0;
        v101(3, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log: File URL is nil", v105, v149, v156, 249);
      }
      v106 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v107 = NFSharedLogGetLogger(v106);
      v108 = objc_claimAutoreleasedReturnValue(v107);
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v109 = object_getClass(self);
        if (class_isMetaClass(v109))
          v110 = 43;
        else
          v110 = 45;
        v111 = object_getClassName(self);
        v112 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v164 = v110;
        v165 = 2082;
        v166 = v111;
        v167 = 2082;
        v168 = v112;
        v169 = 1024;
        v170 = 249;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log: File URL is nil", buf, 0x22u);
      }
      v113 = &AMFDRSealingMapCopyLocalData_ptr;
      goto LABEL_105;
    }
    v159 = v62;
    v63 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:"));
    v64 = NFBootUUID();
    v161 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v160 = v63;
    if (v63)
    {
      v65 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v63, v65) & 1) != 0)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v63, "objectForKeyedSubscript:", CFSTR("bootuuid")));
        if (v66 && (v67 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v66, v67) & 1) != 0))
        {
          v68 = objc_msgSend(v66, "isEqual:", v161);

          if ((v68 & 1) != 0)
          {
            v69 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v70 = NFLogGetLogger(v69);
            if (v70)
            {
              v71 = (void (*)(uint64_t, const char *, ...))v70;
              v72 = object_getClass(self);
              v73 = class_isMetaClass(v72);
              v74 = object_getClassName(self);
              v154 = sel_getName(a2);
              v75 = 45;
              if (v73)
                v75 = 43;
              v71(6, "%c[%{public}s %{public}s]:%i File already present from this boot. Not erasing.", v75, v74, v154, 246);
            }
            v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v77 = NFSharedLogGetLogger(v76);
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v79 = object_getClass(self);
              if (class_isMetaClass(v79))
                v80 = 43;
              else
                v80 = 45;
              v81 = object_getClassName(self);
              v82 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v164 = v80;
              v165 = 2082;
              v166 = v81;
              v167 = 2082;
              v168 = v82;
              v169 = 1024;
              v170 = 246;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i File already present from this boot. Not erasing.", buf, 0x22u);
            }
            v62 = v159;
LABEL_104:
            v113 = &AMFDRSealingMapCopyLocalData_ptr;
            v108 = v160;

            v25 = 0;
LABEL_105:

            v141 = objc_msgSend(objc_alloc((Class)v113[235]), "initWithBytes:length:", &unk_10026A4C2, 10);
            v142 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v42, "objectForKey:", v141));

            if (v142)
            {
              v144 = objc_msgSend(objc_alloc((Class)v113[235]), "initWithBytes:length:", &unk_10026A4C2, 10);
              PLLogRegisteredEvent(47, objc_msgSend(v144, "NF_asHexString"), v142, 0);

            }
            v145 = NFSharedSignpostLog(v143);
            v146 = objc_claimAutoreleasedReturnValue(v145);
            if (os_signpost_enabled(v146))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v146, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", ", buf, 2u);
            }

LABEL_110:
LABEL_111:

            goto LABEL_112;
          }
        }
        else
        {

        }
      }
    }
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFLogGetLogger(v114);
    if (v115)
    {
      v116 = (void (*)(uint64_t, const char *, ...))v115;
      v117 = object_getClass(self);
      v118 = class_isMetaClass(v117);
      v119 = object_getClassName(self);
      v157 = sel_getName(a2);
      v120 = 45;
      if (v118)
        v120 = 43;
      v116(6, "%c[%{public}s %{public}s]:%i Cached boot UUID does not match current boot UUID or file does not exist, updating ..", v120, v119, v157, 235);
    }
    v121 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v122 = NFSharedLogGetLogger(v121);
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      v124 = object_getClass(self);
      if (class_isMetaClass(v124))
        v125 = 43;
      else
        v125 = 45;
      v126 = object_getClassName(self);
      v127 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v164 = v125;
      v165 = 2082;
      v166 = v126;
      v167 = 2082;
      v168 = v127;
      v169 = 1024;
      v170 = 235;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cached boot UUID does not match current boot UUID or file does not exist, updating ..", buf, 0x22u);
    }

    v78 = -[NSObject mutableCopy](v42, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v161, CFSTR("bootuuid"));
    v62 = v159;
    if ((-[NSObject writeToFile:atomically:](v78, "writeToFile:atomically:", v159, 0) & 1) != 0)
    {
      byte_10032A9F9 = 1;
    }
    else
    {
      v128 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v129 = NFLogGetLogger(v128);
      if (v129)
      {
        v130 = (void (*)(uint64_t, const char *, ...))v129;
        v131 = object_getClass(self);
        v132 = class_isMetaClass(v131);
        v150 = object_getClassName(self);
        v158 = sel_getName(a2);
        v58 = !v132;
        v62 = v159;
        v133 = 45;
        if (!v58)
          v133 = 43;
        v130(3, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log to %{public}@", v133, v150, v158, 241, v159);
      }
      v134 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v135 = NFSharedLogGetLogger(v134);
      v136 = objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
      {
        v137 = object_getClass(self);
        if (class_isMetaClass(v137))
          v138 = 43;
        else
          v138 = 45;
        v139 = object_getClassName(self);
        v140 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v164 = v138;
        v165 = 2082;
        v166 = v139;
        v167 = 2082;
        v168 = v140;
        v169 = 1024;
        v170 = 241;
        v171 = 2114;
        v172 = v62;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to dump LPEM log to %{public}@", buf, 0x2Cu);
      }

    }
    goto LABEL_104;
  }
  v6 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = NFLogGetLogger(v6);
  if (v7)
  {
    v8 = (void (*)(uint64_t, const char *, ...))v7;
    v9 = object_getClass(self);
    v10 = class_isMetaClass(v9);
    v11 = object_getClassName(self);
    v151 = sel_getName(a2);
    v12 = 45;
    if (v10)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i Applet LPEM Log already retrieved", v12, v11, v151, 194);
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
    v164 = v17;
    v165 = 2082;
    v166 = v18;
    v167 = 2082;
    v168 = v19;
    v169 = 1024;
    v170 = 194;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet LPEM Log already retrieved", buf, 0x22u);
  }

  v21 = NFSharedSignpostLog(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DUMP_LPEM_LOGS", ", buf, 2u);
  }
  v23 = 1;
LABEL_112:

  return v23;
}

- (NFDriverWrapper)driverWrapper
{
  return self->_driverWrapper;
}

- (void)setDriverWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_driverWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end
