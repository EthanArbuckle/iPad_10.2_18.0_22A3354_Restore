@implementation _NFContactlessSession

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
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v12, ClassName, Name, 42);
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
    v35 = 42;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FE8F8;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 43);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 1);
}

- (BOOL)willStartSession
{
  objc_super v4;

  sub_10019D630((uint64_t)self->_powerConsumptionReporter);
  sub_10023B69C((uint64_t)NFSecureElementWrapper);
  v4.receiver = self;
  v4.super_class = (Class)_NFContactlessSession;
  return -[_NFSession willStartSession](&v4, "willStartSession");
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
  NFSecureElementWrapper *v19;
  NFSecureElementWrapper *secureElementWrapper;
  id v21;
  void *v22;
  const char *Name;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 67);
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
    v26 = v17;
    v27 = 2082;
    v28 = object_getClassName(self);
    v29 = 2082;
    v30 = sel_getName(a2);
    v31 = 1024;
    v32 = 67;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFContactlessSession;
  -[_NFSession didStartSession:](&v24, "didStartSession:", v5);
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v19 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secureElementWrapper"));
    secureElementWrapper = self->_secureElementWrapper;
    self->_secureElementWrapper = v19;

    v21 = -[_NFContactlessSession preloadApplets](self, "preloadApplets");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v22, "didStartSession:", v5);

}

- (void)_internalCleanup
{
  id v4;
  id v5;
  NFApplet *activeSecondaryApplet;
  NSSet *activeSecondaryKeyIdentifiers;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  NFApplet *activeApplet;
  void *v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  NFApplet *v42;

  if (!-[_NFSession isSuspended](self, "isSuspended"))
  {
    if (self->_activeKeyIdentifiers && self->_activeApplet)
      v4 = -[_NFContactlessSession _resetVolatileConfigOnApplet:](self, "_resetVolatileConfigOnApplet:");
    if (self->_activeSecondaryKeyIdentifiers && self->_activeSecondaryApplet)
    {
      v5 = -[_NFContactlessSession _resetVolatileConfigOnApplet:](self, "_resetVolatileConfigOnApplet:");
      activeSecondaryApplet = self->_activeSecondaryApplet;
      self->_activeSecondaryApplet = 0;

      activeSecondaryKeyIdentifiers = self->_activeSecondaryKeyIdentifiers;
      self->_activeSecondaryKeyIdentifiers = 0;

    }
    if (self->_activeApplet)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](self->_activeApplet, "identifier"));
        v12 = sub_100043748((uint64_t)v10, v11);

        if ((v12 & 1) == 0)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v15 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v20 = 45;
            if (isMetaClass)
              v20 = 43;
            v15(6, "%c[%{public}s %{public}s]:%i Deselecting applet %{public}@", v20, ClassName, Name, 97, self->_activeApplet);
          }
          v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v22 = NFSharedLogGetLogger(v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = object_getClass(self);
            if (class_isMetaClass(v24))
              v25 = 43;
            else
              v25 = 45;
            v26 = object_getClassName(self);
            v27 = sel_getName(a2);
            activeApplet = self->_activeApplet;
            *(_DWORD *)buf = 67110146;
            v34 = v25;
            v35 = 2082;
            v36 = v26;
            v37 = 2082;
            v38 = v27;
            v39 = 1024;
            v40 = 97;
            v41 = 2114;
            v42 = activeApplet;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting applet %{public}@", buf, 0x2Cu);
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
          sub_100043E98((uint64_t)v29, 1);

          v30 = -[_NFContactlessSession setActiveApplet:](self, "setActiveApplet:", 0);
          v31 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
          if (v31)
          {
            v32 = v31[2];
            if (v32)
              *(_BYTE *)(v32 + 220) = 0;
          }

        }
      }
    }
    sub_10019CC08((uint64_t)self->_powerConsumptionReporter);
  }
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
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
  const char *v18;
  const char *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  const char *Name;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup"))
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
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 110);
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
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 2082;
      v30 = v19;
      v31 = 1024;
      v32 = 110;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    -[_NFContactlessSession _internalCleanup](self, "_internalCleanup");
  }
  v24.receiver = self;
  v24.super_class = (Class)_NFContactlessSession;
  v20 = -[_NFSession cleanup](&v24, "cleanup");
  v21 = NFSharedSignpostLog(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessSession", buf, 2u);
  }

}

- (BOOL)suspendWithInfo:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessSession;
  v4 = -[_NFXPCSession suspendWithInfo:](&v6, "suspendWithInfo:", a3);
  if (v4)
    -[_NFContactlessSession _internalCleanup](self, "_internalCleanup");
  return v4;
}

- (NFApplet)activeApplet
{
  return self->_activeApplet;
}

- (NSArray)activeAppletGroupMembers
{
  return self->_activeGroupMembers;
}

- (NSArray)applets
{
  return self->_applets;
}

- (BOOL)useFilteredApplets
{
  return 0;
}

- (BOOL)canEnableExpress
{
  NFApplet *activeApplet;
  NFApplet *v4;
  NFApplet *v5;
  BOOL v6;

  activeApplet = self->_activeApplet;
  if (activeApplet)
    v4 = activeApplet;
  else
    v4 = (NFApplet *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));
  v5 = v4;
  v6 = -[_NFContactlessSession _expressModeRequiredForApplet:keySet:](self, "_expressModeRequiredForApplet:keySet:", v4, self->_activeKeyIdentifiers);

  return v6;
}

- (BOOL)_expressModeRequiredForApplet:(id)a3 keySet:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  NSSet *activeKeyIdentifiers;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
    if (!v8)
    {
      v11 = 0;
      LOBYTE(v9) = 0;
LABEL_11:

      goto LABEL_12;
    }
    if (*(_QWORD *)(v8 + 136) == 1)
    {

LABEL_7:
      activeKeyIdentifiers = self->_activeKeyIdentifiers;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      if (activeKeyIdentifiers)
        v13 = sub_100043870((uint64_t)v11, v12, v7);
      else
        v13 = sub_100043748((uint64_t)v11, v12);
      LOBYTE(v9) = v13;

      goto LABEL_11;
    }
    v9 = *(unsigned __int8 *)(v8 + 170);

    if (v9)
      goto LABEL_7;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_12:

  return v9;
}

- (void)_setActiveSecureElementWrapper:(id)a3
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
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v5 = a3;
  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));

    if (v6 != v5)
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
        v9(6, "%c[%{public}s %{public}s]:%i switching to eSE", v13, ClassName, Name, 176);
      }
      v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = object_getClass(self);
        if (class_isMetaClass(v17))
          v18 = 43;
        else
          v18 = 45;
        *(_DWORD *)buf = 67109890;
        v21 = v18;
        v22 = 2082;
        v23 = object_getClassName(self);
        v24 = 2082;
        v25 = sel_getName(a2);
        v26 = 1024;
        v27 = 176;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i switching to eSE", buf, 0x22u);
      }

      -[_NFContactlessSession setSecureElementWrapper:](self, "setSecureElementWrapper:", v5);
    }
  }

}

- (id)_getSecureElementWrapperForApplet:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *appletMap;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  id v39;
  const char *ClassName;
  const char *Name;
  uint64_t v43;
  _NFContactlessSession *v44;
  const char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  void *v66;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v66 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));

  if (v5)
  {
    appletMap = self->_appletMap;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](appletMap, "objectForKey:", v9));

  }
  else
  {
    v10 = 0;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = v7;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    v44 = self;
    v45 = a2;
    v43 = *(_QWORD *)v51;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v15);
        if (v10)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v15), "serialNumber"));
          if (objc_msgSend(v10, "isEqualToString:", v17))
          {

LABEL_37:
            v39 = v16;
LABEL_34:
            v34 = v11;
            goto LABEL_35;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "systemOSSerialNumber"));
          v19 = objc_msgSend(v10, "isEqualToString:", v18);

          if (v19)
            goto LABEL_37;
        }
        if (!v5)
          goto LABEL_37;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v20 = sub_10022B938(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v47 != v24)
                objc_enumerationMutation(v21);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), "isEqualToApplet:", v5) & 1) != 0)
              {
                v39 = v16;

                goto LABEL_34;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
            if (v23)
              continue;
            break;
          }
        }

        v15 = (char *)v15 + 1;
        self = v44;
        a2 = v45;
        v14 = v43;
      }
      while (v15 != v13);
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      if (v13)
        continue;
      break;
    }
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v28 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v31 = 45;
    if (isMetaClass)
      v31 = 43;
    v28(3, "%c[%{public}s %{public}s]:%i No secure element wrapper found for applet %{public}@", v31, ClassName, Name, 206, v5);
  }
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFSharedLogGetLogger(v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    v37 = object_getClassName(self);
    v38 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v55 = v36;
    v56 = 2082;
    v57 = v37;
    v58 = 2082;
    v59 = v38;
    v60 = 1024;
    v61 = 206;
    v62 = 2114;
    v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No secure element wrapper found for applet %{public}@", buf, 0x2Cu);
  }
  v39 = 0;
LABEL_35:

  return v39;
}

- (void)switchToSecureElementWrapperForApplet:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getSecureElementWrapperForApplet:](self, "_getSecureElementWrapperForApplet:", a3));
  -[_NFContactlessSession _setActiveSecureElementWrapper:](self, "_setActiveSecureElementWrapper:", v4);

}

- (id)seidForApplet:(id)a3
{
  NSMutableDictionary *appletMap;
  void *v4;
  void *v5;

  appletMap = self->_appletMap;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](appletMap, "objectForKey:", v4));

  return v5;
}

- (id)_activateKeys:(BOOL)a3 forIdentifiers:(id)a4 onApplet:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  id v40;
  void *v41;
  void *v42;
  const char *Name;
  const char *v45;
  NSErrorUserInfoKey v46;
  void *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", v17, ClassName, Name, 223, v10, v9);
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67110402;
    v49 = v22;
    v50 = 2082;
    v51 = object_getClassName(self);
    v52 = 2082;
    v53 = sel_getName(a2);
    v54 = 1024;
    v55 = 223;
    v56 = 2114;
    v57 = v10;
    v58 = 2114;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", buf, 0x36u);
  }

  if (v10 && objc_msgSend(v10, "containsSubKeys"))
  {
    -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:", v10);
    if (-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v24 = sub_1002350C0(v23, v6, v9, v10);
      v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    }
    else
    {
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFLogGetLogger(v26);
      if (v27)
      {
        v28 = (void (*)(uint64_t, const char *, ...))v27;
        v29 = object_getClass(self);
        v30 = class_isMetaClass(v29);
        v31 = object_getClassName(self);
        v45 = sel_getName(a2);
        v32 = 45;
        if (v30)
          v32 = 43;
        v28(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", v32, v31, v45, 234);
      }
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFSharedLogGetLogger(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = object_getClass(self);
        if (class_isMetaClass(v36))
          v37 = 43;
        else
          v37 = 45;
        v38 = object_getClassName(self);
        v39 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v49 = v37;
        v50 = 2082;
        v51 = v38;
        v52 = 2082;
        v53 = v39;
        v54 = 1024;
        v55 = 234;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", buf, 0x22u);
      }

      v40 = objc_alloc((Class)NSError);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v46 = NSLocalizedDescriptionKey;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v47 = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      v25 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v23, 15, v42);

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_activateKeys:(BOOL)a3 aidsAndKeys:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  const char *ClassName;
  const char *Name;
  const char *v44;
  _QWORD v45[4];
  _QWORD v46[4];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  id v56;

  v4 = a3;
  v7 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i aidsAndKeys: %{public}@", v13, ClassName, Name, 246, v7);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67110146;
    v48 = v18;
    v49 = 2082;
    v50 = object_getClassName(self);
    v51 = 2082;
    v52 = sel_getName(a2);
    v53 = 1024;
    v54 = 246;
    v55 = 2114;
    v56 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i aidsAndKeys: %{public}@", buf, 0x2Cu);
  }

  if (-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
    v20 = sub_100235BE4(v19, v4, v7);
    v21 = (id)objc_claimAutoreleasedReturnValue(v20);
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
      v27 = object_getClassName(self);
      v44 = sel_getName(a2);
      v28 = 45;
      if (v26)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", v28, v27, v44, 250);
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
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v48 = v33;
      v49 = 2082;
      v50 = v34;
      v51 = 2082;
      v52 = v35;
      v53 = 1024;
      v54 = 250;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode to eSE", buf, 0x22u);
    }

    v36 = objc_alloc((Class)NSError);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v45[0] = NSLocalizedDescriptionKey;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v46[0] = v37;
    v46[1] = &off_1002FE910;
    v45[1] = CFSTR("Line");
    v45[2] = CFSTR("Method");
    v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v46[2] = v38;
    v45[3] = NSDebugDescriptionErrorKey;
    v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 251);
    v46[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4));
    v21 = objc_msgSend(v36, "initWithDomain:code:userInfo:", v19, 15, v40);

  }
  return v21;
}

- (id)_resetVolatileConfigOnApplet:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  const char *ClassName;
  const char *Name;
  const char *v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;

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
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i applet: %{public}@", v11, ClassName, Name, 262, v5);
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
    *(_DWORD *)buf = 67110146;
    v46 = v16;
    v47 = 2082;
    v48 = object_getClassName(self);
    v49 = 2082;
    v50 = sel_getName(a2);
    v51 = 1024;
    v52 = 262;
    v53 = 2114;
    v54 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@", buf, 0x2Cu);
  }

  if (v5 && objc_msgSend(v5, "containsSubKeys"))
  {
    -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:", v5);
    if (-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v18 = sub_1002369DC(v17, v5);
      v19 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFLogGetLogger(v20);
      if (v21)
      {
        v22 = (void (*)(uint64_t, const char *, ...))v21;
        v23 = object_getClass(self);
        v24 = class_isMetaClass(v23);
        v25 = object_getClassName(self);
        v42 = sel_getName(a2);
        v26 = 45;
        if (v24)
          v26 = 43;
        v22(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode eSE", v26, v25, v42, 273);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(self);
        v33 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v46 = v31;
        v47 = 2082;
        v48 = v32;
        v49 = 2082;
        v50 = v33;
        v51 = 1024;
        v52 = 273;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode eSE", buf, 0x22u);
      }

      v34 = objc_alloc((Class)NSError);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v43[0] = NSLocalizedDescriptionKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v44[0] = v35;
      v44[1] = &off_1002FE928;
      v43[1] = CFSTR("Line");
      v43[2] = CFSTR("Method");
      v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v44[2] = v36;
      v43[3] = NSDebugDescriptionErrorKey;
      v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 274);
      v44[3] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 4));
      v19 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v17, 15, v38);

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)setActiveKeys:(id)a3 onApplet:(id)a4 allowBackgroundTransactions:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v9;
  unint64_t v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  id v23;
  NSSet *activeKeyIdentifiers;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  id v38;
  NSSet *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSSet *v43;
  const char *v45;
  const char *Name;
  const char *v47;
  NSErrorUserInfoKey v48;
  void *v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;

  v5 = a5;
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", v17, ClassName, Name, 284, v10, v9);
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67110402;
    v51 = v22;
    v52 = 2082;
    v53 = object_getClassName(self);
    v54 = 2082;
    v55 = sel_getName(a2);
    v56 = 1024;
    v57 = 284;
    v58 = 2114;
    v59 = v10;
    v60 = 2114;
    v61 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet: %{public}@  keyIdentifiers: %{public}@", buf, 0x36u);
  }

  if (self->_activeApplet && self->_activeKeyIdentifiers)
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _activateKeys:forIdentifiers:onApplet:](self, "_activateKeys:forIdentifiers:onApplet:", 0));
    if (v23)
      goto LABEL_34;
    activeKeyIdentifiers = self->_activeKeyIdentifiers;
    self->_activeKeyIdentifiers = 0;

  }
  if (v9 | v10)
  {
    if (v9 && !v10)
    {
      v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v26 = NFLogGetLogger(v25);
      if (v26)
      {
        v27 = (void (*)(uint64_t, const char *, ...))v26;
        v28 = object_getClass(self);
        v29 = class_isMetaClass(v28);
        v45 = object_getClassName(self);
        v47 = sel_getName(a2);
        v30 = 45;
        if (v29)
          v30 = 43;
        v27(3, "%c[%{public}s %{public}s]:%i An applet is needed to activate keys %{public}@", v30, v45, v47, 316, v9);
      }
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFSharedLogGetLogger(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = object_getClass(self);
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v51 = v35;
        v52 = 2082;
        v53 = v36;
        v54 = 2082;
        v55 = v37;
        v56 = 1024;
        v57 = 316;
        v58 = 2114;
        v59 = v9;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i An applet is needed to activate keys %{public}@", buf, 0x2Cu);
      }

      v38 = objc_alloc((Class)NSError);
      v39 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v48 = NSLocalizedDescriptionKey;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v49 = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      v23 = objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 10, v41);

      goto LABEL_33;
    }
    if (v9)
      v42 = 1;
    else
      v42 = v5;
    v23 = (id)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _activateKeys:forIdentifiers:onApplet:](self, "_activateKeys:forIdentifiers:onApplet:", v42, v9, v10));
    if (!v23)
    {
      v43 = (NSSet *)(id)v9;
      v39 = self->_activeKeyIdentifiers;
      self->_activeKeyIdentifiers = v43;
LABEL_33:

    }
  }
  else
  {
    v23 = 0;
  }
LABEL_34:

  return v23;
}

- (id)setActiveKeys:(id)a3 allowBackgroundTransactions:(BOOL)a4
{
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  NSSet *activeKeyIdentifiers;
  NSSet *activeSecondaryKeyIdentifiers;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void (*v73)(uint64_t, const char *, ...);
  objc_class *v74;
  _BOOL4 v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSSet *v93;
  NSSet *v94;
  void *v95;
  uint64_t v96;
  void (*v97)(uint64_t, const char *, ...);
  objc_class *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  objc_class *v102;
  int v103;
  const char *v104;
  const char *v105;
  const char *ClassName;
  const char *v108;
  const char *Name;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  _BOOL4 v115;
  const char *v116;
  _QWORD v117[4];
  _QWORD v118[4];
  _QWORD v119[4];
  _QWORD v120[4];
  uint8_t buf[4];
  int v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  int v128;
  __int16 v129;
  id v130;

  v6 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i keyIdentifiers: %{public}@", v12, ClassName, Name, 332, v6);
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
    *(_DWORD *)buf = 67110146;
    v122 = v17;
    v123 = 2082;
    v124 = object_getClassName(self);
    v125 = 2082;
    v126 = sel_getName(a2);
    v127 = 1024;
    v128 = 332;
    v129 = 2114;
    v130 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i keyIdentifiers: %{public}@", buf, 0x2Cu);
  }

  if (self->_activeApplet && self->_activeKeyIdentifiers)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _activateKeys:forIdentifiers:onApplet:](self, "_activateKeys:forIdentifiers:onApplet:", 0));
    if (v18)
    {
      v19 = (id)v18;
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFLogGetLogger(v20);
      if (v21)
      {
        v22 = (void (*)(uint64_t, const char *, ...))v21;
        v23 = object_getClass(self);
        v24 = class_isMetaClass(v23);
        v25 = object_getClassName(self);
        v110 = sel_getName(a2);
        v26 = 45;
        if (v24)
          v26 = 43;
        v22(3, "%c[%{public}s %{public}s]:%i Unable to deactivate keys on avtiveApplet", v26, v25, v110, 343);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(self);
        v33 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v122 = v31;
        v123 = 2082;
        v124 = v32;
        v125 = 2082;
        v126 = v33;
        v127 = 1024;
        v128 = 343;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to deactivate keys on avtiveApplet", buf, 0x22u);
      }
      goto LABEL_72;
    }
    activeKeyIdentifiers = self->_activeKeyIdentifiers;
    self->_activeKeyIdentifiers = 0;

    activeSecondaryKeyIdentifiers = self->_activeSecondaryKeyIdentifiers;
    self->_activeSecondaryKeyIdentifiers = 0;

  }
  if (v6)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", 0));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v29));
    if (v37)
    {
      v38 = objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _activateKeys:aidsAndKeys:](self, "_activateKeys:aidsAndKeys:", 1, v6));
      if (v38)
      {
        v19 = (id)v38;
        v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v40 = NFLogGetLogger(v39);
        if (v40)
        {
          v41 = (void (*)(uint64_t, const char *, ...))v40;
          v42 = object_getClass(self);
          v43 = class_isMetaClass(v42);
          v108 = object_getClassName(self);
          v111 = sel_getName(a2);
          v44 = 45;
          if (v43)
            v44 = 43;
          v41(3, "%c[%{public}s %{public}s]:%i Unable to activate Keys : error = %@", v44, v108, v111, 381, v19);
        }
        v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v46 = NFSharedLogGetLogger(v45);
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = object_getClass(self);
          if (class_isMetaClass(v48))
            v49 = 43;
          else
            v49 = 45;
          v50 = object_getClassName(self);
          v51 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v122 = v49;
          v123 = 2082;
          v124 = v50;
          v125 = 2082;
          v126 = v51;
          v127 = 1024;
          v128 = 381;
          v129 = 2112;
          v130 = v19;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to activate Keys : error = %@", buf, 0x2Cu);
        }
      }
      else
      {
        v47 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v37));
        objc_storeStrong((id *)&self->_activeKeyIdentifiers, v47);
        if ((unint64_t)objc_msgSend(v6, "count") >= 2)
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndex:", 1));

          if (v91)
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v91));
            if (v92)
            {
              v93 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v92));
              v94 = self->_activeSecondaryKeyIdentifiers;
              self->_activeSecondaryKeyIdentifiers = v93;
            }
            else
            {
              v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v96 = NFLogGetLogger(v95);
              if (v96)
              {
                v97 = (void (*)(uint64_t, const char *, ...))v96;
                v98 = object_getClass(self);
                v115 = class_isMetaClass(v98);
                v116 = object_getClassName(self);
                v114 = sel_getName(a2);
                v99 = 45;
                if (v115)
                  v99 = 43;
                v97(6, "%c[%{public}s %{public}s]:%i Invalid secondaryKeyIdentifier. Not setting", v99, v116, v114, 376);
              }
              v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v101 = NFSharedLogGetLogger(v100);
              v94 = (NSSet *)objc_claimAutoreleasedReturnValue(v101);
              if (os_log_type_enabled(&v94->super, OS_LOG_TYPE_DEFAULT))
              {
                v102 = object_getClass(self);
                if (class_isMetaClass(v102))
                  v103 = 43;
                else
                  v103 = 45;
                v104 = object_getClassName(self);
                v105 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                v122 = v103;
                v123 = 2082;
                v124 = v104;
                v125 = 2082;
                v126 = v105;
                v127 = 1024;
                v128 = 376;
                _os_log_impl((void *)&_mh_execute_header, &v94->super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid secondaryKeyIdentifier. Not setting", buf, 0x22u);
              }
            }

          }
        }
        v19 = 0;
      }
    }
    else
    {
      v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v72 = NFLogGetLogger(v71);
      if (v72)
      {
        v73 = (void (*)(uint64_t, const char *, ...))v72;
        v74 = object_getClass(self);
        v75 = class_isMetaClass(v74);
        v76 = object_getClassName(self);
        v113 = sel_getName(a2);
        v77 = 45;
        if (v75)
          v77 = 43;
        v73(3, "%c[%{public}s %{public}s]:%i Invaid primaryKeyIdentifier", v77, v76, v113, 357);
      }
      v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v79 = NFSharedLogGetLogger(v78);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = object_getClass(self);
        if (class_isMetaClass(v81))
          v82 = 43;
        else
          v82 = 45;
        v83 = object_getClassName(self);
        v84 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v122 = v82;
        v123 = 2082;
        v124 = v83;
        v125 = 2082;
        v126 = v84;
        v127 = 1024;
        v128 = 357;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invaid primaryKeyIdentifier", buf, 0x22u);
      }

      v85 = objc_alloc((Class)NSError);
      v47 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v117[0] = NSLocalizedDescriptionKey;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v118[0] = v86;
      v118[1] = &off_1002FE958;
      v117[1] = CFSTR("Line");
      v117[2] = CFSTR("Method");
      v87 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v118[2] = v87;
      v117[3] = NSDebugDescriptionErrorKey;
      v88 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 359);
      v118[3] = v88;
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v118, v117, 4));
      v19 = objc_msgSend(v85, "initWithDomain:code:userInfo:", v47, 10, v89);

    }
  }
  else
  {
    v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v53 = NFLogGetLogger(v52);
    if (v53)
    {
      v54 = (void (*)(uint64_t, const char *, ...))v53;
      v55 = object_getClass(self);
      v56 = class_isMetaClass(v55);
      v57 = object_getClassName(self);
      v112 = sel_getName(a2);
      v58 = 45;
      if (v56)
        v58 = 43;
      v54(3, "%c[%{public}s %{public}s]:%i No applets or keyIdentifiers ", v58, v57, v112, 349);
    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v122 = v63;
      v123 = 2082;
      v124 = v64;
      v125 = 2082;
      v126 = v65;
      v127 = 1024;
      v128 = 349;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No applets or keyIdentifiers ", buf, 0x22u);
    }

    v66 = objc_alloc((Class)NSError);
    v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v119[0] = NSLocalizedDescriptionKey;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v120[0] = v67;
    v120[1] = &off_1002FE940;
    v119[1] = CFSTR("Line");
    v119[2] = CFSTR("Method");
    v68 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v120[2] = v68;
    v119[3] = NSDebugDescriptionErrorKey;
    v69 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 350);
    v120[3] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v120, v119, 4));
    v19 = objc_msgSend(v66, "initWithDomain:code:userInfo:", v29, 10, v70);

  }
LABEL_72:

  return v19;
}

- (id)setActiveApplet:(id)a3
{
  NFApplet *v6;
  void *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  NFApplet *activeApplet;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  NFApplet *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NFApplet *v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  _BOOL4 v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  objc_class *v77;
  int v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  void **v87;
  NSErrorUserInfoKey *v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  const char *v100;
  const char *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  NFApplet *v106;
  void *v107;
  uint64_t v108;
  void (*v109)(uint64_t, const char *, ...);
  objc_class *v110;
  _BOOL4 v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  NSObject *v115;
  objc_class *v116;
  int v117;
  const char *v118;
  const char *v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  void (*v124)(uint64_t, const char *, ...);
  objc_class *v125;
  _BOOL4 v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  NSObject *v131;
  objc_class *v132;
  int v133;
  const char *v134;
  const char *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v143;
  id v144;
  NFApplet *v145;
  void *v146;
  uint64_t v147;
  void (*v148)(uint64_t, const char *, ...);
  objc_class *v149;
  _BOOL4 v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  objc_class *v155;
  int v156;
  const char *v157;
  const char *v158;
  NFApplet *v159;
  NSArray *activeGroupMembers;
  void *v161;
  uint64_t v162;
  void (*v163)(uint64_t, const char *, ...);
  objc_class *v164;
  _BOOL4 v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  NSObject *v170;
  objc_class *v171;
  int v172;
  const char *v173;
  const char *v174;
  void *v175;
  NSArray *v176;
  NSArray *v177;
  const char *v178;
  const char *v179;
  const char *v180;
  const char *v181;
  const char *v182;
  const char *v183;
  const char *v184;
  const char *Name;
  const char *v186;
  const char *v187;
  const char *v188;
  const char *v189;
  const char *v190;
  _QWORD v191[3];
  _QWORD v192[3];
  uint8_t buf[4];
  int v194;
  __int16 v195;
  const char *v196;
  __int16 v197;
  const char *v198;
  __int16 v199;
  int v200;
  __int16 v201;
  NFApplet *v202;
  __int16 v203;
  NFApplet *v204;
  NSErrorUserInfoKey v205;
  void *v206;
  NSErrorUserInfoKey v207;
  void *v208;
  NSErrorUserInfoKey v209;
  void *v210;

  v6 = (NFApplet *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v10 = (void (*)(uint64_t, const char *, ...))Logger;
  if (!v7)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v73 = 45;
      if (isMetaClass)
        v73 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i EMM is nil", v73, ClassName, Name, 390);
    }
    v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v75 = NFSharedLogGetLogger(v74);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v77 = object_getClass(self);
      if (class_isMetaClass(v77))
        v78 = 43;
      else
        v78 = 45;
      *(_DWORD *)buf = 67109890;
      v194 = v78;
      v195 = 2082;
      v196 = object_getClassName(self);
      v197 = 2082;
      v198 = sel_getName(a2);
      v199 = 1024;
      v200 = 390;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil", buf, 0x22u);
    }

    v79 = objc_alloc((Class)NSError);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v209 = NSLocalizedDescriptionKey;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v210 = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1));
    v83 = v79;
    v84 = v80;
    v85 = 12;
    goto LABEL_96;
  }
  if (Logger)
  {
    v11 = object_getClass(self);
    v12 = class_isMetaClass(v11);
    v178 = object_getClassName(self);
    v183 = sel_getName(a2);
    v13 = 45;
    if (v12)
      v13 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, v178, v183, 394, v6);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67110146;
    v194 = v18;
    v195 = 2082;
    v196 = object_getClassName(self);
    v197 = 2082;
    v198 = sel_getName(a2);
    v199 = 1024;
    v200 = 394;
    v201 = 2114;
    v202 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (!v6 || !-[NFApplet isEqualToApplet:](self->_activeApplet, "isEqualToApplet:", v6))
  {
    if (self->_activeApplet)
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFLogGetLogger(v19);
      if (v20)
      {
        v21 = (void (*)(uint64_t, const char *, ...))v20;
        v22 = object_getClass(self);
        v23 = class_isMetaClass(v22);
        v24 = object_getClassName(self);
        v25 = sel_getName(a2);
        v26 = 45;
        if (v23)
          v26 = 43;
        v21(6, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", v26, v24, v25, 401, self->_activeApplet);
      }
      v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v28 = NFSharedLogGetLogger(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        v32 = object_getClassName(self);
        v33 = sel_getName(a2);
        activeApplet = self->_activeApplet;
        *(_DWORD *)buf = 67110146;
        v194 = v31;
        v195 = 2082;
        v196 = v32;
        v197 = 2082;
        v198 = v33;
        v199 = 1024;
        v200 = 401;
        v201 = 2114;
        v202 = activeApplet;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", buf, 0x2Cu);
      }

      if (!-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
      {
        v86 = objc_alloc((Class)NSError);
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v207 = NSLocalizedDescriptionKey;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
        v208 = v81;
        v87 = &v208;
        v88 = &v207;
LABEL_95:
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v88, 1));
        v83 = v86;
        v84 = v80;
        v85 = 15;
LABEL_96:
        v56 = (NFApplet *)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, v85, v82);

        goto LABEL_97;
      }
      if (self->_activeKeyIdentifiers)
      {
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFLogGetLogger(v35);
        if (v36)
        {
          v37 = (void (*)(uint64_t, const char *, ...))v36;
          v38 = object_getClass(self);
          v39 = class_isMetaClass(v38);
          v40 = object_getClassName(self);
          v41 = sel_getName(a2);
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](self->_activeApplet, "identifier"));
          v43 = 45;
          if (v39)
            v43 = 43;
          v37(6, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", v43, v40, v41, 408, v42);

        }
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFSharedLogGetLogger(v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = object_getClass(self);
          if (class_isMetaClass(v47))
            v48 = 43;
          else
            v48 = 45;
          v49 = object_getClassName(self);
          v50 = sel_getName(a2);
          v51 = (NFApplet *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](self->_activeApplet, "identifier"));
          *(_DWORD *)buf = 67110146;
          v194 = v48;
          v195 = 2082;
          v196 = v49;
          v197 = 2082;
          v198 = v50;
          v199 = 1024;
          v200 = 408;
          v201 = 2114;
          v202 = v51;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", buf, 0x2Cu);

        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v53 = sub_1002369DC(v52, self->_activeApplet);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v55 = sub_10022DE7C(v54);
      v56 = (NFApplet *)objc_claimAutoreleasedReturnValue(v55);

      if (v56)
      {
        v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v58 = NFLogGetLogger(v57);
        if (v58)
        {
          v59 = (void (*)(uint64_t, const char *, ...))v58;
          v60 = object_getClass(self);
          v61 = class_isMetaClass(v60);
          v179 = object_getClassName(self);
          v184 = sel_getName(a2);
          v62 = 45;
          if (v61)
            v62 = 43;
          v59(3, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", v62, v179, v184, 415, v56);
        }
        v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v64 = NFSharedLogGetLogger(v63);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = object_getClass(self);
          if (class_isMetaClass(v66))
            v67 = 43;
          else
            v67 = 45;
          v68 = object_getClassName(self);
          v69 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v194 = v67;
          v195 = 2082;
          v196 = v68;
          v197 = 2082;
          v198 = v69;
          v199 = 1024;
          v200 = 415;
          v201 = 2114;
          v202 = v56;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", buf, 0x2Cu);
        }

        goto LABEL_97;
      }
      if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
      {
        v143 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v144 = sub_100239BA4(v143, 0, self->_activeApplet);
        v145 = (NFApplet *)objc_claimAutoreleasedReturnValue(v144);

        if (v145)
        {
          v146 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v147 = NFLogGetLogger(v146);
          if (v147)
          {
            v148 = (void (*)(uint64_t, const char *, ...))v147;
            v149 = object_getClass(self);
            v150 = class_isMetaClass(v149);
            v182 = object_getClassName(self);
            v189 = sel_getName(a2);
            v151 = 45;
            if (v150)
              v151 = 43;
            v148(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v151, v182, v189, 422, v145);
          }
          v152 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v153 = NFSharedLogGetLogger(v152);
          v154 = objc_claimAutoreleasedReturnValue(v153);
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            v155 = object_getClass(self);
            if (class_isMetaClass(v155))
              v156 = 43;
            else
              v156 = 45;
            v157 = object_getClassName(self);
            v158 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v194 = v156;
            v195 = 2082;
            v196 = v157;
            v197 = 2082;
            v198 = v158;
            v199 = 1024;
            v200 = 422;
            v201 = 2114;
            v202 = v145;
            _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
          }

        }
      }
      else
      {
        v145 = 0;
      }
      v159 = self->_activeApplet;
      self->_activeApplet = 0;

      activeGroupMembers = self->_activeGroupMembers;
      self->_activeGroupMembers = 0;

      if (!v6)
        goto LABEL_112;
    }
    else
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      if (!v6)
      {
LABEL_112:
        v161 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v162 = NFLogGetLogger(v161);
        if (v162)
        {
          v163 = (void (*)(uint64_t, const char *, ...))v162;
          v164 = object_getClass(self);
          v165 = class_isMetaClass(v164);
          v166 = object_getClassName(self);
          v190 = sel_getName(a2);
          v167 = 45;
          if (v165)
            v167 = 43;
          v163(6, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", v167, v166, v190, 434);
        }
        v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v169 = NFSharedLogGetLogger(v168);
        v170 = objc_claimAutoreleasedReturnValue(v169);
        if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
        {
          v171 = object_getClass(self);
          if (class_isMetaClass(v171))
            v172 = 43;
          else
            v172 = 45;
          v173 = object_getClassName(self);
          v174 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v194 = v172;
          v195 = 2082;
          v196 = v173;
          v197 = 2082;
          v198 = v174;
          v199 = 1024;
          v200 = 434;
          _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", buf, 0x22u);
        }

        v175 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        sub_1000487B0((uint64_t)v175, 0);

        v56 = 0;
        self->_activeAppletEmulationType = 0;
        goto LABEL_97;
      }
    }
  }
  if (self->_activeApplet)
  {
LABEL_58:
    v56 = 0;
    self->_activeAppletEmulationType = -[_NFContactlessSession _getActiveAppletEmulationType:](self, "_getActiveAppletEmulationType:");
    goto LABEL_97;
  }
  v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v90 = NFLogGetLogger(v89);
  if (v90)
  {
    v91 = (void (*)(uint64_t, const char *, ...))v90;
    v92 = object_getClass(self);
    v93 = class_isMetaClass(v92);
    v180 = object_getClassName(self);
    v186 = sel_getName(a2);
    v94 = 45;
    if (v93)
      v94 = 43;
    v91(6, "%c[%{public}s %{public}s]:%i Activating %{public}@", v94, v180, v186, 440, v6);
  }
  v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v96 = NFSharedLogGetLogger(v95);
  v97 = objc_claimAutoreleasedReturnValue(v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    v98 = object_getClass(self);
    if (class_isMetaClass(v98))
      v99 = 43;
    else
      v99 = 45;
    v100 = object_getClassName(self);
    v101 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v194 = v99;
    v195 = 2082;
    v196 = v100;
    v197 = 2082;
    v198 = v101;
    v199 = 1024;
    v200 = 440;
    v201 = 2114;
    v202 = v6;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Activating %{public}@", buf, 0x2Cu);
  }

  -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:", v6);
  if (!-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
  {
    v86 = objc_alloc((Class)NSError);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v205 = NSLocalizedDescriptionKey;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v206 = v81;
    v87 = &v206;
    v88 = &v205;
    goto LABEL_95;
  }
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v103 = sub_10022DE7C(v102);

  if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
    v105 = sub_100239BA4(v104, 1, v6);
    v106 = (NFApplet *)objc_claimAutoreleasedReturnValue(v105);

    if (v106)
    {
      v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v108 = NFLogGetLogger(v107);
      if (v108)
      {
        v109 = (void (*)(uint64_t, const char *, ...))v108;
        v110 = object_getClass(self);
        v111 = class_isMetaClass(v110);
        v181 = object_getClassName(self);
        v187 = sel_getName(a2);
        v112 = 45;
        if (v111)
          v112 = 43;
        v109(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v112, v181, v187, 454, v106);
      }
      v113 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v114 = NFSharedLogGetLogger(v113);
      v115 = objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v116 = object_getClass(self);
        if (class_isMetaClass(v116))
          v117 = 43;
        else
          v117 = 45;
        v118 = object_getClassName(self);
        v119 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v194 = v117;
        v195 = 2082;
        v196 = v118;
        v197 = 2082;
        v198 = v119;
        v199 = 1024;
        v200 = 454;
        v201 = 2114;
        v202 = v106;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
      }

    }
  }
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v121 = sub_10022C7F0(v120, v6);
  v56 = (NFApplet *)objc_claimAutoreleasedReturnValue(v121);

  if (!v56)
  {
    objc_storeStrong((id *)&self->_activeApplet, a3);
    v176 = (NSArray *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getRelatedGroupMembersForActiveApplet](self, "_getRelatedGroupMembersForActiveApplet"));
    v177 = self->_activeGroupMembers;
    self->_activeGroupMembers = v176;

    goto LABEL_58;
  }
  v122 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v123 = NFLogGetLogger(v122);
  if (v123)
  {
    v124 = (void (*)(uint64_t, const char *, ...))v123;
    v125 = object_getClass(self);
    v126 = class_isMetaClass(v125);
    v127 = object_getClassName(self);
    v188 = sel_getName(a2);
    v128 = 45;
    if (v126)
      v128 = 43;
    v124(3, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", v128, v127, v188, 461, v6, v56);
  }
  v129 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v130 = NFSharedLogGetLogger(v129);
  v131 = objc_claimAutoreleasedReturnValue(v130);
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
  {
    v132 = object_getClass(self);
    if (class_isMetaClass(v132))
      v133 = 43;
    else
      v133 = 45;
    v134 = object_getClassName(self);
    v135 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    v194 = v133;
    v195 = 2082;
    v196 = v134;
    v197 = 2082;
    v198 = v135;
    v199 = 1024;
    v200 = 461;
    v201 = 2114;
    v202 = v6;
    v203 = 2114;
    v204 = v56;
    _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", buf, 0x36u);
  }

  v136 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](v6, "identifier"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet packageIdentifier](v6, "packageIdentifier"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet moduleIdentifier](v6, "moduleIdentifier"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to activate applet with AID: %@, PID: %@, MID: %@. Error: %@"), v136, v137, v138, v56));

  v191[0] = CFSTR("Applet Identifier");
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](v6, "identifier"));
  v192[0] = v140;
  v192[1] = CFSTR("Other Bug");
  v191[1] = CFSTR("Classification");
  v191[2] = CFSTR("FailureKey");
  v192[2] = CFSTR("ttrTransaction");
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v192, v191, 3));
  sub_100187BAC((uint64_t)NFBugCapture, CFSTR("Failed to activate applet"), v139, v141);

LABEL_97:
  return v56;
}

- (id)setActiveApplets:(id)a3
{
  NFApplet *v5;
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  NFApplet *activeApplet;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  NFApplet *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NFApplet *v56;
  void *v57;
  uint64_t v58;
  void (*v59)(uint64_t, const char *, ...);
  objc_class *v60;
  _BOOL4 v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  objc_class *v77;
  int v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  id v99;
  id v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  void *v108;
  uint64_t v109;
  void (*v110)(uint64_t, const char *, ...);
  objc_class *v111;
  _BOOL4 v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  NSObject *v116;
  objc_class *v117;
  int v118;
  const char *v119;
  const char *v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  NFApplet *v125;
  void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const char *, ...);
  objc_class *v129;
  void *v130;
  _BOOL4 v131;
  const char *v132;
  BOOL v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  objc_class *v138;
  int v139;
  void *v140;
  const char *v141;
  const char *v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  void (*v147)(uint64_t, const char *, ...);
  objc_class *v148;
  _BOOL4 v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  NSObject *v155;
  objc_class *v156;
  int v157;
  const char *v158;
  const char *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  __CFString *v165;
  void *v166;
  id v167;
  NFApplet *v168;
  void *v169;
  uint64_t v170;
  void (*v171)(uint64_t, const char *, ...);
  objc_class *v172;
  _BOOL4 v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  NSObject *v177;
  objc_class *v178;
  int v179;
  const char *v180;
  const char *v181;
  void *v182;
  NFApplet *v183;
  NFApplet *activeSecondaryApplet;
  NSArray *activeGroupMembers;
  void *v186;
  uint64_t v187;
  void (*v188)(uint64_t, const char *, ...);
  objc_class *v189;
  _BOOL4 v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  NSObject *v195;
  objc_class *v196;
  int v197;
  const char *v198;
  const char *v199;
  void *v200;
  NSArray *v201;
  NSArray *v202;
  void *v203;
  const char *v204;
  const char *v205;
  const char *v206;
  const char *v207;
  const char *v208;
  const char *v209;
  const char *v210;
  const char *v211;
  const char *Name;
  const char *v213;
  const char *v214;
  const char *v215;
  const char *v216;
  const char *v217;
  const char *v218;
  int v219;
  const char *v220;
  int v221;
  void *v222;
  _QWORD v223[3];
  _QWORD v224[3];
  uint8_t buf[4];
  int v226;
  __int16 v227;
  const char *v228;
  __int16 v229;
  const char *v230;
  __int16 v231;
  int v232;
  __int16 v233;
  NFApplet *v234;
  __int16 v235;
  NFApplet *v236;
  _QWORD v237[4];
  _QWORD v238[4];
  _QWORD v239[4];
  _QWORD v240[4];
  _QWORD v241[4];
  _QWORD v242[4];
  _QWORD v243[4];
  _QWORD v244[4];

  v5 = (NFApplet *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v9 = (void (*)(uint64_t, const char *, ...))Logger;
  if (!v6)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v73 = 45;
      if (isMetaClass)
        v73 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i EMM is nil", v73, ClassName, Name, 492);
    }
    v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v75 = NFSharedLogGetLogger(v74);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v77 = object_getClass(self);
      if (class_isMetaClass(v77))
        v78 = 43;
      else
        v78 = 45;
      *(_DWORD *)buf = 67109890;
      v226 = v78;
      v227 = 2082;
      v228 = object_getClassName(self);
      v229 = 2082;
      v230 = sel_getName(a2);
      v231 = 1024;
      v232 = 492;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil", buf, 0x22u);
    }

    v79 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v243[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v244[0] = v19;
    v244[1] = &off_1002FE970;
    v243[1] = CFSTR("Line");
    v243[2] = CFSTR("Method");
    v80 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v244[2] = v80;
    v243[3] = NSDebugDescriptionErrorKey;
    v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 493);
    v244[3] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v244, v243, 4));
    v83 = v79;
    v84 = v18;
    v85 = 12;
    goto LABEL_67;
  }
  if (Logger)
  {
    v10 = object_getClass(self);
    v11 = class_isMetaClass(v10);
    v204 = object_getClassName(self);
    v210 = sel_getName(a2);
    v12 = 45;
    if (v11)
      v12 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, v204, v210, 495, v5);
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
    *(_DWORD *)buf = 67110146;
    v226 = v17;
    v227 = 2082;
    v228 = object_getClassName(self);
    v229 = 2082;
    v230 = sel_getName(a2);
    v231 = 1024;
    v232 = 495;
    v233 = 2114;
    v234 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (-[NFApplet count](v5, "count") != (id)2)
  {
    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = NFLogGetLogger(v86);
    if (v87)
    {
      v88 = (void (*)(uint64_t, const char *, ...))v87;
      v89 = object_getClass(self);
      v90 = class_isMetaClass(v89);
      v206 = object_getClassName(self);
      v213 = sel_getName(a2);
      v91 = 45;
      if (v90)
        v91 = 43;
      v88(3, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", v91, v206, v213, 498, v5);
    }
    v92 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v93 = NFSharedLogGetLogger(v92);
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      v95 = object_getClass(self);
      if (class_isMetaClass(v95))
        v96 = 43;
      else
        v96 = 45;
      v97 = object_getClassName(self);
      v98 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v226 = v96;
      v227 = 2082;
      v228 = v97;
      v229 = 2082;
      v230 = v98;
      v231 = 1024;
      v232 = 498;
      v233 = 2114;
      v234 = v5;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", buf, 0x2Cu);
    }

    v99 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v241[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v242[0] = v19;
    v242[1] = &off_1002FE988;
    v241[1] = CFSTR("Line");
    v241[2] = CFSTR("Method");
    v80 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v242[2] = v80;
    v241[3] = NSDebugDescriptionErrorKey;
    v81 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 499);
    v242[3] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v242, v241, 4));
    v83 = v99;
    v84 = v18;
    v85 = 10;
LABEL_67:
    v56 = (NFApplet *)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, v85, v82);

    goto LABEL_68;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet firstObject](v5, "firstObject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet lastObject](v5, "lastObject"));
  if (!v18 || !-[NFApplet isEqualToApplet:](self->_activeApplet, "isEqualToApplet:", v18))
  {
    if (self->_activeApplet)
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFLogGetLogger(v20);
      if (v21)
      {
        v22 = (void (*)(uint64_t, const char *, ...))v21;
        v23 = object_getClass(self);
        v24 = class_isMetaClass(v23);
        v25 = object_getClassName(self);
        v26 = sel_getName(a2);
        v27 = 45;
        if (v24)
          v27 = 43;
        v22(6, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", v27, v25, v26, 510, self->_activeApplet);
      }
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFSharedLogGetLogger(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        activeApplet = self->_activeApplet;
        *(_DWORD *)buf = 67110146;
        v226 = v32;
        v227 = 2082;
        v228 = v33;
        v229 = 2082;
        v230 = v34;
        v231 = 1024;
        v232 = 510;
        v233 = 2114;
        v234 = activeApplet;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deselecting current active applet: %{public}@", buf, 0x2Cu);
      }

      if (!-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
      {
        v101 = objc_alloc((Class)NSError);
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v239[0] = NSLocalizedDescriptionKey;
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
        v240[0] = v103;
        v240[1] = &off_1002FE9A0;
        v239[1] = CFSTR("Line");
        v239[2] = CFSTR("Method");
        v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v240[2] = v104;
        v239[3] = NSDebugDescriptionErrorKey;
        v105 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 513);
        v240[3] = v105;
        v106 = v240;
        v107 = v239;
LABEL_122:
        v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v106, v107, 4));
        v56 = (NFApplet *)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 15, v182);

        goto LABEL_68;
      }
      v222 = v19;
      if (self->_activeKeyIdentifiers)
      {
        v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v37 = NFLogGetLogger(v36);
        if (v37)
        {
          v38 = (void (*)(uint64_t, const char *, ...))v37;
          v39 = object_getClass(self);
          v40 = class_isMetaClass(v39);
          v218 = object_getClassName(self);
          v41 = sel_getName(a2);
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](self->_activeApplet, "identifier"));
          v43 = 45;
          if (v40)
            v43 = 43;
          v38(6, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", v43, v218, v41, 517, v42);

          v19 = v222;
        }
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFSharedLogGetLogger(v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = object_getClass(self);
          if (class_isMetaClass(v47))
            v48 = 43;
          else
            v48 = 45;
          v219 = v48;
          v49 = object_getClassName(self);
          v50 = sel_getName(a2);
          v51 = (NFApplet *)objc_claimAutoreleasedReturnValue(-[NFApplet identifier](self->_activeApplet, "identifier"));
          *(_DWORD *)buf = 67110146;
          v226 = v219;
          v227 = 2082;
          v228 = v49;
          v229 = 2082;
          v230 = v50;
          v231 = 1024;
          v232 = 517;
          v233 = 2114;
          v234 = v51;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting volatile config on: %{public}@", buf, 0x2Cu);

          v19 = v222;
        }

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v53 = sub_1002369DC(v52, self->_activeApplet);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
      v55 = sub_10022DE7C(v54);
      v56 = (NFApplet *)objc_claimAutoreleasedReturnValue(v55);

      if (v56)
      {
        v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v58 = NFLogGetLogger(v57);
        if (v58)
        {
          v59 = (void (*)(uint64_t, const char *, ...))v58;
          v60 = object_getClass(self);
          v61 = class_isMetaClass(v60);
          v205 = object_getClassName(self);
          v211 = sel_getName(a2);
          v62 = 45;
          if (v61)
            v62 = 43;
          v59(3, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", v62, v205, v211, 524, v56);
        }
        v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v64 = NFSharedLogGetLogger(v63);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = object_getClass(self);
          if (class_isMetaClass(v66))
            v67 = 43;
          else
            v67 = 45;
          v68 = object_getClassName(self);
          v69 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v226 = v67;
          v227 = 2082;
          v228 = v68;
          v229 = 2082;
          v230 = v69;
          v231 = 1024;
          v232 = 524;
          v233 = 2114;
          v234 = v56;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i deactivateAll failed: %{public}@", buf, 0x2Cu);
        }

        v19 = v222;
        goto LABEL_68;
      }
      if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
      {
        v166 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v167 = sub_100239BA4(v166, 0, self->_activeApplet);
        v168 = (NFApplet *)objc_claimAutoreleasedReturnValue(v167);

        if (v168)
        {
          v169 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v170 = NFLogGetLogger(v169);
          if (v170)
          {
            v171 = (void (*)(uint64_t, const char *, ...))v170;
            v172 = object_getClass(self);
            v173 = class_isMetaClass(v172);
            v209 = object_getClassName(self);
            v216 = sel_getName(a2);
            v174 = 45;
            if (v173)
              v174 = 43;
            v19 = v222;
            v171(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v174, v209, v216, 531, v168);
          }
          v175 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v176 = NFSharedLogGetLogger(v175);
          v177 = objc_claimAutoreleasedReturnValue(v176);
          if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
          {
            v178 = object_getClass(self);
            if (class_isMetaClass(v178))
              v179 = 43;
            else
              v179 = 45;
            v180 = object_getClassName(self);
            v181 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v226 = v179;
            v19 = v222;
            v227 = 2082;
            v228 = v180;
            v229 = 2082;
            v230 = v181;
            v231 = 1024;
            v232 = 531;
            v233 = 2114;
            v234 = v168;
            _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
          }

        }
      }
      else
      {
        v168 = 0;
      }
      v183 = self->_activeApplet;
      self->_activeApplet = 0;

      activeSecondaryApplet = self->_activeSecondaryApplet;
      self->_activeSecondaryApplet = 0;

      activeGroupMembers = self->_activeGroupMembers;
      self->_activeGroupMembers = 0;

      if (!v18)
        goto LABEL_125;
    }
    else
    {
      -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:");
      if (!v18)
      {
LABEL_125:
        v186 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v187 = NFLogGetLogger(v186);
        if (v187)
        {
          v188 = (void (*)(uint64_t, const char *, ...))v187;
          v189 = object_getClass(self);
          v190 = class_isMetaClass(v189);
          v191 = object_getClassName(self);
          v217 = sel_getName(a2);
          v192 = 45;
          if (v190)
            v192 = 43;
          v188(6, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", v192, v191, v217, 543);
        }
        v193 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v194 = NFSharedLogGetLogger(v193);
        v195 = objc_claimAutoreleasedReturnValue(v194);
        if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
        {
          v196 = object_getClass(self);
          if (class_isMetaClass(v196))
            v197 = 43;
          else
            v197 = 45;
          v198 = object_getClassName(self);
          v199 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v226 = v197;
          v227 = 2082;
          v228 = v198;
          v229 = 2082;
          v230 = v199;
          v231 = 1024;
          v232 = 543;
          _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing express mode aid restriction", buf, 0x22u);
        }

        v200 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        sub_1000487B0((uint64_t)v200, 0);

        if (!v5)
          goto LABEL_135;
        goto LABEL_71;
      }
    }
  }
  if (!v5)
  {
LABEL_135:
    v56 = 0;
    self->_activeAppletEmulationType = 0;
    goto LABEL_68;
  }
LABEL_71:
  if (self->_activeApplet)
  {
LABEL_72:
    v56 = 0;
    self->_activeAppletEmulationType = -[_NFContactlessSession _getActiveAppletEmulationType:](self, "_getActiveAppletEmulationType:");
    goto LABEL_68;
  }
  v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v109 = NFLogGetLogger(v108);
  if (v109)
  {
    v110 = (void (*)(uint64_t, const char *, ...))v109;
    v111 = object_getClass(self);
    v112 = class_isMetaClass(v111);
    v207 = object_getClassName(self);
    v214 = sel_getName(a2);
    v113 = 45;
    if (v112)
      v113 = 43;
    v110(6, "%c[%{public}s %{public}s]:%i Activating %{public}@", v113, v207, v214, 549, v5);
  }
  v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v115 = NFSharedLogGetLogger(v114);
  v116 = objc_claimAutoreleasedReturnValue(v115);
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    v117 = object_getClass(self);
    if (class_isMetaClass(v117))
      v118 = 43;
    else
      v118 = 45;
    v119 = object_getClassName(self);
    v120 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v226 = v118;
    v227 = 2082;
    v228 = v119;
    v229 = 2082;
    v230 = v120;
    v231 = 1024;
    v232 = 549;
    v233 = 2114;
    v234 = v5;
    _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Activating %{public}@", buf, 0x2Cu);
  }

  -[_NFContactlessSession switchToSecureElementWrapperForApplet:](self, "switchToSecureElementWrapperForApplet:", v18);
  if (!-[_NFContactlessSession startWiredMode](self, "startWiredMode"))
  {
    v101 = objc_alloc((Class)NSError);
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v237[0] = NSLocalizedDescriptionKey;
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v238[0] = v103;
    v238[1] = &off_1002FE9B8;
    v237[1] = CFSTR("Line");
    v237[2] = CFSTR("Method");
    v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v238[2] = v104;
    v237[3] = NSDebugDescriptionErrorKey;
    v105 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 555);
    v238[3] = v105;
    v106 = v238;
    v107 = v237;
    goto LABEL_122;
  }
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v122 = sub_10022DE7C(v121);

  if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
  {
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
    v124 = sub_100239BA4(v123, 1, v18);
    v125 = (NFApplet *)objc_claimAutoreleasedReturnValue(v124);

    if (v125)
    {
      v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v127 = NFLogGetLogger(v126);
      if (v127)
      {
        v128 = (void (*)(uint64_t, const char *, ...))v127;
        v129 = object_getClass(self);
        v130 = v19;
        v131 = class_isMetaClass(v129);
        v220 = object_getClassName(self);
        v132 = sel_getName(a2);
        v133 = !v131;
        v19 = v130;
        v134 = 45;
        if (!v133)
          v134 = 43;
        v128(3, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", v134, v220, v132, 563, v125);
      }
      v135 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v136 = NFSharedLogGetLogger(v135);
      v137 = objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        v138 = object_getClass(self);
        if (class_isMetaClass(v138))
          v139 = 43;
        else
          v139 = 45;
        v221 = v139;
        v140 = v19;
        v141 = object_getClassName(self);
        v142 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v226 = v221;
        v227 = 2082;
        v228 = v141;
        v19 = v140;
        v229 = 2082;
        v230 = v142;
        v231 = 1024;
        v232 = 563;
        v233 = 2114;
        v234 = v125;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ATL failed to enable plastic card mode: %{public}@", buf, 0x2Cu);
      }

    }
  }
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v144 = sub_10022CD00(v143, v5);
  v56 = (NFApplet *)objc_claimAutoreleasedReturnValue(v144);

  if (!v56)
  {
    objc_storeStrong((id *)&self->_activeApplet, v18);
    objc_storeStrong((id *)&self->_activeSecondaryApplet, v19);
    v201 = (NSArray *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getRelatedGroupMembersForActiveApplet](self, "_getRelatedGroupMembersForActiveApplet"));
    v202 = self->_activeGroupMembers;
    self->_activeGroupMembers = v201;

    goto LABEL_72;
  }
  v145 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v146 = NFLogGetLogger(v145);
  if (v146)
  {
    v147 = (void (*)(uint64_t, const char *, ...))v146;
    v148 = object_getClass(self);
    v149 = class_isMetaClass(v148);
    v150 = v19;
    v151 = object_getClassName(self);
    v215 = sel_getName(a2);
    v152 = 45;
    if (v149)
      v152 = 43;
    v208 = v151;
    v19 = v150;
    v147(3, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", v152, v208, v215, 570, v5, v56);
  }
  v153 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v154 = NFSharedLogGetLogger(v153);
  v155 = objc_claimAutoreleasedReturnValue(v154);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
  {
    v156 = object_getClass(self);
    if (class_isMetaClass(v156))
      v157 = 43;
    else
      v157 = 45;
    v158 = object_getClassName(self);
    v159 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    v226 = v157;
    v227 = 2082;
    v228 = v158;
    v229 = 2082;
    v230 = v159;
    v231 = 1024;
    v232 = 570;
    v233 = 2114;
    v234 = v5;
    v235 = 2114;
    v236 = v56;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Activation failed: %{public}@ : %{public}@", buf, 0x36u);
  }

  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "packageIdentifier"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "moduleIdentifier"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to activate applet with AID: %@, PID: %@, MID: %@. Error: %@"), v160, v161, v162, v56));

  v223[0] = CFSTR("Applet Identifier");
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  if (v164)
    v165 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  else
    v165 = CFSTR("NULL");
  v224[0] = v165;
  v224[1] = CFSTR("Other Bug");
  v223[1] = CFSTR("Classification");
  v223[2] = CFSTR("FailureKey");
  v224[2] = CFSTR("ttrTransaction");
  v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v224, v223, 3));
  sub_100187BAC((uint64_t)NFBugCapture, CFSTR("Failed to activate applet"), v163, v203);

  if (v164)
LABEL_68:

  return v56;
}

- (id)preloadApplets
{
  _NFContactlessSession *v2;
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *appletMap;
  id v7;
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
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  id *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  id v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  id v74;
  void *v75;
  _QWORD *v76;
  uint64_t v77;
  void *v78;
  void (*v79)(uint64_t, const char *, ...);
  objc_class *v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  int v88;
  const char *v89;
  const char *v90;
  void *v93;
  uint64_t v94;
  id v95;
  id obj;
  NSMutableArray *v97;
  int v98;
  void *i;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  NSErrorUserInfoKey v110;
  void *v111;
  _BYTE v112[128];
  NSErrorUserInfoKey v113;
  void *v114;
  _BYTE v115[128];
  NSErrorUserInfoKey v116;
  id v117;
  uint8_t buf[4];
  int v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  const char *v123;
  __int16 v124;
  int v125;
  void *v126;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](v2, "secureElementWrapper"));
  v126 = v3;
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v126, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
  LODWORD(v3) = v4 == 0;

  if ((_DWORD)v3)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v2);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(v2);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i EMM is nil!", v11, ClassName, Name, 608);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(v2);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v119 = v18;
      v120 = 2082;
      v121 = object_getClassName(v2);
      v122 = 2082;
      v123 = sel_getName(a2);
      v124 = 1024;
      v125 = 608;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil!", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v97 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v116 = NSLocalizedDescriptionKey;
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v117 = obj;
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
    v7 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v97, 12, v20);
LABEL_92:

    goto LABEL_93;
  }
  if (!v2->_appletMap)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    appletMap = v2->_appletMap;
    v2->_appletMap = v5;

  }
  if (v2->_applets)
  {
    v7 = 0;
    goto LABEL_94;
  }
  -[NSMutableDictionary removeAllObjects](v2->_appletMap, "removeAllObjects");
  v97 = objc_opt_new(NSMutableArray);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
  sub_100043E98((uint64_t)v21, 1);

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = v93;
  v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
  if (!v95)
    goto LABEL_45;
  v94 = *(_QWORD *)v107;
  while (2)
  {
    for (i = 0; i != v95; i = (char *)i + 1)
    {
      if (*(_QWORD *)v107 != v94)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
      -[_NFContactlessSession _setActiveSecureElementWrapper:](v2, "_setActiveSecureElementWrapper:", v22);
      v23 = sub_10022B938(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (v24 && (v25 = -[_NFContactlessSession useFilteredApplets](v2, "useFilteredApplets"), v24, v25))
      {
        v26 = sub_10022B938(v22);
        v20 = (id)objc_claimAutoreleasedReturnValue(v26);
        v98 = 1;
        if (v20)
          goto LABEL_33;
      }
      else
      {
        if (!-[_NFContactlessSession startWiredMode](v2, "startWiredMode"))
        {
          v41 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
          if (v41)
          {
            v42 = v41[2];
            if (v42)
              *(_BYTE *)(v42 + 220) = 0;
          }

          v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v43);
          if (v44)
          {
            v45 = object_getClass(v2);
            if (class_isMetaClass(v45))
              v46 = 43;
            else
              v46 = 45;
            v47 = object_getClassName(v2);
            v48 = sel_getName(a2);
            v44(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", v46, v47, v48, 639);
          }
          v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v50 = NFSharedLogGetLogger(v49);
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = object_getClass(v2);
            if (class_isMetaClass(v52))
              v53 = 43;
            else
              v53 = 45;
            v54 = object_getClassName(v2);
            v55 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v119 = v53;
            v120 = 2082;
            v121 = v54;
            v122 = 2082;
            v123 = v55;
            v124 = 1024;
            v125 = 639;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", buf, 0x22u);
          }

          v56 = objc_alloc((Class)NSError);
          v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v113 = NSLocalizedDescriptionKey;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
          v114 = v57;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
          v7 = objc_msgSend(v56, "initWithDomain:code:userInfo:", v20, 15, v58);
          goto LABEL_77;
        }
        if (-[_NFContactlessSession useFilteredApplets](v2, "useFilteredApplets"))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](v2, "secureElementWrapper"));
          v105 = 0;
          v28 = (id *)&v105;
          v29 = sub_10022C46C(v27, &v105);
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](v2, "secureElementWrapper"));
          v104 = 0;
          v28 = (id *)&v104;
          v29 = sub_10022EE68(v27, &v104);
        }
        v7 = (id)objc_claimAutoreleasedReturnValue(v29);
        v20 = *v28;

        if (v7 && objc_msgSend(v7, "code") != (id)24)
        {
          v76 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
          if (v76)
          {
            v77 = v76[2];
            if (v77)
              *(_BYTE *)(v77 + 220) = 0;
          }

          v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v79 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v78);
          if (v79)
          {
            v80 = object_getClass(v2);
            if (class_isMetaClass(v80))
              v81 = 43;
            else
              v81 = 45;
            v82 = object_getClassName(v2);
            v83 = sel_getName(a2);
            v79(3, "%c[%{public}s %{public}s]:%i Failed to get applets from eSE", v81, v82, v83, 655);
          }
          v84 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v85 = NFSharedLogGetLogger(v84);
          v86 = objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            v87 = object_getClass(v2);
            if (class_isMetaClass(v87))
              v88 = 43;
            else
              v88 = 45;
            v89 = object_getClassName(v2);
            v90 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v119 = v88;
            v120 = 2082;
            v121 = v89;
            v122 = 2082;
            v123 = v90;
            v124 = 1024;
            v125 = 655;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get applets from eSE", buf, 0x22u);
          }

          -[_NFContactlessSession startDefaultMode](v2, "startDefaultMode");
          goto LABEL_92;
        }

        v98 = 0;
        if (v20)
LABEL_33:
          -[NSMutableArray addObjectsFromArray:](v97, "addObjectsFromArray:", v20);
      }
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v20 = v20;
      v30 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v101;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(_QWORD *)v101 != v31)
              objc_enumerationMutation(v20);
            v33 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)j);
            v34 = v2->_appletMap;
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "serialNumber"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
            -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v35, v36);

          }
          v30 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
        }
        while (v30);
      }

      if (v98 && !-[_NFContactlessSession startWiredMode](v2, "startWiredMode"))
      {
        v59 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
        if (v59)
        {
          v60 = v59[2];
          if (v60)
            *(_BYTE *)(v60 + 220) = 0;
        }

        v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v62 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v61);
        if (v62)
        {
          v63 = object_getClass(v2);
          if (class_isMetaClass(v63))
            v64 = 43;
          else
            v64 = 45;
          v65 = object_getClassName(v2);
          v66 = sel_getName(a2);
          v62(3, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", v64, v65, v66, 676);
        }
        v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v68 = NFSharedLogGetLogger(v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v70 = object_getClass(v2);
          if (class_isMetaClass(v70))
            v71 = 43;
          else
            v71 = 45;
          v72 = object_getClassName(v2);
          v73 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v119 = v71;
          v120 = 2082;
          v121 = v72;
          v122 = 2082;
          v123 = v73;
          v124 = 1024;
          v125 = 676;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start wired mode for eSE", buf, 0x22u);
        }

        v74 = objc_alloc((Class)NSError);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v110 = NSLocalizedDescriptionKey;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
        v111 = v58;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
        v7 = objc_msgSend(v74, "initWithDomain:code:userInfo:", v57, 15, v75);

LABEL_77:
        goto LABEL_92;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](v2, "secureElementWrapper"));
      v38 = sub_10022DE7C(v37);

    }
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
    if (v95)
      continue;
    break;
  }
LABEL_45:

  v39 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
  if (v39)
  {
    v40 = v39[2];
    if (v40)
      *(_BYTE *)(v40 + 220) = 0;
  }

  objc_storeStrong((id *)&v2->_applets, v97);
  -[_NFContactlessSession startDefaultMode](v2, "startDefaultMode");
  v7 = 0;
LABEL_93:

LABEL_94:
  objc_sync_exit(v2);

  return v7;
}

- (id)_getAppletsForAids:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  NSMutableArray *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
  v7 = sub_10022B938(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper", 0));
    v10 = sub_10022B938(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          v18 = objc_msgSend(v4, "containsObject:", v17);

          if (v18)
            -[NSMutableArray addObject:](v5, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

  }
  if (-[NSMutableArray count](v5, "count"))
    v19 = v5;
  else
    v19 = 0;

  return v19;
}

- (id)_getRelatedGroupMembersForActiveApplet
{
  NFApplet *activeApplet;
  void *v5;
  NFApplet *v6;
  uint64_t v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  void *v20;
  NFApplet *v21;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  const char *ClassName;
  const char *v52;
  const char *v53;
  const char *Name;
  const char *v55;
  const char *v56;
  void *v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;

  activeApplet = self->_activeApplet;
  if (!activeApplet)
    goto LABEL_39;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet multiSEGroupMemberIDs](activeApplet, "multiSEGroupMemberIDs"));

  v6 = self->_activeApplet;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[NFApplet multiSEGroupMemberIDs](v6, "multiSEGroupMemberIDs"));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(6, "%c[%{public}s %{public}s]:%i MultiSE group members found: %{public}@", v13, ClassName, Name, 719, v7);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      v59 = v18;
      v60 = 2082;
      v61 = object_getClassName(self);
      v62 = 2082;
      v63 = sel_getName(a2);
      v64 = 1024;
      v65 = 719;
      v66 = 2114;
      v67 = v7;
      v19 = "%c[%{public}s %{public}s]:%i MultiSE group members found: %{public}@";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x2Cu);
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet groupMemberIDs](v6, "groupMemberIDs"));

    v21 = self->_activeApplet;
    if (v20)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[NFApplet groupMemberIDs](v21, "groupMemberIDs"));
      v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFLogGetLogger(v22);
      if (v23)
      {
        v24 = (void (*)(uint64_t, const char *, ...))v23;
        v25 = object_getClass(self);
        v26 = class_isMetaClass(v25);
        v52 = object_getClassName(self);
        v55 = sel_getName(a2);
        v27 = 45;
        if (v26)
          v27 = 43;
        v24(6, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", v27, v52, v55, 723, v7);
      }
      v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v29 = NFSharedLogGetLogger(v28);
      v16 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        *(_DWORD *)buf = 67110146;
        v59 = v31;
        v60 = 2082;
        v61 = object_getClassName(self);
        v62 = 2082;
        v63 = sel_getName(a2);
        v64 = 1024;
        v65 = 723;
        v66 = 2114;
        v67 = v7;
        v19 = "%c[%{public}s %{public}s]:%i Group members found: %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet groupHeadID](v21, "groupHeadID"));

      if (!v33)
        goto LABEL_39;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet groupHeadID](self->_activeApplet, "groupHeadID"));
      v57 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
      v16 = objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getAppletsForAids:](self, "_getAppletsForAids:", v35));

      if (!v16 || -[NSObject count](v16, "count") != (id)1)
      {
        v32 = 0;
        goto LABEL_25;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndex:](v16, "objectAtIndex:", 0));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "groupMemberIDs"));
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFLogGetLogger(v37);
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(self);
        v41 = class_isMetaClass(v40);
        v53 = object_getClassName(self);
        v56 = sel_getName(a2);
        v42 = 45;
        if (v41)
          v42 = 43;
        v39(6, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", v42, v53, v56, 730, v7);
      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        v48 = object_getClassName(self);
        v49 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v59 = v47;
        v60 = 2082;
        v61 = v48;
        v62 = 2082;
        v63 = v49;
        v64 = 1024;
        v65 = 730;
        v66 = 2114;
        v67 = v7;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Group members found: %{public}@", buf, 0x2Cu);
      }

    }
  }

  if (!v7)
  {
LABEL_39:
    v32 = 0;
    return v32;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getAppletsForAids:](self, "_getAppletsForAids:", v7));
  v16 = v7;
LABEL_25:

  return v32;
}

- (int)_getActiveAppletEmulationType:(id)a3
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *v44;
  NSArray *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  const char *Name;
  const char *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierAsData"));
  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269CD8, 14);
  v8 = objc_msgSend(v6, "isEqualToData:", v7);

  if (v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(6, "%c[%{public}s %{public}s]:%i Enabling ABF for FTA", v15, ClassName, Name, 743);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67109890;
      v63 = v20;
      v64 = 2082;
      v65 = object_getClassName(self);
      v66 = 2082;
      v67 = sel_getName(a2);
      v68 = 1024;
      v69 = 743;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling ABF for FTA", buf, 0x22u);
    }

    v21 = 7;
  }
  else
  {
    v22 = objc_msgSend(v5, "isTypeF");
    if (objc_msgSend(v5, "groupActivationStyle") == 1)
    {
      if (v22)
        v21 = 4;
      else
        v21 = 3;
    }
    else if (objc_msgSend(v5, "groupActivationStyle")
           || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupHeadID")), v28, !v28))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupHeadID"));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupHeadID"));
        v26 = sub_10022F2F0(v24, v25);
        v27 = (id)objc_claimAutoreleasedReturnValue(v26);

      }
      else
      {
        v27 = v5;
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "groupMemberIDs"));
      v42 = v41;
      if (v41)
        v43 = v41;
      else
        v43 = objc_opt_new(NSArray);
      v44 = v43;

      if (v27)
      {
        if (objc_msgSend(v27, "isTypeF"))
          v21 = 4;
        else
          v21 = 3;
      }
      else
      {
        v21 = 0;
      }
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v45 = v44;
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession secureElementWrapper](self, "secureElementWrapper"));
            v52 = sub_10022F2F0(v51, v50);
            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

            if (v53)
            {
              if (objc_msgSend(v53, "isTypeF"))
                v21 |= 4u;
              else
                v21 |= 3u;
            }

          }
          v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v47);
      }

    }
    else
    {
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFLogGetLogger(v29);
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        v33 = class_isMetaClass(v32);
        v34 = object_getClassName(self);
        v56 = sel_getName(a2);
        v35 = 45;
        if (v33)
          v35 = 43;
        v31(4, "%c[%{public}s %{public}s]:%i Invalid GP group activation", v35, v34, v56, 754);
      }
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFSharedLogGetLogger(v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = object_getClass(self);
        if (class_isMetaClass(v39))
          v40 = 43;
        else
          v40 = 45;
        *(_DWORD *)buf = 67109890;
        v63 = v40;
        v64 = 2082;
        v65 = object_getClassName(self);
        v66 = 2082;
        v67 = sel_getName(a2);
        v68 = 1024;
        v69 = 754;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid GP group activation", buf, 0x22u);
      }

      v21 = 0;
    }
  }

  return v21;
}

- (BOOL)_configureEmulationType:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NFContactlessSession.m"), 788, CFSTR("Invalid argument"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
  v6 = -[_NFContactlessSession _configureEmulationType:routingConfigWhenEmulationOff:](self, "_configureEmulationType:routingConfigWhenEmulationOff:", a3, v5);

  return v6;
}

- (BOOL)_configureEmulationType:(unint64_t)a3 routingConfigWhenEmulationOff:(id)a4
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  unsigned int activeAppletEmulationType;
  uint64_t v32;
  unsigned int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  void *v56;
  unsigned int v58;
  _BOOL4 v59;
  unint64_t v60;
  const char *v61;
  unint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  int v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  void *v77;

  v7 = a4;
  if (!a3)
  {
    if (self->_emulationState)
    {
      Logger = NFLogGetLogger(2);
      if (Logger)
      {
        v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v12(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v18, ClassName, Name, 802, v17);

      }
      v19 = NFSharedLogGetLogger(2);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21))
          v22 = 43;
        else
          v22 = 45;
        v23 = object_getClassName(self);
        v24 = sel_getName(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        *(_DWORD *)buf = 67110146;
        v69 = v22;
        v70 = 2082;
        v71 = v23;
        v72 = 2082;
        v73 = v24;
        v74 = 1024;
        v75 = 802;
        v76 = 2112;
        v77 = v25;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);

      }
    }
    self->_emulationState = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "setRoutingConfig:", v7));
    v28 = v27 == 0;

    goto LABEL_18;
  }
  if ((a3 & 8) != 0)
  {
    self->_emulationState = 8;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig expressOnly](NFRoutingConfig, "expressOnly"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "setRoutingConfig:", v29));
    v28 = v30 == 0;

LABEL_18:
    goto LABEL_58;
  }
  v8 = self->_emulationState & 0xFFFFFFFFFFFFFFF7;
  self->_emulationState = v8;
  v9 = v8 | a3;
  if ((v8 | a3) == 4)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig hostCardEmulation](NFRoutingConfig, "hostCardEmulation"));
  }
  else
  {
    activeAppletEmulationType = self->_activeAppletEmulationType;
    if ((v9 & 4) != 0)
    {
      v33 = -[NFApplet supportedTypeFSystem](self->_activeApplet, "supportedTypeFSystem");
      if (v33 == 2)
        activeAppletEmulationType |= 4u;
      else
        activeAppletEmulationType |= 3u;
      v32 = v33 != 2;
    }
    else
    {
      v32 = 0;
    }
    if (-[NFApplet suppressTypeB](self->_activeApplet, "suppressTypeB"))
    {
      activeAppletEmulationType &= ~2u;
    }
    else if (-[NFApplet groupActivationStyle](self->_activeApplet, "groupActivationStyle") == 2)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet groupMemberIDs](self->_activeApplet, "groupMemberIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession _getAppletsForAids:](self, "_getAppletsForAids:", v34));

      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v36)
      {
        v37 = v36;
        v58 = v32;
        v60 = v9;
        v38 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(_QWORD *)v64 != v38)
              objc_enumerationMutation(v35);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "suppressTypeB"))
            {
              activeAppletEmulationType &= ~2u;
              goto LABEL_38;
            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (v37)
            continue;
          break;
        }
LABEL_38:
        v9 = v60;
        v32 = v58;
      }

    }
    if (-[NFApplet suppressTypeA](self->_activeApplet, "suppressTypeA"))
      v40 = activeAppletEmulationType & 0xFFFFFFFE;
    else
      v40 = activeAppletEmulationType;
    v10 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedCardEmulationWithHCE:emulationType:](NFRoutingConfig, "embeddedCardEmulationWithHCE:emulationType:", v32, v40));
  }
  v41 = (void *)v10;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "setRoutingConfig:", v41));
  v28 = v43 == 0;

  if (!v43)
  {
    if (!self->_emulationState)
    {
      v44 = NFLogGetLogger(2);
      if (v44)
      {
        v45 = (void (*)(uint64_t, const char *, ...))v44;
        v46 = object_getClass(self);
        v59 = class_isMetaClass(v46);
        v61 = object_getClassName(self);
        v47 = sel_getName(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        v49 = 45;
        if (v59)
          v49 = 43;
        v45(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", v49, v61, v47, 857, v48);

      }
      v50 = NFSharedLogGetLogger(2);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = object_getClass(self);
        v62 = v9;
        if (class_isMetaClass(v52))
          v53 = 43;
        else
          v53 = 45;
        v54 = object_getClassName(self);
        v55 = sel_getName(a2);
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
        *(_DWORD *)buf = 67110146;
        v69 = v53;
        v9 = v62;
        v70 = 2082;
        v71 = v54;
        v72 = 2082;
        v73 = v55;
        v74 = 1024;
        v75 = 857;
        v76 = 2112;
        v77 = v56;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: %@", buf, 0x2Cu);

      }
    }
    self->_emulationState = v9;
  }

LABEL_58:
  return v28;
}

- (void)getAppletsWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C23F8;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)setActiveApplet:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NFContactlessSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C27E8;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)startCardEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2CE0;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)stopCardEmulationWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFContactlessSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3374;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (BOOL)startWiredMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 0));
  LOBYTE(self) = -[_NFContactlessSession _configureEmulationType:routingConfigWhenEmulationOff:](self, "_configureEmulationType:routingConfigWhenEmulationOff:", 0, v3);

  return (char)self;
}

- (BOOL)_startFieldDetectAndKeepSEOn:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 1));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 1));
  v5 = (void *)v4;
  v6 = -[_NFContactlessSession _configureEmulationType:routingConfigWhenEmulationOff:](self, "_configureEmulationType:routingConfigWhenEmulationOff:", 0, v4);

  return v6;
}

- (BOOL)startFieldDetectMode
{
  return -[_NFContactlessSession _startFieldDetectAndKeepSEOn:](self, "_startFieldDetectAndKeepSEOn:", 0);
}

- (BOOL)startDefaultModeAndKeepSEOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NFApplet *activeApplet;
  NFApplet *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *p_super;
  objc_class *v19;
  int v20;
  BOOL v21;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  NSSet *activeKeyIdentifiers;
  void *v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  unsigned __int8 *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  void *v86;
  void *v87;
  unsigned __int8 v88;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  uint8_t buf[4];
  int v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  NSObject *v103;
  __int16 v104;
  NSSet *v105;

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));

  if (v6)
  {
    activeApplet = self->_activeApplet;
    if (activeApplet)
      v8 = activeApplet;
    else
      v8 = (NFApplet *)objc_claimAutoreleasedReturnValue(-[_NFContactlessSession deferredActivationApplet](self, "deferredActivationApplet"));
    p_super = &v8->super;
    if (-[_NFContactlessSession canEnableExpress](self, "canEnableExpress"))
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v24 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v29 = 45;
        if (isMetaClass)
          v29 = 43;
        v24(6, "%c[%{public}s %{public}s]:%i in session express for aid:%{public}@ kids:%{public}@", v29, ClassName, Name, 974, p_super, self->_activeKeyIdentifiers);
      }
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = NFSharedLogGetLogger(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = object_getClass(self);
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        v35 = object_getClassName(self);
        v36 = sel_getName(a2);
        activeKeyIdentifiers = self->_activeKeyIdentifiers;
        *(_DWORD *)buf = 67110402;
        v95 = v34;
        v96 = 2082;
        v97 = v35;
        v98 = 2082;
        v99 = v36;
        v100 = 1024;
        v101 = 974;
        v102 = 2114;
        v103 = p_super;
        v104 = 2114;
        v105 = activeKeyIdentifiers;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session express for aid:%{public}@ kids:%{public}@", buf, 0x36u);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      v39 = sub_100041B44((_BOOL8)v38);

      if (v39)
      {
        v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v41 = NFLogGetLogger(v40);
        if (v41)
        {
          v42 = (void (*)(uint64_t, const char *, ...))v41;
          v43 = object_getClass(self);
          v44 = class_isMetaClass(v43);
          v45 = object_getClassName(self);
          v91 = sel_getName(a2);
          v46 = 45;
          if (v44)
            v46 = 43;
          v42(6, "%c[%{public}s %{public}s]:%i Express mode is active", v46, v45, v91, 977);
        }
        v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v48 = NFSharedLogGetLogger(v47);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = object_getClass(self);
          if (class_isMetaClass(v50))
            v51 = 43;
          else
            v51 = 45;
          v52 = object_getClassName(self);
          v53 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v95 = v51;
          v96 = 2082;
          v97 = v52;
          v98 = 2082;
          v99 = v53;
          v100 = 1024;
          v101 = 977;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode is active", buf, 0x22u);
        }
LABEL_49:

        v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v73 = NFLogGetLogger(v72);
        if (v73)
        {
          v74 = (void (*)(uint64_t, const char *, ...))v73;
          v75 = object_getClass(self);
          v76 = class_isMetaClass(v75);
          v77 = object_getClassName(self);
          v93 = sel_getName(a2);
          v78 = 45;
          if (v76)
            v78 = 43;
          v74(6, "%c[%{public}s %{public}s]:%i Start in session express", v78, v77, v93, 990);
        }
        v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v80 = NFSharedLogGetLogger(v79);
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = object_getClass(self);
          if (class_isMetaClass(v82))
            v83 = 43;
          else
            v83 = 45;
          v84 = object_getClassName(self);
          v85 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v95 = v83;
          v96 = 2082;
          v97 = v84;
          v98 = 2082;
          v99 = v85;
          v100 = 1024;
          v101 = 990;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Start in session express", buf, 0x22u);
        }

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        sub_1000487B0((uint64_t)v86, p_super);

        v87 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
        sub_10003D1FC((uint64_t)v87);

        v88 = -[_NFContactlessSession _configureEmulationType:](self, "_configureEmulationType:", 8);
        goto LABEL_60;
      }
      v54 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
      if (v54)
      {
        v55 = v54[169];

        if (v55)
        {
          v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v57 = NFLogGetLogger(v56);
          if (v57)
          {
            v58 = (void (*)(uint64_t, const char *, ...))v57;
            v59 = object_getClass(self);
            v60 = class_isMetaClass(v59);
            v61 = object_getClassName(self);
            v92 = sel_getName(a2);
            v62 = 45;
            if (v60)
              v62 = 43;
            v58(6, "%c[%{public}s %{public}s]:%i Cancel previous delayed express restart request; force express enable",
              v62,
              v61,
              v92,
              984);
          }
          v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v64 = NFSharedLogGetLogger(v63);
          v65 = objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = object_getClass(self);
            if (class_isMetaClass(v66))
              v67 = 43;
            else
              v67 = 45;
            v68 = object_getClassName(self);
            v69 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v95 = v67;
            v96 = 2082;
            v97 = v68;
            v98 = 2082;
            v99 = v69;
            v100 = 1024;
            v101 = 984;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cancel previous delayed express restart request; force express enable",
              buf,
              0x22u);
          }

          v70 = objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](self, "expressModeManager"));
          v49 = v70;
          if (v70)
          {
            v71 = *(void **)(v70 + 72);
            if (v71)
            {
              *(_BYTE *)(v49 + 169) = 0;
              objc_msgSend(v71, "stopTimer");
            }
          }
          goto LABEL_49;
        }
      }
    }
    v88 = -[_NFContactlessSession _startFieldDetectAndKeepSEOn:](self, "_startFieldDetectAndKeepSEOn:", v3);
LABEL_60:
    v21 = v88;
    goto LABEL_61;
  }
  v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFLogGetLogger(v9);
  if (v10)
  {
    v11 = (void (*)(uint64_t, const char *, ...))v10;
    v12 = object_getClass(self);
    v13 = class_isMetaClass(v12);
    v14 = object_getClassName(self);
    v90 = sel_getName(a2);
    v15 = 45;
    if (v13)
      v15 = 43;
    v11(3, "%c[%{public}s %{public}s]:%i EMM is nil!", v15, v14, v90, 964);
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  p_super = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    *(_DWORD *)buf = 67109890;
    v95 = v20;
    v96 = 2082;
    v97 = object_getClassName(self);
    v98 = 2082;
    v99 = sel_getName(a2);
    v100 = 1024;
    v101 = 964;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i EMM is nil!", buf, 0x22u);
  }
  v21 = 0;
LABEL_61:

  return v21;
}

- (BOOL)startDefaultMode
{
  return -[_NFContactlessSession startDefaultModeAndKeepSEOn:](self, "startDefaultModeAndKeepSEOn:", 0);
}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = a3;
  self->_fieldPresent = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v5, "didDetectField:", v3);

  if (self->_emulationState)
    v6 = !v3;
  else
    v6 = 1;
  if (!v6)
  {
    v10[0] = CFSTR("FieldTechnology");
    v10[1] = CFSTR("SystemCode");
    v11[0] = &off_1002FE9D0;
    v11[1] = &off_1002FE9E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NFFieldNotification notificationWithDictionary:](NFFieldNotification, "notificationWithDictionary:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v9, "didDetectFieldNotification:", v8);

  }
}

- (void)handleFieldNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v5, "didDetectFieldNotification:", v4);

}

- (void)handleFieldReset
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
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1032);
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
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 1032;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)handleSelectEvent:(id)a3
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
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v5 = a3;
  if (-[_NFContactlessSession plasticCardMode](self, "plasticCardMode"))
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
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Ignoring due to plasticCardMode", v12, ClassName, Name, 1038);
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
      v21 = v17;
      v22 = 2082;
      v23 = object_getClassName(self);
      v24 = 2082;
      v25 = sel_getName(a2);
      v26 = 1024;
      v27 = 1038;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring due to plasticCardMode", buf, 0x22u);
    }

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v18, "didSelectApplet:", v5);

  }
}

- (void)handleFelicaStateEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v5, "didFelicaStateChange:", v4);

}

- (NFSecureElementWrapper)secureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSecureElementWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  return (NFSystemPowerConsumptionMonitor *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPowerConsumptionReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NFApplet)deferredActivationApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDeferredActivationApplet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSSet)activeKeyIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 248, 1);
}

- (NSSet)activeSecondaryKeyIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)plasticCardMode
{
  return self->_plasticCardMode;
}

- (void)setPlasticCardMode:(BOOL)a3
{
  self->_plasticCardMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSecondaryKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeKeyIdentifiers, 0);
  objc_storeStrong((id *)&self->_deferredActivationApplet, 0);
  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_applets, 0);
  objc_storeStrong((id *)&self->_appletMap, 0);
  objc_storeStrong((id *)&self->_activeGroupMembers, 0);
  objc_storeStrong((id *)&self->_activeSecondaryApplet, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
}

@end
