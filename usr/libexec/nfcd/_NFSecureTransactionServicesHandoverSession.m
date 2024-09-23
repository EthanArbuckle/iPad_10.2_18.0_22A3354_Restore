@implementation _NFSecureTransactionServicesHandoverSession

- (BOOL)willStartSession
{
  STSHelperLibrary *v3;
  objc_super v5;

  v3 = objc_opt_new(STSHelperLibrary);
  sub_100058658((uint64_t)self, v3);

  v5.receiver = self;
  v5.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  return -[_NFSession willStartSession](&v5, "willStartSession");
}

- (void)endSession:(id)a3
{
  STSHelperLibrary *stsHelper;
  id v5;
  objc_super v6;

  if (self)
    stsHelper = self->_stsHelper;
  else
    stsHelper = 0;
  v5 = a3;
  -[STSHelperLibrary invalidate](stsHelper, "invalidate");
  sub_100058658((uint64_t)self, 0);
  v6.receiver = self;
  v6.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  -[_NFXPCSession endSession:](&v6, "endSession:", v5);

}

- (void)startSTSNotificationListenerEndpoint:(id)a3
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
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  STSHelperLibrary *stsHelper;
  id v36;
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
  void *v47;

  v5 = a3;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
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
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 102, v13);

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
      v39 = v19;
      v40 = 2082;
      v41 = v20;
      v42 = 2082;
      v43 = v21;
      v44 = 1024;
      v45 = 102;
      v46 = 2114;
      v47 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
  }
  else
  {
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFLogGetLogger(v23);
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(self);
      v37 = sel_getName(a2);
      v29 = 45;
      if (v27)
        v29 = 43;
      v25(6, "%c[%{public}s %{public}s]:%i ", v29, v28, v37, 105);
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
      *(_DWORD *)buf = 67109890;
      v39 = v34;
      v40 = 2082;
      v41 = object_getClassName(self);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 105;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    if (self)
      stsHelper = self->_stsHelper;
    else
      stsHelper = 0;
    v36 = -[STSHelperLibrary connectToNotificationListener:](stsHelper, "connectToNotificationListener:", v5);
  }

}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  _QWORD v6[6];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100058AA8;
  v6[3] = &unk_1002E5F60;
  v6[4] = self;
  v6[5] = a2;
  v4 = sub_100058C3C(self, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "fieldChange:", v3);

}

- (void)handleFieldNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  _NFSecureTransactionServicesHandoverSession *v11;
  SEL v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100058D18;
  v10 = &unk_1002E5F60;
  v11 = self;
  v12 = a2;
  v4 = a3;
  v5 = sub_100058C3C(self, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "fieldNotification:", v4, v7, v8, v9, v10, v11, v12);

}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  id v9;
  NFTNEPHandler *tnepHandler;
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
  const char *v23;
  const char *v24;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v4 = a3;
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[_NFSession signpostId](self, "signpostId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "ReaderDetected", ", buf, 2u);
    }
  }

  v9 = v4;
  if (self)
  {
    tnepHandler = self->_tnepHandler;
    if (tnepHandler)
    {
      sub_10023B7E0((uint64_t)tnepHandler, v9);
    }
    else
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName("startHCEProcessingWithDevice:completion:");
        v17 = 45;
        if (isMetaClass)
          v17 = 43;
        v13(3, "%c[%{public}s %{public}s]:%i Missing tnepHandler", v17, ClassName, Name, 802);
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
        v23 = object_getClassName(self);
        v24 = sel_getName("startHCEProcessingWithDevice:completion:");
        *(_DWORD *)buf = 67109890;
        v27 = v22;
        v28 = 2082;
        v29 = v23;
        v30 = 2082;
        v31 = v24;
        v32 = 1024;
        v33 = 802;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing tnepHandler", buf, 0x22u);
      }

    }
  }

}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *driverWrapper;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  NFTNEPHandler *v18;
  unint64_t role;
  NFDriverWrapper *v20;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    goto LABEL_10;
  v7 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagA"));
      if (v10)
      {

LABEL_13:
        v6 = v9;

        if (!v6)
          goto LABEL_24;
        if (self)
        {
          driverWrapper = self->_driverWrapper;
          if (driverWrapper)
          {
            driverWrapper = (void *)sub_10017E9A4(driverWrapper, v6, 0);
            if ((_DWORD)driverWrapper)
              goto LABEL_25;
          }
        }
        v14 = NFSharedSignpostLog(driverWrapper);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = -[_NFSession signpostId](self, "signpostId");
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v17 = v16;
          if (os_signpost_enabled(v15))
          {
            *(_WORD *)v21 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, v17, "TargetTagDetected", ", v21, 2u);
          }
        }

        if (self)
        {
          objc_storeStrong((id *)&self->_connectedTag, v9);
          v18 = self->_tnepHandler;
          if (v18)
          {
            role = self->_role;
            if (role == 4)
            {

LABEL_29:
              sub_10023B858((id *)&self->_tnepHandler->super.isa, self->_connectedTag);
              goto LABEL_27;
            }

            if (role == 1)
              goto LABEL_29;
          }
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NFSecureTransactionServicesHandoverSession.m"), 192, CFSTR("Tag not handle!"));
        goto LABEL_11;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagB"));

      if (v11)
        goto LABEL_13;
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
      continue;
    break;
  }
LABEL_10:
  v12 = v5;
LABEL_11:

LABEL_24:
  if (self)
LABEL_25:
    v20 = self->_driverWrapper;
  else
    v20 = 0;
  sub_1001FBF60(v20);
LABEL_27:

}

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
      v9(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v13, ClassName, Name, 203);
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
      v36 = 203;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v28[0] = v21;
    v28[1] = &off_1002FDF38;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v28[2] = v22;
    v27[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 204);
    v28[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    v6 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v24);

  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode");
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t role;
  void *v11;
  unsigned __int8 v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  STSHelperLibrary *stsHelper;
  id v28;
  uint64_t v29;
  NSObject *v30;
  const char *Name;
  objc_super v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup") && !-[_NFSession isSuspended](self, "isSuspended"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
    v8 = objc_msgSend(v6, "setRoutingConfig:", v7);

    if (self)
    {
      role = self->_role;
      if (role == 4 || role == 1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
        v12 = objc_msgSend(v11, "configureECPPolling:", 0);

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
            v19 = 45;
            if (isMetaClass)
              v19 = 43;
            v15(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v19, ClassName, Name, 224);
          }
          v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v21 = NFSharedLogGetLogger(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = object_getClass(self);
            if (class_isMetaClass(v23))
              v24 = 43;
            else
              v24 = 45;
            v25 = object_getClassName(self);
            v26 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v34 = v24;
            v35 = 2082;
            v36 = v25;
            v37 = 2082;
            v38 = v26;
            v39 = 1024;
            v40 = 224;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
          }

        }
      }
      stsHelper = self->_stsHelper;
    }
    else
    {
      stsHelper = 0;
    }
    -[STSHelperLibrary invalidate](stsHelper, "invalidate");
  }
  v32.receiver = self;
  v32.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  v28 = -[_NFSession cleanup](&v32, "cleanup");
  v29 = NFSharedSignpostLog(v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }

}

- (void)didStartSession:(id)a3
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  STSHelperLibrary *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  unint64_t v35;
  os_signpost_id_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  unint64_t v40;
  os_signpost_id_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  unint64_t v45;
  os_signpost_id_t v46;
  const char *v47;
  NSObject *v48;
  os_signpost_type_t v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  unint64_t v67;
  os_signpost_id_t v68;
  STSHelperLibrary *stsHelper;
  STSHelperLibrary *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  unint64_t v76;
  os_signpost_id_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  objc_class *v89;
  int v90;
  const char *v91;
  const char *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  uint64_t v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  _BOOL4 v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  unint64_t v117;
  os_signpost_id_t v118;
  const char *v119;
  NSObject *v120;
  os_signpost_type_t v121;
  void *specific;
  uint64_t Logger;
  void (*v124)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  NSObject *v131;
  objc_class *v132;
  int v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  NSObject *v140;
  unint64_t v141;
  os_signpost_id_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  void *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *Name;
  _QWORD v153[5];
  _QWORD *v154;
  _QWORD *v155;
  SEL v156;
  _QWORD v157[5];
  _QWORD *v158;
  _QWORD *v159;
  SEL v160;
  _QWORD v161[6];
  _QWORD v162[6];
  objc_super v163;
  _QWORD v164[4];
  _QWORD v165[4];
  void *v166;
  uint8_t buf[4];
  _BYTE v168[14];
  __int16 v169;
  const char *v170;
  __int16 v171;
  int v172;
  __int16 v173;
  uint64_t v174;

  v5 = a3;
  v163.receiver = self;
  v163.super_class = (Class)_NFSecureTransactionServicesHandoverSession;
  -[_NFSession didStartSession:](&v163, "didStartSession:", v5);
  v162[0] = _NSConcreteStackBlock;
  v162[1] = 3221225472;
  v162[2] = sub_10005AA28;
  v162[3] = &unk_1002E5F60;
  v162[4] = self;
  v162[5] = a2;
  v6 = objc_retainBlock(v162);
  v161[0] = _NSConcreteStackBlock;
  v161[1] = 3221225472;
  v161[2] = sub_10005ADD0;
  v161[3] = &unk_1002E5C30;
  v161[4] = self;
  v161[5] = a2;
  v7 = objc_retainBlock(v161);
  if (!v5)
  {
    if (self)
    {
      switch(self->_role)
      {
        case 0uLL:
          goto LABEL_28;
        case 1uLL:
        case 4uLL:
          v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269A3A, 6);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
          objc_msgSend(v9, "configureECPPolling:", v8);

          if (self->_role != 1)
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v124 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v128 = 45;
              if (isMetaClass)
                v128 = 43;
              v124(6, "%c[%{public}s %{public}s]:%i Starting TNEP reader", v128, ClassName, Name, 301);
            }
            v129 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v130 = NFSharedLogGetLogger(v129);
            v131 = objc_claimAutoreleasedReturnValue(v130);
            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
            {
              v132 = object_getClass(self);
              if (class_isMetaClass(v132))
                v133 = 43;
              else
                v133 = 45;
              v134 = object_getClassName(self);
              v135 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v168 = v133;
              *(_WORD *)&v168[4] = 2082;
              *(_QWORD *)&v168[6] = v134;
              v169 = 2082;
              v170 = v135;
              v171 = 1024;
              v172 = 301;
              _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP reader", buf, 0x22u);
            }

            v137 = NFSharedSignpostLog(v136);
            v44 = objc_claimAutoreleasedReturnValue(v137);
            v138 = -[_NFSession signpostId](self, "signpostId");
            if (v138 - 1 > 0xFFFFFFFFFFFFFFFDLL)
              goto LABEL_82;
            v46 = v138;
            if (!os_signpost_enabled(v44))
              goto LABEL_82;
            *(_WORD *)buf = 0;
            v47 = "Start_TNEP_Reader";
            v48 = v44;
            v49 = OS_SIGNPOST_EVENT;
            goto LABEL_81;
          }
          v10 = sub_10005AFD8((uint64_t)self);
          v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v12 = NFLogGetLogger(v11);
          if (v12)
          {
            v13 = (void (*)(uint64_t, const char *, ...))v12;
            v14 = object_getClass(self);
            v15 = class_isMetaClass(v14);
            v147 = object_getClassName(self);
            v148 = sel_getName(a2);
            v16 = 45;
            if (v15)
              v16 = 43;
            v13(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", v16, v147, v148, 284, v10);
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
            v22 = object_getClassName(self);
            v23 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v168 = v21;
            *(_WORD *)&v168[4] = 2082;
            *(_QWORD *)&v168[6] = v22;
            v169 = 2082;
            v170 = v23;
            v171 = 1024;
            v172 = 284;
            v173 = 2048;
            v174 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", buf, 0x2Cu);
          }

          v25 = NFSharedSignpostLog(v24);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          v27 = -[_NFSession signpostId](self, "signpostId");
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v28 = v27;
            if (os_signpost_enabled(v26))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "Start_ISO18013_Reader", ", buf, 2u);
            }
          }

          v29 = self->_stsHelper;
          v30 = -[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:](v29, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", v10, sub_10005B19C((uint64_t)self), self);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

          v33 = NFSharedSignpostLog(v32);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          v35 = -[_NFSession signpostId](self, "signpostId");
          if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v36 = v35;
            if (os_signpost_enabled(v34))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v168 = v31;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v36, "Start_ISO18013_Reader", "error=%@", buf, 0xCu);
            }
          }

          if (!v31)
          {
            v38 = NFSharedSignpostLog(v37);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            v40 = -[_NFSession signpostId](self, "signpostId");
            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v41 = v40;
              if (os_signpost_enabled(v39))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v41, "Start_SEProxyListener", ", buf, 2u);
              }
            }

            sub_100059964((uint64_t)self);
            v43 = NFSharedSignpostLog(v42);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            v45 = -[_NFSession signpostId](self, "signpostId");
            if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL)
              goto LABEL_82;
            v46 = v45;
            if (!os_signpost_enabled(v44))
              goto LABEL_82;
            *(_WORD *)buf = 0;
            v47 = "Start_SEProxyListener";
            v48 = v44;
            v49 = OS_SIGNPOST_INTERVAL_END;
LABEL_81:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, v49, v46, v47, "", buf, 2u);
LABEL_82:

            v157[0] = _NSConcreteStackBlock;
            v157[1] = 3221225472;
            v157[2] = sub_10005B23C;
            v157[3] = &unk_1002E61C8;
            v157[4] = self;
            v160 = a2;
            v158 = v6;
            v159 = v7;
            sub_10005B588((uint64_t)self, v157);

            goto LABEL_92;
          }
          break;
        case 3uLL:
          v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v101 = NFLogGetLogger(v100);
          if (v101)
          {
            v102 = (void (*)(uint64_t, const char *, ...))v101;
            v103 = object_getClass(self);
            v104 = class_isMetaClass(v103);
            v105 = object_getClassName(self);
            v151 = sel_getName(a2);
            v106 = 45;
            if (v104)
              v106 = 43;
            v102(6, "%c[%{public}s %{public}s]:%i Starting TNEP device", v106, v105, v151, 331);
          }
          v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v108 = NFSharedLogGetLogger(v107);
          v109 = objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            v110 = object_getClass(self);
            if (class_isMetaClass(v110))
              v111 = 43;
            else
              v111 = 45;
            v112 = object_getClassName(self);
            v113 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v168 = v111;
            *(_WORD *)&v168[4] = 2082;
            *(_QWORD *)&v168[6] = v112;
            v169 = 2082;
            v170 = v113;
            v171 = 1024;
            v172 = 331;
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP device", buf, 0x22u);
          }

          v115 = NFSharedSignpostLog(v114);
          v116 = objc_claimAutoreleasedReturnValue(v115);
          v117 = -[_NFSession signpostId](self, "signpostId");
          if (v117 - 1 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_90;
          v118 = v117;
          if (!os_signpost_enabled(v116))
            goto LABEL_90;
          *(_WORD *)buf = 0;
          v119 = "Start_TNEP_Device";
          v120 = v116;
          v121 = OS_SIGNPOST_EVENT;
          goto LABEL_89;
        default:
          v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v80 = NFLogGetLogger(v79);
          if (v80)
          {
            v81 = (void (*)(uint64_t, const char *, ...))v80;
            v82 = object_getClass(self);
            v83 = class_isMetaClass(v82);
            v84 = object_getClassName(self);
            v150 = sel_getName(a2);
            v85 = 45;
            if (v83)
              v85 = 43;
            v81(3, "%c[%{public}s %{public}s]:%i Invalid command", v85, v84, v150, 350);
          }
          v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v87 = NFSharedLogGetLogger(v86);
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v89 = object_getClass(self);
            if (class_isMetaClass(v89))
              v90 = 43;
            else
              v90 = 45;
            v91 = object_getClassName(self);
            v92 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v168 = v90;
            *(_WORD *)&v168[4] = 2082;
            *(_QWORD *)&v168[6] = v91;
            v169 = 2082;
            v170 = v92;
            v171 = 1024;
            v172 = 350;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid command", buf, 0x22u);
          }

          v93 = objc_alloc((Class)NSError);
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v164[0] = NSLocalizedDescriptionKey;
          v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Command"));
          v165[0] = v95;
          v165[1] = &off_1002FDF80;
          v164[1] = CFSTR("Line");
          v164[2] = CFSTR("Method");
          v96 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v165[2] = v96;
          v164[3] = NSDebugDescriptionErrorKey;
          v97 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 351);
          v165[3] = v97;
          v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v165, v164, 4));
          v99 = objc_msgSend(v93, "initWithDomain:code:userInfo:", v94, 11, v98);
          ((void (*)(_QWORD *, id))v6[2])(v6, v99);

          goto LABEL_92;
      }
    }
    else
    {
LABEL_28:
      v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFLogGetLogger(v50);
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(self);
        v54 = class_isMetaClass(v53);
        v55 = object_getClassName(self);
        v149 = sel_getName(a2);
        v56 = 45;
        if (v54)
          v56 = 43;
        v52(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", v56, v55, v149, 315);
      }
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger(v57);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = object_getClass(self);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v168 = v61;
        *(_WORD *)&v168[4] = 2082;
        *(_QWORD *)&v168[6] = v62;
        v169 = 2082;
        v170 = v63;
        v171 = 1024;
        v172 = 315;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", buf, 0x22u);
      }

      v65 = NFSharedSignpostLog(v64);
      v66 = objc_claimAutoreleasedReturnValue(v65);
      v67 = -[_NFSession signpostId](self, "signpostId");
      if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v68 = v67;
        if (os_signpost_enabled(v66))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_BEGIN, v68, "Start_ISO18013_Device", ", buf, 2u);
        }
      }

      if (self)
        stsHelper = self->_stsHelper;
      else
        stsHelper = 0;
      v70 = stsHelper;
      v71 = sub_10005AFD8((uint64_t)self);
      v72 = -[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:](v70, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", v71, sub_10005B19C((uint64_t)self), self);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v72);

      v74 = NFSharedSignpostLog(v73);
      v75 = objc_claimAutoreleasedReturnValue(v74);
      v76 = -[_NFSession signpostId](self, "signpostId");
      if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v77 = v76;
        if (os_signpost_enabled(v75))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v168 = v31;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v75, OS_SIGNPOST_INTERVAL_END, v77, "Start_ISO18013_Device", "error=%@", buf, 0xCu);
        }
      }

      if (!v31)
      {
        v139 = NFSharedSignpostLog(v78);
        v140 = objc_claimAutoreleasedReturnValue(v139);
        v141 = -[_NFSession signpostId](self, "signpostId");
        if (v141 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v142 = v141;
          if (os_signpost_enabled(v140))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v140, OS_SIGNPOST_INTERVAL_BEGIN, v142, "Start_SEProxyListener", ", buf, 2u);
          }
        }

        sub_100059964((uint64_t)self);
        v144 = NFSharedSignpostLog(v143);
        v116 = objc_claimAutoreleasedReturnValue(v144);
        v145 = -[_NFSession signpostId](self, "signpostId");
        if (v145 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v118 = v145;
          if (os_signpost_enabled(v116))
          {
            *(_WORD *)buf = 0;
            v119 = "Start_SEProxyListener";
            v120 = v116;
            v121 = OS_SIGNPOST_INTERVAL_END;
LABEL_89:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v120, v121, v118, v119, "", buf, 2u);
          }
        }
LABEL_90:

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NFTNEPService serviceWithURI:minWaitTime:maxWaitTimeExtension:maxMessageSize:](NFTNEPService, "serviceWithURI:minWaitTime:maxWaitTimeExtension:maxMessageSize:", CFSTR("urn:nfc:sn:handover"), 20, 31, 2048));
        v166 = v31;
        v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v166, 1));
        v153[0] = _NSConcreteStackBlock;
        v153[1] = 3221225472;
        v153[2] = sub_10005B80C;
        v153[3] = &unk_1002E61C8;
        v153[4] = self;
        v156 = a2;
        v154 = v6;
        v155 = v7;
        sub_10005BB58((uint64_t)self, v146, 0, v153);

        goto LABEL_91;
      }
    }
    ((void (*)(_QWORD *, void *))v6[2])(v6, v31);
LABEL_91:

    goto LABEL_92;
  }
  ((void (*)(_QWORD *, id))v6[2])(v6, v5);
LABEL_92:

}

- (void)iso18013DataRetrievalCompleted
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
  id v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 407);
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
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 407;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
  v18 = objc_msgSend(v16, "setRoutingConfig:", v17);

}

- (void)relinquishSEProxy
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 414);
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
    v24 = 414;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (self)
  {
    -[STSHelperLibrary stopSEProxyListener](self->_stsHelper, "stopSEProxyListener");
    objc_storeStrong((id *)&self->_seProxyListener, 0);
  }
  else
  {
    objc_msgSend(0, "stopSEProxyListener");
  }
}

- (void)restartNFCReaderDiscovery
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 422);
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
    v24 = 422;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_1001FBF60(self->_driverWrapper);
}

- (void)reqlinquishNFCReaderProxy
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
  id v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 428);
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
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 428;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
  v18 = objc_msgSend(v16, "setRoutingConfig:", v17);

}

- (void)coreDuetActivityRevoked
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C944;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CAC4;
  block[3] = &unk_1002E6240;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005D2B4;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)startTNEPReaderWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D934;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepReaderSelectService:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005DEBC;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)tnepReaderDeselectWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E524;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepReaderSend:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005EB9C;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)tnepReaderRestartPollingWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F1F4;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepServiceInvalidate
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 isMetaClass;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  _QWORD block[4];
  id v35[2];
  id buf;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;

  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v8 = 43;
      else
        v8 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v6(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v8, ClassName, Name, 577, v11);

    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v16;
      v37 = 2082;
      v38 = v17;
      v39 = 2082;
      v40 = v18;
      v41 = 1024;
      v42 = 577;
      v43 = 2114;
      v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", (uint8_t *)&buf, 0x2Cu);

    }
  }
  else
  {
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFLogGetLogger(v20);
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      isMetaClass = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v33 = sel_getName(a2);
      v26 = 45;
      if (isMetaClass)
        v26 = 43;
      v22(6, "%c[%{public}s %{public}s]:%i ", v26, v25, v33, 579);
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
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v31;
      v37 = 2082;
      v38 = object_getClassName(self);
      v39 = 2082;
      v40 = sel_getName(a2);
      v41 = 1024;
      v42 = 579;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
    }

    objc_initWeak(&buf, self);
    v32 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005FBA0;
    block[3] = &unk_1002E6290;
    objc_copyWeak(v35, &buf);
    v35[1] = (id)a2;
    dispatch_async(v32, block);

    objc_destroyWeak(v35);
    objc_destroyWeak(&buf);
  }
}

- (void)tnepTagDeviceReaderDetected
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 598);
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
    v24 = 598;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  unsigned int v9;
  uint64_t v10;
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
  void *v24;
  const char *Name;
  _QWORD v26[6];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("urn:nfc:sn:handover"));
  v10 = v9 ^ 1;
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
    v13(6, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", v17, ClassName, Name, 608, v7, v10);
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
    v28 = v22;
    v29 = 2082;
    v30 = object_getClassName(self);
    v31 = 2082;
    v32 = sel_getName(a2);
    v33 = 1024;
    v34 = 608;
    v35 = 2114;
    v36 = v7;
    v37 = 2048;
    v38 = v9 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", buf, 0x36u);
  }

  if (v9)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100060158;
    v26[3] = &unk_1002E5F60;
    v26[4] = self;
    v26[5] = a2;
    v23 = sub_100058C3C(self, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v24, "connectionHandoverTNEPServiceSelected:", CFSTR("urn:nfc:sn:handover"));

  }
  v8[2](v8, v10, 0);

}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  NSError *deviceHandoverSelectError;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  NSError *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  NSError *v46;
  __int16 v47;
  id v48;
  NSErrorUserInfoKey v49;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v10 = 43;
    else
      v10 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (self)
      deviceHandoverSelectError = self->_deviceHandoverSelectError;
    else
      deviceHandoverSelectError = 0;
    v8(6, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", v10, ClassName, Name, 622, deviceHandoverSelectError, v5);
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
    v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    if (self)
      v21 = self->_deviceHandoverSelectError;
    else
      v21 = 0;
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = v18;
    v39 = 2082;
    v40 = v19;
    v41 = 2082;
    v42 = v20;
    v43 = 1024;
    v44 = 622;
    v45 = 2114;
    v46 = v21;
    v47 = 2114;
    v48 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", buf, 0x36u);
  }

  if (self && self->_deviceHandoverSelectError)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100060754;
    v37[3] = &unk_1002E5F60;
    v37[4] = self;
    v37[5] = a2;
    v22 = sub_100058C3C(self, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v23, "connectionHandoverProcessFailure:", self->_deviceHandoverSelectError);

    sub_1000608E8((uint64_t)self, 0);
  }
  else if (v5)
  {
    if (objc_msgSend(v5, "code") == (id)28)
    {
      v24 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[8];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v26 = v24;
      v27 = 8;
    }
    else if (objc_msgSend(v5, "code") == (id)62 || objc_msgSend(v5, "code") == (id)59)
    {
      v30 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[2];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v26 = v30;
      v27 = 2;
    }
    else
    {
      v31 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[10];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v26 = v31;
      v27 = 10;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, v25));

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100060900;
    v36[3] = &unk_1002E5F60;
    v36[4] = self;
    v36[5] = a2;
    v33 = sub_100058C3C(self, v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v34, "connectionHandoverProcessFailure:", v32);

  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100060A94;
    v35[3] = &unk_1002E5F60;
    v35[4] = self;
    v35[5] = a2;
    v28 = sub_100058C3C(self, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v29, "connectionHandoverProcessCompleted");

  }
}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  STSHelperLibrary *stsHelper;
  STSHelperLibrary *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[16];

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CH_Negotiation", ", buf, 2u);
    }
  }

  if (self)
    stsHelper = self->_stsHelper;
  else
    stsHelper = 0;
  v11 = stsHelper;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asData"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100060D64;
  v14[3] = &unk_1002E62E0;
  v14[4] = self;
  v14[5] = a2;
  -[STSHelperLibrary processConnectionHandoverRequestData:callbackQueue:responseHandler:](v11, "processConnectionHandoverRequestData:callbackQueue:responseHandler:", v12, v13, v14);

}

- (void)tnepReaderServicesDiscovered:(id)a3
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
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
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
  _QWORD *v36;
  id v37;
  void *v38;
  NFTNEPHandler *tnepHandler;
  _QWORD *v40;
  const char *ClassName;
  const char *Name;
  const char *v43;
  _QWORD v44[5];
  id v45;
  SEL v46;
  _QWORD v47[6];
  _QWORD v48[6];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
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
    v8(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v11, ClassName, Name, 683, v5);
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
    v55 = v16;
    v56 = 2082;
    v57 = object_getClassName(self);
    v58 = 2082;
    v59 = sel_getName(a2);
    v60 = 1024;
    v61 = 683;
    v62 = 2114;
    v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i services=%{public}@", buf, 0x2Cu);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("urn:nfc:sn:handover")) & 1) != 0)
        {

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_1000618E4;
          v48[3] = &unk_1002E5F60;
          v48[4] = self;
          v48[5] = a2;
          v36 = objc_retainBlock(v48);
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_100061CE4;
          v47[3] = &unk_1002E5F60;
          v47[4] = self;
          v47[5] = a2;
          v37 = sub_100058C3C(self, v47);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          objc_msgSend(v38, "connectionHandoverTNEPServiceSelected:", CFSTR("urn:nfc:sn:handover"));

          if (self)
            tnepHandler = self->_tnepHandler;
          else
            tnepHandler = 0;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100061E78;
          v44[3] = &unk_1002E6218;
          v45 = v36;
          v46 = a2;
          v44[4] = self;
          v40 = v36;
          -[NFTNEPHandler tnepReaderSelectService:callback:](tnepHandler, "tnepReaderSelectService:callback:", CFSTR("urn:nfc:sn:handover"), v44);

          goto LABEL_31;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v19)
        continue;
      break;
    }
  }

  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFLogGetLogger(v22);
  if (v23)
  {
    v24 = (void (*)(uint64_t, const char *, ...))v23;
    v25 = object_getClass(self);
    v26 = class_isMetaClass(v25);
    v27 = object_getClassName(self);
    v43 = sel_getName(a2);
    v28 = 45;
    if (v26)
      v28 = 43;
    v24(4, "%c[%{public}s %{public}s]:%i No matching service found", v28, v27, v43, 694);
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
    v55 = v33;
    v56 = 2082;
    v57 = v34;
    v58 = 2082;
    v59 = v35;
    v60 = 1024;
    v61 = 694;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No matching service found", buf, 0x22u);
  }

LABEL_31:
}

- (void)staticReaderEngagementDiscovered:(id)a3
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
  STSHelperLibrary *stsHelper;
  STSHelperLibrary *v18;
  void *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  _QWORD v23[6];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;

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
    v8(6, "%c[%{public}s %{public}s]:%i handover select = %@", v11, ClassName, Name, 765, v5);
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
    v25 = v16;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 765;
    v32 = 2112;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select = %@", buf, 0x2Cu);
  }

  if (self)
    stsHelper = self->_stsHelper;
  else
    stsHelper = 0;
  v18 = stsHelper;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100062D60;
  v23[3] = &unk_1002E5F60;
  v23[4] = self;
  v23[5] = a2;
  -[STSHelperLibrary connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:](v18, "connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:", v19, v20, v23);

}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
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
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[6];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "ReaderServicesAborted", ", buf, 2u);
    }
  }

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
    v12(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v15, ClassName, Name, 788, v5);
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
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v29 = v20;
    v30 = 2082;
    v31 = v21;
    v32 = 2082;
    v33 = v22;
    v34 = 1024;
    v35 = 788;
    v36 = 2114;
    v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100063524;
  v27[3] = &unk_1002E5F60;
  v27[4] = self;
  v27[5] = a2;
  v23 = sub_100058C3C(self, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v24, "tnepReaderServicesAborted:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandoverSelectError, 0);
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_tnepHandler, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_seWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_powerConsumptionReporter, 0);
}

@end
