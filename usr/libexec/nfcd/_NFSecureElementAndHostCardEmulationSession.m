@implementation _NFSecureElementAndHostCardEmulationSession

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
  if (objc_msgSend(v5, "seSessionAccess") && (objc_msgSend(v5, "hceAccess") & 1) != 0)
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
      v9(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v13, ClassName, Name, 30);
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
      v36 = 30;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v28[0] = v21;
    v28[1] = &off_1002FE1A8;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v28[2] = v22;
    v27[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 31);
    v28[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    v6 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v24);

  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithHCE](NFRoutingConfig, "embeddedWiredModeWithHCE");
}

- (void)didStartSession:(id)a3
{
  void *v4;
  NFSecureElementWrapper *v5;
  NFSecureElementWrapper *embeddedSecureElementWrapper;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  -[_NFHCESession didStartSession:](&v7, "didStartSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v5 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secureElementWrapper"));
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v5;

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementAndHostCardEmulationSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  if (objc_msgSend(v7, "isEqualToString:", v5))
  {

LABEL_4:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementAndHostCardEmulationSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementAndHostCardEmulationSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
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

- (void)startEmulationWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  objc_super v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = kdebug_trace(724566220, 0, 0, 0, 0);
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", ", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  v9 = -[_NFSession workQueue](&v15, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E1E0;
  block[3] = &unk_1002E5D28;
  v13 = v5;
  v14 = a2;
  block[4] = self;
  v11 = v5;
  dispatch_async(v10, block);

}

- (void)stopEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E88C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)transceive:(id)a3 forSEID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  v12 = -[_NFSession workQueue](&v22, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EF14;
  block[3] = &unk_1002E6240;
  v20 = v11;
  v21 = a2;
  block[4] = self;
  v18 = v10;
  v19 = v9;
  v14 = v9;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return self->_embeddedSecureElementWrapper;
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, 0);
}

@end
