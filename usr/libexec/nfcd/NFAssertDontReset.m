@implementation NFAssertDontReset

- (BOOL)isEntitled:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_whitelistChecker"));
  v4 = objc_msgSend(v3, "dontResetAssertion");

  return v4;
}

- (BOOL)isSupported
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controllerInfo"));
  if (objc_msgSend(v3, "siliconName") == (id)14)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controllerInfo"));
    if (objc_msgSend(v5, "siliconName") == (id)15)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controllerInfo"));
      if (objc_msgSend(v6, "siliconName") == (id)16)
      {
        v4 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controllerInfo"));
        v4 = objc_msgSend(v7, "siliconName") == (id)17;

      }
    }

  }
  return v4;
}

- (void)onAssertWithCompletion:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  void *v21;
  id v22;
  void *specific;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *ClassName;
  const char *v36;
  const char *Name;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;

  v5 = (void (**)(id, void *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  v8 = sub_10016F13C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "driverWrapper"));
    v22 = sub_1002028D4((uint64_t)v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v9)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v25 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v28 = 45;
        if (isMetaClass)
          v28 = 43;
        v25(3, "%c[%{public}s %{public}s]:%i Failed to set don't reset flag: %{public}@", v28, ClassName, Name, 47, v9);
      }
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFSharedLogGetLogger(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        *(_DWORD *)buf = 67110146;
        v39 = v33;
        v40 = 2082;
        v41 = object_getClassName(self);
        v42 = 2082;
        v43 = sel_getName(a2);
        v44 = 1024;
        v45 = 47;
        v46 = 2114;
        v47 = v9;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set don't reset flag: %{public}@", buf, 0x2Cu);
      }

    }
    goto LABEL_24;
  }
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFLogGetLogger(v10);
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(self);
    v14 = class_isMetaClass(v13);
    v34 = object_getClassName(self);
    v36 = sel_getName(a2);
    v15 = 45;
    if (v14)
      v15 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", v15, v34, v36, 38, v9);
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    *(_DWORD *)buf = 67110146;
    v39 = v20;
    v40 = 2082;
    v41 = object_getClassName(self);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 38;
    v46 = 2114;
    v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", buf, 0x2Cu);
  }

  if (v5)
LABEL_24:
    v5[2](v5, v9);

}

- (void)onDeassertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "driverWrapper"));
  v6 = sub_1002028D4((uint64_t)v5, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  sub_10016FD04(v4, v7);

  if (v8)
    v8[2](v8, 0);

}

@end
