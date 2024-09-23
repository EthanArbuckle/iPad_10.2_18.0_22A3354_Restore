@implementation NFAssertPowerUp

- (BOOL)isEntitled:(id)a3
{
  return 1;
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
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *ClassName;
  const char *Name;
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

  v5 = (void (**)(id, void *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  v8 = sub_10016F13C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

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
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", v15, ClassName, Name, 34, v9);
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
      v24 = v20;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 34;
      v31 = 2114;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", buf, 0x2Cu);
    }

  }
  v5[2](v5, v9);

}

- (void)onDeassertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  sub_10016FD04(v4, v5);

  if (v6)
    v6[2](v6, 0);

}

@end
