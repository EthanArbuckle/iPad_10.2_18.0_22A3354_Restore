@implementation _NFFieldDetectSession

- (_NFFieldDetectSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  _NFFieldDetectSession *v4;
  _NFFieldDetectSession *v5;
  _NFFieldDetectSession *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NFFieldDetectSession;
  v4 = -[_NFXPCSession initWithRemoteObject:workQueue:](&v8, "initWithRemoteObject:workQueue:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_notificationConfig = 1;
    v4->_notificationCategories = -1;
    v6 = v4;
  }

  return v5;
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

  if ((objc_msgSend(a3, "cardModeAccess") & 1) != 0)
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
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v12, ClassName, Name, 30);
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
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FD8D8;
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

- (void)handleFieldNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[_NFFieldDetectSession notificationConfig](self, "notificationConfig") & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v4, "didDetectField:", 1);

  }
  if ((-[_NFFieldDetectSession notificationConfig](self, "notificationConfig") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v5, "didDetectFieldNotification:", v6);

  }
}

- (void)handleFilteredFieldNotification:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[_NFFieldDetectSession unfiltered](self, "unfiltered");
  v5 = v9;
  if (v4)
  {
    if ((-[_NFFieldDetectSession notificationConfig](self, "notificationConfig") & 2) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v6, "didDetectField:", 1);

    }
    v7 = -[_NFFieldDetectSession notificationConfig](self, "notificationConfig");
    v5 = v9;
    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
      objc_msgSend(v8, "didDetectFieldNotification:", v9);

      v5 = v9;
    }
  }

}

- (BOOL)skipAppLaunch
{
  return (LOBYTE(self->_notificationConfig) >> 2) & 1;
}

- (BOOL)requireSuppressDefaultAppPresentmentAssertion
{
  return (LOBYTE(self->_notificationConfig) >> 3) & 1;
}

- (void)didStartSession:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFFieldDetectSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v6, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject", v6.receiver, v6.super_class));
  objc_msgSend(v5, "didStartSession:", v4);

}

- (BOOL)isFeatureSupported:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NFFieldDetectSession;
  return -[_NFSession isFeatureSupported:](&v4, "isFeatureSupported:", a3);
}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (!a3 || (-[_NFFieldDetectSession notificationConfig](self, "notificationConfig") & 2) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v5, "didDetectField:", v3);

  }
}

- (BOOL)unfiltered
{
  return self->_unfiltered;
}

- (void)setUnfiltered:(BOOL)a3
{
  self->_unfiltered = a3;
}

- (unint64_t)notificationConfig
{
  return self->_notificationConfig;
}

- (void)setNotificationConfig:(unint64_t)a3
{
  self->_notificationConfig = a3;
}

- (unint64_t)notificationCategories
{
  return self->_notificationCategories;
}

- (void)setNotificationCategories:(unint64_t)a3
{
  self->_notificationCategories = a3;
}

@end
