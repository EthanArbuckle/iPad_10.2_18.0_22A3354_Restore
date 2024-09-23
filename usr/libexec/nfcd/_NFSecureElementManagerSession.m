@implementation _NFSecureElementManagerSession

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

  if ((objc_msgSend(a3, "seSessionAccess") & 1) != 0)
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
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", v12, ClassName, Name, 110);
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
    v35 = 110;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring SE access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_1002FFD50;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 111);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (_NFSecureElementManagerSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  _NFSecureElementManagerSession *v6;
  NFFelicaStateEvent *v7;
  NFFelicaStateEvent *felicaEvents;
  NSMutableArray *v9;
  NSMutableArray *appletRequiresEndOfTransactionProcessing;
  NSMutableArray *v11;
  NSMutableArray *appletChangedByTSM;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v14, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_alloc_init(NFFelicaStateEvent);
    felicaEvents = v6->_felicaEvents;
    v6->_felicaEvents = v7;

    v9 = objc_opt_new(NSMutableArray);
    appletRequiresEndOfTransactionProcessing = v6->_appletRequiresEndOfTransactionProcessing;
    v6->_appletRequiresEndOfTransactionProcessing = v9;

    v11 = objc_opt_new(NSMutableArray);
    appletChangedByTSM = v6->_appletChangedByTSM;
    v6->_appletChangedByTSM = v11;

    v6->_delayExpressMode = 0.0;
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
  v9.super_class = (Class)_NFSecureElementManagerSession;
  v4 = a3;
  -[_NFSession didStartSession:](&v9, "didStartSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager", v9.receiver, v9.super_class));
  v6 = (NFSecureElementWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secureElementWrapper"));
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v8, "didStartSession:", v4);

}

- (void)markAsDirty:(BOOL)a3
{
  self->_seDirty = a3;
}

- (BOOL)isDirty
{
  return self->_seDirty;
}

- (BOOL)_activateSecureElementWrapper:(id)a3
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
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  if (!a3)
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
      v8(3, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil!", v12, ClassName, Name, 169);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
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
      v27 = 169;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i secureElementWrapper is nil!", buf, 0x22u);
    }

  }
  return a3 != 0;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  if (objc_msgSend(v7, "isEqualToString:", v5))
  {

LABEL_4:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
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
    v14(3, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", v17, ClassName, Name, 181, v5);
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
    v33 = 181;
    v34 = 2114;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", buf, 0x2Cu);
  }

  v11 = 0;
LABEL_15:

  return v11;
}

- (id)_getSecureElementForAID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v6 = sub_10022B938(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v34;
LABEL_3:
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(v7);
      v10 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v15 = objc_msgSend(v14, "isEqualToString:", v4);

      if ((v15 & 1) != 0)
        break;
      v12 = (char *)v12 + 1;
      v13 = v10;
      if (v9 == v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v9)
          goto LABEL_3;

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v16 = -[_NFSecureElementManagerSession _getAllApplets:](self, "_getAllApplets:", 0);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper", 0));
    v18 = sub_10022B938(v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (!v19)
    {
      v26 = 0;
      goto LABEL_21;
    }
    v20 = v19;
    v10 = 0;
    v21 = *(_QWORD *)v30;
LABEL_12:
    v22 = 0;
    v23 = v10;
    while (1)
    {
      if (*(_QWORD *)v30 != v21)
        objc_enumerationMutation(v7);
      v10 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v25 = objc_msgSend(v24, "isEqualToString:", v4);

      if ((v25 & 1) != 0)
        break;
      v22 = (char *)v22 + 1;
      v23 = v10;
      if (v20 == v22)
      {
        v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v20)
          goto LABEL_12;
        v26 = 0;
        goto LABEL_20;
      }
    }
  }
  v27 = v10;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v10 = v7;
  v7 = v27;
LABEL_20:

LABEL_21:
  return v26;
}

- (id)_getAllApplets:(id *)a3
{
  NSMutableArray *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  const char *Name;
  uint64_t v38;
  uint64_t v39;
  NSErrorUserInfoKey v40;
  id v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  v6 = objc_opt_new(NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v8 = -[_NFSecureElementManagerSession _activateSecureElementWrapper:](self, "_activateSecureElementWrapper:", v7);

  if ((v8 & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Failed to activate embedded secure element", v23, ClassName, Name, 212);
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
      *(_DWORD *)buf = 67109890;
      v43 = v28;
      v44 = 2082;
      v45 = object_getClassName(self);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 212;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to activate embedded secure element", buf, 0x22u);
    }

    v29 = objc_alloc((Class)NSError);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v40 = NSLocalizedDescriptionKey;
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v41 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v32 = objc_msgSend(v29, "initWithDomain:code:userInfo:", v10, 15, v31);
    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_whitelistChecker"));

  v11 = objc_msgSend(v10, "useUnfilteredApplets");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](self, "embeddedSecureElementWrapper"));
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    v39 = 0;
    v14 = (id *)&v39;
    v15 = sub_10022EE68(v12, &v39);
    v16 = objc_claimAutoreleasedReturnValue(v15);
  }
  else
  {
    v38 = 0;
    v14 = (id *)&v38;
    v33 = sub_10022C46C(v12, &v38);
    v16 = objc_claimAutoreleasedReturnValue(v33);
  }
  v34 = (void *)v16;
  v30 = *v14;

  if (v34)
  {
    v32 = v34;
    v31 = v32;
LABEL_17:
    v35 = v32;
    goto LABEL_18;
  }
  if (v30)
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v30);
  v31 = 0;
  v35 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v6);
LABEL_18:

  return v35;
}

- (void)_triggerProvisioningBugCatpture:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("kData")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));

  v15[0] = CFSTR("Status Word");
  v8 = objc_msgSend(v5, "status");
  v9 = 0;
  v10 = "Unknown Error";
  while ((unsigned __int16)word_1002E9798[v9] != v8)
  {
    v9 += 8;
    if (v9 == 192)
      goto LABEL_6;
  }
  v10 = *(const char **)&word_1002E9798[v9 + 4];
LABEL_6:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s (%04X)"), v10, objc_msgSend(v5, "status")));
  v16[0] = v11;
  v16[1] = CFSTR("Serious Bug");
  v15[1] = CFSTR("Classification");
  v15[2] = CFSTR("FailureKey");
  v16[2] = CFSTR("ttrProvisioning");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("80E6")) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("84E6")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Install Command, Response: 0x%04X"), objc_msgSend(v5, "status")));
    sub_100187D74((uint64_t)NFBugCapture, CFSTR("Applet Installation Failed"), v13, v12);
    v14 = 0;
LABEL_15:

    +[NFExceptionsCALogger postAnalyticsAppletProvisioningFailureEvent:responseCode:](NFExceptionsCALogger, "postAnalyticsAppletProvisioningFailureEvent:responseCode:", v14, objc_msgSend(v5, "status"));
    goto LABEL_16;
  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("80E8")) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("84E8")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Load Command, Response: 0x%04X"), objc_msgSend(v5, "status")));
    sub_100187D74((uint64_t)NFBugCapture, CFSTR("Applet Loading Failed"), v13, v12);
    v14 = 1;
    goto LABEL_15;
  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("80E2")) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("84E2")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Store Data Command, Response: 0x%04X"), objc_msgSend(v5, "status")));
    sub_100187D74((uint64_t)NFBugCapture, CFSTR("Applet Personalization Failed"), v13, v12);
    v14 = 2;
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_processCommandDataProtocol:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  id v26;
  void *specific;
  uint64_t Logger;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void **v43;
  NSErrorUserInfoKey *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  unsigned int v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  _BOOL4 v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  NSErrorUserInfoKey v91;
  void *v92;
  NSErrorUserInfoKey v93;
  void *v94;
  NSErrorUserInfoKey v95;
  void *v96;
  NSErrorUserInfoKey v97;
  void *v98;
  uint8_t buf[4];
  int v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  const char *v108;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dataProtocol")));
  if (v9)
  {
    v10 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v29 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v89 = object_getClassName(v9);
        v34 = 45;
        if (isMetaClass)
          v34 = 43;
        v29(3, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %s", v34, ClassName, Name, 278, v89);
      }
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = object_getClass(self);
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        *(_DWORD *)buf = 67110146;
        v100 = v39;
        v101 = 2082;
        v102 = object_getClassName(self);
        v103 = 2082;
        v104 = sel_getName(a2);
        v105 = 1024;
        v106 = 278;
        v107 = 2080;
        v108 = object_getClassName(v9);
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %s", buf, 0x2Cu);
      }

      v40 = objc_alloc((Class)NSError);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v97 = NSLocalizedDescriptionKey;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Decoding Error"));
      v98 = v42;
      v43 = &v98;
      v44 = &v97;
      goto LABEL_27;
    }
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GlobalPlatform")) & 1) == 0)
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MiFare")) & 1) != 0)
      {
        if (objc_msgSend(v8, "status") != 36864)
          goto LABEL_5;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("kData")));
        if (!objc_msgSend(v65, "compare:options:range:", CFSTR("80E2"), 1, 0, objc_msgSend(CFSTR("80E2"), "length"))|| !objc_msgSend(v65, "compare:options:range:", CFSTR("84E2"), 1, 0, objc_msgSend(CFSTR("84E2"), "length")))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
          v67 = +[NFMSEIParser parseResponseAPDU:](NFMSEIParser, "parseResponseAPDU:", v66);

          if (v67)
          {
            v68 = objc_alloc((Class)NSError);
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
            v93 = NSLocalizedDescriptionKey;
            if (v67 >= 0x47)
              v70 = 71;
            else
              v70 = v67;
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1002E9508[v70]));
            v94 = v71;
            v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
            v26 = objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, v67, v72);

            goto LABEL_38;
          }
        }

LABEL_16:
        v26 = 0;
        goto LABEL_38;
      }
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FeliCa")) & 1) == 0)
      {
        v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v74 = NFLogGetLogger(v73);
        if (v74)
        {
          v75 = (void (*)(uint64_t, const char *, ...))v74;
          v76 = object_getClass(self);
          v77 = class_isMetaClass(v76);
          v84 = object_getClassName(self);
          v87 = sel_getName(a2);
          v78 = 45;
          if (v77)
            v78 = 43;
          v75(3, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %{public}@", v78, v84, v87, 289, v9);
        }
        v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v80 = NFSharedLogGetLogger(v79);
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          v82 = object_getClass(self);
          if (class_isMetaClass(v82))
            v83 = 43;
          else
            v83 = 45;
          *(_DWORD *)buf = 67110146;
          v100 = v83;
          v101 = 2082;
          v102 = object_getClassName(self);
          v103 = 2082;
          v104 = sel_getName(a2);
          v105 = 1024;
          v106 = 289;
          v107 = 2114;
          v108 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect data protocol parameter: %{public}@", buf, 0x2Cu);
        }

        v40 = objc_alloc((Class)NSError);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v95 = NSLocalizedDescriptionKey;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Decoding Error"));
        v96 = v42;
        v43 = &v96;
        v44 = &v95;
LABEL_27:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v44, 1));
        v26 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 23, v45);

        goto LABEL_38;
      }
    }
  }
  if (objc_msgSend(v8, "status") == 36864)
    goto LABEL_16;
LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_numberForKey:", CFSTR("kIgnoreResult")));
  if (objc_msgSend(v11, "BOOLValue"))
  {
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFLogGetLogger(v12);
    if (v13)
    {
      v14 = (void (*)(uint64_t, const char *, ...))v13;
      v15 = object_getClass(self);
      v16 = class_isMetaClass(v15);
      v17 = object_getClassName(self);
      v18 = v11;
      v19 = sel_getName(a2);
      v88 = objc_msgSend(v8, "status");
      v85 = v19;
      v11 = v18;
      v20 = 45;
      if (v16)
        v20 = 43;
      v14(5, "%c[%{public}s %{public}s]:%i Ignoring R-APDU Error: 0x%04x", v20, v17, v85, 314, v88);
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
      *(_DWORD *)buf = 67110146;
      v100 = v25;
      v101 = 2082;
      v102 = object_getClassName(self);
      v103 = 2082;
      v104 = sel_getName(a2);
      v105 = 1024;
      v106 = 314;
      v107 = 1024;
      LODWORD(v108) = objc_msgSend(v8, "status");
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring R-APDU Error: 0x%04x", buf, 0x28u);
    }

    goto LABEL_16;
  }
  -[_NFSecureElementManagerSession _triggerProvisioningBugCatpture:response:](self, "_triggerProvisioningBugCatpture:response:", v7, v8);
  v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v47 = NFLogGetLogger(v46);
  if (v47)
  {
    v48 = (void (*)(uint64_t, const char *, ...))v47;
    v49 = object_getClass(self);
    v50 = class_isMetaClass(v49);
    v51 = object_getClassName(self);
    v52 = v11;
    v53 = sel_getName(a2);
    v90 = objc_msgSend(v8, "status");
    v86 = v53;
    v11 = v52;
    v54 = 45;
    if (v50)
      v54 = 43;
    v48(3, "%c[%{public}s %{public}s]:%i R-APDU Error: 0x%04x", v54, v51, v86, 319, v90);
  }
  v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v56 = NFSharedLogGetLogger(v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
  {
    v58 = object_getClass(self);
    if (class_isMetaClass(v58))
      v59 = 43;
    else
      v59 = 45;
    *(_DWORD *)buf = 67110146;
    v100 = v59;
    v101 = 2082;
    v102 = object_getClassName(self);
    v103 = 2082;
    v104 = sel_getName(a2);
    v105 = 1024;
    v106 = 319;
    v107 = 1024;
    LODWORD(v108) = objc_msgSend(v8, "status");
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i R-APDU Error: 0x%04x", buf, 0x28u);
  }

  v60 = objc_alloc((Class)NSError);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v91 = NSLocalizedDescriptionKey;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Commmand Error"));
  v92 = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
  v26 = objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 16, v63);

LABEL_38:
  return v26;
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  -[NFFelicaStateEvent addStateInfo:appletAID:](self->_felicaEvents, "addStateInfo:appletAID:", a3, a4);
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *appletRequiresEndOfTransactionProcessing;
  void *v13;
  NSMutableArray *appletChangedByTSM;
  void *v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *Name;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession _getSecureElementForAID:](self, "_getSecureElementForAID:", v7));

  if (-[_NFSecureElementManagerSession _activateSecureElementWrapper:](self, "_activateSecureElementWrapper:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));
    v10 = sub_10022F2F0(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (objc_msgSend(v11, "isTypeF") && (sub_10023B608(v8, v11) & 1) == 0)
    {
      appletRequiresEndOfTransactionProcessing = self->_appletRequiresEndOfTransactionProcessing;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));
      -[NSMutableArray addObject:](appletRequiresEndOfTransactionProcessing, "addObject:", v13);

      appletChangedByTSM = self->_appletChangedByTSM;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));
      -[NSMutableArray addObject:](appletChangedByTSM, "addObject:", v15);

    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v22, ClassName, Name, 343);
    }
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFSharedLogGetLogger(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(self);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      *(_DWORD *)buf = 67109890;
      v30 = v27;
      v31 = 2082;
      v32 = object_getClassName(self);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 343;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
    }

  }
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *appletChangedByTSM;
  void *v9;
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
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));

  if (v7)
  {
    appletChangedByTSM = self->_appletChangedByTSM;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletIdentifier"));
    -[NSMutableArray addObject:](appletChangedByTSM, "addObject:", v9);

  }
  else
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
      v12(3, "%c[%{public}s %{public}s]:%i NULL AID !", v16, ClassName, Name, 366);
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
      *(_DWORD *)buf = 67109890;
      v24 = v21;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 366;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NULL AID !", buf, 0x22u);
    }

  }
}

- (void)cleanup
{
  _NFSecureElementManagerSession *v2;
  uint64_t v3;
  NSObject *v4;
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
  const char *v17;
  const char *v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  id v22;
  void *i;
  void *v24;
  void *v25;
  _NFSecureElementManagerSession *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  BOOL v34;
  NSMutableArray *v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  void *v63;
  uint64_t v64;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *v66;
  _BOOL4 v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  void (*v93)(uint64_t, const char *, ...);
  objc_class *v94;
  const char *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  objc_class *v107;
  int v108;
  const char *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  NSObject *v119;
  void *v120;
  uint64_t v121;
  void (*v122)(uint64_t, const char *, ...);
  objc_class *v123;
  _BOOL4 v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  objc_class *v129;
  int v130;
  const char *v131;
  const char *v132;
  const char *v133;
  NSObject *v134;
  os_log_type_t v135;
  uint32_t v136;
  objc_class *v137;
  _BOOL4 v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  objc_class *v143;
  int v144;
  const char *v145;
  const char *v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  uint64_t v151;
  void *j;
  NSObject *v153;
  void *v154;
  uint64_t v155;
  void (*v156)(uint64_t, const char *, ...);
  objc_class *v157;
  _BOOL4 v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  NSObject *v162;
  objc_class *v163;
  int v164;
  const char *v165;
  const char *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  void *v171;
  id v172;
  uint64_t v173;
  NSObject *v174;
  const char *v175;
  const char *v176;
  const char *Name;
  const char *v178;
  const char *v179;
  const char *v180;
  const char *v181;
  const char *v182;
  const char *v183;
  id v184;
  void *v185;
  _BOOL4 v186;
  const char *v187;
  const char *v188;
  int v189;
  _NFSecureElementManagerSession *v190;
  id obj;
  id obja;
  NSMutableArray *objb;
  objc_super v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _QWORD v200[6];
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  uint8_t v206[128];
  uint8_t buf[4];
  _BYTE v208[24];
  __int16 v209;
  int v210;
  __int16 v211;
  NSObject *v212;
  __int16 v213;
  id v214;
  _BYTE v215[128];

  v2 = self;
  v3 = NFSharedSignpostLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementManagerSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](v2, "needsCleanup") && !-[_NFSession isSuspended](v2, "isSuspended"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v2);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v2);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 376);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(v2);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(v2);
      v18 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v208 = v16;
      *(_WORD *)&v208[4] = 2082;
      *(_QWORD *)&v208[6] = v17;
      *(_WORD *)&v208[14] = 2082;
      *(_QWORD *)&v208[16] = v18;
      v209 = 1024;
      v210 = 376;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v19 = v2->_appletRequiresEndOfTransactionProcessing;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v202, v215, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(id *)v203;
      v190 = v2;
      obj = *(id *)v203;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(id *)v203 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession _getSecureElementForAID:](v2, "_getSecureElementForAID:", v24));
          if (-[_NFSecureElementManagerSession _activateSecureElementWrapper:](v2, "_activateSecureElementWrapper:", v25))
          {
            v26 = v2;
            v27 = v21;
            v28 = sub_10022F2F0(v25, v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v201 = 0;
            v30 = sub_10023B324(v25, v29, &v201);
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            v32 = v201;
            v33 = v32;
            if (v31)
              v34 = v32 == 0;
            else
              v34 = 0;
            if (!v34)
            {
              v35 = v19;
              v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v37 = NFLogGetLogger(v36);
              if (v37)
              {
                v38 = (void (*)(uint64_t, const char *, ...))v37;
                v39 = object_getClass(v190);
                v40 = class_isMetaClass(v39);
                v41 = object_getClassName(v190);
                v178 = sel_getName(a2);
                v42 = 45;
                if (v40)
                  v42 = 43;
                v38(3, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", v42, v41, v178, 391, v33, v31);
              }
              v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v44 = NFSharedLogGetLogger(v43);
              v45 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                v46 = object_getClass(v190);
                if (class_isMetaClass(v46))
                  v47 = 43;
                else
                  v47 = 45;
                v48 = object_getClassName(v190);
                v49 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)v208 = v47;
                *(_WORD *)&v208[4] = 2082;
                *(_QWORD *)&v208[6] = v48;
                *(_WORD *)&v208[14] = 2082;
                *(_QWORD *)&v208[16] = v49;
                v209 = 1024;
                v210 = 391;
                v211 = 2114;
                v212 = v33;
                v213 = 2114;
                v214 = v31;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", buf, 0x36u);
              }

              v19 = v35;
              v26 = v190;
              v22 = obj;
            }

            v21 = v27;
            v2 = v26;
          }
          else
          {
            v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v51 = NFLogGetLogger(v50);
            if (v51)
            {
              v52 = (void (*)(uint64_t, const char *, ...))v51;
              v53 = object_getClass(v2);
              v54 = class_isMetaClass(v53);
              v55 = object_getClassName(v2);
              v179 = sel_getName(a2);
              v56 = 45;
              if (v54)
                v56 = 43;
              v52(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v56, v55, v179, 395);
            }
            v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v58 = NFSharedLogGetLogger(v57);
            v33 = objc_claimAutoreleasedReturnValue(v58);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v59 = object_getClass(v2);
              if (class_isMetaClass(v59))
                v60 = 43;
              else
                v60 = 45;
              v61 = object_getClassName(v2);
              v62 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v208 = v60;
              *(_WORD *)&v208[4] = 2082;
              *(_QWORD *)&v208[6] = v61;
              *(_WORD *)&v208[14] = 2082;
              *(_QWORD *)&v208[16] = v62;
              v209 = 1024;
              v210 = 395;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
            }
          }

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v202, v215, 16);
      }
      while (v21);
    }

    if (v2->_delayExpressMode > 0.0)
    {
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v64 = NFLogGetLogger(v63);
      if (v64)
      {
        v65 = (void (*)(uint64_t, const char *, ...))v64;
        v66 = object_getClass(v2);
        v67 = class_isMetaClass(v66);
        v68 = object_getClassName(v2);
        v180 = sel_getName(a2);
        v69 = 45;
        if (v67)
          v69 = 43;
        v65(6, "%c[%{public}s %{public}s]:%i Delaying express transit after transaction", v69, v68, v180, 400);
      }
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger(v70);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = object_getClass(v2);
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        v75 = object_getClassName(v2);
        v76 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v208 = v74;
        *(_WORD *)&v208[4] = 2082;
        *(_QWORD *)&v208[6] = v75;
        *(_WORD *)&v208[14] = 2082;
        *(_QWORD *)&v208[16] = v76;
        v209 = 1024;
        v210 = 400;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delaying express transit after transaction", buf, 0x22u);
      }

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession expressModeManager](v2, "expressModeManager"));
      sub_100043EE4(v77, v2->_delayExpressMode);

    }
    if (!-[_NFSecureElementManagerSession isDirty](v2, "isDirty"))
      goto LABEL_94;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));

    if (!v78)
      goto LABEL_94;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v80 = -[_NFSecureElementManagerSession _activateSecureElementWrapper:](v2, "_activateSecureElementWrapper:", v79);

    if (!v80)
      goto LABEL_94;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "handle"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "info"));

    v84 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    objc_msgSend(v84, "refreshSecureElementInfo");

    v85 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v86 = sub_10022BED0(v85);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v88 = sub_1002390B4(v87);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v90 = objc_msgSend(v89, "refreshISDCounter");

    if (objc_msgSend(v83, "migrationState") == (id)1
      || objc_msgSend(v83, "migrationContext") != (id)4 && objc_msgSend(v83, "migrationContext") != (id)5)
    {
LABEL_93:

LABEL_94:
      v148 = (void *)objc_claimAutoreleasedReturnValue(-[NFFelicaStateEvent asDictionary](v2->_felicaEvents, "asDictionary"));
      v200[0] = _NSConcreteStackBlock;
      v200[1] = 3221225472;
      v200[2] = sub_10015584C;
      v200[3] = &unk_1002E9750;
      v200[4] = v2;
      v200[5] = a2;
      v185 = v148;
      objc_msgSend(v148, "enumerateKeysAndObjectsUsingBlock:", v200);
      v198 = 0u;
      v199 = 0u;
      v196 = 0u;
      v197 = 0u;
      objb = v2->_appletChangedByTSM;
      v149 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
      if (v149)
      {
        v150 = v149;
        v151 = *(_QWORD *)v197;
        do
        {
          for (j = 0; j != v150; j = (char *)j + 1)
          {
            if (*(_QWORD *)v197 != v151)
              objc_enumerationMutation(objb);
            v153 = *(NSObject **)(*((_QWORD *)&v196 + 1) + 8 * (_QWORD)j);
            v154 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v155 = NFLogGetLogger(v154);
            if (v155)
            {
              v156 = (void (*)(uint64_t, const char *, ...))v155;
              v157 = object_getClass(v2);
              v158 = class_isMetaClass(v157);
              v176 = object_getClassName(v2);
              v183 = sel_getName(a2);
              v159 = 45;
              if (v158)
                v159 = 43;
              v156(6, "%c[%{public}s %{public}s]:%i TSM update notification for AID %{public}@", v159, v176, v183, 445, v153);
            }
            v160 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v161 = NFSharedLogGetLogger(v160);
            v162 = objc_claimAutoreleasedReturnValue(v161);
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
            {
              v163 = object_getClass(v2);
              if (class_isMetaClass(v163))
                v164 = 43;
              else
                v164 = 45;
              v165 = object_getClassName(v2);
              v166 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)v208 = v164;
              *(_WORD *)&v208[4] = 2082;
              *(_QWORD *)&v208[6] = v165;
              *(_WORD *)&v208[14] = 2082;
              *(_QWORD *)&v208[16] = v166;
              v209 = 1024;
              v210 = 445;
              v211 = 2114;
              v212 = v153;
              _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TSM update notification for AID %{public}@", buf, 0x2Cu);
            }

            v167 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
            sub_1000EC8E8(v167, (uint64_t)"com.apple.stockholm.se.update.by.tsm", v153);

            v169 = NFSharedSignpostLog(v168);
            v170 = objc_claimAutoreleasedReturnValue(v169);
            if (os_signpost_enabled(v170))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v208 = "com.apple.stockholm.se.update.by.tsm";
              *(_WORD *)&v208[8] = 2112;
              *(_QWORD *)&v208[10] = v153;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v170, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UPDATE_BY_TSM_NOTIFICATION", "%s, aid: %@", buf, 0x16u);
            }

          }
          v150 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
        }
        while (v150);
      }

      if (v2->_scriptExecuted)
      {
        v171 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
        sub_1000EC8E8(v171, (uint64_t)"com.apple.stockholm.tsm.script.executed", 0);

      }
      goto LABEL_115;
    }
    obja = v83;
    v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v92 = NFLogGetLogger(v91);
    if (v92)
    {
      v93 = (void (*)(uint64_t, const char *, ...))v92;
      v94 = object_getClass(v2);
      v186 = class_isMetaClass(v94);
      v188 = object_getClassName(v2);
      v95 = sel_getName(a2);
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "handle"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "info"));
      v99 = objc_msgSend(v98, "migrationState");
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "handle"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "info"));
      v184 = objc_msgSend(v102, "migrationContext");
      v103 = 45;
      if (v186)
        v103 = 43;
      v93(4, "%c[%{public}s %{public}s]:%i Recovering slam in state %lu context %lu", v103, v188, v95, 420, v99, v184);

    }
    v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v105 = NFSharedLogGetLogger(v104);
    v106 = objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      v107 = object_getClass(v2);
      if (class_isMetaClass(v107))
        v108 = 43;
      else
        v108 = 45;
      v189 = v108;
      v187 = object_getClassName(v2);
      v109 = sel_getName(a2);
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "handle"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "info"));
      v113 = objc_msgSend(v112, "migrationState");
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "handle"));
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "info"));
      v117 = objc_msgSend(v116, "migrationContext");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v208 = v189;
      *(_WORD *)&v208[4] = 2082;
      *(_QWORD *)&v208[6] = v187;
      *(_WORD *)&v208[14] = 2082;
      *(_QWORD *)&v208[16] = v109;
      v209 = 1024;
      v210 = 420;
      v211 = 2048;
      v212 = v113;
      v213 = 2048;
      v214 = v117;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Recovering slam in state %lu context %lu", buf, 0x36u);

    }
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureElementManagerSession embeddedSecureElementWrapper](v2, "embeddedSecureElementWrapper"));
    v119 = objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "recoverSLAM"));

    v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v121 = NFLogGetLogger(v120);
    v122 = (void (*)(uint64_t, const char *, ...))v121;
    if (v119)
    {
      if (v121)
      {
        v123 = object_getClass(v2);
        v124 = class_isMetaClass(v123);
        v175 = object_getClassName(v2);
        v181 = sel_getName(a2);
        v125 = 45;
        if (v124)
          v125 = 43;
        v122(3, "%c[%{public}s %{public}s]:%i Failed to recover SLAM? %{public}@", v125, v175, v181, 423, v119);
      }
      v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v127 = NFSharedLogGetLogger(v126);
      v128 = objc_claimAutoreleasedReturnValue(v127);
      if (!os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        goto LABEL_92;
      v129 = object_getClass(v2);
      if (class_isMetaClass(v129))
        v130 = 43;
      else
        v130 = 45;
      v131 = object_getClassName(v2);
      v132 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v208 = v130;
      *(_WORD *)&v208[4] = 2082;
      *(_QWORD *)&v208[6] = v131;
      *(_WORD *)&v208[14] = 2082;
      *(_QWORD *)&v208[16] = v132;
      v209 = 1024;
      v210 = 423;
      v211 = 2114;
      v212 = v119;
      v133 = "%c[%{public}s %{public}s]:%i Failed to recover SLAM? %{public}@";
      v134 = v128;
      v135 = OS_LOG_TYPE_ERROR;
      v136 = 44;
    }
    else
    {
      if (v121)
      {
        v137 = object_getClass(v2);
        v138 = class_isMetaClass(v137);
        v139 = object_getClassName(v2);
        v182 = sel_getName(a2);
        v140 = 45;
        if (v138)
          v140 = 43;
        v122(6, "%c[%{public}s %{public}s]:%i SLAM Recovery successful", v140, v139, v182, 425);
      }
      v141 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v142 = NFSharedLogGetLogger(v141);
      v128 = objc_claimAutoreleasedReturnValue(v142);
      if (!os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        goto LABEL_92;
      v143 = object_getClass(v2);
      if (class_isMetaClass(v143))
        v144 = 43;
      else
        v144 = 45;
      v145 = object_getClassName(v2);
      v146 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v208 = v144;
      *(_WORD *)&v208[4] = 2082;
      *(_QWORD *)&v208[6] = v145;
      *(_WORD *)&v208[14] = 2082;
      *(_QWORD *)&v208[16] = v146;
      v209 = 1024;
      v210 = 425;
      v133 = "%c[%{public}s %{public}s]:%i SLAM Recovery successful";
      v134 = v128;
      v135 = OS_LOG_TYPE_DEFAULT;
      v136 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v134, v135, v133, buf, v136);
LABEL_92:

    v147 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    objc_msgSend(v147, "refreshSecureElementInfo");

    v83 = obja;
    goto LABEL_93;
  }
LABEL_115:
  v195.receiver = v2;
  v195.super_class = (Class)_NFSecureElementManagerSession;
  v172 = -[_NFSession cleanup](&v195, "cleanup");
  v173 = NFSharedSignpostLog(v172);
  v174 = objc_claimAutoreleasedReturnValue(v173);
  if (os_signpost_enabled(v174))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v174, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureElementManagerSession", buf, 2u);
  }

}

- (void)stateInformationWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, id);
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
  void *v28;
  const __CFString *v29;
  void *v30;
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

  v5 = (void (**)(id, _QWORD, id))a3;
  if (-[_NFSession didStart](self, "didStart")
    && !-[_NFSession isSuspended](self, "isSuspended")
    && !-[_NFSession didEnd](self, "didEnd"))
  {
    v29 = CFSTR("version");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    v30 = v28;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));

    -[_NFSecureElementManagerSession stateInformationWithRedirectInfo:completion:](self, "stateInformationWithRedirectInfo:completion:", v24, v5);
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
    v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 465, v13);

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
    v34 = v19;
    v35 = 2082;
    v36 = v20;
    v37 = 2082;
    v38 = v21;
    v39 = 1024;
    v40 = 465;
    v41 = 2114;
    v42 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

  }
  if (v5)
  {
    v23 = objc_alloc((Class)NSError);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v31 = NSLocalizedDescriptionKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Session not active"));
    v32 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 54, v26);
    v5[2](v5, 0, v27);

LABEL_15:
  }

}

- (void)stateInformationWithRedirectInfo:(id)a3 completion:(id)a4
{
  -[_NFSecureElementManagerSession stateInformationWithRedirectInfo:appletFiltering:completion:](self, "stateInformationWithRedirectInfo:appletFiltering:completion:", a3, 1, a4);
}

- (void)stateInformationWithRedirectInfo:(id)a3 appletFiltering:(BOOL)a4 completion:(id)a5
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
  BOOL v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100155E7C;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  block[4] = self;
  v16 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)signChallenge:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001567E4;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)signChallenge:(id)a3 useOSVersion:(BOOL)a4 completion:(id)a5
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
  BOOL v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100157314;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  v19 = a4;
  block[4] = self;
  v16 = v9;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)signChallenge:(id)a3 forAID:(id)a4 completion:(id)a5
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
  v22.super_class = (Class)_NFSecureElementManagerSession;
  v12 = -[_NFSession workQueue](&v22, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100158160;
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

- (void)getSignedPlatformDataForSeid:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100158F1C;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001595E4;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)deleteApplets:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100159A78;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)deleteAllAppletsWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015A40C;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)transceive:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  int64_t v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_NFSecureElementManagerSession;
  v14 = -[_NFSession workQueue](&v25, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10015B25C;
  v19[3] = &unk_1002E9778;
  v19[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v23 = a2;
  v24 = a5;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  dispatch_async(v15, v19);

}

- (void)transceiveMultiple:(id)a3 forSEID:(id)a4 toOS:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  int64_t v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_NFSecureElementManagerSession;
  v14 = -[_NFSession workQueue](&v25, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10015B73C;
  v19[3] = &unk_1002E9778;
  v19[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v23 = a2;
  v24 = a5;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  dispatch_async(v15, v19);

}

- (void)execRemoteAdminScript:(id)a3 params:(id)a4 completion:(id)a5
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
  v22.super_class = (Class)_NFSecureElementManagerSession;
  v12 = -[_NFSession workQueue](&v22, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D660;
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

- (void)refreshSecureElement:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015F228;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)validateSEPairingsWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015FA24;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)didExitRestrictedMode:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016016C;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)getCryptogramWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100160548;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)setExpressPassConfig:(id)a3 restoreAuthorization:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  SEL v20;
  BOOL v21;
  objc_super v22;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  v11 = NFSharedSignpostLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:setExpressPassConfig", "in", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)_NFSecureElementManagerSession;
  v13 = -[_NFSession workQueue](&v22, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100160D78;
  block[3] = &unk_1002E8410;
  v19 = v10;
  v20 = a2;
  block[4] = self;
  v18 = v9;
  v21 = a4;
  v15 = v9;
  v16 = v10;
  dispatch_async(v14, block);

}

- (void)getExpressPassConfigWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100161508;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)setExpressModesControlState:(int64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  OS_dispatch_queue *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  int64_t v16;
  objc_super v17;
  uint8_t buf[16];

  v7 = a4;
  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:setExpressModesControlState", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v10 = -[_NFSession workQueue](&v17, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100161BE0;
  v13[3] = &unk_1002E6638;
  v13[4] = self;
  v14 = v7;
  v15 = a2;
  v16 = a3;
  v12 = v7;
  dispatch_async(v11, v13);

}

- (void)restoreAuthorizationForAllAppletsExcept:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:restoreAuthorizationForAllAppletsExcept", "in", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v19, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100162998;
  v15[3] = &unk_1002E6268;
  v17 = v8;
  v18 = a2;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)restoreAuthorizarionForKeys:(id)a3 onApplet:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  objc_super v24;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NFSharedSignpostLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:restoreAuthorizarionForKeys", "in", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFSecureElementManagerSession;
  v14 = -[_NFSession workQueue](&v24, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100163400;
  block[3] = &unk_1002E6240;
  v22 = v11;
  v23 = a2;
  block[4] = self;
  v20 = v9;
  v21 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  dispatch_async(v15, block);

}

- (void)disableAuthorizationForApplets:(id)a3 andKey:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, id);
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  OS_dispatch_queue *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  void (**v39)(id, id);
  SEL v40;
  objc_super v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _BYTE v49[128];

  v11 = a3;
  v34 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v18);
        v20 = objc_opt_class(NFApplet);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
        {
          if (v13)
          {
            v27 = objc_alloc((Class)NSError);
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
            v47[0] = NSLocalizedDescriptionKey;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
            v48[0] = v29;
            v48[1] = &off_1002FFF00;
            v47[1] = CFSTR("Line");
            v47[2] = CFSTR("Method");
            v30 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
            v48[2] = v30;
            v47[3] = NSDebugDescriptionErrorKey;
            v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1494);
            v48[3] = v31;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 4));
            v33 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 12, v32);
            v13[2](v13, v33);

          }
          v26 = v34;
          goto LABEL_15;
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = NFSharedSignpostLog(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:disableAuthorizationForApplets", "in", buf, 2u);
  }

  v41.receiver = self;
  v41.super_class = (Class)_NFSecureElementManagerSession;
  v24 = -[_NFSession workQueue](&v41, "workQueue");
  v25 = objc_claimAutoreleasedReturnValue(v24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100163F80;
  block[3] = &unk_1002E89F8;
  block[4] = self;
  v40 = a2;
  v39 = v13;
  v36 = v14;
  v26 = v34;
  v37 = v34;
  v38 = v12;
  dispatch_async(v25, block);

LABEL_15:
}

- (void)disableAuthorizationForPasses:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  objc_super v24;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NFSharedSignpostLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:disableAuthorizationForPasses", "in", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)_NFSecureElementManagerSession;
  v14 = -[_NFSession workQueue](&v24, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164B58;
  block[3] = &unk_1002E6240;
  v22 = v11;
  v23 = a2;
  block[4] = self;
  v20 = v9;
  v21 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  dispatch_async(v15, block);

}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getFelicaAppletState", "in", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v19, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001656D4;
  v15[3] = &unk_1002E6268;
  v17 = v8;
  v18 = a2;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getTransitAppletState", "in", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v19, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100166138;
  v15[3] = &unk_1002E6268;
  v17 = v8;
  v18 = a2;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)getServiceProviderDataForApplet:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  OS_dispatch_queue *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  SEL v28;
  objc_super v29;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = NFSharedSignpostLog(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SEMSession:getServiceProviderDataForApplet", "in", buf, 2u);
  }

  v29.receiver = self;
  v29.super_class = (Class)_NFSecureElementManagerSession;
  v17 = -[_NFSession workQueue](&v29, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100166A98;
  v23[3] = &unk_1002E89F8;
  v27 = v14;
  v28 = a2;
  v23[4] = self;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v22 = v14;
  dispatch_async(v18, v23);

}

- (void)getAndResetLPEMCounterWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167180;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)expressModesInfoWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167958;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)performPeerPaymentEnrollment:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100167FF0;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)powerCycleSEID:(id)a3 completion:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100168824;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)getAttackCounterLogForSEID:(id)a3 acknowledgeLogs:(BOOL)a4 completion:(id)a5
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
  BOOL v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168ECC;
  block[3] = &unk_1002E8410;
  v17 = v10;
  v18 = a2;
  block[4] = self;
  v16 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)getAttackLogPresence:(id)a3 callback:(id)a4
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
  v17.super_class = (Class)_NFSecureElementManagerSession;
  v9 = -[_NFSession workQueue](&v17, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016988C;
  v13[3] = &unk_1002E6268;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)dumpDomain:(unsigned __int8)a3 forSEID:(id)a4 completion:(id)a5
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
  v20.super_class = (Class)_NFSecureElementManagerSession;
  v11 = -[_NFSession workQueue](&v20, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A014;
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

- (void)getOSUpdateLogWithCompletion:(id)a3
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
  v12.super_class = (Class)_NFSecureElementManagerSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A5A4;
  block[3] = &unk_1002E5D28;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDriverWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
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
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_appletChangedByTSM, 0);
  objc_storeStrong((id *)&self->_appletRequiresEndOfTransactionProcessing, 0);
  objc_storeStrong((id *)&self->_felicaEvents, 0);
}

@end
