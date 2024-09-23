@implementation _NFHardwareManager

- (void)handleTemperatureChange:(double)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000078E8;
  v4[3] = &unk_1002E5C30;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  NFDriverWrapper *driverWrapper;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  char v30;
  NFFieldDetectManager *fieldDetectManager;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  const char *ClassName;
  const char *Name;
  const char *v48;
  _QWORD v49[6];
  char v50;
  BOOL v51;
  uint8_t buf[4];
  _BYTE v53[14];
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;

  v3 = a3;
  if (a3)
    sub_1000057D4(self);
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
    v8(6, "%c[%{public}s %{public}s]:%i fieldPresent=%d", v11, ClassName, Name, 6729, v3);
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
    *(_DWORD *)v53 = v16;
    *(_WORD *)&v53[4] = 2082;
    *(_QWORD *)&v53[6] = object_getClassName(self);
    v54 = 2082;
    v55 = sel_getName(a2);
    v56 = 1024;
    v57 = 6729;
    v58 = 1024;
    v59 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i fieldPresent=%d", buf, 0x28u);
  }

  v17 = sub_1000078A4();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)v18;
  if (v3)
    sub_100009988(v18);
  else
    sub_100006394(v18);

  v20 = kdebug_trace(724566196, 0, 0, 0, 0);
  v21 = NFSharedSignpostLog(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    v23 = CFSTR("OFF");
    if (v3)
      v23 = CFSTR("ON");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v53 = v23;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FIELD_CHANGE_NOTIF", "field %@", buf, 0xCu);
  }

  if (!v3)
  {
    v25 = "com.apple.stockholm.field.off";
    goto LABEL_24;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (driverWrapper->_flags & 0x400) == 0)
  {
    v25 = "com.apple.stockholm.field.on";
LABEL_24:
    sub_100007548(self, v25);
    v27 = NFSharedSignpostLog(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_signpost_enabled(v28))
    {
      v29 = "OFF";
      if (v3)
        v29 = "ON";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v53 = v29;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FIELD_DETECT_NOTIFICATION", "field %s", buf, 0xCu);
    }

    if (!v3)
      sub_100098D04((uint64_t)self);
    if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleFieldChanged:") & 1) != 0)
      -[_NFSession handleFieldChanged:](self->_currentSecureElementSession, "handleFieldChanged:", v3);
    v30 = sub_100170214((uint64_t)self);
    fieldDetectManager = self->_fieldDetectManager;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100111FE8;
    v49[3] = &unk_1002E85F0;
    v50 = v30;
    v49[4] = self;
    v49[5] = a2;
    v51 = v3;
    -[NFFieldDetectManager enumerateFieldDetectSessionsUsingBlock:](fieldDetectManager, "enumerateFieldDetectSessionsUsingBlock:", v49);
    return;
  }
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFLogGetLogger(v32);
  if (v33)
  {
    v34 = (void (*)(uint64_t, const char *, ...))v33;
    v35 = object_getClass(self);
    v36 = class_isMetaClass(v35);
    v37 = object_getClassName(self);
    v48 = sel_getName(a2);
    v38 = 45;
    if (v36)
      v38 = 43;
    v34(4, "%c[%{public}s %{public}s]:%i Ignoring field on event due to ExpressModeDebug setting!", v38, v37, v48, 6742);
  }
  v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v40 = NFSharedLogGetLogger(v39);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = object_getClass(self);
    if (class_isMetaClass(v42))
      v43 = 43;
    else
      v43 = 45;
    v44 = object_getClassName(self);
    v45 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v53 = v43;
    *(_WORD *)&v53[4] = 2082;
    *(_QWORD *)&v53[6] = v44;
    v54 = 2082;
    v55 = v45;
    v56 = 1024;
    v57 = 6742;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring field on event due to ExpressModeDebug setting!", buf, 0x22u);
  }

}

- (void)handleFieldReset
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008610;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)handleFieldNotification:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004BBC;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v18;
  const char *ClassName;
  const char *Name;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  unsigned int v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  NSMutableSet *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  const char *v60;
  id Property;
  id v62;
  NFClientAppStateObserver *appStateObserver;
  NFClientAppStateObserver *v64;
  const char *v65;
  id v66;
  id v67;
  const char *v68;
  id v69;
  id v70;
  uint64_t v72;
  void *v74;
  _QWORD v75[6];
  _QWORD v76[6];
  _BYTE buf[60];

  v6 = a3;
  v7 = a4;
  v8 = qword_10032ACA8;
  v74 = v6;
  v9 = 1;
  if ((id)qword_10032ACA8 == v6)
    v9 = 2;
  v72 = v9;
  v10 = objc_msgSend(objc_alloc((Class)NFServiceWhitelistChecker), "initWithConnection:coreNFCConnection:", v7, qword_10032ACA8 == (_QWORD)v6);
  v11 = kdebug_trace(724566040, 0, 0, 0, 0);
  v12 = NFSharedSignpostLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "XPC_CONNECT", "XPC connection from %@", buf, 0xCu);

  }
  if ((id)v8 == v6 || (objc_msgSend(v10, "internalAccess") & 1) != 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v18 = 43;
      else
        v18 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
      Logger(6, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", v18, ClassName, Name, 88, v21, v7);

    }
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(self);
      v28 = sel_getName(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v26;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = v27;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 88;
      *(_WORD *)&buf[34] = 2114;
      *(_QWORD *)&buf[36] = v29;
      *(_WORD *)&buf[44] = 2114;
      *(_QWORD *)&buf[46] = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", buf, 0x36u);

    }
    if ((void *)v8 == v74)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NFCHardwareManagerCallbacks interface](NFCHardwareManagerCallbacks, "interface"));
      objc_msgSend(v7, "setRemoteObjectInterface:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NFCHardwareManagerInterface interface](NFCHardwareManagerInterface, "interface"));
      objc_msgSend(v7, "setExportedInterface:", v53);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxy"));
      sub_10011B75C((uint64_t)self, v33);
    }
    else
    {
      v30 = sub_10006C4CC();
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v7, "setRemoteObjectInterface:", v31);

      v32 = sub_10006BAE8();
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v7, "setExportedInterface:", v33);
    }

    objc_msgSend(v7, "setExportedObject:", self);
    v54 = objc_opt_new(NSMutableSet);
    v44 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v54, CFSTR("ProxyObjects")));

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v72));
    -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v55, CFSTR("serviceType"));

    -[NSObject setObject:forKey:](v44, "setObject:forKey:", v10, CFSTR("ServiceWhitelist"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
    -[NSObject setObject:forKey:](v44, "setObject:forKey:", v56, CFSTR("ClientName"));

    v57 = sub_1000511DC((uint64_t)NFClientAppStateObserver, v7, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    if (objc_msgSend(v58, "lengthOfBytesUsingEncoding:", 4))
      -[NSObject setObject:forKey:](v44, "setObject:forKey:", v58, CFSTR("BundleIdentifier"));
    objc_msgSend(v7, "setUserInfo:", v44);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = sub_10002A490;
    *(_QWORD *)&buf[32] = sub_10002A4A0;
    v59 = v7;
    *(_QWORD *)&buf[40] = v59;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10002A4A8;
    v76[3] = &unk_1002E55C8;
    v76[4] = self;
    v76[5] = buf;
    objc_msgSend(v59, "setInvalidationHandler:", v76);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10002A518;
    v75[3] = &unk_1002E55C8;
    v75[4] = self;
    v75[5] = buf;
    objc_msgSend(v59, "setInterruptionHandler:", v75);
    if (self)
      Property = objc_getProperty(self, v60, 240, 1);
    else
      Property = 0;
    v62 = Property;
    objc_msgSend(v59, "_setQueue:", v62);

    if (self)
      appStateObserver = self->_appStateObserver;
    else
      appStateObserver = 0;
    v64 = appStateObserver;
    sub_10004F678((uint64_t)v64, v59);

    objc_msgSend(v59, "resume");
    if (self)
      v66 = objc_getProperty(self, v65, 176, 1);
    else
      v66 = 0;
    v67 = v66;
    objc_sync_enter(v67);
    if (self)
      v69 = objc_getProperty(self, v68, 176, 1);
    else
      v69 = 0;
    v70 = v69;
    objc_msgSend(v70, "addObject:", v59);

    objc_sync_exit(v67);
    _Block_object_dispose(buf, 8);

    v51 = 1;
  }
  else
  {
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v34);
    if (v35)
    {
      v36 = object_getClass(self);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      v40 = objc_msgSend(v7, "processIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
      v35(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", v37, v38, v39, 84, v40, v41, "com.apple.nfcd.hwmanager");

    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      v47 = object_getClassName(self);
      v48 = sel_getName(a2);
      v49 = objc_msgSend(v7, "processIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientName"));
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&buf[4] = v46;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = v47;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v48;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 84;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v49;
      *(_WORD *)&buf[40] = 2114;
      *(_QWORD *)&buf[42] = v50;
      *(_WORD *)&buf[50] = 2080;
      *(_QWORD *)&buf[52] = "com.apple.nfcd.hwmanager";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", buf, 0x3Cu);

    }
    v51 = 0;
  }

  return v51;
}

- (BOOL)_shouldWalletIntentSessionIgnoreField:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;

  v5 = a4;
  v6 = objc_msgSend(a3, "category");
  v7 = v5;
  v12 = 0;
  if (v6 == (id)8)
  {
    v8 = objc_opt_class(_NFXPCSession);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_whitelistChecker"));
      v11 = objc_msgSend(v10, "nfcCardSessionAccess");

      if ((v11 & 1) != 0)
        v12 = 1;
    }
  }

  return v12;
}

+ (id)sharedHardwareManager
{
  if (qword_10032A9E0 != -1)
    dispatch_once(&qword_10032A9E0, &stru_1002E7EB0);
  return (id)qword_10032A9D8;
}

- (_NFHardwareManager)init
{
  id v3;
  void *v4;
  NFFieldDetectManager *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _NFControllerManager *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  int v37;
  id v38;
  _QWORD *v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v49;
  const char *ClassName;
  const char *Name;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63[2];
  id location;
  objc_super v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  id v75;

  v65.receiver = self;
  v65.super_class = (Class)_NFHardwareManager;
  v3 = -[_NFHardwareManager init](&v65, "init");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    *((_WORD *)v3 + 167) = 0;
    *((_QWORD *)v3 + 35) = 0;
    *((_QWORD *)v3 + 36) = 1;
    v5 = objc_opt_new(NFFieldDetectManager);
    v6 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v5;

    v7 = NFCreateWorkLoop("com.apple.nfcd.xpcConnection", 50);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)*((_QWORD *)v3 + 30);
    *((_QWORD *)v3 + 30) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 30), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    v10 = NFCreateWorkLoop("com.apple.nfcd.workQueue", 50);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)*((_QWORD *)v3 + 29);
    *((_QWORD *)v3 + 29) = v11;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 29), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    v13 = objc_opt_new(NSMutableArray);
    v14 = (void *)*((_QWORD *)v3 + 22);
    *((_QWORD *)v3 + 22) = v13;

    v15 = sub_1001F7FAC((id *)[NFDriverWrapper alloc], *((void **)v3 + 29));
    v16 = (void *)*((_QWORD *)v3 + 46);
    *((_QWORD *)v3 + 46) = v15;

    v17 = *((_QWORD *)v3 + 46);
    if (v17)
    {
      *(_QWORD *)(v17 + 248) = v3;
      v18 = (void *)*((_QWORD *)v3 + 46);
    }
    else
    {
      v18 = 0;
    }
    *((_BYTE *)v3 + 342) = 0;
    v19 = sub_100202BB0(v18, (_BYTE *)v3 + 342);
    v20 = -[_NFControllerManager initWithQueue:driverWrapper:]([_NFControllerManager alloc], "initWithQueue:driverWrapper:", *((_QWORD *)v3 + 29), *((_QWORD *)v3 + 46));
    v21 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v20;

    v22 = objc_msgSend(objc_alloc((Class)NFPowerObserver), "initWithDelegate:", v3);
    v23 = (void *)*((_QWORD *)v3 + 7);
    *((_QWORD *)v3 + 7) = v22;

    v24 = sub_10004F548([NFClientAppStateObserver alloc], v3);
    v25 = (void *)*((_QWORD *)v3 + 9);
    *((_QWORD *)v3 + 9) = v24;

    v26 = objc_alloc_init((Class)NSMutableDictionary);
    v27 = (void *)*((_QWORD *)v3 + 20);
    *((_QWORD *)v3 + 20) = v26;

    v28 = objc_alloc_init((Class)NSMutableArray);
    v29 = (void *)*((_QWORD *)v3 + 23);
    *((_QWORD *)v3 + 23) = v28;

    v30 = objc_alloc_init((Class)NSMutableArray);
    v31 = (void *)*((_QWORD *)v3 + 24);
    *((_QWORD *)v3 + 24) = v30;

    *((_BYTE *)v3 + 345) = 0;
    *((_BYTE *)v3 + 351) = 0;
    *((_DWORD *)v3 + 81) = -1;
    objc_storeStrong((id *)v3 + 50, *((id *)v3 + 29));
    v32 = objc_msgSend(objc_alloc((Class)NFXPCEventPublisher), "initWithStreamName:queue:", CFSTR("com.apple.nfcd.homekit.field"), *((_QWORD *)v3 + 50));
    v33 = (void *)*((_QWORD *)v3 + 13);
    *((_QWORD *)v3 + 13) = v32;

    v34 = objc_msgSend(objc_alloc((Class)NFXPCEventPublisher), "initWithStreamName:queue:", CFSTR("com.apple.nfcd.xpc.sesd.events"), *((_QWORD *)v3 + 50));
    v35 = (void *)*((_QWORD *)v3 + 49);
    *((_QWORD *)v3 + 49) = v34;

    v37 = NFIsInternalBuild(v36);
    if (v37)
      LOBYTE(v37) = objc_msgSend(v4, "BOOLForKey:", CFSTR("DisableFailForward"));
    *((_BYTE *)v3 + 354) = v37;
    objc_initWeak(&location, v3);
    v38 = objc_alloc((Class)NFTimer);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000DAFE8;
    v61[3] = &unk_1002E5E80;
    objc_copyWeak(v63, &location);
    v39 = v3;
    v62 = v39;
    v63[1] = (id)a2;
    v40 = objc_msgSend(v38, "initSleepTimerWithCallback:queue:", v61, *((_QWORD *)v3 + 29));
    v41 = (void *)v39[16];
    v39[16] = v40;

    v60 = 0;
    v42 = sub_100026F2C((uint64_t)NFDriverWrapper, &v60);
    v43 = v60;
    if (v42)
    {
      v44 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v43));
      v45 = (void *)v39[53];
      v39[53] = v44;

      if (!v39[53])
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
        if (Logger)
        {
          Class = object_getClass(v39);
          if (class_isMetaClass(Class))
            v49 = 43;
          else
            v49 = 45;
          ClassName = object_getClassName(v39);
          Name = sel_getName(a2);
          Logger(3, "%c[%{public}s %{public}s]:%i Serial from FDR is invalid; %{public}@",
            v49,
            ClassName,
            Name,
            427,
            v43);
        }
        v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v53 = NFSharedLogGetLogger(v52);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = object_getClass(v39);
          if (class_isMetaClass(v55))
            v56 = 43;
          else
            v56 = 45;
          v57 = object_getClassName(v39);
          v58 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v67 = v56;
          v68 = 2082;
          v69 = v57;
          v70 = 2082;
          v71 = v58;
          v72 = 1024;
          v73 = 427;
          v74 = 2114;
          v75 = v43;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Serial from FDR is invalid; %{public}@",
            buf,
            0x2Cu);
        }

      }
    }

    objc_destroyWeak(v63);
    objc_destroyWeak(&location);

  }
  return (_NFHardwareManager *)v3;
}

- (void)dealloc
{
  OS_dispatch_workloop *workQueue;
  NFDriverWrapper *driverWrapper;
  NFWalletPresentationService *sharedWalletPresentationService;
  objc_super v6;

  workQueue = self->_workQueue;
  self->_workQueue = 0;

  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
    driverWrapper->_delegate = 0;
  sharedWalletPresentationService = self->_sharedWalletPresentationService;
  if (sharedWalletPresentationService)
    -[NFWalletPresentationService removeObserver:forKeyPath:](sharedWalletPresentationService, "removeObserver:forKeyPath:", self, CFSTR("walletDomain"));
  v6.receiver = self;
  v6.super_class = (Class)_NFHardwareManager;
  -[_NFHardwareManager dealloc](&v6, "dealloc");
}

- (void)start
{
  NSObject *v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _NFHardwareManager *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *workQueue;
  _QWORD block[6];
  _QWORD v32[5];
  _BYTE state[18];
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;

  v4 = _os_activity_create((void *)&_mh_execute_header, "_NFHardwareManager started", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcd started", v8, ClassName, Name, 455);
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
    v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v34 = 2082;
    v35 = v17;
    v36 = 1024;
    v37 = 455;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd started", state, 0x22u);
  }

  v18 = kdebug_trace(724566036, 0, 0, 0, 0);
  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWMANAGER_START", ", state, 2u);
  }

  v21 = self;
  objc_sync_enter(v21);
  if (v21->_isRunning)
  {
    objc_sync_exit(v21);

  }
  else
  {
    v22 = sub_100029B84(v21, v21->_xpcConnectionQueue);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v23, "resume");
    v24 = sub_100029C14(v21, v21->_xpcConnectionQueue);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v25, "resume");

    v21->_isRunning = 1;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000DBB28;
    v32[3] = &unk_1002E7ED8;
    v32[4] = v21;
    v21->_stateCaptureHandle = os_state_add_handler(&_dispatch_main_q, v32);
    objc_sync_exit(v21);

    v26 = v21->_secureElementSessionQueue;
    objc_sync_enter(v26);
    sub_1000DBE28(v21, 0);
    objc_sync_exit(v26);

    v27 = sub_1001F419C((uint64_t)_NFFailForwardCoordinator);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    sub_1001F4208(v28, v21);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    objc_msgSend(v29, "setEnableDebug:", NFIsInternalBuild(v29));

    workQueue = v21->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DC2B4;
    block[3] = &unk_1002E5C30;
    block[4] = v21;
    block[5] = a2;
    dispatch_async(workQueue, block);
  }
}

- (uint64_t)getPrimaryHardwareState
{
  _QWORD *v1;
  uint64_t v2;
  void *specific;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;

  if (result)
  {
    v1 = (id)result;
    objc_sync_enter(v1);
    v2 = v1[35];
    objc_sync_exit(v1);

    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v1);
      Name = sel_getName("getHardwareState");
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v5(6, "%c[%{public}s %{public}s]:%i state = %lu", v8, ClassName, Name, 1563, v2);
    }
    v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v10 = NFSharedLogGetLogger(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(v1);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67110146;
      v17 = v13;
      v18 = 2082;
      v19 = object_getClassName(v1);
      v20 = 2082;
      v21 = sel_getName("getHardwareState");
      v22 = 1024;
      v23 = 1563;
      v24 = 2048;
      v25 = v2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i state = %lu", buf, 0x2Cu);
    }

    if ((unint64_t)(v2 - 1) <= 3)
      return (v2 + 1);
    else
      return 1;
  }
  return result;
}

- (void)stop
{
  NSObject *v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _NFHardwareManager *v21;
  NFTimer *powerCountersTimer;
  void *v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  NSObject *p_super;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  _BYTE state[18];
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;

  v4 = _os_activity_create((void *)&_mh_execute_header, "_NFHardwareManger stopped", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcd stopping", v8, ClassName, Name, 580);
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
    v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v54 = 2082;
    v55 = v17;
    v56 = 1024;
    v57 = 580;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd stopping", state, 0x22u);
  }

  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWMANAGER_STOP", ", state, 2u);
  }

  v21 = self;
  objc_sync_enter(v21);
  if (v21->_isRunning)
  {
    v21->_isRunning = 0;
    powerCountersTimer = v21->_powerCountersTimer;
    if (powerCountersTimer)
      -[NFTimer stopTimer](powerCountersTimer, "stopTimer");
    sub_1001EB470(v21->_keyBag);
    -[NFPowerObserver unregisterForEvents](v21->_powerObserver, "unregisterForEvents");
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v23);
    if (v24)
    {
      v25 = object_getClass(v21);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(v21);
      v28 = sel_getName("_unloadService");
      v24(6, "%c[%{public}s %{public}s]:%i Invalidating XPC", v26, v27, v28, 1500);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = object_getClass(v21);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(v21);
      v35 = sel_getName("_unloadService");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v33;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v34;
      v54 = 2082;
      v55 = v35;
      v56 = 1024;
      v57 = 1500;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating XPC", state, 0x22u);
    }

    objc_msgSend((id)qword_10032ACA0, "invalidate");
    objc_msgSend((id)qword_10032ACA0, "setDelegate:", 0);
    v36 = (void *)qword_10032ACA0;
    qword_10032ACA0 = 0;

    objc_msgSend((id)qword_10032ACA8, "invalidate");
    objc_msgSend((id)qword_10032ACA8, "setDelegate:", 0);
    v37 = (void *)qword_10032ACA8;
    qword_10032ACA8 = 0;

    if (v21->_userInitiatedShutdown
      || !-[NFHardwareControllerInfo hasLPEMSupport](v21->_controllerInfo, "hasLPEMSupport")
      || (v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](v21, "driverWrapper")),
          v39 = sub_100197958((uint64_t)v38) == 0,
          v38,
          v39))
    {
      sub_1001FB2A8(v21->_driverWrapper);
    }
    objc_sync_exit(v21);

    v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v40);
    if (v41)
    {
      v42 = object_getClass(v21);
      if (class_isMetaClass(v42))
        v43 = 43;
      else
        v43 = 45;
      v44 = object_getClassName(v21);
      v45 = sel_getName(a2);
      v41(6, "%c[%{public}s %{public}s]:%i Nfcd stopped", v43, v44, v45, 621);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    p_super = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v49 = object_getClass(v21);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(v21);
      v52 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v50;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v51;
      v54 = 2082;
      v55 = v52;
      v56 = 1024;
      v57 = 621;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd stopped", state, 0x22u);
    }
  }
  else
  {
    objc_sync_exit(v21);
    p_super = &v21->super;
  }

}

- (void)managedConfigChanged:(BOOL)a3
{
  sub_1000E43E4(self, a3);
}

- (BOOL)refreshSecureElementInfo
{
  NFDriverWrapper *driverWrapper;
  int v5;
  id v6;
  id v7;
  NFHardwareSecureElementInfo *secureElementInfo;
  void *v9;
  void *v10;
  NFHardwareSecureElementInfo *v11;
  NSObject *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  const char *Name;
  id v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  driverWrapper = self->_driverWrapper;
  v28 = 0;
  v5 = sub_100026500(driverWrapper, 1, &v28);
  v6 = v28;
  v7 = v28;
  if (v5)
  {
    objc_storeStrong((id *)&self->_secureElementInfo, v6);
    secureElementInfo = self->_secureElementInfo;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayForKey:", CFSTR("BootHistory")));
    -[NFHardwareSecureElementInfo setBootHistory:](secureElementInfo, "setBootHistory:", v10);

    v11 = self->_secureElementInfo;
    v12 = objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper handle](self->_secureElementWrapper, "handle"));
    -[NSObject setInfo:](v12, "setInfo:", v11);
  }
  else
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
      v15(3, "%c[%{public}s %{public}s]:%i Failed to get secure element info", v19, ClassName, Name, 1443);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v12 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v30 = v23;
      v31 = 2082;
      v32 = v24;
      v33 = 2082;
      v34 = v25;
      v35 = 1024;
      v36 = 1443;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get secure element info", buf, 0x22u);
    }
  }

  return v5;
}

- (int64_t)nfcRadioEnabled:(id *)a3 showUIPopup:(BOOL)a4
{
  _BOOL4 v4;
  _NFHardwareManager *v6;
  int64_t nfcRadioEnabled;
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
  const char *v19;
  const char *v20;
  int64_t v21;
  _NFHardwareManager *v22;
  void *v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  id location;
  uint8_t buf[8];
  _BYTE v40[26];
  __int16 v41;
  int v42;

  v4 = a4;
  v6 = self;
  objc_sync_enter(v6);
  nfcRadioEnabled = v6->_nfcRadioEnabled;
  if (nfcRadioEnabled)
  {
    if (!v4)
      goto LABEL_19;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v6);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i _nfcRadioEnabled = %d", v11, ClassName, Name, 1461, v6->_nfcRadioEnabled);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(v6);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(v6);
      v20 = sel_getName(a2);
      v21 = v6->_nfcRadioEnabled;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v18;
      *(_WORD *)v40 = 2082;
      *(_QWORD *)&v40[2] = v19;
      *(_WORD *)&v40[10] = 2082;
      *(_QWORD *)&v40[12] = v20;
      *(_WORD *)&v40[20] = 1024;
      *(_DWORD *)&v40[22] = 1461;
      v41 = 1024;
      v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i _nfcRadioEnabled = %d", buf, 0x28u);
    }

    nfcRadioEnabled = v6->_nfcRadioEnabled;
    if (!v4)
    {
LABEL_19:
      objc_sync_exit(v6);

      if (nfcRadioEnabled == 1)
        return nfcRadioEnabled;
      goto LABEL_20;
    }
  }
  if (nfcRadioEnabled == 1)
    goto LABEL_19;
  v22 = v6;
  objc_sync_enter(v22);
  objc_initWeak(&location, v22);
  if (!v22->_radioDisabledNotificationPopup)
  {
    v22->_radioDisabledNotificationPopup = 1;
    v23 = (void *)objc_opt_new(NFRadioPowerSwitch);
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)v40 = 3221225472;
    *(_QWORD *)&v40[8] = sub_1000E49FC;
    *(_QWORD *)&v40[16] = &unk_1002E81E0;
    objc_copyWeak((id *)&v40[24], &location);
    objc_msgSend(v23, "requestUserSettingsNotificationWithCompletion:popupInterval:", buf, 0.0);

    objc_destroyWeak((id *)&v40[24]);
  }
  objc_destroyWeak(&location);
  objc_sync_exit(v22);

  objc_sync_exit(v22);
LABEL_20:
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
  if (v25)
  {
    v26 = object_getClass(v6);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(v6);
    v29 = sel_getName(a2);
    v25(6, "%c[%{public}s %{public}s]:%i state = %d", v27, v28, v29, 1478, nfcRadioEnabled);
  }
  v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v31 = NFSharedLogGetLogger(v30);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = object_getClass(v6);
    if (class_isMetaClass(v33))
      v34 = 43;
    else
      v34 = 45;
    v35 = object_getClassName(v6);
    v36 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v34;
    *(_WORD *)v40 = 2082;
    *(_QWORD *)&v40[2] = v35;
    *(_WORD *)&v40[10] = 2082;
    *(_QWORD *)&v40[12] = v36;
    *(_WORD *)&v40[20] = 1024;
    *(_DWORD *)&v40[22] = 1478;
    v41 = 1024;
    v42 = nfcRadioEnabled;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i state = %d", buf, 0x28u);
  }

  return nfcRadioEnabled;
}

- (void)isHWSupportedWithCompletion:(id)a3
{
  void *specific;
  void (**v7)(id, uint64_t);
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = (void (**)(id, uint64_t))a3;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "NF_userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1599, v16);

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
    v23 = object_getClassName(self);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v30 = v22;
    v31 = 2082;
    v32 = v23;
    v33 = 2082;
    v34 = v24;
    v35 = 1024;
    v36 = 1599;
    v37 = 2114;
    v38 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v28 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
  v7[2](v7, v28);

}

- (void)waitForHWSupportedWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  NSObject *workQueue;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  SEL v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
    v15 = a2;
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1607, v17);

    v5 = v16;
    a2 = v15;

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v36 = v23;
    v37 = 2082;
    v38 = v24;
    v39 = 2082;
    v40 = v25;
    v41 = 1024;
    v42 = 1607;
    v43 = 2114;
    v44 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E77B0;
  block[3] = &unk_1002E5D50;
  block[4] = self;
  v32 = v6;
  v33 = v5;
  v34 = a2;
  v29 = v5;
  v30 = v6;
  dispatch_async(workQueue, block);

}

- (BOOL)hasSession
{
  NSMutableArray *v3;
  BOOL v4;

  v3 = self->_secureElementSessionQueue;
  objc_sync_enter(v3);
  if (self->_currentSecureElementSession)
    v4 = 1;
  else
    v4 = -[NSMutableArray count](self->_secureElementSessionQueue, "count") != 0;
  objc_sync_exit(v3);

  return v4;
}

- (void)maybeStartNextSession
{
  sub_1000E8458((id *)&self->super.isa, 0);
}

- (id)secureElementDidExitRestrictedMode:(id)a3 os:(int64_t)a4
{
  id v6;
  unsigned int v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void **v17;
  NSErrorUserInfoKey *v18;
  id v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *specific;
  uint64_t Logger;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  const char *Name;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  _BYTE v57[128];
  NSErrorUserInfoKey v58;
  void *v59;
  NSErrorUserInfoKey v60;
  void *v61;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEqual:", self->_secureElementWrapper);
  if (v7)
    v8 = CFSTR("embedded");
  else
    v8 = 0;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFHardwareManager powerCycleSE:](self, "powerCycleSE:", v6));
  v10 = (id)v9;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v12));

    if (v13)
    {
      v14 = objc_alloc((Class)NSError);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v60 = NSLocalizedDescriptionKey;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v61 = v16;
      v17 = &v61;
      v18 = &v60;
    }
    else
    {
      if (-[_NFHardwareManager refreshSecureElementInfo](self, "refreshSecureElementInfo"))
      {
        v19 = sub_10022BED0(self->_secureElementWrapper);
        v10 = 0;
        goto LABEL_15;
      }
      v14 = objc_alloc((Class)NSError);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v58 = NSLocalizedDescriptionKey;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
      v59 = v16;
      v17 = &v59;
      v18 = &v58;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    v10 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 15, v20);

  }
LABEL_15:
  v21 = sub_100007A04((id *)&self->super.isa);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allValues"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "secureElementWithIdentifier:didChangeRestrictedMode:", v8, 0);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v25);
  }

  if (v10)
  {
    self->_restrictedModeBroadcasted = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to exit restricted mode. Returned with error %@"), v10));
    sub_100187CDC((uint64_t)NFBugCapture, CFSTR("Failed to exit restricted mode"), v28, 0);

  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v31 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v35 = 45;
      if (isMetaClass)
        v35 = 43;
      v31(6, "%c[%{public}s %{public}s]:%i Device exited Restricted Mode and we are posting events", v35, ClassName, Name, 2424);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(self);
      v42 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v50 = v40;
      v51 = 2082;
      v52 = v41;
      v53 = 2082;
      v54 = v42;
      v55 = 1024;
      v56 = 2424;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Device exited Restricted Mode and we are posting events", buf, 0x22u);
    }

    +[NFExceptionsCALogger postAnalyticsSERestrictedModeExited:](NFExceptionsCALogger, "postAnalyticsSERestrictedModeExited:", sub_1000DFCAC((uint64_t)self));
    self->_restrictedModeBroadcasted = 0;
  }

  return v10;
}

- (void)postEventForPublisher:(id)a3 event:(const char *)a4 objectString:(id)a5
{
  id v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  int v31;
  const char *ClassName;
  const char *Name;
  const char *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;

  v9 = a3;
  v10 = a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v13 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v9)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i posting notification: %s", v16, ClassName, Name, 2727, a4);
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
      *(_DWORD *)buf = 67110146;
      v36 = v21;
      v37 = 2082;
      v38 = object_getClassName(self);
      v39 = 2082;
      v40 = sel_getName(a2);
      v41 = 1024;
      v42 = 2727;
      v43 = 2080;
      v44 = a4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i posting notification: %s", buf, 0x2Cu);
    }

    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "postNotificationName:object:userInfo:options:", v22, v10, 0, 3);

    if (v10)
      objc_msgSend(v9, "sendSimpleEvent:objectString:", v22, v10);
    else
      objc_msgSend(v9, "sendSimpleEvent:", v22);
  }
  else
  {
    if (Logger)
    {
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(self);
      v34 = sel_getName(a2);
      v27 = 45;
      if (v25)
        v27 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i Invalid event publisher. ", v27, v26, v34, 2724);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v22 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      *(_DWORD *)buf = 67109890;
      v36 = v31;
      v37 = 2082;
      v38 = object_getClassName(self);
      v39 = 2082;
      v40 = sel_getName(a2);
      v41 = 1024;
      v42 = 2724;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid event publisher. ", buf, 0x22u);
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  void *v12;
  NSObject *workQueue;
  objc_super v14;
  _QWORD block[5];
  id v16;
  SEL v17;

  v11 = a5;
  v12 = v11;
  if (off_100329780 == a6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ED1B4;
    block[3] = &unk_1002E5C80;
    block[4] = self;
    v17 = a2;
    v16 = v11;
    dispatch_async(workQueue, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_NFHardwareManager;
    -[_NFHardwareManager observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v11, a6);
  }

}

- (void)controllerInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ED3E8;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)expressModesInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ED5DC;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)checkExpressPassCompatibilityDeprecated:(id)a3 callback:(id)a4
{
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  const char *ClassName;
  const char *Name;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v26 = 0;
  v7 = (void (**)(id, void *, id))a4;
  v8 = sub_10023AA88((uint64_t)NFSecureElementWrapper, a3, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v26;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", v16, ClassName, Name, 2853, v9);
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
    v28 = v21;
    v29 = 2082;
    v30 = v22;
    v31 = 2082;
    v32 = v23;
    v33 = 1024;
    v34 = 2853;
    v35 = 2114;
    v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", buf, 0x2Cu);
  }

  v7[2](v7, v9, v10);
}

- (void)checkExpressPassCompatibility:(id)a3 callback:(id)a4
{
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  id v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  const char *ClassName;
  const char *Name;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v26 = 0;
  v7 = (void (**)(id, void *, id))a4;
  v8 = sub_10023AEA0((uint64_t)NFSecureElementWrapper, a3, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v26;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", v16, ClassName, Name, 2863, v9);
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
    v28 = v21;
    v29 = 2082;
    v30 = v22;
    v31 = 2082;
    v32 = v23;
    v33 = 1024;
    v34 = 2863;
    v35 = 2114;
    v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", buf, 0x2Cu);
  }

  v7[2](v7, v9, v10);
}

- (void)currentInMetroStatus:(id)a3
{
  void (**v5)(id, id, id);
  id v6;
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *Name;
  id v23;
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
  id v35;

  v23 = 0;
  v5 = (void (**)(id, id, id))a3;
  v6 = sub_10023B2F8((uint64_t)NFSecureElementWrapper, (uint64_t)&v23);
  v7 = v23;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i currentInMetroStatus %d (error %@)", v14, ClassName, Name, 2873, v6, v7);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    v25 = v19;
    v26 = 2082;
    v27 = v20;
    v28 = 2082;
    v29 = v21;
    v30 = 1024;
    v31 = 2873;
    v32 = 1024;
    v33 = (int)v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i currentInMetroStatus %d (error %@)", buf, 0x32u);
  }

  v5[2](v5, v6, v7);
}

- (void)setAntiRelayRID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE1D0;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)rfSettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EE384;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)getDieIDWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EEC48;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)getUniqueFDRKeyWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EF320;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)stateInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EF8B8;
  v7[3] = &unk_1002E82A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)pushSignedRF:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0654;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)setFieldDetectEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F0BD8;
  v11[3] = &unk_1002E82D0;
  v14 = a3;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, v11);

}

- (void)registerForCallbacks:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F1200;
  block[3] = &unk_1002E82F8;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(workQueue, block);

}

- (void)unregisterForCallbacks:(id)a3
{
  void *v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", a3));
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F1674;
  v7[3] = &unk_1002E5CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)secureElementsWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F16FC;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)cachedEmbeddedSecureElementSerialNumber:(id)a3
{
  void (**v5)(id, id, id);
  NSData *seSerialFromFDR;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v5 = (void (**)(id, id, id))a3;
  if (self && (seSerialFromFDR = self->_seSerialFromFDR) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](seSerialFromFDR, "NF_asHexString"));
  }
  else
  {
    v16 = 0;
    v8 = sub_100026F2C((uint64_t)NFDriverWrapper, &v16);
    v7 = v16;
    if (!v8)
    {
      v9 = objc_alloc((Class)NSError);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v17[0] = NSLocalizedDescriptionKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not found"));
      v18[0] = v11;
      v18[1] = &off_1002FEFA0;
      v17[1] = CFSTR("Line");
      v17[2] = CFSTR("Method");
      v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v18[2] = v12;
      v17[3] = NSDebugDescriptionErrorKey;
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 3237);
      v18[3] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      v15 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 65, v14);
      v5[2](v5, v7, v15);

      goto LABEL_6;
    }
  }
  v5[2](v5, v7, 0);
LABEL_6:

}

- (void)triggerDelayedWake:(unsigned __int8)a3 completion:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F1B58;
  block[3] = &unk_1002E8320;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)triggerCrash:(unsigned __int16)a3 completion:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int16 v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F23E8;
  block[3] = &unk_1002E8348;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)toggleGPIO:(unsigned __int16)a3 completion:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int16 v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2A04;
  block[3] = &unk_1002E8348;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)getHostCardEmulationLogWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F30E4;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(workQueue, block);

}

- (BOOL)isRecoveryInProgress
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  v3 = sub_10014C524(v2);

  return v3;
}

- (id)triggerHammerfestRecoveryAt:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  SEL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1000E3C80;
  v20 = sub_1000E3C90;
  v21 = 0;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3830;
  block[3] = &unk_1002E8370;
  v14 = &v16;
  v15 = a2;
  block[4] = self;
  v13 = v5;
  v7 = v5;
  dispatch_async_and_wait(workQueue, block);
  v8 = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F39CC;
  v11[3] = &unk_1002E5C58;
  v11[4] = self;
  dispatch_async(v8, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)furyDelegateRegistered:(id)a3
{
  void *specific;
  id v7;
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
  _NFHardwareManager *v19;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = a3;
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
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 3411);
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
    v22 = v18;
    v23 = 2082;
    v24 = object_getClassName(self);
    v25 = 2082;
    v26 = sel_getName(a2);
    v27 = 1024;
    v28 = 3411;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19 = self;
  objc_sync_enter(v19);
  objc_storeWeak((id *)&v19->_ffDelegate, v7);

  objc_sync_exit(v19);
}

- (id)powerCycleSE:(id)a3
{
  id v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  void **v38;
  uint64_t v39;
  BOOL (*v40)(uint64_t);
  void *v41;
  id v42;
  _NFHardwareManager *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;

  v5 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1000E3C80;
  v49 = sub_1000E3C90;
  v50 = 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Power cycling SE :(", v9, ClassName, Name, 3805);
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
    v17 = object_getClassName(self);
    v18 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v52 = v16;
    v53 = 2082;
    v54 = v17;
    v55 = 2082;
    v56 = v18;
    v57 = 1024;
    v58 = 3805;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Power cycling SE :(", buf, 0x22u);
  }

  v38 = _NSConcreteStackBlock;
  v39 = 3221225472;
  v40 = sub_1000F3F68;
  v41 = &unk_1002E83E8;
  v19 = v5;
  v42 = v19;
  v43 = self;
  v44 = &v45;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
  v21 = sub_1000E3CEC((void **)&self->super.isa, &v38, CFSTR("PowerCycleSE"), v20);

  if ((v21 & 1) == 0)
  {
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v22);
    if (v23)
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      v23(3, "%c[%{public}s %{public}s]:%i Failed to powercycle SE: %{public}@", v25, v26, v27, 3821, v46[5], v38, v39, v40, v41);
    }
    v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v29 = NFSharedLogGetLogger(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      v35 = v46[5];
      *(_DWORD *)buf = 67110146;
      v52 = v32;
      v53 = 2082;
      v54 = v33;
      v55 = 2082;
      v56 = v34;
      v57 = 1024;
      v58 = 3821;
      v59 = 2114;
      v60 = v35;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to powercycle SE: %{public}@", buf, 0x2Cu);
    }

  }
  v36 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v36;
}

- (void)enablePowerCountersLogging:(BOOL)a3
{
  sub_1001F0B70((uint64_t)self, a3);
}

- (void)openSinglePollExpressModeAssertion:(double)a3 completion:(id)a4
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F414C;
  v8[3] = &unk_1002E6380;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(workQueue, v8);

}

- (void)cancelSinglePollExpressModeAssertionWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F439C;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)radioEnableStateWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F45EC;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)enableRadio:(BOOL)a3 completion:(id)a4
{
  id v7;
  void *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  SEL v15;
  BOOL v16;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4814;
  block[3] = &unk_1002E8410;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  v16 = a3;
  v10 = v8;
  v11 = v7;
  dispatch_async(workQueue, block);

}

- (void)getTemperatureWithCompletion:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F53D4;
  block[3] = &unk_1002E5D28;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)getReaderProhibitTimer:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F5AF4;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)dumpLPMDebugLogWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F623C;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)setChipscope:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F67AC;
  block[3] = &unk_1002E8320;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)getLPEMFTALoggingWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F6C50;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)requestAssertion:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F6E88;
  v11[3] = &unk_1002E5D50;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v14 = a3;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, v11);

}

- (void)releaseAssertion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F6F74;
  v13[3] = &unk_1002E8438;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(workQueue, v13);

}

- (void)requestSuppressPresentmentWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  void *v15;
  void (**v16)(id, _QWORD, void *);
  const char *v17;
  const char *Name;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  id v32;
  const char *ClassName;
  _QWORD v34[5];
  id v35;
  void (**v36)(id, _QWORD, void *);
  SEL v37;
  _OWORD v38[2];
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unsigned int v50;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_NFCardSession validateEntitlements:](_NFCardSession, "validateEntitlements:", v8));

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
      v15 = v9;
      v16 = v5;
      v17 = a2;
      Name = sel_getName(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v32 = objc_msgSend(v6, "processIdentifier");
      v31 = Name;
      a2 = v17;
      v5 = v16;
      v9 = v15;
      v21 = 45;
      if (isMetaClass)
        v21 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v21, ClassName, v31, 4138, v20, v32);

    }
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(self);
      v28 = sel_getName(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110402;
      v40 = v26;
      v41 = 2082;
      v42 = v27;
      v43 = 2082;
      v44 = v28;
      v45 = 1024;
      v46 = 4138;
      v47 = 2114;
      v48 = v30;
      v49 = 1026;
      v50 = objc_msgSend(v6, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);

    }
    v5[2](v5, 0, v9);
  }
  else
  {
    if (v6)
      objc_msgSend(v6, "auditToken");
    else
      memset(v38, 0, sizeof(v38));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000F72D4;
    v34[3] = &unk_1002E8460;
    v36 = v5;
    v37 = a2;
    v34[4] = self;
    v35 = v6;
    +[_NFCardSession isEligibleWithUserPrompt:auditToken:completion:](_NFCardSession, "isEligibleWithUserPrompt:auditToken:completion:", 1, v38, v34);

  }
}

- (void)releaseSuppressPresentmentAssertion:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *workQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  _NFHardwareManager *v16;
  id v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7870;
  block[3] = &unk_1002E83C0;
  v15 = v7;
  v16 = self;
  v18 = v8;
  v19 = a2;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(workQueue, block);

}

- (void)queueFieldDetectSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void (**v9)(id, _QWORD, void *);
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v14;
  const char *ClassName;
  const char *Name;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  NFDriverWrapper *driverWrapper;
  void *v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  objc_class *v40;
  int v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  _NFFieldDetectSession *v91;
  _NFFieldDetectSession *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  char isKindOfClass;
  void *v97;
  NSMutableArray *v98;
  void *v99;
  void *v100;
  void *v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  const char *v112;
  const char *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  const char *v119;
  id v120;
  id v121;
  void *v122;
  NSErrorUserInfoKey v123;
  void *v124;
  uint8_t buf[4];
  int v126;
  __int16 v127;
  const char *v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  unsigned int v136;
  NSErrorUserInfoKey v137;
  void *v138;
  NSErrorUserInfoKey v139;
  void *v140;
  NSErrorUserInfoKey v141;
  void *v142;

  v120 = a3;
  v121 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v14 = 43;
    else
      v14 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 4186, v18);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v126 = v23;
    v127 = 2082;
    v128 = v24;
    v129 = 2082;
    v130 = v25;
    v131 = 1024;
    v132 = 4186;
    v133 = 2114;
    v134 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    driverWrapper = self->_driverWrapper;
    if (driverWrapper && driverWrapper->_hasAntenna)
    {
      if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, 0) == (id)1)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[_NFFieldDetectSession validateEntitlements:](_NFFieldDetectSession, "validateEntitlements:", v56));

        if (v47)
        {
          v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v58 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v57);
          if (v58)
          {
            v59 = object_getClass(self);
            if (class_isMetaClass(v59))
              v60 = 43;
            else
              v60 = 45;
            v119 = object_getClassName(self);
            v61 = sel_getName(a2);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("ClientName")));
            v58(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v60, v119, v61, 4207, v63, objc_msgSend(v122, "processIdentifier"));

          }
          v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v65 = NFSharedLogGetLogger(v64);
          v66 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = object_getClass(self);
            if (class_isMetaClass(v67))
              v68 = 43;
            else
              v68 = 45;
            v69 = object_getClassName(self);
            v70 = sel_getName(a2);
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ClientName")));
            v73 = objc_msgSend(v122, "processIdentifier");
            *(_DWORD *)buf = 67110402;
            v126 = v68;
            v127 = 2082;
            v128 = v69;
            v129 = 2082;
            v130 = v70;
            v131 = 1024;
            v132 = 4207;
            v133 = 2114;
            v134 = v72;
            v135 = 1024;
            v136 = v73;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

          }
          v9[2](v9, 0, v47);
        }
        else
        {
          v91 = -[_NFFieldDetectSession initWithRemoteObject:workQueue:]([_NFFieldDetectSession alloc], "initWithRemoteObject:workQueue:", v120, self->_workQueue);
          v92 = v91;
          if (v91)
          {
            -[_NFSession setQueue:](v91, "setQueue:", self);
            -[_NFXPCSession setConnection:](v92, "setConnection:", v122);
            -[_NFSession setUid:](v92, "setUid:", 0xFFFFFFFFLL);
            v93 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v121, v93) & 1) != 0)
            {
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKey:", CFSTR("session.fd.unfiltered")));
              v95 = objc_opt_class(NSNumber);
              isKindOfClass = objc_opt_isKindOfClass(v94, v95);

              if ((isKindOfClass & 1) != 0)
              {
                v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKey:", CFSTR("session.fd.unfiltered")));
                -[_NFFieldDetectSession setUnfiltered:](v92, "setUnfiltered:", objc_msgSend(v97, "BOOLValue"));

              }
            }
            v98 = self->_secureElementSessionQueue;
            objc_sync_enter(v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
            objc_msgSend(v100, "addObject:", v92);

            objc_sync_exit(v98);
            ((void (**)(id, _NFFieldDetectSession *, void *))v9)[2](v9, v92, 0);
            sub_100098D38((uint64_t)self, v92, 0, (int)objc_msgSend(v122, "processIdentifier"), 0);
          }
          else
          {
            v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v102 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v101);
            if (v102)
            {
              v103 = object_getClass(self);
              if (class_isMetaClass(v103))
                v104 = 43;
              else
                v104 = 45;
              v105 = object_getClassName(self);
              v106 = sel_getName(a2);
              v102(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v104, v105, v106, 4214);
            }
            v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v108 = NFSharedLogGetLogger(v107);
            v109 = objc_claimAutoreleasedReturnValue(v108);
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            {
              v110 = object_getClass(self);
              if (class_isMetaClass(v110))
                v111 = 43;
              else
                v111 = 45;
              v112 = object_getClassName(self);
              v113 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v126 = v111;
              v127 = 2082;
              v128 = v112;
              v129 = 2082;
              v130 = v113;
              v131 = 1024;
              v132 = 4214;
              _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
            }

            v114 = objc_alloc((Class)NSError);
            v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
            v123 = NSLocalizedDescriptionKey;
            v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
            v124 = v116;
            v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
            v118 = objc_msgSend(v114, "initWithDomain:code:userInfo:", v115, 13, v117);
            v9[2](v9, 0, v118);

          }
          v47 = 0;
        }
      }
      else
      {
        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v74);
        if (v75)
        {
          v76 = object_getClass(self);
          if (class_isMetaClass(v76))
            v77 = 43;
          else
            v77 = 45;
          v78 = object_getClassName(self);
          v79 = sel_getName(a2);
          v75(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v77, v78, v79, 4200);
        }
        v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v81 = NFSharedLogGetLogger(v80);
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          v83 = object_getClass(self);
          if (class_isMetaClass(v83))
            v84 = 43;
          else
            v84 = 45;
          v85 = object_getClassName(self);
          v86 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v126 = v84;
          v127 = 2082;
          v128 = v85;
          v129 = 2082;
          v130 = v86;
          v131 = 1024;
          v132 = 4200;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
        }

        v87 = objc_alloc((Class)NSError);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v137 = NSLocalizedDescriptionKey;
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
        v138 = v88;
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));
        v90 = objc_msgSend(v87, "initWithDomain:code:userInfo:", v47, 50, v89);
        v9[2](v9, 0, v90);

      }
    }
    else
    {
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v29);
      if (v30)
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v30(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v32, v33, v34, 4194, v36);

      }
      v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v38 = NFSharedLogGetLogger(v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = object_getClass(self);
        if (class_isMetaClass(v40))
          v41 = 43;
        else
          v41 = 45;
        v42 = object_getClassName(self);
        v43 = sel_getName(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "NF_userInfo"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110146;
        v126 = v41;
        v127 = 2082;
        v128 = v42;
        v129 = 2082;
        v130 = v43;
        v131 = 1024;
        v132 = 4194;
        v133 = 2114;
        v134 = v45;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

      }
      v46 = objc_alloc((Class)NSError);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v139 = NSLocalizedDescriptionKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
      v140 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1));
      v50 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 14, v49);
      v9[2](v9, 0, v50);

    }
  }
  else
  {
    v51 = objc_alloc((Class)NSError);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v141 = NSLocalizedDescriptionKey;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v142 = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1));
    v54 = objc_msgSend(v51, "initWithDomain:code:userInfo:", v47, 58, v53);
    v9[2](v9, 0, v54);

  }
}

- (void)queueECommercePaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  _NFECommercePaymentSession *v52;
  _NFECommercePaymentSession *v53;
  NSObject *workQueue;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  const char *v78;
  id v79;
  id v80;
  id v81;
  _QWORD block[5];
  _NFECommercePaymentSession *v83;
  id v84;
  SEL v85;
  NSErrorUserInfoKey v86;
  void *v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  unsigned int v99;
  NSErrorUserInfoKey v100;
  void *v101;

  v81 = a3;
  v80 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 4248, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v89 = v23;
    v90 = 2082;
    v91 = v24;
    v92 = 2082;
    v93 = v25;
    v94 = 1024;
    v95 = 4248;
    v96 = 2114;
    v97 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFECommercePaymentSession validateEntitlements:](_NFECommercePaymentSession, "validateEntitlements:", v29));

    if (v30)
    {
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v79 = objc_msgSend(v8, "processIdentifier");
        v40 = 45;
        if (v35)
          v40 = 43;
        v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v36, v37, 4267, v39, v79);

      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFSharedLogGetLogger(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44))
          v45 = 43;
        else
          v45 = 45;
        v46 = object_getClassName(self);
        v47 = sel_getName(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v50 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v89 = v45;
        v90 = 2082;
        v91 = v46;
        v92 = 2082;
        v93 = v47;
        v94 = 1024;
        v95 = 4267;
        v96 = 2114;
        v97 = v49;
        v98 = 1024;
        v99 = v50;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v51 = v80;
      (*((void (**)(id, _QWORD, _QWORD, void *))v80 + 2))(v80, 0, 0, v30);
    }
    else
    {
      v52 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFECommercePaymentSession alloc], "initWithRemoteObject:workQueue:", v81, self->_workQueue);
      v53 = v52;
      if (v52)
      {
        -[_NFSession setQueue:](v52, "setQueue:", self);
        -[_NFXPCSession setConnection:](v53, "setConnection:", v8);
        -[_NFSession setUid:](v53, "setUid:", 0xFFFFFFFFLL);
        v51 = v80;
        (*((void (**)(id, _NFECommercePaymentSession *, BOOL, _QWORD))v80 + 2))(v80, v53, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000F8FD4;
        block[3] = &unk_1002E5CD0;
        block[4] = self;
        v83 = v53;
        v85 = a2;
        v84 = v8;
        dispatch_async(workQueue, block);

      }
      else
      {
        v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v60 = NFLogGetLogger(v59);
        if (v60)
        {
          v61 = (void (*)(uint64_t, const char *, ...))v60;
          v62 = object_getClass(self);
          v63 = class_isMetaClass(v62);
          v64 = object_getClassName(self);
          v78 = sel_getName(a2);
          v65 = 45;
          if (v63)
            v65 = 43;
          v61(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v65, v64, v78, 4274);
        }
        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger(v66);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = object_getClass(self);
          if (class_isMetaClass(v69))
            v70 = 43;
          else
            v70 = 45;
          v71 = object_getClassName(self);
          v72 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v89 = v70;
          v90 = 2082;
          v91 = v71;
          v92 = 2082;
          v93 = v72;
          v94 = 1024;
          v95 = 4274;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v73 = objc_alloc((Class)NSError);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v86 = NSLocalizedDescriptionKey;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v87 = v75;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
        v77 = objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 13, v76);
        v51 = v80;
        (*((void (**)(id, _QWORD, _QWORD, id))v80 + 2))(v80, 0, 0, v77);

      }
      v30 = 0;
    }
  }
  else
  {
    v55 = objc_alloc((Class)NSError);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v100 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v101 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
    v58 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v30, 58, v57);
    v51 = v80;
    (*((void (**)(id, _QWORD, _QWORD, id))v80 + 2))(v80, 0, 0, v58);

  }
}

- (void)queueContactlessPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v18;
  const char *Name;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NFDriverWrapper *driverWrapper;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _NFContactlessPaymentSession *v89;
  _NFContactlessPaymentSession *v90;
  void *v91;
  NSObject *workQueue;
  _NFContactlessPaymentSession *v93;
  void *v94;
  uint64_t v95;
  void (*v96)(uint64_t, const char *, ...);
  objc_class *v97;
  _BOOL4 v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
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
  id v128;
  void *v129;
  void *v130;
  id v131;
  const char *v132;
  const char *v133;
  const char *v134;
  id v135;
  id v136;
  id v137;
  const char *sel;
  _QWORD block[4];
  _NFContactlessPaymentSession *v140;
  _NFHardwareManager *v141;
  id v142;
  const char *v143;
  NSErrorUserInfoKey v144;
  void *v145;
  NSErrorUserInfoKey v146;
  void *v147;
  NSErrorUserInfoKey v148;
  void *v149;
  uint8_t buf[4];
  int v151;
  __int16 v152;
  const char *v153;
  __int16 v154;
  const char *v155;
  __int16 v156;
  int v157;
  __int16 v158;
  void *v159;
  __int16 v160;
  unsigned int v161;
  NSErrorUserInfoKey v162;
  void *v163;

  v9 = a3;
  v10 = a4;
  v137 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  sel = a2;
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v18 = v9;
    Name = sel_getName(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v132 = Name;
    v9 = v18;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v132, 4319, v21);

  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(sel);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v151 = v27;
    v152 = 2082;
    v153 = v28;
    v154 = 2082;
    v155 = v29;
    v156 = 1024;
    v157 = 4319;
    v158 = 2114;
    v159 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v58 = objc_alloc((Class)NSError);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v162 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v163 = v59;
    v60 = v11;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1));
    v62 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v34, 58, v61);
    v57 = v137;
    (*((void (**)(id, _QWORD, _QWORD, id))v137 + 2))(v137, 0, 0, v62);

    v11 = v60;
    goto LABEL_60;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[_NFContactlessSession validateEntitlements:](_NFContactlessPaymentSession, "validateEntitlements:", v33));

  if (v34)
  {
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFLogGetLogger(v35);
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(self);
      v39 = class_isMetaClass(v38);
      v40 = object_getClassName(self);
      v41 = sel_getName(sel);
      v136 = v10;
      v42 = v9;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v135 = objc_msgSend(v11, "processIdentifier");
      v45 = 45;
      if (v39)
        v45 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v45, v40, v41, 4338, v44, v135);

      v9 = v42;
      v10 = v136;
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(sel);
      v53 = v11;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v56 = objc_msgSend(v53, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      v151 = v50;
      v152 = 2082;
      v153 = v51;
      v154 = 2082;
      v155 = v52;
      v156 = 1024;
      v157 = 4338;
      v158 = 2114;
      v159 = v55;
      v160 = 1024;
      v161 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      v11 = v53;
    }

    v57 = v137;
    (*((void (**)(id, _QWORD, _QWORD, void *))v137 + 2))(v137, 0, 0, v34);
    goto LABEL_60;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFLogGetLogger(v64);
    if (v65)
    {
      v66 = (void (*)(uint64_t, const char *, ...))v65;
      v67 = object_getClass(self);
      v68 = class_isMetaClass(v67);
      v69 = object_getClassName(self);
      v70 = sel_getName(sel);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v73 = 45;
      if (v68)
        v73 = 43;
      v66(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v73, v69, v70, 4344, v72);

    }
    v74 = v11;
    v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = object_getClass(self);
      if (class_isMetaClass(v78))
        v79 = 43;
      else
        v79 = 45;
      v80 = object_getClassName(self);
      v81 = sel_getName(sel);
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      v151 = v79;
      v152 = 2082;
      v153 = v80;
      v154 = 2082;
      v155 = v81;
      v156 = 1024;
      v157 = 4344;
      v158 = 2114;
      v159 = v83;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v84 = objc_alloc((Class)NSError);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v148 = NSLocalizedDescriptionKey;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v149 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
    v88 = objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 14, v87);
    v57 = v137;
    (*((void (**)(id, _QWORD, _QWORD, id))v137 + 2))(v137, 0, 0, v88);

LABEL_59:
    v34 = 0;
    v11 = v74;
    goto LABEL_60;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v10)) == (id)1)
  {
    v89 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:]([_NFContactlessPaymentSession alloc], "initWithRemoteObject:workQueue:expressModeManager:", v9, self->_workQueue, self->_expressModeManager);
    v90 = v89;
    if (v89)
    {
      -[_NFSession setQueue:](v89, "setQueue:", self);
      -[_NFXPCSession setConnection:](v90, "setConnection:", v11);
      -[_NFSession setUid:](v90, "setUid:", 0xFFFFFFFFLL);
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "exportedInterface"));
      sub_10006B974((uint64_t)NFHardwareManagerInterface, v91);

      (*((void (**)(id, _NFContactlessPaymentSession *, BOOL, _QWORD))v137 + 2))(v137, v90, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000FA384;
      block[3] = &unk_1002E5CD0;
      v140 = v90;
      v141 = self;
      v57 = v137;
      v143 = sel;
      v74 = v11;
      v142 = v11;
      dispatch_async(workQueue, block);

      v93 = v140;
    }
    else
    {
      v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v115 = NFLogGetLogger(v114);
      if (v115)
      {
        v116 = (void (*)(uint64_t, const char *, ...))v115;
        v117 = object_getClass(self);
        v118 = class_isMetaClass(v117);
        v119 = object_getClassName(self);
        v134 = sel_getName(sel);
        v120 = 45;
        if (v118)
          v120 = 43;
        v116(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v120, v119, v134, 4359);
      }
      v74 = v11;
      v121 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v122 = NFSharedLogGetLogger(v121);
      v123 = objc_claimAutoreleasedReturnValue(v122);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        v124 = object_getClass(self);
        if (class_isMetaClass(v124))
          v125 = 43;
        else
          v125 = 45;
        v126 = object_getClassName(self);
        v127 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        v151 = v125;
        v152 = 2082;
        v153 = v126;
        v154 = 2082;
        v155 = v127;
        v156 = 1024;
        v157 = 4359;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
      }

      v128 = objc_alloc((Class)NSError);
      v93 = (_NFContactlessPaymentSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v144 = NSLocalizedDescriptionKey;
      v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v145 = v129;
      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
      v131 = objc_msgSend(v128, "initWithDomain:code:userInfo:", v93, 13, v130);
      v57 = v137;
      (*((void (**)(id, _QWORD, _QWORD, id))v137 + 2))(v137, 0, 0, v131);

    }
    goto LABEL_59;
  }
  v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v95 = NFLogGetLogger(v94);
  if (v95)
  {
    v96 = (void (*)(uint64_t, const char *, ...))v95;
    v97 = object_getClass(self);
    v98 = class_isMetaClass(v97);
    v99 = object_getClassName(self);
    v133 = sel_getName(sel);
    v100 = 45;
    if (v98)
      v100 = 43;
    v96(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v100, v99, v133, 4350);
  }
  v101 = v11;
  v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v103 = NFSharedLogGetLogger(v102);
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
  {
    v105 = object_getClass(self);
    if (class_isMetaClass(v105))
      v106 = 43;
    else
      v106 = 45;
    v107 = object_getClassName(self);
    v108 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    v151 = v106;
    v152 = 2082;
    v153 = v107;
    v154 = 2082;
    v155 = v108;
    v156 = 1024;
    v157 = 4350;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
  }

  v109 = objc_alloc((Class)NSError);
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v146 = NSLocalizedDescriptionKey;
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
  v147 = v111;
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
  v113 = objc_msgSend(v109, "initWithDomain:code:userInfo:", v110, 50, v112);
  v57 = v137;
  (*((void (**)(id, _QWORD, _QWORD, id))v137 + 2))(v137, 0, 0, v113);

  v34 = 0;
  v11 = v101;
LABEL_60:

}

- (void)queueContactlessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v18;
  const char *Name;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NFDriverWrapper *driverWrapper;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _NFContactlessSession *v89;
  _NFContactlessSession *v90;
  NSObject *workQueue;
  _NFContactlessSession *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  NSObject *v103;
  objc_class *v104;
  int v105;
  const char *v106;
  const char *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  void (*v115)(uint64_t, const char *, ...);
  objc_class *v116;
  _BOOL4 v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSObject *v122;
  objc_class *v123;
  int v124;
  const char *v125;
  const char *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  const char *v131;
  const char *v132;
  const char *v133;
  id v134;
  id v135;
  id v136;
  const char *sel;
  _QWORD block[4];
  _NFContactlessSession *v139;
  _NFHardwareManager *v140;
  id v141;
  const char *v142;
  NSErrorUserInfoKey v143;
  void *v144;
  NSErrorUserInfoKey v145;
  void *v146;
  NSErrorUserInfoKey v147;
  void *v148;
  uint8_t buf[4];
  int v150;
  __int16 v151;
  const char *v152;
  __int16 v153;
  const char *v154;
  __int16 v155;
  int v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  unsigned int v160;
  NSErrorUserInfoKey v161;
  void *v162;

  v9 = a3;
  v10 = a4;
  v136 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  sel = a2;
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v18 = v9;
    Name = sel_getName(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v131 = Name;
    v9 = v18;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v131, 4407, v21);

  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(sel);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v150 = v27;
    v151 = 2082;
    v152 = v28;
    v153 = 2082;
    v154 = v29;
    v155 = 1024;
    v156 = 4407;
    v157 = 2114;
    v158 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v58 = objc_alloc((Class)NSError);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v161 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v162 = v59;
    v60 = v11;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1));
    v62 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v34, 58, v61);
    v57 = v136;
    (*((void (**)(id, _QWORD, _QWORD, id))v136 + 2))(v136, 0, 0, v62);

    v11 = v60;
    goto LABEL_60;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[_NFContactlessSession validateEntitlements:](_NFContactlessSession, "validateEntitlements:", v33));

  if (v34)
  {
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFLogGetLogger(v35);
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(self);
      v39 = class_isMetaClass(v38);
      v40 = object_getClassName(self);
      v41 = sel_getName(sel);
      v135 = v10;
      v42 = v9;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v134 = objc_msgSend(v11, "processIdentifier");
      v45 = 45;
      if (v39)
        v45 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v45, v40, v41, 4426, v44, v134);

      v9 = v42;
      v10 = v135;
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(sel);
      v53 = v11;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v56 = objc_msgSend(v53, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      v150 = v50;
      v151 = 2082;
      v152 = v51;
      v153 = 2082;
      v154 = v52;
      v155 = 1024;
      v156 = 4426;
      v157 = 2114;
      v158 = v55;
      v159 = 1024;
      v160 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      v11 = v53;
    }

    v57 = v136;
    (*((void (**)(id, _QWORD, _QWORD, void *))v136 + 2))(v136, 0, 0, v34);
    goto LABEL_60;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFLogGetLogger(v64);
    if (v65)
    {
      v66 = (void (*)(uint64_t, const char *, ...))v65;
      v67 = object_getClass(self);
      v68 = class_isMetaClass(v67);
      v69 = object_getClassName(self);
      v70 = sel_getName(sel);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v73 = 45;
      if (v68)
        v73 = 43;
      v66(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v73, v69, v70, 4432, v72);

    }
    v74 = v11;
    v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      v78 = object_getClass(self);
      if (class_isMetaClass(v78))
        v79 = 43;
      else
        v79 = 45;
      v80 = object_getClassName(self);
      v81 = sel_getName(sel);
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      v150 = v79;
      v151 = 2082;
      v152 = v80;
      v153 = 2082;
      v154 = v81;
      v155 = 1024;
      v156 = 4432;
      v157 = 2114;
      v158 = v83;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v84 = objc_alloc((Class)NSError);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v147 = NSLocalizedDescriptionKey;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v148 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
    v88 = objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 14, v87);
    v57 = v136;
    (*((void (**)(id, _QWORD, _QWORD, id))v136 + 2))(v136, 0, 0, v88);

LABEL_59:
    v34 = 0;
    v11 = v74;
    goto LABEL_60;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v10)) == (id)1)
  {
    v89 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:]([_NFContactlessSession alloc], "initWithRemoteObject:workQueue:expressModeManager:", v9, self->_workQueue, self->_expressModeManager);
    v90 = v89;
    if (v89)
    {
      -[_NFSession setQueue:](v89, "setQueue:", self);
      -[_NFXPCSession setConnection:](v90, "setConnection:", v11);
      -[_NFSession setUid:](v90, "setUid:", 0xFFFFFFFFLL);
      (*((void (**)(id, _NFContactlessSession *, BOOL, _QWORD))v136 + 2))(v136, v90, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000FB730;
      block[3] = &unk_1002E5CD0;
      v139 = v90;
      v140 = self;
      v57 = v136;
      v142 = sel;
      v74 = v11;
      v141 = v11;
      dispatch_async(workQueue, block);

      v92 = v139;
    }
    else
    {
      v113 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v114 = NFLogGetLogger(v113);
      if (v114)
      {
        v115 = (void (*)(uint64_t, const char *, ...))v114;
        v116 = object_getClass(self);
        v117 = class_isMetaClass(v116);
        v118 = object_getClassName(self);
        v133 = sel_getName(sel);
        v119 = 45;
        if (v117)
          v119 = 43;
        v115(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v119, v118, v133, 4448);
      }
      v74 = v11;
      v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v121 = NFSharedLogGetLogger(v120);
      v122 = objc_claimAutoreleasedReturnValue(v121);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        v123 = object_getClass(self);
        if (class_isMetaClass(v123))
          v124 = 43;
        else
          v124 = 45;
        v125 = object_getClassName(self);
        v126 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        v150 = v124;
        v151 = 2082;
        v152 = v125;
        v153 = 2082;
        v154 = v126;
        v155 = 1024;
        v156 = 4448;
        _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
      }

      v127 = objc_alloc((Class)NSError);
      v92 = (_NFContactlessSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v143 = NSLocalizedDescriptionKey;
      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v144 = v128;
      v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1));
      v130 = objc_msgSend(v127, "initWithDomain:code:userInfo:", v92, 13, v129);
      v57 = v136;
      (*((void (**)(id, _QWORD, _QWORD, id))v136 + 2))(v136, 0, 0, v130);

    }
    goto LABEL_59;
  }
  v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v94 = NFLogGetLogger(v93);
  if (v94)
  {
    v95 = (void (*)(uint64_t, const char *, ...))v94;
    v96 = object_getClass(self);
    v97 = class_isMetaClass(v96);
    v98 = object_getClassName(self);
    v132 = sel_getName(sel);
    v99 = 45;
    if (v97)
      v99 = 43;
    v95(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v99, v98, v132, 4438);
  }
  v100 = v11;
  v101 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v102 = NFSharedLogGetLogger(v101);
  v103 = objc_claimAutoreleasedReturnValue(v102);
  if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
  {
    v104 = object_getClass(self);
    if (class_isMetaClass(v104))
      v105 = 43;
    else
      v105 = 45;
    v106 = object_getClassName(self);
    v107 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    v150 = v105;
    v151 = 2082;
    v152 = v106;
    v153 = 2082;
    v154 = v107;
    v155 = 1024;
    v156 = 4438;
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
  }

  v108 = objc_alloc((Class)NSError);
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v145 = NSLocalizedDescriptionKey;
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
  v146 = v110;
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1));
  v112 = objc_msgSend(v108, "initWithDomain:code:userInfo:", v109, 50, v111);
  v57 = v136;
  (*((void (**)(id, _QWORD, _QWORD, id))v136 + 2))(v136, 0, 0, v112);

  v34 = 0;
  v11 = v100;
LABEL_60:

}

- (void)queueSecureElementManagerSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v18;
  const char *Name;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _NFSecureElementManagerSession *v64;
  _NFSecureElementManagerSession *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  char isKindOfClass;
  void *v70;
  void *v71;
  NSObject *workQueue;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  void (*v80)(uint64_t, const char *, ...);
  objc_class *v81;
  _BOOL4 v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  objc_class *v88;
  int v89;
  const char *v90;
  const char *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  const char *v96;
  const char *v97;
  id v98;
  _NFHardwareManager *v99;
  id v100;
  const char *v101;
  void *v102;
  _QWORD block[4];
  id v104;
  _NFHardwareManager *v105;
  _NFSecureElementManagerSession *v106;
  id v107;
  SEL v108;
  NSErrorUserInfoKey v109;
  void *v110;
  uint8_t buf[4];
  int v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  const char *v116;
  __int16 v117;
  int v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  unsigned int v122;
  NSErrorUserInfoKey v123;
  void *v124;

  v9 = a3;
  v10 = a4;
  v100 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v18 = v9;
    Name = sel_getName(a2);
    v101 = a2;
    v20 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v96 = Name;
    v9 = v18;
    v23 = 45;
    if (isMetaClass)
      v23 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v23, ClassName, v96, 4495, v22);

    v10 = v20;
    a2 = v101;
  }
  v102 = v10;
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = NFSharedLogGetLogger(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(self);
    v30 = sel_getName(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v112 = v28;
    v113 = 2082;
    v114 = v29;
    v115 = 2082;
    v116 = v30;
    v117 = 1024;
    v118 = 4495;
    v119 = 2114;
    v120 = v32;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureElementManagerSession validateEntitlements:](_NFSecureElementManagerSession, "validateEntitlements:", v34));

    if (v35)
    {
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFLogGetLogger(v36);
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(self);
        v40 = class_isMetaClass(v39);
        v41 = object_getClassName(self);
        v42 = sel_getName(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
        v99 = self;
        v44 = v11;
        v45 = a2;
        v46 = v9;
        v47 = v43;
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v98 = objc_msgSend(v44, "processIdentifier");
        v49 = 45;
        if (v40)
          v49 = 43;
        v38(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v49, v41, v42, 4520, v48, v98);

        v9 = v46;
        a2 = v45;
        v11 = v44;
        self = v99;
      }
      v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFSharedLogGetLogger(v50);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = object_getClass(self);
        if (class_isMetaClass(v53))
          v54 = 43;
        else
          v54 = 45;
        v55 = object_getClassName(self);
        v56 = sel_getName(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v59 = objc_msgSend(v11, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v112 = v54;
        v113 = 2082;
        v114 = v55;
        v115 = 2082;
        v116 = v56;
        v117 = 1024;
        v118 = 4520;
        v119 = 2114;
        v120 = v58;
        v121 = 1024;
        v122 = v59;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v60 = v100;
      (*((void (**)(id, _QWORD, _QWORD, void *))v100 + 2))(v100, 0, 0, v35);
    }
    else
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
      v63 = objc_msgSend(v62, "allowBackgroundedSession");

      v64 = -[_NFSecureElementManagerSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:]([_NFSecureElementManagerSession alloc], "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", v9, self->_workQueue, self->_expressModeManager, v63);
      v65 = v64;
      if (v64)
      {
        -[_NFSession setQueue:](v64, "setQueue:", self);
        -[_NFXPCSession setConnection:](v65, "setConnection:", v11);
        v66 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v102, v66) & 1) != 0)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKey:", CFSTR("session.high.priority")));
          v68 = objc_opt_class(NSNumber);
          isKindOfClass = objc_opt_isKindOfClass(v67, v68);

          if ((isKindOfClass & 1) != 0)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("session.high.priority")));
            -[_NFSession setPriority:](v65, "setPriority:", objc_msgSend(v70, "BOOLValue"));

          }
        }
        -[_NFSession setUid:](v65, "setUid:", 0xFFFFFFFFLL);
        -[_NFSecureElementManagerSession setDriverWrapper:](v65, "setDriverWrapper:", self->_driverWrapper);
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "exportedInterface"));
        sub_10006B830((uint64_t)NFHardwareManagerInterface, v71);

        (*((void (**)(id, _NFSecureElementManagerSession *, BOOL, _QWORD))v100 + 2))(v100, v65, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FC78C;
        block[3] = &unk_1002E8488;
        v104 = v102;
        v105 = self;
        v60 = v100;
        v106 = v65;
        v108 = a2;
        v107 = v11;
        dispatch_async(workQueue, block);

        v73 = v104;
      }
      else
      {
        v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v79 = NFLogGetLogger(v78);
        if (v79)
        {
          v80 = (void (*)(uint64_t, const char *, ...))v79;
          v81 = object_getClass(self);
          v82 = class_isMetaClass(v81);
          v83 = object_getClassName(self);
          v97 = sel_getName(a2);
          v84 = 45;
          if (v82)
            v84 = 43;
          v80(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v84, v83, v97, 4531);
        }
        v85 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v86 = NFSharedLogGetLogger(v85);
        v87 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          v88 = object_getClass(self);
          if (class_isMetaClass(v88))
            v89 = 43;
          else
            v89 = 45;
          v90 = object_getClassName(self);
          v91 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v112 = v89;
          v113 = 2082;
          v114 = v90;
          v115 = 2082;
          v116 = v91;
          v117 = 1024;
          v118 = 4531;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v92 = objc_alloc((Class)NSError);
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v109 = NSLocalizedDescriptionKey;
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v110 = v93;
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
        v95 = objc_msgSend(v92, "initWithDomain:code:userInfo:", v73, 13, v94);
        v60 = v100;
        (*((void (**)(id, _QWORD, _QWORD, id))v100 + 2))(v100, 0, 0, v95);

      }
      v35 = 0;
    }
  }
  else
  {
    v74 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v123 = NSLocalizedDescriptionKey;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v124 = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
    v77 = objc_msgSend(v74, "initWithDomain:code:userInfo:", v35, 58, v76);
    v60 = v100;
    (*((void (**)(id, _QWORD, _QWORD, id))v100 + 2))(v100, 0, 0, v77);

  }
}

- (void)queueLoyaltyAndPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v18;
  const char *Name;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NFDriverWrapper *driverWrapper;
  void *v64;
  uint64_t v65;
  void (*v66)(uint64_t, const char *, ...);
  objc_class *v67;
  _BOOL4 v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _NFLoyaltyAndPaymentSession *v89;
  _NFLoyaltyAndPaymentSession *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  char isKindOfClass;
  void *v95;
  void *v96;
  NSObject *workQueue;
  _NFLoyaltyAndPaymentSession *v98;
  void *v99;
  uint64_t v100;
  void (*v101)(uint64_t, const char *, ...);
  objc_class *v102;
  _BOOL4 v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  int v111;
  const char *v112;
  const char *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  uint64_t v120;
  void (*v121)(uint64_t, const char *, ...);
  objc_class *v122;
  _BOOL4 v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  objc_class *v129;
  int v130;
  const char *v131;
  const char *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  const char *v137;
  const char *v138;
  const char *v139;
  id v140;
  id v141;
  id v142;
  const char *sel;
  _QWORD block[4];
  _NFLoyaltyAndPaymentSession *v145;
  _NFHardwareManager *v146;
  id v147;
  const char *v148;
  NSErrorUserInfoKey v149;
  void *v150;
  NSErrorUserInfoKey v151;
  void *v152;
  NSErrorUserInfoKey v153;
  void *v154;
  uint8_t buf[4];
  int v156;
  __int16 v157;
  const char *v158;
  __int16 v159;
  const char *v160;
  __int16 v161;
  int v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  unsigned int v166;
  NSErrorUserInfoKey v167;
  void *v168;

  v9 = a3;
  v10 = a4;
  v142 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  sel = a2;
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v18 = v9;
    Name = sel_getName(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v137 = Name;
    v9 = v18;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v137, 4582, v21);

  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(sel);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v156 = v27;
    v157 = 2082;
    v158 = v28;
    v159 = 2082;
    v160 = v29;
    v161 = 1024;
    v162 = 4582;
    v163 = 2114;
    v164 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v58 = objc_alloc((Class)NSError);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v167 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v168 = v59;
    v60 = v11;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1));
    v62 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v34, 58, v61);
    v57 = v142;
    (*((void (**)(id, _QWORD, _QWORD, id))v142 + 2))(v142, 0, 0, v62);

    v11 = v60;
    goto LABEL_63;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[_NFLoyaltyAndPaymentSession validateEntitlements:](_NFLoyaltyAndPaymentSession, "validateEntitlements:", v33));

  if (v34)
  {
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFLogGetLogger(v35);
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(self);
      v39 = class_isMetaClass(v38);
      v40 = object_getClassName(self);
      v41 = sel_getName(sel);
      v141 = v10;
      v42 = v9;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v140 = objc_msgSend(v11, "processIdentifier");
      v45 = 45;
      if (v39)
        v45 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v45, v40, v41, 4601, v44, v140);

      v9 = v42;
      v10 = v141;
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(sel);
      v53 = v11;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v56 = objc_msgSend(v53, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      v156 = v50;
      v157 = 2082;
      v158 = v51;
      v159 = 2082;
      v160 = v52;
      v161 = 1024;
      v162 = 4601;
      v163 = 2114;
      v164 = v55;
      v165 = 1024;
      v166 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      v11 = v53;
    }

    v57 = v142;
    (*((void (**)(id, _QWORD, _QWORD, void *))v142 + 2))(v142, 0, 0, v34);
    goto LABEL_63;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    v64 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v65 = NFLogGetLogger(v64);
    if (v65)
    {
      v66 = (void (*)(uint64_t, const char *, ...))v65;
      v67 = object_getClass(self);
      v68 = class_isMetaClass(v67);
      v69 = object_getClassName(self);
      v70 = sel_getName(sel);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v73 = 45;
      if (v68)
        v73 = 43;
      v66(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v73, v69, v70, 4607, v72);

    }
    v74 = v11;
    v75 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v76 = NFSharedLogGetLogger(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = object_getClass(self);
      if (class_isMetaClass(v78))
        v79 = 43;
      else
        v79 = 45;
      v80 = object_getClassName(self);
      v81 = sel_getName(sel);
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      v156 = v79;
      v157 = 2082;
      v158 = v80;
      v159 = 2082;
      v160 = v81;
      v161 = 1024;
      v162 = 4607;
      v163 = 2114;
      v164 = v83;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v84 = objc_alloc((Class)NSError);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v153 = NSLocalizedDescriptionKey;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v154 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
    v88 = objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 14, v87);
    v57 = v142;
    (*((void (**)(id, _QWORD, _QWORD, id))v142 + 2))(v142, 0, 0, v88);

LABEL_62:
    v34 = 0;
    v11 = v74;
    goto LABEL_63;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v10)) == (id)1)
  {
    v89 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:]([_NFLoyaltyAndPaymentSession alloc], "initWithRemoteObject:workQueue:expressModeManager:", v9, self->_workQueue, self->_expressModeManager);
    v90 = v89;
    if (v89)
    {
      -[_NFSession setQueue:](v89, "setQueue:", self);
      -[_NFXPCSession setConnection:](v90, "setConnection:", v11);
      -[_NFSession setUid:](v90, "setUid:", 0xFFFFFFFFLL);
      v91 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v91) & 1) != 0)
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("session.force.express.exit")));
        v93 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v92, v93);

        if ((isKindOfClass & 1) != 0)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.force.express.exit")));
          -[_NFSession setForceExpressExit:](v90, "setForceExpressExit:", objc_msgSend(v95, "BOOLValue"));

        }
      }
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "exportedInterface"));
      sub_10006B974((uint64_t)NFHardwareManagerInterface, v96);

      (*((void (**)(id, _NFLoyaltyAndPaymentSession *, BOOL, _QWORD))v142 + 2))(v142, v90, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000FD8A8;
      block[3] = &unk_1002E5CD0;
      v145 = v90;
      v146 = self;
      v57 = v142;
      v148 = sel;
      v74 = v11;
      v147 = v11;
      dispatch_async(workQueue, block);

      v98 = v145;
    }
    else
    {
      v119 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v120 = NFLogGetLogger(v119);
      if (v120)
      {
        v121 = (void (*)(uint64_t, const char *, ...))v120;
        v122 = object_getClass(self);
        v123 = class_isMetaClass(v122);
        v124 = object_getClassName(self);
        v139 = sel_getName(sel);
        v125 = 45;
        if (v123)
          v125 = 43;
        v121(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v125, v124, v139, 4623);
      }
      v74 = v11;
      v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v127 = NFSharedLogGetLogger(v126);
      v128 = objc_claimAutoreleasedReturnValue(v127);
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        v129 = object_getClass(self);
        if (class_isMetaClass(v129))
          v130 = 43;
        else
          v130 = 45;
        v131 = object_getClassName(self);
        v132 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        v156 = v130;
        v157 = 2082;
        v158 = v131;
        v159 = 2082;
        v160 = v132;
        v161 = 1024;
        v162 = 4623;
        _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
      }

      v133 = objc_alloc((Class)NSError);
      v98 = (_NFLoyaltyAndPaymentSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v149 = NSLocalizedDescriptionKey;
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v150 = v134;
      v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
      v136 = objc_msgSend(v133, "initWithDomain:code:userInfo:", v98, 13, v135);
      v57 = v142;
      (*((void (**)(id, _QWORD, _QWORD, id))v142 + 2))(v142, 0, 0, v136);

    }
    goto LABEL_62;
  }
  v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v100 = NFLogGetLogger(v99);
  if (v100)
  {
    v101 = (void (*)(uint64_t, const char *, ...))v100;
    v102 = object_getClass(self);
    v103 = class_isMetaClass(v102);
    v104 = object_getClassName(self);
    v138 = sel_getName(sel);
    v105 = 45;
    if (v103)
      v105 = 43;
    v101(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v105, v104, v138, 4613);
  }
  v106 = v11;
  v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v108 = NFSharedLogGetLogger(v107);
  v109 = objc_claimAutoreleasedReturnValue(v108);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
  {
    v110 = object_getClass(self);
    if (class_isMetaClass(v110))
      v111 = 43;
    else
      v111 = 45;
    v112 = object_getClassName(self);
    v113 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    v156 = v111;
    v157 = 2082;
    v158 = v112;
    v159 = 2082;
    v160 = v113;
    v161 = 1024;
    v162 = 4613;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
  }

  v114 = objc_alloc((Class)NSError);
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v151 = NSLocalizedDescriptionKey;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
  v152 = v116;
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
  v118 = objc_msgSend(v114, "initWithDomain:code:userInfo:", v115, 50, v117);
  v57 = v142;
  (*((void (**)(id, _QWORD, _QWORD, id))v142 + 2))(v142, 0, 0, v118);

  v34 = 0;
  v11 = v106;
LABEL_63:

}

- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  const char *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  const char *v92;
  id v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  unsigned int v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  void (*v110)(uint64_t, const char *, ...);
  objc_class *v111;
  _BOOL4 v112;
  const char *v113;
  const char *v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  objc_class *v121;
  int v122;
  const char *v123;
  const char *v124;
  unsigned int v125;
  void *v126;
  id v127;
  void *v128;
  uint64_t v129;
  void (*v130)(uint64_t, const char *, ...);
  objc_class *v131;
  _BOOL4 v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  objc_class *v138;
  int v139;
  const char *v140;
  const char *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  void (*v147)(uint64_t, const char *, ...);
  objc_class *v148;
  _BOOL4 v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSObject *v153;
  objc_class *v154;
  int v155;
  const char *v156;
  const char *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  id v163;
  id v164;
  NSObject *workQueue;
  void *v166;
  uint64_t v167;
  void (*v168)(uint64_t, const char *, ...);
  objc_class *v169;
  _BOOL4 v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  NSObject *v175;
  objc_class *v176;
  int v177;
  const char *v178;
  const char *v179;
  id v180;
  const char *v181;
  const char *v182;
  const char *v183;
  const char *v184;
  const char *v185;
  const char *v186;
  const char *v187;
  const char *v188;
  const char *v189;
  id v190;
  _BOOL4 v191;
  const char *v192;
  id v193;
  id v194;
  id v196;
  void *v197;
  _QWORD block[5];
  id v199;
  NSErrorUserInfoKey v200;
  void *v201;
  NSErrorUserInfoKey v202;
  void *v203;
  NSErrorUserInfoKey v204;
  void *v205;
  NSErrorUserInfoKey v206;
  const __CFString *v207;
  uint8_t buf[4];
  int v209;
  __int16 v210;
  const char *v211;
  __int16 v212;
  const char *v213;
  __int16 v214;
  int v215;
  __int16 v216;
  _BYTE v217[24];
  NSErrorUserInfoKey v218;
  void *v219;
  NSErrorUserInfoKey v220;
  void *v221;
  NSErrorUserInfoKey v222;
  void *v223;
  NSErrorUserInfoKey v224;
  void *v225;
  NSErrorUserInfoKey v226;
  void *v227;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (v9)
  {
    v11 = objc_opt_class(NFReaderSessionConfig);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
    {
      v43 = objc_alloc((Class)NSError);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v226 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v227 = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1));
      v44 = objc_msgSend(v43, "initWithDomain:code:userInfo:", v35, 10, v37);
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v44);

      goto LABEL_92;
    }
  }
  v196 = v9;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v193 = v10;
  v194 = v8;
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NFReaderSessionConfig sessionTypeString:](NFReaderSessionConfig, "sessionTypeString:", objc_msgSend(v9, "sessionType")));
    v182 = Name;
    v10 = v193;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@, type:%{public}@", v22, ClassName, v182, 4691, v20, v21);

    v8 = v194;
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NFReaderSessionConfig sessionTypeString:](NFReaderSessionConfig, "sessionTypeString:", objc_msgSend(v9, "sessionType")));
    *(_DWORD *)buf = 67110402;
    v209 = v27;
    v10 = v193;
    v210 = 2082;
    v211 = v28;
    v212 = 2082;
    v213 = v29;
    v214 = 1024;
    v215 = 4691;
    v216 = 2114;
    *(_QWORD *)v217 = v31;
    *(_WORD *)&v217[8] = 2114;
    *(_QWORD *)&v217[10] = v32;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, type:%{public}@", buf, 0x36u);

    v8 = v194;
  }

  v33 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
  if ((v33 & 5) != 1)
  {
    if (v33 == 4)
    {
      v41 = objc_alloc((Class)NSError);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v222 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "No NFC on device"));
      v223 = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1));
      v38 = v41;
      v39 = v35;
      v40 = 57;
      goto LABEL_16;
    }
    if (-[NFHardwareControllerInfo hasReaderModeSupport](self->_controllerInfo, "hasReaderModeSupport"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_whitelistChecker"));
      if ((objc_msgSend(v35, "externalReaderAccessAllow") & 1) == 0)
      {
        v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v87 = NFLogGetLogger(v86);
        if (v87)
        {
          v88 = (void (*)(uint64_t, const char *, ...))v87;
          v89 = object_getClass(self);
          v90 = class_isMetaClass(v89);
          v91 = object_getClassName(self);
          v92 = sel_getName(a2);
          v93 = objc_msgSend(v197, "processIdentifier");
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "clientName"));
          v185 = v92;
          v8 = v194;
          v95 = 45;
          if (v90)
            v95 = 43;
          v88(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", v95, v91, v185, 4711, v93, v94);

          v10 = v193;
        }
        v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v97 = NFSharedLogGetLogger(v96);
        v98 = objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          v99 = object_getClass(self);
          if (class_isMetaClass(v99))
            v100 = 43;
          else
            v100 = 45;
          v101 = object_getClassName(self);
          v102 = sel_getName(a2);
          v103 = objc_msgSend(v197, "processIdentifier");
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "clientName"));
          *(_DWORD *)buf = 67110402;
          v209 = v100;
          v210 = 2082;
          v211 = v101;
          v212 = 2082;
          v213 = v102;
          v214 = 1024;
          v215 = 4711;
          v216 = 1024;
          *(_DWORD *)v217 = v103;
          *(_WORD *)&v217[4] = 2114;
          *(_QWORD *)&v217[6] = v104;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", buf, 0x32u);

          v8 = v194;
        }

        v105 = objc_alloc((Class)NSError);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v218 = NSLocalizedDescriptionKey;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
        v219 = v37;
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1));
        v107 = objc_msgSend(v105, "initWithDomain:code:userInfo:", v36, 32, v106);
        (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v107);

        goto LABEL_17;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "readerPurposeString"));
      v46 = objc_msgSend(v45, "length");

      if (!v46)
      {
        v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v109 = NFLogGetLogger(v108);
        if (v109)
        {
          v110 = (void (*)(uint64_t, const char *, ...))v109;
          v111 = object_getClass(self);
          v112 = class_isMetaClass(v111);
          v113 = object_getClassName(self);
          v114 = sel_getName(a2);
          v115 = objc_msgSend(v197, "processIdentifier");
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "clientName"));
          v186 = v114;
          v8 = v194;
          v117 = 43;
          if (!v112)
            v117 = 45;
          v110(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required %{public}@ key.", v117, v113, v186, 4717, v115, v116, NFReaderPurposeStringKey);

          v10 = v193;
        }
        v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v119 = NFSharedLogGetLogger(v118);
        v120 = objc_claimAutoreleasedReturnValue(v119);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          v121 = object_getClass(self);
          if (class_isMetaClass(v121))
            v122 = 43;
          else
            v122 = 45;
          v123 = object_getClassName(self);
          v124 = sel_getName(a2);
          v125 = objc_msgSend(v197, "processIdentifier");
          v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "clientName"));
          *(_DWORD *)buf = 67110658;
          v209 = v122;
          v210 = 2082;
          v211 = v123;
          v212 = 2082;
          v213 = v124;
          v214 = 1024;
          v215 = 4717;
          v216 = 1024;
          *(_DWORD *)v217 = v125;
          *(_WORD *)&v217[4] = 2114;
          *(_QWORD *)&v217[6] = v126;
          *(_WORD *)&v217[14] = 2114;
          *(_QWORD *)&v217[16] = NFReaderPurposeStringKey;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required %{public}@ key.", buf, 0x3Cu);

          v8 = v194;
        }

        v127 = objc_alloc((Class)NSError);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v206 = NSLocalizedDescriptionKey;
        v207 = CFSTR("This app has crashed because it attempted to access NFC NDEF reader without a usage description.  The app's Info.plist must contain an NFCReaderUsageDescription key with a string value explaining to the user how the app uses the NFC NDEF reader.");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1));
        v38 = v127;
        v39 = v36;
        v40 = 36;
        goto LABEL_16;
      }
      if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, 1) == (id)1)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_userInfo"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("serviceType")));

        if (v36
          && (v48 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v36, v48) & 1) != 0)
          && objc_msgSend(v36, "unsignedIntegerValue") == (id)2)
        {
          if (objc_msgSend(v9, "sessionType") != (id)3
            || (v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vasPasses")),
                v50 = objc_msgSend(v49, "count"),
                v49,
                v50))
          {
            v51 = objc_claimAutoreleasedReturnValue(+[_NFSession validateEntitlements:](_NFReaderSession, "validateEntitlements:", v35));
            if (v51)
            {
              v37 = (void *)v51;
              v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v53 = NFLogGetLogger(v52);
              if (v53)
              {
                v54 = (void (*)(uint64_t, const char *, ...))v53;
                v55 = object_getClass(self);
                v191 = class_isMetaClass(v55);
                v192 = object_getClassName(self);
                v56 = sel_getName(a2);
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_userInfo"));
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("ClientName")));
                v190 = objc_msgSend(v197, "processIdentifier");
                v183 = v56;
                v8 = v194;
                v59 = 45;
                if (v191)
                  v59 = 43;
                v54(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v59, v192, v183, 4747, v58, v190);

              }
              v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v61 = NFSharedLogGetLogger(v60);
              v62 = objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                v63 = object_getClass(self);
                if (class_isMetaClass(v63))
                  v64 = 43;
                else
                  v64 = 45;
                v65 = object_getClassName(self);
                v66 = sel_getName(a2);
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "NF_userInfo"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("ClientName")));
                v69 = objc_msgSend(v197, "processIdentifier");
                *(_DWORD *)buf = 67110402;
                v209 = v64;
                v210 = 2082;
                v211 = v65;
                v212 = 2082;
                v213 = v66;
                v214 = 1024;
                v215 = 4747;
                v216 = 2114;
                *(_QWORD *)v217 = v68;
                *(_WORD *)&v217[8] = 1024;
                *(_DWORD *)&v217[10] = v69;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

                v8 = v194;
              }

              v10 = v193;
              (*((void (**)(id, _QWORD, _QWORD, void *))v193 + 2))(v193, 0, 0, v37);
              goto LABEL_17;
            }
            buf[0] = 0;
            v199 = 0;
            v164 = sub_1000EABBC(self, v8, v9, (uint64_t)objc_msgSend(v36, "unsignedIntegerValue"), v35, v197, buf, &v199);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v164);
            v85 = v199;
            (*((void (**)(id, id, _QWORD, void *))v10 + 2))(v10, v85, buf[0], v37);
            workQueue = self->_workQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000FF4E0;
            block[3] = &unk_1002E5C58;
            block[4] = self;
            dispatch_async(workQueue, block);
LABEL_49:

            goto LABEL_92;
          }
          v166 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v167 = NFLogGetLogger(v166);
          if (v167)
          {
            v168 = (void (*)(uint64_t, const char *, ...))v167;
            v169 = object_getClass(self);
            v170 = class_isMetaClass(v169);
            v171 = object_getClassName(self);
            v189 = sel_getName(a2);
            v172 = 45;
            if (v170)
              v172 = 43;
            v168(4, "%c[%{public}s %{public}s]:%i Missing VAS pass configuration", v172, v171, v189, 4739);
          }
          v173 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v174 = NFSharedLogGetLogger(v173);
          v175 = objc_claimAutoreleasedReturnValue(v174);
          if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
          {
            v176 = object_getClass(self);
            if (class_isMetaClass(v176))
              v177 = 43;
            else
              v177 = 45;
            v178 = object_getClassName(self);
            v179 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v209 = v177;
            v210 = 2082;
            v211 = v178;
            v212 = 2082;
            v213 = v179;
            v214 = 1024;
            v215 = 4739;
            _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing VAS pass configuration", buf, 0x22u);
          }

          v180 = objc_alloc((Class)NSError);
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v200 = NSLocalizedDescriptionKey;
          v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
          v201 = v143;
          v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1));
          v160 = v180;
          v161 = v37;
          v162 = 10;
        }
        else
        {
          v145 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v146 = NFLogGetLogger(v145);
          if (v146)
          {
            v147 = (void (*)(uint64_t, const char *, ...))v146;
            v148 = object_getClass(self);
            v149 = class_isMetaClass(v148);
            v181 = object_getClassName(self);
            v188 = sel_getName(a2);
            v150 = 45;
            if (v149)
              v150 = 43;
            v147(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v150, v181, v188, 4732, v36);
          }
          v151 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v152 = NFSharedLogGetLogger(v151);
          v153 = objc_claimAutoreleasedReturnValue(v152);
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
          {
            v154 = object_getClass(self);
            if (class_isMetaClass(v154))
              v155 = 43;
            else
              v155 = 45;
            v156 = object_getClassName(self);
            v157 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v209 = v155;
            v210 = 2082;
            v211 = v156;
            v212 = 2082;
            v213 = v157;
            v214 = 1024;
            v215 = 4732;
            v216 = 2114;
            *(_QWORD *)v217 = v36;
            _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
          }

          v158 = objc_alloc((Class)NSError);
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v202 = NSLocalizedDescriptionKey;
          v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
          v203 = v143;
          v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1));
          v160 = v158;
          v161 = v37;
          v162 = 12;
        }
        v163 = objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, v162, v159);
        (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v163);

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
          v133 = object_getClassName(self);
          v187 = sel_getName(a2);
          v134 = 45;
          if (v132)
            v134 = 43;
          v130(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v134, v133, v187, 4724);
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
          v140 = object_getClassName(self);
          v141 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v209 = v139;
          v210 = 2082;
          v211 = v140;
          v212 = 2082;
          v213 = v141;
          v214 = 1024;
          v215 = 4724;
          _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
        }

        v142 = objc_alloc((Class)NSError);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v204 = NSLocalizedDescriptionKey;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
        v205 = v37;
        v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1));
        v144 = objc_msgSend(v142, "initWithDomain:code:userInfo:", v36, 50, v143);
        (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v144);

      }
      goto LABEL_92;
    }
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFLogGetLogger(v70);
    if (v71)
    {
      v72 = (void (*)(uint64_t, const char *, ...))v71;
      v73 = object_getClass(self);
      v74 = class_isMetaClass(v73);
      v75 = object_getClassName(self);
      v184 = sel_getName(a2);
      v76 = 45;
      if (v74)
        v76 = 43;
      v72(3, "%c[%{public}s %{public}s]:%i ReaderMode Not Supported.", v76, v75, v184, 4703);
    }
    v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v78 = NFSharedLogGetLogger(v77);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      v80 = object_getClass(self);
      if (class_isMetaClass(v80))
        v81 = 43;
      else
        v81 = 45;
      v82 = object_getClassName(self);
      v83 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v209 = v81;
      v210 = 2082;
      v211 = v82;
      v212 = 2082;
      v213 = v83;
      v214 = 1024;
      v215 = 4703;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ReaderMode Not Supported.", buf, 0x22u);
    }

    v84 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v220 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v221 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1));
    v85 = objc_msgSend(v84, "initWithDomain:code:userInfo:", v35, 14, v37);
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v85);
    goto LABEL_49;
  }
  v34 = objc_alloc((Class)NSError);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v224 = NSLocalizedDescriptionKey;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
  v225 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1));
  v38 = v34;
  v39 = v35;
  v40 = 58;
LABEL_16:
  v42 = objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, v40, v37);
  (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v42);

LABEL_17:
  v9 = v196;
LABEL_92:

}

- (void)areFeaturesSupported:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FF59C;
  v11[3] = &unk_1002E6268;
  v13 = v6;
  v14 = a3;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, v11);

}

- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;
  BOOL v17;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FFA60;
  v13[3] = &unk_1002E84B0;
  v17 = a3;
  v16 = a4;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(workQueue, v13);

}

- (void)queueReaderSessionInternal:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  void *v40;
  objc_class *v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  const char *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  unsigned int v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void (*v89)(uint64_t, const char *, ...);
  objc_class *v90;
  _BOOL4 v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  void (*v105)(uint64_t, const char *, ...);
  objc_class *v106;
  _BOOL4 v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  objc_class *v112;
  int v113;
  const char *v114;
  const char *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  objc_class *v120;
  _BOOL4 v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  objc_class *v126;
  int v127;
  const char *v128;
  const char *v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  uint64_t v134;
  void *i;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  char isKindOfClass;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  NSObject *workQueue;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  _BOOL4 v164;
  int v165;
  NSMutableArray *v166;
  id v167;
  void *v168;
  id v169;
  _QWORD block[5];
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[2];
  _QWORD v177[2];
  _BYTE v178[128];
  NSErrorUserInfoKey v179;
  void *v180;
  NSErrorUserInfoKey v181;
  void *v182;
  NSErrorUserInfoKey v183;
  void *v184;
  uint8_t buf[4];
  int v186;
  __int16 v187;
  const char *v188;
  __int16 v189;
  const char *v190;
  __int16 v191;
  int v192;
  __int16 v193;
  _BYTE v194[14];
  NSErrorUserInfoKey v195;
  void *v196;
  NSErrorUserInfoKey v197;
  void *v198;

  v9 = a3;
  v169 = a4;
  v167 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v21 = 45;
    if (isMetaClass)
      v21 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, Name, 4868, v20);

    v10 = v18;
  }
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFSharedLogGetLogger(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    v26 = v9;
    if (class_isMetaClass(v25))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v186 = v27;
    v9 = v26;
    v187 = 2082;
    v188 = v28;
    v189 = 2082;
    v190 = v29;
    v191 = 1024;
    v192 = 4868;
    v193 = 2114;
    *(_QWORD *)v194 = v31;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_whitelistChecker"));
  v168 = v9;
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v40 = v32;
    v59 = objc_alloc((Class)NSError);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v197 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v198 = v36;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1));
    v62 = v59;
    v63 = v60;
    v64 = 58;
LABEL_50:
    v102 = objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, v64, v61);
    v57 = v167;
    (*((void (**)(id, _QWORD, _QWORD, id))v167 + 2))(v167, 0, 0, v102);

    v58 = v169;
    goto LABEL_51;
  }
  if (!-[NFHardwareControllerInfo hasReaderModeSupport](self->_controllerInfo, "hasReaderModeSupport"))
  {
    v40 = v32;
    v65 = objc_alloc((Class)NSError);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v195 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v196 = v36;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1));
    v62 = v65;
    v63 = v60;
    v64 = 14;
    goto LABEL_50;
  }
  if ((objc_msgSend(v32, "readerInternalAccess") & 1) == 0)
  {
    v40 = v32;
    v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v67 = NFLogGetLogger(v66);
    if (v67)
    {
      v68 = (void (*)(uint64_t, const char *, ...))v67;
      v69 = object_getClass(self);
      v70 = class_isMetaClass(v69);
      v71 = object_getClassName(self);
      v72 = sel_getName(a2);
      v73 = v10;
      v74 = objc_msgSend(v10, "processIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "clientName"));
      v158 = v74;
      v10 = v73;
      v76 = 45;
      if (v70)
        v76 = 43;
      v68(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", v76, v71, v72, 4883, v158, v75);

    }
    v77 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v78 = NFSharedLogGetLogger(v77);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v80 = object_getClass(self);
      if (class_isMetaClass(v80))
        v81 = 43;
      else
        v81 = 45;
      v82 = object_getClassName(self);
      v83 = sel_getName(a2);
      v84 = objc_msgSend(v10, "processIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "clientName"));
      *(_DWORD *)buf = 67110402;
      v186 = v81;
      v187 = 2082;
      v188 = v82;
      v189 = 2082;
      v190 = v83;
      v191 = 1024;
      v192 = 4883;
      v193 = 1024;
      *(_DWORD *)v194 = v84;
      *(_WORD *)&v194[4] = 2114;
      *(_QWORD *)&v194[6] = v85;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", buf, 0x32u);

    }
    v86 = objc_alloc((Class)NSError);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v183 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v184 = v36;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1));
    v62 = v86;
    v63 = v60;
    v64 = 32;
    goto LABEL_50;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v169)) != (id)1)
  {
    v40 = v32;
    v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v88 = NFLogGetLogger(v87);
    if (v88)
    {
      v89 = (void (*)(uint64_t, const char *, ...))v88;
      v90 = object_getClass(self);
      v91 = class_isMetaClass(v90);
      v92 = object_getClassName(self);
      v155 = sel_getName(a2);
      v93 = 45;
      if (v91)
        v93 = 43;
      v89(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v93, v92, v155, 4889);
    }
    v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v95 = NFSharedLogGetLogger(v94);
    v96 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v97 = object_getClass(self);
      if (class_isMetaClass(v97))
        v98 = 43;
      else
        v98 = 45;
      v99 = object_getClassName(self);
      v100 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v186 = v98;
      v187 = 2082;
      v188 = v99;
      v189 = 2082;
      v190 = v100;
      v191 = 1024;
      v192 = 4889;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v101 = objc_alloc((Class)NSError);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v181 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v182 = v36;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1));
    v62 = v101;
    v63 = v60;
    v64 = 50;
    goto LABEL_50;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("serviceType")));

  v163 = v34;
  if (v34
    && (v35 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v34, v35) & 1) != 0)
    && objc_msgSend(v34, "unsignedIntegerValue") == (id)1)
  {
    v162 = v10;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSession validateEntitlements:](_NFReaderSession, "validateEntitlements:", v32));
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    v39 = (void (*)(uint64_t, const char *, ...))v38;
    if (v36)
    {
      v40 = v32;
      if (v38)
      {
        v41 = object_getClass(self);
        v164 = class_isMetaClass(v41);
        v42 = object_getClassName(self);
        v43 = sel_getName(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "NF_userInfo"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v159 = objc_msgSend(v162, "processIdentifier");
        v46 = 45;
        if (v164)
          v46 = 43;
        v39(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v46, v42, v43, 4904, v45, v159);

      }
      v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFSharedLogGetLogger(v47);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = object_getClass(self);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        v165 = v51;
        v52 = object_getClassName(self);
        v53 = sel_getName(a2);
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "NF_userInfo"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v56 = objc_msgSend(v162, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v186 = v165;
        v187 = 2082;
        v188 = v52;
        v189 = 2082;
        v190 = v53;
        v191 = 1024;
        v192 = 4904;
        v193 = 2114;
        *(_QWORD *)v194 = v55;
        *(_WORD *)&v194[8] = 1024;
        *(_DWORD *)&v194[10] = v56;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v57 = v167;
      (*((void (**)(id, _QWORD, _QWORD, void *))v167 + 2))(v167, 0, 0, v36);
      v58 = v169;
      v10 = v162;
    }
    else
    {
      if (v38)
      {
        v120 = object_getClass(self);
        v121 = class_isMetaClass(v120);
        v154 = object_getClassName(self);
        v157 = sel_getName(a2);
        v122 = 45;
        if (v121)
          v122 = 43;
        v39(6, "%c[%{public}s %{public}s]:%i attribute=%{public}@", v122, v154, v157, 4909, v169);
      }
      v123 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v124 = NFSharedLogGetLogger(v123);
      v125 = objc_claimAutoreleasedReturnValue(v124);
      v58 = v169;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        v126 = object_getClass(self);
        if (class_isMetaClass(v126))
          v127 = 43;
        else
          v127 = 45;
        v128 = object_getClassName(self);
        v129 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v186 = v127;
        v187 = 2082;
        v188 = v128;
        v189 = 2082;
        v190 = v129;
        v191 = 1024;
        v192 = 4909;
        v193 = 2114;
        *(_QWORD *)v194 = v169;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i attribute=%{public}@", buf, 0x2Cu);
      }

      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "NF_arrayForKey:", CFSTR("session.suspendOnECP")));
      v166 = objc_opt_new(NSMutableArray);
      v161 = v130;
      if (objc_msgSend(v130, "count"))
      {
        v160 = v32;
        v174 = 0u;
        v175 = 0u;
        v172 = 0u;
        v173 = 0u;
        v131 = v130;
        v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v172, v178, 16);
        if (v132)
        {
          v133 = v132;
          v134 = *(_QWORD *)v173;
          do
          {
            for (i = 0; i != v133; i = (char *)i + 1)
            {
              if (*(_QWORD *)v173 != v134)
                objc_enumerationMutation(v131);
              v136 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v136, "length"))
              {
                v176[0] = CFSTR("ECPData");
                v176[1] = CFSTR("IgnoreRFTechOnIsEqual");
                v177[0] = v136;
                v177[1] = &off_1002FEE38;
                v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v177, v176, 2));
                v138 = (void *)objc_claimAutoreleasedReturnValue(+[NFFieldNotification notificationWithDictionary:](NFFieldNotification, "notificationWithDictionary:", v137));

                if (v138)
                  -[NSMutableArray addObject:](v166, "addObject:", v138);

              }
            }
            v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v172, v178, 16);
          }
          while (v133);
        }

        v58 = v169;
        v32 = v160;
      }
      buf[0] = 0;
      v139 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v58, v139) & 1) != 0)
      {
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", CFSTR("session.show.corenfc.ui")));
        v141 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v140, v141);

        v10 = v162;
        if ((isKindOfClass & 1) != 0)
        {
          v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("session.show.corenfc.ui")));
          if (objc_msgSend(v143, "BOOLValue"))
            v144 = 3;
          else
            v144 = 0;

        }
        else
        {
          v144 = 0;
        }
      }
      else
      {
        v144 = 0;
        v10 = v162;
      }
      v145 = (void *)objc_claimAutoreleasedReturnValue(+[NFReaderSessionConfig sessionConfigWithUIMode:sessionType:initialScanText:vasPass:](NFReaderSessionConfig, "sessionConfigWithUIMode:sessionType:initialScanText:vasPass:", v144, 4, 0, 0));
      v146 = objc_msgSend(v163, "unsignedIntegerValue");
      v171 = 0;
      v147 = v9;
      v40 = v32;
      v148 = sub_1000EABBC(self, v147, v145, (uint64_t)v146, v32, v10, buf, &v171);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v148);
      v149 = v171;
      v150 = v149;
      if (!v36)
        objc_msgSend(v149, "setSuspendOnFieldList:", v166);
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exportedInterface"));
      sub_10006B908((uint64_t)NFHardwareManagerInterface, v151);

      v57 = v167;
      (*((void (**)(id, void *, _QWORD, void *))v167 + 2))(v167, v150, buf[0], v36);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010115C;
      block[3] = &unk_1002E5C58;
      block[4] = self;
      dispatch_async(workQueue, block);

    }
  }
  else
  {
    v103 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v104 = NFLogGetLogger(v103);
    if (v104)
    {
      v105 = (void (*)(uint64_t, const char *, ...))v104;
      v106 = object_getClass(self);
      v107 = class_isMetaClass(v106);
      v153 = object_getClassName(self);
      v156 = sel_getName(a2);
      v108 = 45;
      if (v107)
        v108 = 43;
      v105(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v108, v153, v156, 4897, v34);
    }
    v40 = v32;
    v109 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v110 = NFSharedLogGetLogger(v109);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      v112 = object_getClass(self);
      if (class_isMetaClass(v112))
        v113 = 43;
      else
        v113 = 45;
      v114 = object_getClassName(self);
      v115 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v186 = v113;
      v187 = 2082;
      v188 = v114;
      v189 = 2082;
      v190 = v115;
      v191 = 1024;
      v192 = 4897;
      v193 = 2114;
      *(_QWORD *)v194 = v163;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    v116 = objc_alloc((Class)NSError);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v179 = NSLocalizedDescriptionKey;
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v180 = v117;
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1));
    v119 = objc_msgSend(v116, "initWithDomain:code:userInfo:", v36, 12, v118);
    v57 = v167;
    (*((void (**)(id, _QWORD, _QWORD, id))v167 + 2))(v167, 0, 0, v119);

    v58 = v169;
  }
  v60 = v163;
LABEL_51:

}

- (void)queueSeshatSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v13;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  _NFSeshatSession *v48;
  _NFSeshatSession *v49;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *workQueue;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void (**v82)(id, _QWORD, void *);
  _QWORD block[5];
  _QWORD v84[4];
  _QWORD v85[4];
  uint8_t buf[4];
  int v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  unsigned int v97;
  NSErrorUserInfoKey v98;
  void *v99;

  v80 = a3;
  v79 = a4;
  v82 = (void (**)(id, _QWORD, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v13 = 43;
    else
      v13 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 4973, v17);

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
    v23 = object_getClassName(self);
    v24 = sel_getName(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v87 = v22;
    v88 = 2082;
    v89 = v23;
    v90 = 2082;
    v91 = v24;
    v92 = 1024;
    v93 = 4973;
    v94 = 2114;
    v95 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSeshatSession validateEntitlements:](_NFSeshatSession, "validateEntitlements:", v28));

    if (v29)
    {
      v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v30);
      if (v31)
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v31(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v33, v34, v35, 4982, v37, objc_msgSend(v8, "processIdentifier"));

      }
      v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v39 = NFSharedLogGetLogger(v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v47 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v87 = v42;
        v88 = 2082;
        v89 = v43;
        v90 = 2082;
        v91 = v44;
        v92 = 1024;
        v93 = 4982;
        v94 = 2114;
        v95 = v46;
        v96 = 1024;
        v97 = v47;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v82[2](v82, 0, v29);
    }
    else
    {
      v48 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFSeshatSession alloc], "initWithRemoteObject:workQueue:", v80, self->_workQueue);
      v49 = v48;
      if (v48)
      {
        -[_NFSession setQueue:](v48, "setQueue:", self);
        -[_NFXPCSession setConnection:](v49, "setConnection:", v8);
        -[_NFSession setUid:](v49, "setUid:", 0xFFFFFFFFLL);
        -[_NFSeshatSession setDriverWrapper:](v49, "setDriverWrapper:", self->_driverWrapper);
        v50 = self->_secureElementSessionQueue;
        objc_sync_enter(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
        objc_msgSend(v52, "addObject:", v49);

        if (!self->_currentSecureElementSession && !-[NSMutableArray count](self->_secureElementSessionQueue, "count"))
          sub_1000DBE28(self, 1);
        -[NSMutableArray insertObject:atIndex:](self->_secureElementSessionQueue, "insertObject:atIndex:", v49, 0);
        objc_sync_exit(v50);

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "exportedInterface"));
        sub_10006B89C((uint64_t)NFHardwareManagerInterface, v53);

        ((void (**)(id, _NFSeshatSession *, void *))v82)[2](v82, v49, 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100101A60;
        block[3] = &unk_1002E5C58;
        block[4] = self;
        dispatch_async(workQueue, block);
      }
      else
      {
        v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v59);
        if (v60)
        {
          v61 = object_getClass(self);
          if (class_isMetaClass(v61))
            v62 = 43;
          else
            v62 = 45;
          v63 = object_getClassName(self);
          v64 = sel_getName(a2);
          v60(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v62, v63, v64, 4989);
        }
        v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v66 = NFSharedLogGetLogger(v65);
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          v68 = object_getClass(self);
          if (class_isMetaClass(v68))
            v69 = 43;
          else
            v69 = 45;
          v70 = object_getClassName(self);
          v71 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v87 = v69;
          v88 = 2082;
          v89 = v70;
          v90 = 2082;
          v91 = v71;
          v92 = 1024;
          v93 = 4989;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v72 = objc_alloc((Class)NSError);
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v84[0] = NSLocalizedDescriptionKey;
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v85[0] = v74;
        v85[1] = &off_1002FF3C0;
        v84[1] = CFSTR("Line");
        v84[2] = CFSTR("Method");
        v75 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v85[2] = v75;
        v84[3] = NSDebugDescriptionErrorKey;
        v76 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 4990);
        v85[3] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 4));
        v78 = objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 13, v77);
        v82[2](v82, 0, v78);

      }
      v29 = 0;
    }
  }
  else
  {
    v55 = objc_alloc((Class)NSError);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v98 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v99 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
    v58 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v29, 58, v57);
    v82[2](v82, 0, v58);

  }
}

- (void)areSessionsAllowedWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *workQueue;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100101B1C;
  v10[3] = &unk_1002E6268;
  v12 = v5;
  v13 = a2;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(workQueue, v10);

}

- (void)queuePeerPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  _NFPeerPaymentSession *v52;
  _NFPeerPaymentSession *v53;
  NSObject *workQueue;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  const char *v78;
  id v79;
  id v80;
  id v81;
  _QWORD block[5];
  _NFPeerPaymentSession *v83;
  id v84;
  SEL v85;
  NSErrorUserInfoKey v86;
  void *v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  unsigned int v99;
  NSErrorUserInfoKey v100;
  void *v101;

  v81 = a3;
  v80 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 5052, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v89 = v23;
    v90 = 2082;
    v91 = v24;
    v92 = 2082;
    v93 = v25;
    v94 = 1024;
    v95 = 5052;
    v96 = 2114;
    v97 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFPeerPaymentSession validateEntitlements:](_NFPeerPaymentSession, "validateEntitlements:", v29));

    if (v30)
    {
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v79 = objc_msgSend(v8, "processIdentifier");
        v40 = 45;
        if (v35)
          v40 = 43;
        v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v36, v37, 5071, v39, v79);

      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFSharedLogGetLogger(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44))
          v45 = 43;
        else
          v45 = 45;
        v46 = object_getClassName(self);
        v47 = sel_getName(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v50 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v89 = v45;
        v90 = 2082;
        v91 = v46;
        v92 = 2082;
        v93 = v47;
        v94 = 1024;
        v95 = 5071;
        v96 = 2114;
        v97 = v49;
        v98 = 1024;
        v99 = v50;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v51 = v80;
      (*((void (**)(id, _QWORD, _QWORD, void *))v80 + 2))(v80, 0, 0, v30);
    }
    else
    {
      v52 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFPeerPaymentSession alloc], "initWithRemoteObject:workQueue:", v81, self->_workQueue);
      v53 = v52;
      if (v52)
      {
        -[_NFSession setQueue:](v52, "setQueue:", self);
        -[_NFXPCSession setConnection:](v53, "setConnection:", v8);
        -[_NFSession setUid:](v53, "setUid:", 0xFFFFFFFFLL);
        v51 = v80;
        (*((void (**)(id, _NFPeerPaymentSession *, BOOL, _QWORD))v80 + 2))(v80, v53, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001025A0;
        block[3] = &unk_1002E5CD0;
        block[4] = self;
        v83 = v53;
        v85 = a2;
        v84 = v8;
        dispatch_async(workQueue, block);

      }
      else
      {
        v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v60 = NFLogGetLogger(v59);
        if (v60)
        {
          v61 = (void (*)(uint64_t, const char *, ...))v60;
          v62 = object_getClass(self);
          v63 = class_isMetaClass(v62);
          v64 = object_getClassName(self);
          v78 = sel_getName(a2);
          v65 = 45;
          if (v63)
            v65 = 43;
          v61(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v65, v64, v78, 5078);
        }
        v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger(v66);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = object_getClass(self);
          if (class_isMetaClass(v69))
            v70 = 43;
          else
            v70 = 45;
          v71 = object_getClassName(self);
          v72 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v89 = v70;
          v90 = 2082;
          v91 = v71;
          v92 = 2082;
          v93 = v72;
          v94 = 1024;
          v95 = 5078;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v73 = objc_alloc((Class)NSError);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v86 = NSLocalizedDescriptionKey;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v87 = v75;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
        v77 = objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 13, v76);
        v51 = v80;
        (*((void (**)(id, _QWORD, _QWORD, id))v80 + 2))(v80, 0, 0, v77);

      }
      v30 = 0;
    }
  }
  else
  {
    v55 = objc_alloc((Class)NSError);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v100 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v101 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
    v58 = objc_msgSend(v55, "initWithDomain:code:userInfo:", v30, 58, v57);
    v51 = v80;
    (*((void (**)(id, _QWORD, _QWORD, id))v80 + 2))(v80, 0, 0, v58);

  }
}

- (void)queueTrustSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  _NFTrustSession *v52;
  _NFTrustSession *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *workQueue;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD block[5];
  _NFTrustSession *v71;
  id v72;
  SEL v73;
  NSErrorUserInfoKey v74;
  void *v75;
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  unsigned int v87;
  NSErrorUserInfoKey v88;
  void *v89;

  v69 = a3;
  v68 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 5122, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v77 = v23;
    v78 = 2082;
    v79 = v24;
    v80 = 2082;
    v81 = v25;
    v82 = 1024;
    v83 = 5122;
    v84 = 2114;
    v85 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFTrustSession validateEntitlements:](_NFTrustSession, "validateEntitlements:", v29));

    if (v30)
    {
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v67 = objc_msgSend(v8, "processIdentifier");
        v40 = 45;
        if (v35)
          v40 = 43;
        v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v36, v37, 5141, v39, v67);

      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFSharedLogGetLogger(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44))
          v45 = 43;
        else
          v45 = 45;
        v46 = object_getClassName(self);
        v47 = sel_getName(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v50 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v77 = v45;
        v78 = 2082;
        v79 = v46;
        v80 = 2082;
        v81 = v47;
        v82 = 1024;
        v83 = 5141;
        v84 = 2114;
        v85 = v49;
        v86 = 1024;
        v87 = v50;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v51 = v68;
      (*((void (**)(id, _QWORD, _QWORD, void *))v68 + 2))(v68, 0, 0, v30);
    }
    else
    {
      v52 = -[_NFTrustSession initWithRemoteObject:workQueue:]([_NFTrustSession alloc], "initWithRemoteObject:workQueue:", v69, self->_workQueue);
      v53 = v52;
      if (v52)
      {
        -[_NFSession setQueue:](v52, "setQueue:", self);
        -[_NFXPCSession setConnection:](v53, "setConnection:", v8);
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "applicationIdentifier"));
        -[_NFTrustSession setApplicationIdentifier:](v53, "setApplicationIdentifier:", v56);

        -[_NFSession setUid:](v53, "setUid:", 0xFFFFFFFFLL);
        v51 = v68;
        (*((void (**)(id, _NFTrustSession *, BOOL, _QWORD))v68 + 2))(v68, v53, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001033BC;
        block[3] = &unk_1002E5CD0;
        block[4] = self;
        v71 = v53;
        v73 = a2;
        v72 = v8;
        dispatch_async(workQueue, block);

      }
      else
      {
        v62 = objc_alloc((Class)NSError);
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v74 = NSLocalizedDescriptionKey;
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
        v75 = v64;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
        v66 = objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 6, v65);
        v51 = v68;
        (*((void (**)(id, _QWORD, _QWORD, id))v68 + 2))(v68, 0, 0, v66);

      }
      v30 = 0;
    }
  }
  else
  {
    v58 = objc_alloc((Class)NSError);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v88 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v89 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
    v61 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v30, 58, v60);
    v51 = v68;
    (*((void (**)(id, _QWORD, _QWORD, id))v68 + 2))(v68, 0, 0, v61);

  }
}

- (void)queueNdefTagSession:(id)a3 sessionAttribute:(id)a4 data:(id)a5 completion:(id)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
  NFDriverWrapper *driverWrapper;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  void *v76;
  void *v77;
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
  unsigned int v88;
  void *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  id v103;
  _NFTagSession *v104;
  id v105;
  void *v106;
  NSObject *workQueue;
  const char *v108;
  id v109;
  const char *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v117[14];
  __int16 v118;
  const char *v119;
  __int16 v120;
  int v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  unsigned int v125;
  NSErrorUserInfoKey v126;
  void *v127;
  NSErrorUserInfoKey v128;
  void *v129;
  NSErrorUserInfoKey v130;
  void *v131;

  v113 = a3;
  v114 = a4;
  v112 = a5;
  v111 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = kdebug_trace(724566212, 0, 0, 0, 0);
  v13 = NFSharedSignpostLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v117 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "Tag session requested from %@", buf, 0xCu);

  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v26 = 45;
    if (isMetaClass)
      v26 = 43;
    v19(6, "%c[%{public}s %{public}s]:%i %{public}@", v26, ClassName, Name, 5201, v25);

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
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v117 = v31;
    *(_WORD *)&v117[4] = 2082;
    *(_QWORD *)&v117[6] = v32;
    v118 = 2082;
    v119 = v33;
    v120 = 1024;
    v121 = 5201;
    v122 = 2114;
    v123 = v35;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v63 = objc_alloc((Class)NSError);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v130 = NSLocalizedDescriptionKey;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v131 = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
    v60 = v63;
    v61 = v57;
    v62 = 58;
LABEL_26:
    v64 = objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, v62, v59);
    v65 = v111;
    (*((void (**)(id, _QWORD, _QWORD, id))v111 + 2))(v111, 0, 0, v64);

LABEL_27:
    v67 = v112;
    v66 = v113;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v46 = 45;
      if (v41)
        v46 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v46, v42, v43, 5209, v45);

    }
    v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v48 = NFSharedLogGetLogger(v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v117 = v51;
      *(_WORD *)&v117[4] = 2082;
      *(_QWORD *)&v117[6] = v52;
      v118 = 2082;
      v119 = v53;
      v120 = 1024;
      v121 = 5209;
      v122 = 2114;
      v123 = v55;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v56 = objc_alloc((Class)NSError);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v128 = NSLocalizedDescriptionKey;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v129 = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1));
    v60 = v56;
    v61 = v57;
    v62 = 14;
    goto LABEL_26;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v114)) != (id)1)
  {
    v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v90 = NFLogGetLogger(v89);
    if (v90)
    {
      v91 = (void (*)(uint64_t, const char *, ...))v90;
      v92 = object_getClass(self);
      v93 = class_isMetaClass(v92);
      v94 = object_getClassName(self);
      v108 = sel_getName(a2);
      v95 = 45;
      if (v93)
        v95 = 43;
      v91(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v95, v94, v108, 5215);
    }
    v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v97 = NFSharedLogGetLogger(v96);
    v98 = objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      v99 = object_getClass(self);
      if (class_isMetaClass(v99))
        v100 = 43;
      else
        v100 = 45;
      v101 = object_getClassName(self);
      v102 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v117 = v100;
      *(_WORD *)&v117[4] = 2082;
      *(_QWORD *)&v117[6] = v101;
      v118 = 2082;
      v119 = v102;
      v120 = 1024;
      v121 = 5215;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v103 = objc_alloc((Class)NSError);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v126 = NSLocalizedDescriptionKey;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v127 = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
    v60 = v103;
    v61 = v57;
    v62 = 50;
    goto LABEL_26;
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[_NFTagSession validateEntitlements:](_NFTagSession, "validateEntitlements:", v69));

  if (v57)
  {
    v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v71 = NFLogGetLogger(v70);
    if (v71)
    {
      v72 = (void (*)(uint64_t, const char *, ...))v71;
      v73 = object_getClass(self);
      v74 = class_isMetaClass(v73);
      v110 = object_getClassName(self);
      v75 = sel_getName(a2);
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v109 = objc_msgSend(v11, "processIdentifier");
      v78 = 45;
      if (v74)
        v78 = 43;
      v72(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v78, v110, v75, 5223, v77, v109);

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
      v84 = object_getClassName(self);
      v85 = sel_getName(a2);
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "NF_userInfo"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v88 = objc_msgSend(v11, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v117 = v83;
      *(_WORD *)&v117[4] = 2082;
      *(_QWORD *)&v117[6] = v84;
      v118 = 2082;
      v119 = v85;
      v120 = 1024;
      v121 = 5223;
      v122 = 2114;
      v123 = v87;
      v124 = 1024;
      v125 = v88;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

    }
    v65 = v111;
    (*((void (**)(id, _QWORD, _QWORD, void *))v111 + 2))(v111, 0, 0, v57);
    goto LABEL_27;
  }
  v66 = v113;
  v104 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFTagSession alloc], "initWithRemoteObject:workQueue:", v113, self->_workQueue);
  -[_NFSession setQueue:](v104, "setQueue:", self);
  -[_NFXPCSession setConnection:](v104, "setConnection:", v11);
  v67 = v112;
  if (v112)
    -[_NFTagSession setInitialPayload:](v104, "setInitialPayload:", v112);
  -[_NFSession setUid:](v104, "setUid:", 0xFFFFFFFFLL);
  buf[0] = 0;
  v105 = sub_1001C7B30((uint64_t)self, v104, v11, buf);
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  v65 = v111;
  if (v106)
  {
    (*((void (**)(id, _QWORD, _QWORD, void *))v111 + 2))(v111, 0, 0, v106);
  }
  else
  {
    (*((void (**)(id, _NFTagSession *, _QWORD, _QWORD))v111 + 2))(v111, v104, buf[0], 0);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100104564;
    block[3] = &unk_1002E5C58;
    block[4] = self;
    dispatch_async(workQueue, block);
  }

  v57 = 0;
LABEL_28:

}

- (void)queueHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  void *v35;
  NFDriverWrapper *driverWrapper;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  const char *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  void *v85;
  void *v86;
  unsigned int v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  objc_class *v98;
  int v99;
  const char *v100;
  const char *v101;
  id v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  uint64_t v108;
  void *i;
  void *v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  void *v114;
  uint64_t v115;
  void (*v116)(uint64_t, const char *, ...);
  objc_class *v117;
  _BOOL4 v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  objc_class *v122;
  int v123;
  const char *v124;
  const char *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void (*v132)(uint64_t, const char *, ...);
  objc_class *v133;
  _BOOL4 v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  objc_class *v140;
  int v141;
  const char *v142;
  const char *v143;
  void *v144;
  uint64_t v145;
  void (*v146)(uint64_t, const char *, ...);
  objc_class *v147;
  _BOOL4 v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  objc_class *v153;
  int v154;
  const char *v155;
  const char *v156;
  _NFHCESession *v157;
  _NFHardwareManager *v158;
  _NFHCESession *v159;
  NSMutableArray *v160;
  uint64_t v161;
  void *v162;
  NSMutableArray *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void (*v167)(uint64_t, const char *, ...);
  objc_class *v168;
  _BOOL4 v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  uint64_t v174;
  NSObject *v175;
  objc_class *v176;
  int v177;
  const char *v178;
  const char *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  unsigned int v188;
  unsigned int v189;
  NFHCEBroadcastECPConfig *v190;
  void *v191;
  id v192;
  void *v193;
  NSObject *workQueue;
  const char *v195;
  const char *v196;
  const char *v197;
  const char *v198;
  const char *v199;
  const char *v200;
  const char *v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  id v215;
  id v216;
  void *v217;
  NSMutableArray *v218;
  void *v219;
  _NFHardwareManager *v220;
  _QWORD block[5];
  NSMutableArray *v223;
  SEL v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  NSErrorUserInfoKey v229;
  void *v230;
  _QWORD v231[2];
  _QWORD v232[2];
  uint8_t v233[128];
  uint8_t buf[4];
  _BYTE v235[14];
  __int16 v236;
  const char *v237;
  __int16 v238;
  int v239;
  __int16 v240;
  id v241;
  __int16 v242;
  unsigned int v243;
  NSErrorUserInfoKey v244;
  void *v245;
  NSErrorUserInfoKey v246;
  void *v247;
  NSErrorUserInfoKey v248;
  void *v249;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v218 = objc_opt_new(NSMutableArray);
  v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = kdebug_trace(724566212, 0, 0, 0, 0);
  v12 = NFSharedSignpostLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v235 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "HCE session requested from %@", buf, 0xCu);

  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v26 = 45;
    if (isMetaClass)
      v26 = 43;
    v18(6, "%c[%{public}s %{public}s]:%i %{public}@", v26, ClassName, Name, 5277, v25);

    v10 = v24;
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
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v235 = v31;
    *(_WORD *)&v235[4] = 2082;
    *(_QWORD *)&v235[6] = v32;
    v236 = 2082;
    v237 = v33;
    v238 = 1024;
    v239 = 5277;
    v240 = 2114;
    v241 = v35;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v64 = objc_alloc((Class)NSError);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v248 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v249 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v249, &v248, 1));
    v61 = v64;
    v62 = v58;
    v63 = 58;
LABEL_26:
    v65 = objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, v63, v60);
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v65);

    goto LABEL_27;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFLogGetLogger(v37);
    if (v38)
    {
      v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
      v45 = v10;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v47 = 45;
      if (v41)
        v47 = 43;
      v39(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v47, v42, v43, 5285, v46);

      v10 = v45;
    }
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v235 = v52;
      *(_WORD *)&v235[4] = 2082;
      *(_QWORD *)&v235[6] = v53;
      v236 = 2082;
      v237 = v54;
      v238 = 1024;
      v239 = 5285;
      v240 = 2114;
      v241 = v56;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v57 = objc_alloc((Class)NSError);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v246 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v247 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v247, &v246, 1));
    v61 = v57;
    v62 = v58;
    v63 = 14;
    goto LABEL_26;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v9)) != (id)1)
  {
    v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v89 = NFLogGetLogger(v88);
    if (v89)
    {
      v90 = (void (*)(uint64_t, const char *, ...))v89;
      v91 = object_getClass(self);
      v92 = class_isMetaClass(v91);
      v93 = object_getClassName(self);
      v197 = sel_getName(a2);
      v94 = 45;
      if (v92)
        v94 = 43;
      v90(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v94, v93, v197, 5291);
    }
    v95 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v96 = NFSharedLogGetLogger(v95);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v98 = object_getClass(self);
      if (class_isMetaClass(v98))
        v99 = 43;
      else
        v99 = 45;
      v100 = object_getClassName(self);
      v101 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v235 = v99;
      *(_WORD *)&v235[4] = 2082;
      *(_QWORD *)&v235[6] = v100;
      v236 = 2082;
      v237 = v101;
      v238 = 1024;
      v239 = 5291;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v102 = objc_alloc((Class)NSError);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v244 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v245 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v245, &v244, 1));
    v61 = v102;
    v62 = v58;
    v63 = 50;
    goto LABEL_26;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHCESession validateEntitlements:](_NFHCESession, "validateEntitlements:", v67));

  v220 = self;
  if (v58)
  {
    v215 = v10;
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFLogGetLogger(v68);
    if (v69)
    {
      v70 = (void (*)(uint64_t, const char *, ...))v69;
      v71 = object_getClass(self);
      v72 = class_isMetaClass(v71);
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v202 = objc_msgSend(v219, "processIdentifier");
      v77 = 45;
      if (v72)
        v77 = 43;
      v70(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v77, v73, v74, 5299, v76, v202);

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
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "NF_userInfo"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v87 = objc_msgSend(v219, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v235 = v82;
      *(_WORD *)&v235[4] = 2082;
      *(_QWORD *)&v235[6] = v83;
      v236 = 2082;
      v237 = v84;
      v238 = 1024;
      v239 = 5299;
      v240 = 2114;
      v241 = v86;
      v242 = 1024;
      v243 = v87;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

    }
    v10 = v215;
    (*((void (**)(id, _QWORD, _QWORD, void *))v215 + 2))(v215, 0, 0, v58);
    goto LABEL_27;
  }
  v103 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v103) & 1) == 0)
  {
    v217 = 0;
    v208 = 0;
    v209 = 0;
    v212 = 0;
    v214 = 0;
    v210 = 0;
    v211 = 0;
    v127 = 0;
    v126 = 0;
    v104 = 0;
    goto LABEL_89;
  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_arrayForKey:", CFSTR("StartOnECP")));
  if (!objc_msgSend(v104, "count"))
    goto LABEL_74;
  v213 = v8;
  v216 = v10;
  v227 = 0u;
  v228 = 0u;
  v225 = 0u;
  v226 = 0u;
  v204 = v104;
  v105 = v104;
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v225, v233, 16);
  if (!v106)
    goto LABEL_73;
  v107 = v106;
  v108 = *(_QWORD *)v226;
  do
  {
    for (i = 0; i != v107; i = (char *)i + 1)
    {
      if (*(_QWORD *)v226 != v108)
        objc_enumerationMutation(v105);
      v110 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * (_QWORD)i);
      v111 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v110, v111) & 1) != 0)
      {
        if (!objc_msgSend(v110, "length"))
          continue;
        v231[0] = CFSTR("ECPData");
        v231[1] = CFSTR("IgnoreRFTechOnIsEqual");
        v232[0] = v110;
        v232[1] = &off_1002FEE38;
        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v232, v231, 2));
        v113 = objc_claimAutoreleasedReturnValue(+[NFFieldNotification notificationWithDictionary:](NFFieldNotification, "notificationWithDictionary:", v112));

        if (v113)
          -[NSMutableArray addObject:](v218, "addObject:", v113);
      }
      else
      {
        v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v115 = NFLogGetLogger(v114);
        if (v115)
        {
          v116 = (void (*)(uint64_t, const char *, ...))v115;
          v117 = object_getClass(self);
          v118 = class_isMetaClass(v117);
          v195 = object_getClassName(self);
          v198 = sel_getName(a2);
          v119 = 45;
          if (v118)
            v119 = 43;
          self = v220;
          v116(3, "%c[%{public}s %{public}s]:%i Invalid ECP data: %{public}@", v119, v195, v198, 5309, v110);
        }
        v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v121 = NFSharedLogGetLogger(v120);
        v113 = objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          v122 = object_getClass(self);
          if (class_isMetaClass(v122))
            v123 = 43;
          else
            v123 = 45;
          v124 = object_getClassName(v220);
          v125 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v235 = v123;
          self = v220;
          *(_WORD *)&v235[4] = 2082;
          *(_QWORD *)&v235[6] = v124;
          v236 = 2082;
          v237 = v125;
          v238 = 1024;
          v239 = 5309;
          v240 = 2114;
          v241 = v110;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid ECP data: %{public}@", buf, 0x2Cu);
        }
      }

    }
    v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v225, v233, 16);
  }
  while (v107);
LABEL_73:

  v8 = v213;
  v10 = v216;
  v104 = v204;
LABEL_74:
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("EmulationOnSessionStart")));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("ReadOnReaderConnected")));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("SuspendOnDisconnect")));
  v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("BackgroundTagReadingECP")));
  v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("ListenOnAllField")));
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("FDRestartOnMatchingECPTermInfo")));
  v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_dataForKey:", CFSTR("ECPBroadcast")));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("disableAutostartOnField")));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_dataForKey:", CFSTR("bkgTagReadECPOverride")));
  if (v128)
  {
    v129 = v128;
    v217 = v128;
    if (!objc_msgSend(v128, "length") || (unint64_t)objc_msgSend(v129, "length") >= 0x15)
    {
      v130 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v131 = NFLogGetLogger(v130);
      if (v131)
      {
        v132 = (void (*)(uint64_t, const char *, ...))v131;
        v133 = object_getClass(self);
        v134 = class_isMetaClass(v133);
        v135 = object_getClassName(self);
        v199 = sel_getName(a2);
        v136 = 45;
        if (v134)
          v136 = 43;
        v132(3, "%c[%{public}s %{public}s]:%i Invalid override; dropping", v136, v135, v199, 5335);
      }
      v137 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v138 = NFSharedLogGetLogger(v137);
      v139 = objc_claimAutoreleasedReturnValue(v138);
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        v140 = object_getClass(self);
        if (class_isMetaClass(v140))
          v141 = 43;
        else
          v141 = 45;
        v142 = object_getClassName(self);
        v143 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v235 = v141;
        *(_WORD *)&v235[4] = 2082;
        *(_QWORD *)&v235[6] = v142;
        v236 = 2082;
        v237 = v143;
        v238 = 1024;
        v239 = 5335;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid override; dropping",
          buf,
          0x22u);
      }

      goto LABEL_87;
    }
  }
  else
  {
LABEL_87:
    v217 = 0;
  }
LABEL_89:
  v144 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v145 = NFLogGetLogger(v144);
  if (v145)
  {
    v146 = (void (*)(uint64_t, const char *, ...))v145;
    v147 = object_getClass(self);
    v148 = class_isMetaClass(v147);
    v196 = object_getClassName(self);
    v200 = sel_getName(a2);
    v149 = 45;
    if (v148)
      v149 = 43;
    v146(6, "%c[%{public}s %{public}s]:%i attribute=%{public}@", v149, v196, v200, 5341, v9);
  }
  v150 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v151 = NFSharedLogGetLogger(v150);
  v152 = objc_claimAutoreleasedReturnValue(v151);
  if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
  {
    v153 = object_getClass(self);
    if (class_isMetaClass(v153))
      v154 = 43;
    else
      v154 = 45;
    v155 = object_getClassName(self);
    v156 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v235 = v154;
    *(_WORD *)&v235[4] = 2082;
    *(_QWORD *)&v235[6] = v155;
    v236 = 2082;
    v237 = v156;
    v238 = 1024;
    v239 = 5341;
    v240 = 2114;
    v241 = v9;
    _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i attribute=%{public}@", buf, 0x2Cu);
  }

  v157 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFHCESession alloc], "initWithRemoteObject:workQueue:", v8, self->_workQueue);
  v158 = self;
  v159 = v157;
  if (v157)
  {
    -[_NFSession setQueue:](v157, "setQueue:", v158);
    -[_NFXPCSession setConnection:](v159, "setConnection:", v219);
    -[_NFHCESession setReadOnConnected:](v159, "setReadOnConnected:", objc_msgSend(v126, "BOOLValue"));
    if (-[NSMutableArray count](v218, "count"))
      v160 = v218;
    else
      v160 = 0;
    -[_NFSession setStartOnFieldList:](v159, "setStartOnFieldList:", v160);
    -[_NFHCESession setEmulationOnSessionStart:](v159, "setEmulationOnSessionStart:", objc_msgSend(v212, "BOOLValue"));
    -[_NFHCESession setSuspendOnDisconnect:](v159, "setSuspendOnDisconnect:", objc_msgSend(v127, "BOOLValue"));
    -[_NFSession setBackgroundTagReadEcpOption:](v159, "setBackgroundTagReadEcpOption:", 0);
    if (objc_msgSend(v211, "BOOLValue"))
    {
      if (v217)
        v161 = 2;
      else
        v161 = 1;
      -[_NFSession setBackgroundTagReadEcpOption:](v159, "setBackgroundTagReadEcpOption:", v161);
      -[_NFSession setBackgroundTagReadCustomECP:](v159, "setBackgroundTagReadCustomECP:", v217);
    }
    -[_NFHCESession setDisableAutoStartOnField:](v159, "setDisableAutoStartOnField:", objc_msgSend(v208, "BOOLValue"));
    if (objc_msgSend(v210, "BOOLValue"))
      -[_NFSession setFieldHandlingInSuspension:](v159, "setFieldHandlingInSuspension:", -[_NFSession fieldHandlingInSuspension](v159, "fieldHandlingInSuspension") | 1);
    if (objc_msgSend(v209, "BOOLValue"))
      -[_NFSession setFieldHandlingInSuspension:](v159, "setFieldHandlingInSuspension:", -[_NFSession fieldHandlingInSuspension](v159, "fieldHandlingInSuspension") | 2);
    if (objc_msgSend(v214, "length"))
    {
      v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_arrayForKey:", CFSTR("ECPBroadcastFieldMatch")));
      v203 = v126;
      if (v162)
      {
        v163 = sub_1000ECF00((uint64_t)v220, v162);
        v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
      }
      else
      {
        v164 = 0;
      }
      v205 = v104;
      v207 = v127;
      v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("ECPBroadcastInterval")));
      v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_numberForKey:", CFSTR("ECPBroadcastPollDuration")));
      v187 = v186;
      if (v186)
        v188 = objc_msgSend(v186, "unsignedLongValue");
      else
        v188 = 0;
      if (v185)
        v189 = objc_msgSend(v185, "unsignedLongValue");
      else
        v189 = 3000;
      v190 = sub_1000849F8((uint64_t)NFHCEBroadcastECPConfig, v214, v188, v189, v164);
      v191 = (void *)objc_claimAutoreleasedReturnValue(v190);
      -[_NFHCESession setEcpBroadcastConfig:](v159, "setEcpBroadcastConfig:", v191);

      v126 = v203;
      v104 = v205;
      v127 = v207;
    }
    -[_NFSession setUid:](v159, "setUid:", 0xFFFFFFFFLL);
    buf[0] = 0;
    v192 = sub_1001C7B30((uint64_t)v220, v159, v219, buf);
    v193 = (void *)objc_claimAutoreleasedReturnValue(v192);
    if (v193)
    {
      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v193);
    }
    else
    {
      (*((void (**)(id, _NFHCESession *, _QWORD, _QWORD))v10 + 2))(v10, v159, buf[0], 0);
      workQueue = v220->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100105AD8;
      block[3] = &unk_1002E5C80;
      block[4] = v220;
      v223 = v218;
      v224 = a2;
      dispatch_async(workQueue, block);

    }
  }
  else
  {
    v206 = v127;
    v165 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v166 = NFLogGetLogger(v165);
    if (v166)
    {
      v167 = (void (*)(uint64_t, const char *, ...))v166;
      v168 = object_getClass(v220);
      v169 = class_isMetaClass(v168);
      v170 = object_getClassName(v220);
      v201 = sel_getName(a2);
      v171 = 45;
      if (v169)
        v171 = 43;
      v167(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v171, v170, v201, 5345);
    }
    v172 = v126;
    v173 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v174 = NFSharedLogGetLogger(v173);
    v175 = objc_claimAutoreleasedReturnValue(v174);
    if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
    {
      v176 = object_getClass(v220);
      if (class_isMetaClass(v176))
        v177 = 43;
      else
        v177 = 45;
      v178 = object_getClassName(v220);
      v179 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v235 = v177;
      *(_WORD *)&v235[4] = 2082;
      *(_QWORD *)&v235[6] = v178;
      v236 = 2082;
      v237 = v179;
      v238 = 1024;
      v239 = 5345;
      _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    v180 = objc_alloc((Class)NSError);
    v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v229 = NSLocalizedDescriptionKey;
    v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v230 = v182;
    v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v230, &v229, 1));
    v184 = objc_msgSend(v180, "initWithDomain:code:userInfo:", v181, 13, v183);
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v184);

    v126 = v172;
    v127 = v206;
  }

  v58 = 0;
LABEL_27:

}

- (void)queueSecureElementAndHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *specific;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  void *v33;
  NFDriverWrapper *driverWrapper;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void (*v69)(uint64_t, const char *, ...);
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  id v100;
  uint64_t v101;
  void *v102;
  _NFSecureElementAndHostCardEmulationSession *v103;
  _NFSecureElementAndHostCardEmulationSession *v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void (*v109)(uint64_t, const char *, ...);
  objc_class *v110;
  _BOOL4 v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  NSObject *v116;
  objc_class *v117;
  int v118;
  const char *v119;
  const char *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *workQueue;
  const char *v127;
  const char *v128;
  id v129;
  const char *v130;
  id v131;
  id v132;
  id v133;
  _QWORD block[5];
  NSErrorUserInfoKey v135;
  void *v136;
  uint8_t buf[4];
  _BYTE v138[14];
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  unsigned int v146;
  NSErrorUserInfoKey v147;
  void *v148;
  NSErrorUserInfoKey v149;
  void *v150;
  NSErrorUserInfoKey v151;
  void *v152;

  v132 = a3;
  v133 = a4;
  v131 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = kdebug_trace(724566212, 0, 0, 0, 0);
  v11 = NFSharedSignpostLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v138 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "SE+HCE session requested from %@", buf, 0xCu);

  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v17 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v24 = 45;
    if (isMetaClass)
      v24 = 43;
    v17(6, "%c[%{public}s %{public}s]:%i %{public}@", v24, ClassName, Name, 5447, v23);

  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v138 = v29;
    *(_WORD *)&v138[4] = 2082;
    *(_QWORD *)&v138[6] = v30;
    v139 = 2082;
    v140 = v31;
    v141 = 1024;
    v142 = 5447;
    v143 = 2114;
    v144 = v33;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v61 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v151 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v152 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
    v58 = v61;
    v59 = v55;
    v60 = 58;
LABEL_26:
    v62 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, v60, v57);
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v62);

LABEL_27:
    v64 = v132;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
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
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v44 = 45;
      if (v39)
        v44 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v44, v40, v41, 5455, v43);

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
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v138 = v49;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v50;
      v139 = 2082;
      v140 = v51;
      v141 = 1024;
      v142 = 5455;
      v143 = 2114;
      v144 = v53;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v54 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v149 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v150 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
    v58 = v54;
    v59 = v55;
    v60 = 14;
    goto LABEL_26;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v133)) != (id)1)
  {
    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = NFLogGetLogger(v86);
    if (v87)
    {
      v88 = (void (*)(uint64_t, const char *, ...))v87;
      v89 = object_getClass(self);
      v90 = class_isMetaClass(v89);
      v91 = object_getClassName(self);
      v127 = sel_getName(a2);
      v92 = 45;
      if (v90)
        v92 = 43;
      v88(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v92, v91, v127, 5461);
    }
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFSharedLogGetLogger(v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      v96 = object_getClass(self);
      if (class_isMetaClass(v96))
        v97 = 43;
      else
        v97 = 45;
      v98 = object_getClassName(self);
      v99 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v138 = v97;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v98;
      v139 = 2082;
      v140 = v99;
      v141 = 1024;
      v142 = 5461;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v100 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v147 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v148 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
    v58 = v100;
    v59 = v55;
    v60 = 50;
    goto LABEL_26;
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureElementAndHostCardEmulationSession validateEntitlements:](_NFSecureElementAndHostCardEmulationSession, "validateEntitlements:", v66));

  if (v55)
  {
    v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v68 = NFLogGetLogger(v67);
    if (v68)
    {
      v69 = (void (*)(uint64_t, const char *, ...))v68;
      v70 = object_getClass(self);
      v71 = class_isMetaClass(v70);
      v130 = object_getClassName(self);
      v72 = sel_getName(a2);
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v129 = objc_msgSend(v9, "processIdentifier");
      v75 = 45;
      if (v71)
        v75 = 43;
      v69(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v75, v130, v72, 5469, v74, v129);

    }
    v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v77 = NFSharedLogGetLogger(v76);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v79 = object_getClass(self);
      if (class_isMetaClass(v79))
        v80 = 43;
      else
        v80 = 45;
      v81 = object_getClassName(self);
      v82 = sel_getName(a2);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v85 = objc_msgSend(v9, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v138 = v80;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v81;
      v139 = 2082;
      v140 = v82;
      v141 = 1024;
      v142 = 5469;
      v143 = 2114;
      v144 = v84;
      v145 = 1024;
      v146 = v85;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

    }
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v55);
    goto LABEL_27;
  }
  v101 = objc_opt_class(NSDictionary);
  v64 = v132;
  if ((objc_opt_isKindOfClass(v133, v101) & 1) != 0)
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "NF_numberForKey:", CFSTR("EmulationOnSessionStart")));
  else
    v102 = 0;
  v103 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFSecureElementAndHostCardEmulationSession alloc], "initWithRemoteObject:workQueue:", v132, self->_workQueue);
  v104 = v103;
  if (v103)
  {
    -[_NFSession setQueue:](v103, "setQueue:", self);
    -[_NFXPCSession setConnection:](v104, "setConnection:", v9);
    -[_NFHCESession setEmulationOnSessionStart:](v104, "setEmulationOnSessionStart:", objc_msgSend(v102, "BOOLValue"));
    -[_NFSession setUid:](v104, "setUid:", 0xFFFFFFFFLL);
    buf[0] = 0;
    v105 = sub_1001C7B30((uint64_t)self, v104, v9, buf);
    v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
    v63 = v131;
    if (v106)
    {
      (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v106);
    }
    else
    {
      (*((void (**)(id, _NFSecureElementAndHostCardEmulationSession *, _QWORD, _QWORD))v131 + 2))(v131, v104, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001069B4;
      block[3] = &unk_1002E5C58;
      block[4] = self;
      dispatch_async(workQueue, block);
    }

  }
  else
  {
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFLogGetLogger(v107);
    if (v108)
    {
      v109 = (void (*)(uint64_t, const char *, ...))v108;
      v110 = object_getClass(self);
      v111 = class_isMetaClass(v110);
      v112 = object_getClassName(self);
      v128 = sel_getName(a2);
      v113 = 45;
      if (v111)
        v113 = 43;
      v109(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v113, v112, v128, 5480);
    }
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFSharedLogGetLogger(v114);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v117 = object_getClass(self);
      if (class_isMetaClass(v117))
        v118 = 43;
      else
        v118 = 45;
      v119 = object_getClassName(self);
      v120 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v138 = v118;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v119;
      v139 = 2082;
      v140 = v120;
      v141 = 1024;
      v142 = 5480;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    v121 = objc_alloc((Class)NSError);
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v135 = NSLocalizedDescriptionKey;
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v136 = v123;
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1));
    v125 = objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 13, v124);
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v125);

    v64 = v132;
  }

  v55 = 0;
LABEL_28:

}

- (void)queueSecureElementReaderSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *specific;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  void *v33;
  NFDriverWrapper *driverWrapper;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void (*v69)(uint64_t, const char *, ...);
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  id v100;
  _NFSecureElementReaderSession *v101;
  _NFSecureElementReaderSession *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void (*v109)(uint64_t, const char *, ...);
  objc_class *v110;
  _BOOL4 v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  NSObject *v116;
  objc_class *v117;
  int v118;
  const char *v119;
  const char *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *workQueue;
  const char *v127;
  const char *v128;
  id v129;
  const char *v130;
  id v131;
  id v132;
  id v133;
  _QWORD block[5];
  NSErrorUserInfoKey v135;
  void *v136;
  uint8_t buf[4];
  _BYTE v138[14];
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  unsigned int v146;
  NSErrorUserInfoKey v147;
  void *v148;
  NSErrorUserInfoKey v149;
  void *v150;
  NSErrorUserInfoKey v151;
  void *v152;

  v132 = a3;
  v133 = a4;
  v131 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = kdebug_trace(724566212, 0, 0, 0, 0);
  v11 = NFSharedSignpostLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v138 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "SE+Reader session requested from %@", buf, 0xCu);

  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v17 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v24 = 45;
    if (isMetaClass)
      v24 = 43;
    v17(6, "%c[%{public}s %{public}s]:%i %{public}@", v24, ClassName, Name, 5520, v23);

  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v138 = v29;
    *(_WORD *)&v138[4] = 2082;
    *(_QWORD *)&v138[6] = v30;
    v139 = 2082;
    v140 = v31;
    v141 = 1024;
    v142 = 5520;
    v143 = 2114;
    v144 = v33;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    v61 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v151 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v152 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
    v58 = v61;
    v59 = v55;
    v60 = 58;
LABEL_26:
    v62 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, v60, v57);
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v62);

LABEL_27:
    v64 = v132;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
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
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v44 = 45;
      if (v39)
        v44 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v44, v40, v41, 5528, v43);

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
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ClientName")));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v138 = v49;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v50;
      v139 = 2082;
      v140 = v51;
      v141 = 1024;
      v142 = 5528;
      v143 = 2114;
      v144 = v53;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);

    }
    v54 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v149 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v150 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
    v58 = v54;
    v59 = v55;
    v60 = 14;
    goto LABEL_26;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v133)) != (id)1)
  {
    v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = NFLogGetLogger(v86);
    if (v87)
    {
      v88 = (void (*)(uint64_t, const char *, ...))v87;
      v89 = object_getClass(self);
      v90 = class_isMetaClass(v89);
      v91 = object_getClassName(self);
      v127 = sel_getName(a2);
      v92 = 45;
      if (v90)
        v92 = 43;
      v88(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v92, v91, v127, 5534);
    }
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFSharedLogGetLogger(v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      v96 = object_getClass(self);
      if (class_isMetaClass(v96))
        v97 = 43;
      else
        v97 = 45;
      v98 = object_getClassName(self);
      v99 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v138 = v97;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v98;
      v139 = 2082;
      v140 = v99;
      v141 = 1024;
      v142 = 5534;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v100 = objc_alloc((Class)NSError);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v147 = NSLocalizedDescriptionKey;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v148 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
    v58 = v100;
    v59 = v55;
    v60 = 50;
    goto LABEL_26;
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureElementReaderSession validateEntitlements:](_NFSecureElementReaderSession, "validateEntitlements:", v66));

  if (v55)
  {
    v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v68 = NFLogGetLogger(v67);
    if (v68)
    {
      v69 = (void (*)(uint64_t, const char *, ...))v68;
      v70 = object_getClass(self);
      v71 = class_isMetaClass(v70);
      v130 = object_getClassName(self);
      v72 = sel_getName(a2);
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v129 = objc_msgSend(v9, "processIdentifier");
      v75 = 45;
      if (v71)
        v75 = 43;
      v69(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v75, v130, v72, 5542, v74, v129);

    }
    v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v77 = NFSharedLogGetLogger(v76);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v79 = object_getClass(self);
      if (class_isMetaClass(v79))
        v80 = 43;
      else
        v80 = 45;
      v81 = object_getClassName(self);
      v82 = sel_getName(a2);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v85 = objc_msgSend(v9, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v138 = v80;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v81;
      v139 = 2082;
      v140 = v82;
      v141 = 1024;
      v142 = 5542;
      v143 = 2114;
      v144 = v84;
      v145 = 1024;
      v146 = v85;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

    }
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v55);
    goto LABEL_27;
  }
  v64 = v132;
  v101 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFSecureElementReaderSession alloc], "initWithRemoteObject:workQueue:", v132, self->_workQueue);
  v102 = v101;
  if (v101)
  {
    -[_NFSession setQueue:](v101, "setQueue:", self);
    -[_NFXPCSession setConnection:](v102, "setConnection:", v9);
    -[_NFSession setUid:](v102, "setUid:", 0xFFFFFFFFLL);
    -[_NFSecureElementReaderSession setDriverWrapper:](v102, "setDriverWrapper:", self->_driverWrapper);
    v103 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
    v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
    -[_NFSecureElementReaderSession setPowerConsumptionReporter:](v102, "setPowerConsumptionReporter:", v104);

    buf[0] = 0;
    v105 = sub_1001C7B30((uint64_t)self, v102, v9, buf);
    v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
    v63 = v131;
    if (v106)
    {
      (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v106);
    }
    else
    {
      (*((void (**)(id, _NFSecureElementReaderSession *, _QWORD, _QWORD))v131 + 2))(v131, v102, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100107648;
      block[3] = &unk_1002E5C58;
      block[4] = self;
      dispatch_async(workQueue, block);
    }

  }
  else
  {
    v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFLogGetLogger(v107);
    if (v108)
    {
      v109 = (void (*)(uint64_t, const char *, ...))v108;
      v110 = object_getClass(self);
      v111 = class_isMetaClass(v110);
      v112 = object_getClassName(self);
      v128 = sel_getName(a2);
      v113 = 45;
      if (v111)
        v113 = 43;
      v109(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v113, v112, v128, 5549);
    }
    v114 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v115 = NFSharedLogGetLogger(v114);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v117 = object_getClass(self);
      if (class_isMetaClass(v117))
        v118 = 43;
      else
        v118 = 45;
      v119 = object_getClassName(self);
      v120 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v138 = v118;
      *(_WORD *)&v138[4] = 2082;
      *(_QWORD *)&v138[6] = v119;
      v139 = 2082;
      v140 = v120;
      v141 = 1024;
      v142 = 5549;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    v121 = objc_alloc((Class)NSError);
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v135 = NSLocalizedDescriptionKey;
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v136 = v123;
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1));
    v125 = objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 13, v124);
    v63 = v131;
    (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v125);

    v64 = v132;
  }

  v55 = 0;
LABEL_28:

}

- (void)queueSecureTransactionServicesSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  _NFHardwareManager *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char isKindOfClass;
  void *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  _NFHardwareManager *v74;
  const char *v75;
  const char *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  objc_class *v86;
  id v87;
  int v88;
  const char *v89;
  const char *v90;
  void *v91;
  void *v92;
  id *v93;
  id v94;
  const char *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
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
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  NSObject *workQueue;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  id v124;
  const char *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  unint64_t v130;
  id v131;
  _QWORD block[5];
  NSErrorUserInfoKey v133;
  void *v134;
  uint8_t buf[4];
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  unint64_t v146;
  __int16 v147;
  id v148;
  NSErrorUserInfoKey v149;
  void *v150;
  NSErrorUserInfoKey v151;
  void *v152;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    v131 = v11;
    v13 = &OBJC_IVAR___NFAssertSuppressPresentmentIntentToDefaultApp__clientInfo;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureTransactionServicesHandoverSession validateEntitlements:](_NFSecureTransactionServicesHandoverSession, "validateEntitlements:", v15));

    if (v16)
    {
      v129 = v10;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        v127 = v9;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v25 = self;
        v26 = a2;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v124 = objc_msgSend(v12, "processIdentifier");
        v28 = 45;
        if (isMetaClass)
          v28 = 43;
        v120 = ClassName;
        v9 = v127;
        v19(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v28, v120, Name, 5592, v27, v124);

        a2 = v26;
        self = v25;

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
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110402;
        v136 = v33;
        v137 = 2082;
        v138 = v34;
        v139 = 2082;
        v140 = v35;
        v141 = 1024;
        v142 = 5592;
        v143 = 2114;
        v144 = v37;
        v145 = 1024;
        LODWORD(v146) = objc_msgSend(v12, "processIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v11 = v131;
      (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v16);
      v10 = v129;
    }
    else if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v10)) == (id)1)
    {
      v42 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v42) & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.role")));
        v44 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v43, v44);

        if ((isKindOfClass & 1) != 0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.role")));
          v130 = (unint64_t)objc_msgSend(v46, "unsignedIntegerValue");

        }
        else
        {
          v130 = -1;
        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.type")));
        v65 = objc_opt_class(NSNumber);
        v66 = objc_opt_isKindOfClass(v64, v65);

        if ((v66 & 1) != 0)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.type")));
          v128 = objc_msgSend(v67, "unsignedIntegerValue");

        }
        else
        {
          v128 = 0;
        }
        v13 = &OBJC_IVAR___NFAssertSuppressPresentmentIntentToDefaultApp__clientInfo;
      }
      else
      {
        v128 = 0;
        v130 = -1;
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      v126 = v12;
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v74 = self;
        v75 = a2;
        v76 = sel_getName(a2);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v78 = v9;
        v79 = v77;
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v81 = !v72;
        v13 = &OBJC_IVAR___NFAssertSuppressPresentmentIntentToDefaultApp__clientInfo;
        v122 = v76;
        a2 = v75;
        self = v74;
        v82 = 43;
        if (v81)
          v82 = 45;
        v70(6, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", v82, v73, v122, 5614, v80, v130, v128);

        v9 = v78;
      }
      v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v84 = NFSharedLogGetLogger(v83);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = object_getClass(self);
        v87 = v10;
        if (class_isMetaClass(v86))
          v88 = 43;
        else
          v88 = 45;
        v89 = object_getClassName(self);
        v90 = sel_getName(a2);
        v125 = a2;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "NF_userInfo"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110658;
        v136 = v88;
        v10 = v87;
        v137 = 2082;
        v138 = v89;
        v13 = &OBJC_IVAR___NFAssertSuppressPresentmentIntentToDefaultApp__clientInfo;
        v139 = 2082;
        v140 = v90;
        v141 = 1024;
        v142 = 5614;
        v143 = 2114;
        v144 = v92;
        v145 = 2048;
        v146 = v130;
        v147 = 2048;
        v148 = v128;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", buf, 0x40u);

        a2 = v125;
      }

      objc_opt_self(v13 + 812);
      if (v130 <= 4 && v128)
      {
        v93 = sub_100058504(objc_alloc((Class)(v13 + 812)), (uint64_t)v9, (void *)v130, v128, (uint64_t)self->_expressModeManager, self->_secureElementWrapper, self->_driverWrapper, (uint64_t)self->_workQueue);
        v12 = v126;
        objc_msgSend(v93, "setConnection:", v126);
        objc_msgSend(v93, "setQueue:", self);
        objc_msgSend(v93, "setUid:", 0xFFFFFFFFLL);
        v94 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
        v96 = (void *)objc_claimAutoreleasedReturnValue(v94);
        v11 = v131;
        if (v93)
          objc_setProperty_atomic(v93, v95, v96, 176);

        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "exportedInterface"));
        sub_10006BA48((uint64_t)NFHardwareManagerInterface, v97);

        buf[0] = 0;
        v98 = sub_1001C7B30((uint64_t)self, v93, v126, buf);
        v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
        if (v99)
        {
          (*((void (**)(id, _QWORD, _QWORD, void *))v131 + 2))(v131, 0, 0, v99);
        }
        else
        {
          (*((void (**)(id, id *, _QWORD, _QWORD))v131 + 2))(v131, v93, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10010824C;
          block[3] = &unk_1002E5C58;
          block[4] = self;
          dispatch_async(workQueue, block);
        }

      }
      else
      {
        v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v101 = NFLogGetLogger(v100);
        v11 = v131;
        v12 = v126;
        if (v101)
        {
          v102 = (void (*)(uint64_t, const char *, ...))v101;
          v103 = object_getClass(self);
          v104 = class_isMetaClass(v103);
          v105 = object_getClassName(self);
          v123 = sel_getName(a2);
          v106 = 45;
          if (v104)
            v106 = 43;
          v102(3, "%c[%{public}s %{public}s]:%i Role or type mismatch", v106, v105, v123, 5617);
        }
        v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v108 = NFSharedLogGetLogger(v107);
        v109 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          v110 = object_getClass(self);
          if (class_isMetaClass(v110))
            v111 = 43;
          else
            v111 = 45;
          v112 = object_getClassName(self);
          v113 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v136 = v111;
          v137 = 2082;
          v138 = v112;
          v139 = 2082;
          v140 = v113;
          v141 = 1024;
          v142 = 5617;
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Role or type mismatch", buf, 0x22u);
        }

        v114 = objc_alloc((Class)NSError);
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v133 = NSLocalizedDescriptionKey;
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
        v134 = v116;
        v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1));
        v118 = objc_msgSend(v114, "initWithDomain:code:userInfo:", v115, 10, v117);
        (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v118);

      }
      v16 = 0;
    }
    else
    {
      v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFLogGetLogger(v47);
      v11 = v131;
      if (v48)
      {
        v49 = (void (*)(uint64_t, const char *, ...))v48;
        v50 = object_getClass(self);
        v51 = class_isMetaClass(v50);
        v52 = object_getClassName(self);
        v121 = sel_getName(a2);
        v53 = 45;
        if (v51)
          v53 = 43;
        v49(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v53, v52, v121, 5598);
      }
      v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = NFSharedLogGetLogger(v54);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = object_getClass(self);
        if (class_isMetaClass(v57))
          v58 = 43;
        else
          v58 = 45;
        *(_DWORD *)buf = 67109890;
        v136 = v58;
        v137 = 2082;
        v138 = object_getClassName(self);
        v139 = 2082;
        v140 = sel_getName(a2);
        v141 = 1024;
        v142 = 5598;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      v59 = objc_alloc((Class)NSError);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v149 = NSLocalizedDescriptionKey;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
      v150 = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
      v63 = objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 50, v62);
      (*((void (**)(id, _QWORD, _QWORD, id))v131 + 2))(v131, 0, 0, v63);

      v16 = 0;
    }
  }
  else
  {
    v38 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v151 = NSLocalizedDescriptionKey;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v152 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
    v41 = objc_msgSend(v38, "initWithDomain:code:userInfo:", v16, 58, v40);
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v41);

  }
}

- (void)queueSecureTransactionServicesHybridSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  _NFHardwareManager *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char isKindOfClass;
  void *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  int v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  _NFHardwareManager *v74;
  const char *v75;
  const char *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  objc_class *v86;
  id v87;
  int v88;
  const char *v89;
  const char *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
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
  id v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *workQueue;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  id v123;
  const char *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  uint64_t v129;
  id v130;
  _QWORD block[5];
  NSErrorUserInfoKey v132;
  void *v133;
  uint8_t buf[4];
  int v135;
  __int16 v136;
  const char *v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  int v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  id v147;
  NSErrorUserInfoKey v148;
  void *v149;
  NSErrorUserInfoKey v150;
  void *v151;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    v130 = v11;
    v13 = NFTagAppLauncher;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureTransactionServicesHandoverHybridSession validateEntitlements:](_NFSecureTransactionServicesHandoverHybridSession, "validateEntitlements:", v15));

    if (v16)
    {
      v128 = v10;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        v126 = v9;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v25 = self;
        v26 = a2;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v123 = objc_msgSend(v12, "processIdentifier");
        v28 = 45;
        if (isMetaClass)
          v28 = 43;
        v119 = ClassName;
        v9 = v126;
        v19(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v28, v119, Name, 5664, v27, v123);

        a2 = v26;
        self = v25;

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
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110402;
        v135 = v33;
        v136 = 2082;
        v137 = v34;
        v138 = 2082;
        v139 = v35;
        v140 = 1024;
        v141 = 5664;
        v142 = 2114;
        v143 = v37;
        v144 = 1024;
        LODWORD(v145) = objc_msgSend(v12, "processIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v11 = v130;
      (*((void (**)(id, _QWORD, _QWORD, void *))v130 + 2))(v130, 0, 0, v16);
      v10 = v128;
    }
    else if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v10)) == (id)1)
    {
      v42 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v42) & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.role")));
        v44 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v43, v44);

        if ((isKindOfClass & 1) != 0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.role")));
          v129 = (uint64_t)objc_msgSend(v46, "unsignedIntegerValue");

        }
        else
        {
          v129 = -1;
        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.type")));
        v65 = objc_opt_class(NSNumber);
        v66 = objc_opt_isKindOfClass(v64, v65);

        if ((v66 & 1) != 0)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session.sts.handover.type")));
          v127 = objc_msgSend(v67, "unsignedIntegerValue");

        }
        else
        {
          v127 = 0;
        }
        v13 = NFTagAppLauncher;
      }
      else
      {
        v127 = 0;
        v129 = -1;
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      v125 = v12;
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v74 = self;
        v75 = a2;
        v76 = sel_getName(a2);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v78 = v9;
        v79 = v77;
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v81 = !v72;
        v13 = NFTagAppLauncher;
        v121 = v76;
        a2 = v75;
        self = v74;
        v82 = 43;
        if (v81)
          v82 = 45;
        v70(6, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", v82, v73, v121, 5686, v80, v129, v127);

        v9 = v78;
      }
      v83 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v84 = NFSharedLogGetLogger(v83);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = object_getClass(self);
        v87 = v10;
        if (class_isMetaClass(v86))
          v88 = 43;
        else
          v88 = 45;
        v89 = object_getClassName(self);
        v90 = sel_getName(a2);
        v124 = a2;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "NF_userInfo"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110658;
        v135 = v88;
        v10 = v87;
        v136 = 2082;
        v137 = v89;
        v13 = NFTagAppLauncher;
        v138 = 2082;
        v139 = v90;
        v140 = 1024;
        v141 = 5686;
        v142 = 2114;
        v143 = v92;
        v144 = 2048;
        v145 = v129;
        v146 = 2048;
        v147 = v127;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", buf, 0x40u);

        a2 = v124;
      }

      if (objc_msgSend(&v13[60], "isRoleValid:", v129) && v127)
      {
        v93 = objc_msgSend(objc_alloc(&v13[60]), "initWithRemoteObject:role:type:expressModeManager:seWrapper:driverWrapper:workQueue:", v9, v129, v127, self->_expressModeManager, self->_secureElementWrapper, self->_driverWrapper, self->_workQueue);
        v12 = v125;
        objc_msgSend(v93, "setConnection:", v125);
        objc_msgSend(v93, "setQueue:", self);
        objc_msgSend(v93, "setUid:", 0xFFFFFFFFLL);
        v94 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
        v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
        objc_msgSend(v93, "setPowerConsumptionReporter:", v95);

        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "exportedInterface"));
        sub_10006BA48((uint64_t)NFHardwareManagerInterface, v96);

        buf[0] = 0;
        v97 = sub_1001C7B30((uint64_t)self, v93, v125, buf);
        v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
        v11 = v130;
        if (v98)
        {
          (*((void (**)(id, _QWORD, _QWORD, void *))v130 + 2))(v130, 0, 0, v98);
        }
        else
        {
          (*((void (**)(id, id, _QWORD, _QWORD))v130 + 2))(v130, v93, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100108E44;
          block[3] = &unk_1002E5C58;
          block[4] = self;
          dispatch_async(workQueue, block);
        }

      }
      else
      {
        v99 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v100 = NFLogGetLogger(v99);
        v11 = v130;
        v12 = v125;
        if (v100)
        {
          v101 = (void (*)(uint64_t, const char *, ...))v100;
          v102 = object_getClass(self);
          v103 = class_isMetaClass(v102);
          v104 = object_getClassName(self);
          v122 = sel_getName(a2);
          v105 = 45;
          if (v103)
            v105 = 43;
          v101(3, "%c[%{public}s %{public}s]:%i Role or type mismatch", v105, v104, v122, 5689);
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
          v135 = v110;
          v136 = 2082;
          v137 = v111;
          v138 = 2082;
          v139 = v112;
          v140 = 1024;
          v141 = 5689;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Role or type mismatch", buf, 0x22u);
        }

        v113 = objc_alloc((Class)NSError);
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v132 = NSLocalizedDescriptionKey;
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
        v133 = v115;
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
        v117 = objc_msgSend(v113, "initWithDomain:code:userInfo:", v114, 10, v116);
        (*((void (**)(id, _QWORD, _QWORD, id))v130 + 2))(v130, 0, 0, v117);

      }
      v16 = 0;
    }
    else
    {
      v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFLogGetLogger(v47);
      v11 = v130;
      if (v48)
      {
        v49 = (void (*)(uint64_t, const char *, ...))v48;
        v50 = object_getClass(self);
        v51 = class_isMetaClass(v50);
        v52 = object_getClassName(self);
        v120 = sel_getName(a2);
        v53 = 45;
        if (v51)
          v53 = 43;
        v49(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v53, v52, v120, 5670);
      }
      v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = NFSharedLogGetLogger(v54);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = object_getClass(self);
        if (class_isMetaClass(v57))
          v58 = 43;
        else
          v58 = 45;
        *(_DWORD *)buf = 67109890;
        v135 = v58;
        v136 = 2082;
        v137 = object_getClassName(self);
        v138 = 2082;
        v139 = sel_getName(a2);
        v140 = 1024;
        v141 = 5670;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      v59 = objc_alloc((Class)NSError);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v148 = NSLocalizedDescriptionKey;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
      v149 = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
      v63 = objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 50, v62);
      (*((void (**)(id, _QWORD, _QWORD, id))v130 + 2))(v130, 0, 0, v63);

      v16 = 0;
    }
  }
  else
  {
    v38 = objc_alloc((Class)NSError);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v150 = NSLocalizedDescriptionKey;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v151 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1));
    v41 = objc_msgSend(v38, "initWithDomain:code:userInfo:", v16, 58, v40);
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v41);

  }
}

- (void)queueUnifiedAccessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v17;
  const char *Name;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  const char *v39;
  const char *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _NFUnifiedAccessSession *v62;
  _NFUnifiedAccessSession *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  char isKindOfClass;
  void *v68;
  void *v69;
  NSObject *workQueue;
  void *v71;
  _NFUnifiedAccessSession *v72;
  void *v73;
  uint64_t v74;
  void (*v75)(uint64_t, const char *, ...);
  objc_class *v76;
  _BOOL4 v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  objc_class *v96;
  _BOOL4 v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  objc_class *v103;
  int v104;
  const char *v105;
  const char *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  const char *v111;
  const char *v112;
  const char *v113;
  id v114;
  id v115;
  const char *sel;
  id v117;
  _QWORD block[4];
  _NFUnifiedAccessSession *v119;
  _NFHardwareManager *v120;
  id v121;
  const char *v122;
  char v123;
  NSErrorUserInfoKey v124;
  void *v125;
  NSErrorUserInfoKey v126;
  void *v127;
  uint8_t buf[4];
  int v129;
  __int16 v130;
  const char *v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  int v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  unsigned int v139;
  NSErrorUserInfoKey v140;
  void *v141;

  v9 = a3;
  v117 = a4;
  v115 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  sel = a2;
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v17 = v9;
    Name = sel_getName(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v111 = Name;
    v9 = v17;
    v21 = 45;
    if (isMetaClass)
      v21 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, v111, 5730, v20);

  }
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFSharedLogGetLogger(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(self);
    v28 = sel_getName(sel);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v129 = v26;
    v130 = 2082;
    v131 = v27;
    v132 = 2082;
    v133 = v28;
    v134 = 1024;
    v135 = 5730;
    v136 = 2114;
    v137 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[_NFUnifiedAccessSession validateEntitlements:](_NFUnifiedAccessSession, "validateEntitlements:", v32));

    if (v33)
    {
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFLogGetLogger(v34);
      if (v35)
      {
        v36 = (void (*)(uint64_t, const char *, ...))v35;
        v37 = object_getClass(self);
        v38 = class_isMetaClass(v37);
        v39 = object_getClassName(self);
        v40 = sel_getName(sel);
        v41 = v9;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v114 = objc_msgSend(v10, "processIdentifier");
        v44 = 45;
        if (v38)
          v44 = 43;
        v36(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v44, v39, v40, 5739, v43, v114);

        v9 = v41;
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
        v51 = sel_getName(sel);
        v52 = v10;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v55 = objc_msgSend(v52, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v129 = v49;
        v130 = 2082;
        v131 = v50;
        v132 = 2082;
        v133 = v51;
        v134 = 1024;
        v135 = 5739;
        v136 = 2114;
        v137 = v54;
        v138 = 1024;
        v139 = v55;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

        v10 = v52;
      }

      v56 = v115;
      (*((void (**)(id, _QWORD, _QWORD, void *))v115 + 2))(v115, 0, 0, v33);
    }
    else if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, sub_1000ECE40((uint64_t)self, v117)) == (id)1)
    {
      v62 = -[_NFUnifiedAccessSession initWithRemoteObject:expressModeManager:driverWrapper:workQueue:]([_NFUnifiedAccessSession alloc], "initWithRemoteObject:expressModeManager:driverWrapper:workQueue:", v9, self->_expressModeManager, self->_driverWrapper, self->_workQueue);
      v63 = v62;
      if (v62)
      {
        -[_NFSession setQueue:](v62, "setQueue:", self);
        -[_NFXPCSession setConnection:](v63, "setConnection:", v10);
        -[_NFSession setUid:](v63, "setUid:", 0xFFFFFFFFLL);
        v64 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v117, v64) & 1) != 0)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("session.force.express.exit")));
          v66 = objc_opt_class(NSNumber);
          isKindOfClass = objc_opt_isKindOfClass(v65, v66);

          if ((isKindOfClass & 1) != 0)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("session.force.express.exit")));
            -[_NFSession setForceExpressExit:](v63, "setForceExpressExit:", objc_msgSend(v68, "BOOLValue"));

          }
        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exportedInterface"));
        sub_10006B974((uint64_t)NFHardwareManagerInterface, v69);

        (*((void (**)(id, _NFUnifiedAccessSession *, BOOL, _QWORD))v115 + 2))(v115, v63, -[_NFHardwareManager isFirstInQueue](self, "isFirstInQueue"), 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100109918;
        block[3] = &unk_1002E8500;
        v119 = v63;
        v120 = self;
        v56 = v115;
        v71 = v10;
        v121 = v10;
        v122 = sel;
        v123 = 0;
        dispatch_async(workQueue, block);

        v72 = v119;
      }
      else
      {
        v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v94 = NFLogGetLogger(v93);
        if (v94)
        {
          v95 = (void (*)(uint64_t, const char *, ...))v94;
          v96 = object_getClass(self);
          v97 = class_isMetaClass(v96);
          v98 = object_getClassName(self);
          v113 = sel_getName(sel);
          v99 = 45;
          if (v97)
            v99 = 43;
          v95(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v99, v98, v113, 5755);
        }
        v71 = v10;
        v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v101 = NFSharedLogGetLogger(v100);
        v102 = objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          v103 = object_getClass(self);
          if (class_isMetaClass(v103))
            v104 = 43;
          else
            v104 = 45;
          v105 = object_getClassName(self);
          v106 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          v129 = v104;
          v130 = 2082;
          v131 = v105;
          v132 = 2082;
          v133 = v106;
          v134 = 1024;
          v135 = 5755;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v107 = objc_alloc((Class)NSError);
        v72 = (_NFUnifiedAccessSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v124 = NSLocalizedDescriptionKey;
        v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v125 = v108;
        v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1));
        v110 = objc_msgSend(v107, "initWithDomain:code:userInfo:", v72, 13, v109);
        v56 = v115;
        (*((void (**)(id, _QWORD, _QWORD, id))v115 + 2))(v115, 0, 0, v110);

      }
      v33 = 0;
      v10 = v71;
    }
    else
    {
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = NFLogGetLogger(v73);
      if (v74)
      {
        v75 = (void (*)(uint64_t, const char *, ...))v74;
        v76 = object_getClass(self);
        v77 = class_isMetaClass(v76);
        v78 = object_getClassName(self);
        v112 = sel_getName(sel);
        v79 = 45;
        if (v77)
          v79 = 43;
        v75(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v79, v78, v112, 5745);
      }
      v80 = v10;
      v81 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v82 = NFSharedLogGetLogger(v81);
      v83 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v84 = object_getClass(self);
        if (class_isMetaClass(v84))
          v85 = 43;
        else
          v85 = 45;
        v86 = object_getClassName(self);
        v87 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        v129 = v85;
        v130 = 2082;
        v131 = v86;
        v132 = 2082;
        v133 = v87;
        v134 = 1024;
        v135 = 5745;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      v88 = objc_alloc((Class)NSError);
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v126 = NSLocalizedDescriptionKey;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
      v127 = v90;
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
      v92 = objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 50, v91);
      v56 = v115;
      (*((void (**)(id, _QWORD, _QWORD, id))v115 + 2))(v115, 0, 0, v92);

      v33 = 0;
      v10 = v80;
    }
  }
  else
  {
    v57 = objc_alloc((Class)NSError);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v140 = NSLocalizedDescriptionKey;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v141 = v58;
    v59 = v10;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
    v61 = objc_msgSend(v57, "initWithDomain:code:userInfo:", v33, 58, v60);
    v56 = v115;
    (*((void (**)(id, _QWORD, _QWORD, id))v115 + 2))(v115, 0, 0, v61);

    v10 = v59;
  }

}

- (void)queueSecureElementLoggingSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  _NFSecureElementLoggingSession *v52;
  _NFSecureElementLoggingSession *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  objc_class *v70;
  int v71;
  const char *v72;
  const char *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *workQueue;
  const char *v80;
  id v81;
  id v82;
  id v83;
  _QWORD block[5];
  NSErrorUserInfoKey v85;
  void *v86;
  uint8_t buf[4];
  int v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  unsigned int v98;
  NSErrorUserInfoKey v99;
  void *v100;

  v83 = a3;
  v82 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 5801, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v88 = v23;
    v89 = 2082;
    v90 = v24;
    v91 = 2082;
    v92 = v25;
    v93 = 1024;
    v94 = 5801;
    v95 = 2114;
    v96 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFSecureElementLoggingSession validateEntitlements:](_NFSecureElementLoggingSession, "validateEntitlements:", v29));

    if (v30)
    {
      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v32 = NFLogGetLogger(v31);
      if (v32)
      {
        v33 = (void (*)(uint64_t, const char *, ...))v32;
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v81 = objc_msgSend(v8, "processIdentifier");
        v40 = 45;
        if (v35)
          v40 = 43;
        v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v36, v37, 5810, v39, v81);

      }
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFSharedLogGetLogger(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = object_getClass(self);
        if (class_isMetaClass(v44))
          v45 = 43;
        else
          v45 = 45;
        v46 = object_getClassName(self);
        v47 = sel_getName(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v50 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v88 = v45;
        v89 = 2082;
        v90 = v46;
        v91 = 2082;
        v92 = v47;
        v93 = 1024;
        v94 = 5810;
        v95 = 2114;
        v96 = v49;
        v97 = 1024;
        v98 = v50;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      }
      v51 = v82;
      (*((void (**)(id, _QWORD, _QWORD, void *))v82 + 2))(v82, 0, 0, v30);
    }
    else
    {
      v52 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFSecureElementLoggingSession alloc], "initWithRemoteObject:workQueue:", v83, self->_workQueue);
      v53 = v52;
      if (v52)
      {
        -[_NFSession setQueue:](v52, "setQueue:", self);
        -[_NFXPCSession setConnection:](v53, "setConnection:", v8);
        -[_NFSession setUid:](v53, "setUid:", 0xFFFFFFFFLL);
        -[_NFSecureElementLoggingSession setDriverWrapper:](v53, "setDriverWrapper:", self->_driverWrapper);
        buf[0] = 0;
        v54 = sub_1001C7B30((uint64_t)self, v53, v8, buf);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v51 = v82;
        if (v55)
        {
          (*((void (**)(id, _QWORD, _QWORD, void *))v82 + 2))(v82, 0, 0, v55);
        }
        else
        {
          (*((void (**)(id, _NFSecureElementLoggingSession *, _QWORD, _QWORD))v82 + 2))(v82, v53, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10010A4AC;
          block[3] = &unk_1002E5C58;
          block[4] = self;
          dispatch_async(workQueue, block);
        }

      }
      else
      {
        v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = NFLogGetLogger(v60);
        if (v61)
        {
          v62 = (void (*)(uint64_t, const char *, ...))v61;
          v63 = object_getClass(self);
          v64 = class_isMetaClass(v63);
          v65 = object_getClassName(self);
          v80 = sel_getName(a2);
          v66 = 45;
          if (v64)
            v66 = 43;
          v62(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v66, v65, v80, 5817);
        }
        v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v68 = NFSharedLogGetLogger(v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v70 = object_getClass(self);
          if (class_isMetaClass(v70))
            v71 = 43;
          else
            v71 = 45;
          v72 = object_getClassName(self);
          v73 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v88 = v71;
          v89 = 2082;
          v90 = v72;
          v91 = 2082;
          v92 = v73;
          v93 = 1024;
          v94 = 5817;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        v74 = objc_alloc((Class)NSError);
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v85 = NSLocalizedDescriptionKey;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
        v86 = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
        v78 = objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 13, v77);
        v51 = v82;
        (*((void (**)(id, _QWORD, _QWORD, id))v82 + 2))(v82, 0, 0, v78);

      }
      v30 = 0;
    }
  }
  else
  {
    v56 = objc_alloc((Class)NSError);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v99 = NSLocalizedDescriptionKey;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v100 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v59 = objc_msgSend(v56, "initWithDomain:code:userInfo:", v30, 58, v58);
    v51 = v82;
    (*((void (**)(id, _QWORD, _QWORD, id))v82 + 2))(v82, 0, 0, v59);

  }
}

- (void)queueLPEMConfigSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  _NFLPEMConfigSession *v53;
  id v54;
  void *v55;
  NSObject *workQueue;
  id v57;
  id v58;
  id v59;
  _QWORD block[5];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  unsigned int v72;

  v59 = a3;
  v58 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 5850, v17);

  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFSharedLogGetLogger(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22))
      v23 = 43;
    else
      v23 = 45;
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v62 = v23;
    v63 = 2082;
    v64 = v24;
    v65 = 2082;
    v66 = v25;
    v67 = 1024;
    v68 = 5850;
    v69 = 2114;
    v70 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[_NFLPEMConfigSession validateEntitlements:](_NFLPEMConfigSession, "validateEntitlements:", v29));

  if (v30)
  {
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFLogGetLogger(v31);
    if (v32)
    {
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(self);
      v35 = class_isMetaClass(v34);
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v57 = objc_msgSend(v8, "processIdentifier");
      v40 = 45;
      if (v35)
        v40 = 43;
      v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v36, v37, 5854, v39, v57);

    }
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFSharedLogGetLogger(v41);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(self);
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      v46 = object_getClassName(self);
      v47 = sel_getName(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ClientName")));
      v50 = objc_msgSend(v8, "processIdentifier");
      *(_DWORD *)buf = 67110402;
      v62 = v45;
      v63 = 2082;
      v64 = v46;
      v65 = 2082;
      v66 = v47;
      v67 = 1024;
      v68 = 5854;
      v69 = 2114;
      v70 = v49;
      v71 = 1024;
      v72 = v50;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

    }
    v51 = v58;
    (*((void (**)(id, _QWORD, _QWORD, void *))v58 + 2))(v58, 0, 0, v30);
    v52 = v59;
  }
  else
  {
    v52 = v59;
    v53 = -[_NFXPCSession initWithRemoteObject:workQueue:]([_NFLPEMConfigSession alloc], "initWithRemoteObject:workQueue:", v59, self->_workQueue);
    -[_NFSession setQueue:](v53, "setQueue:", self);
    -[_NFXPCSession setConnection:](v53, "setConnection:", v8);
    -[_NFSession setUid:](v53, "setUid:", 0xFFFFFFFFLL);
    -[_NFLPEMConfigSession setDriverWrapper:](v53, "setDriverWrapper:", self->_driverWrapper);
    buf[0] = 0;
    v54 = sub_1001C7B30((uint64_t)self, v53, v8, buf);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v51 = v58;
    if (v55)
    {
      (*((void (**)(id, _QWORD, _QWORD, void *))v58 + 2))(v58, 0, 0, v55);
    }
    else
    {
      (*((void (**)(id, _NFLPEMConfigSession *, _QWORD, _QWORD))v58 + 2))(v58, v53, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010A9FC;
      block[3] = &unk_1002E5C58;
      block[4] = self;
      dispatch_async(workQueue, block);
    }

  }
}

- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *specific;
  uint64_t Logger;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  _BOOL4 v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  const char *Name;
  const char *v81;
  id v82;
  const char *v83;
  _BOOL4 v84;
  void *v85;
  const char *v86;
  const char *v87;
  int v88;
  _QWORD v89[5];
  id v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  id v95;
  SEL v96;
  int v97;
  _OWORD v98[2];
  int v99;
  uint8_t buf[4];
  int v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  unsigned int v111;
  NSErrorUserInfoKey v112;
  void *v113;
  NSErrorUserInfoKey v114;
  void *v115;
  _QWORD v116[4];
  _QWORD v117[4];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v99 = -1;
  v13 = sub_1001C6F4C(self, v12, 0, &v99);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    v15 = (void *)v14;
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, v14);
    goto LABEL_43;
  }
  v16 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  if (!v16 || (v17 = v16[218], v16, (v17 & 1) == 0))
  {
    v18 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v116[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v117[0] = v19;
    v117[1] = &off_1002FF4E0;
    v116[1] = CFSTR("Line");
    v116[2] = CFSTR("Method");
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v117[2] = v20;
    v116[3] = NSDebugDescriptionErrorKey;
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 5956);
    v117[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 4));
    v23 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v15, 14, v22);
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v23);

LABEL_31:
    goto LABEL_43;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, 1) != (id)1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v46 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v50 = 45;
      if (isMetaClass)
        v50 = 43;
      v46(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v50, ClassName, Name, 5961);
    }
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFSharedLogGetLogger(v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = object_getClass(self);
      if (class_isMetaClass(v54))
        v55 = 43;
      else
        v55 = 45;
      v56 = object_getClassName(self);
      v57 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v101 = v55;
      v102 = 2082;
      v103 = v56;
      v104 = 2082;
      v105 = v57;
      v106 = 1024;
      v107 = 5961;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v58 = objc_alloc((Class)NSError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v114 = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v115 = v19;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1));
    v60 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v15, 50, v59);
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v60);

    goto LABEL_31;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("serviceType")));

  if (v15
    && (v25 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v15, v25) & 1) != 0)
    && objc_msgSend(v15, "unsignedIntegerValue") == (id)2)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v28 = (id)objc_claimAutoreleasedReturnValue(+[_NFCardSession validateEntitlements:](_NFCardSession, "validateEntitlements:", v27));

    if (v28)
    {
      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFLogGetLogger(v29);
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        v84 = class_isMetaClass(v32);
        v87 = object_getClassName(self);
        v83 = sel_getName(a2);
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v82 = objc_msgSend(v12, "processIdentifier");
        v34 = 45;
        if (v84)
          v34 = 43;
        v31(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v34, v87, v83, 5977, v33, v82);

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
        v88 = v39;
        v86 = object_getClassName(self);
        v40 = sel_getName(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_userInfo"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v43 = objc_msgSend(v12, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v101 = v88;
        v102 = 2082;
        v103 = v86;
        v104 = 2082;
        v105 = v40;
        v106 = 1024;
        v107 = 5977;
        v108 = 2114;
        v109 = v42;
        v110 = 1026;
        v111 = v43;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);

      }
      (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v28);
    }
    else
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NF_whitelistChecker"));
      if (v12)
        objc_msgSend(v12, "auditToken");
      else
        memset(v98, 0, sizeof(v98));
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_10010B3AC;
      v89[3] = &unk_1002E8528;
      v95 = v11;
      v96 = a2;
      v89[4] = self;
      v90 = v10;
      v91 = v79;
      v92 = v9;
      v93 = v12;
      v97 = v99;
      v94 = v15;
      v28 = v79;
      +[_NFCardSession isEligibleWithUserPrompt:auditToken:completion:](_NFCardSession, "isEligibleWithUserPrompt:auditToken:completion:", 1, v98, v89);

    }
  }
  else
  {
    v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v62 = NFLogGetLogger(v61);
    if (v62)
    {
      v63 = (void (*)(uint64_t, const char *, ...))v62;
      v64 = object_getClass(self);
      v65 = class_isMetaClass(v64);
      v66 = object_getClassName(self);
      v81 = sel_getName(a2);
      v67 = 45;
      if (v65)
        v67 = 43;
      v63(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v67, v66, v81, 5968, v15);
    }
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFSharedLogGetLogger(v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = object_getClass(self);
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v101 = v72;
      v102 = 2082;
      v103 = v73;
      v104 = 2082;
      v105 = v74;
      v106 = 1024;
      v107 = 5968;
      v108 = 2114;
      v109 = v15;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    v75 = objc_alloc((Class)NSError);
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v112 = NSLocalizedDescriptionKey;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v113 = v76;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
    v78 = objc_msgSend(v75, "initWithDomain:code:userInfo:", v28, 12, v77);
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v78);

  }
LABEL_43:

}

- (void)queueCardFieldDetectSession:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *specific;
  uint64_t Logger;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  unsigned int v76;
  const char *v77;
  const char *Name;
  const char *v79;
  id v80;
  const char *v81;
  _BOOL4 v82;
  const char *v83;
  const char *v84;
  _QWORD v85[5];
  id v86;
  void *v87;
  id v88;
  void (**v89)(id, _QWORD, uint64_t);
  SEL v90;
  int v91;
  unsigned int v92;
  _OWORD v93[2];
  int v94;
  uint8_t buf[4];
  int v96;
  __int16 v97;
  const char *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  unsigned int v106;
  NSErrorUserInfoKey v107;
  void *v108;
  NSErrorUserInfoKey v109;
  void *v110;
  _QWORD v111[4];
  _QWORD v112[4];

  v7 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v94 = -1;
  v10 = sub_1001C6F4C(self, v9, 0, &v94);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = (void *)v11;
    v8[2](v8, 0, v11);
    goto LABEL_43;
  }
  v13 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  if (!v13 || (v14 = v13[218], v13, (v14 & 1) == 0))
  {
    v15 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v111[0] = NSLocalizedDescriptionKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v112[0] = v16;
    v112[1] = &off_1002FF558;
    v111[1] = CFSTR("Line");
    v111[2] = CFSTR("Method");
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v112[2] = v17;
    v111[3] = NSDebugDescriptionErrorKey;
    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 6045);
    v112[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v112, v111, 4));
    v20 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v12, 14, v19);
    v8[2](v8, 0, (uint64_t)v20);

LABEL_31:
    goto LABEL_43;
  }
  if ((id)-[_NFHardwareManager nfcRadioEnabled:showUIPopup:](self, "nfcRadioEnabled:showUIPopup:", 0, 1) != (id)1)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v44 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v48 = 45;
      if (isMetaClass)
        v48 = 43;
      v44(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v48, ClassName, Name, 6050);
    }
    v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v50 = NFSharedLogGetLogger(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = object_getClass(self);
      if (class_isMetaClass(v52))
        v53 = 43;
      else
        v53 = 45;
      v54 = object_getClassName(self);
      v55 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v96 = v53;
      v97 = 2082;
      v98 = v54;
      v99 = 2082;
      v100 = v55;
      v101 = 1024;
      v102 = 6050;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    v56 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v109 = NSLocalizedDescriptionKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NFC radio disabled"));
    v110 = v16;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
    v58 = objc_msgSend(v56, "initWithDomain:code:userInfo:", v12, 50, v57);
    v8[2](v8, 0, (uint64_t)v58);

    goto LABEL_31;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("serviceType")));

  if (v12
    && (v22 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v12, v22) & 1) != 0)
    && objc_msgSend(v12, "unsignedIntegerValue") == (id)2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_NFCardSession validateEntitlements:](_NFCardSession, "validateEntitlements:", v24));

    if (v25)
    {
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFLogGetLogger(v26);
      if (v27)
      {
        v28 = (void (*)(uint64_t, const char *, ...))v27;
        v29 = object_getClass(self);
        v82 = class_isMetaClass(v29);
        v83 = object_getClassName(self);
        v81 = sel_getName(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v80 = objc_msgSend(v9, "processIdentifier");
        v32 = 45;
        if (v82)
          v32 = 43;
        v28(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v32, v83, v81, 6066, v31, v80);

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
        v84 = object_getClassName(self);
        v38 = sel_getName(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NF_userInfo"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v41 = objc_msgSend(v9, "processIdentifier");
        *(_DWORD *)buf = 67110402;
        v96 = v37;
        v97 = 2082;
        v98 = v84;
        v99 = 2082;
        v100 = v38;
        v101 = 1024;
        v102 = 6066;
        v103 = 2114;
        v104 = v40;
        v105 = 1026;
        v106 = v41;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);

      }
      v8[2](v8, 0, (uint64_t)v25);
    }
    else
    {
      v76 = objc_msgSend(v9, "processIdentifier");
      if (v9)
        objc_msgSend(v9, "auditToken");
      else
        memset(v93, 0, sizeof(v93));
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10010C4F0;
      v85[3] = &unk_1002E8550;
      v89 = v8;
      v90 = a2;
      v85[4] = self;
      v86 = v7;
      v87 = v9;
      v91 = v94;
      v88 = v12;
      v92 = v76;
      +[_NFCardSession isEligibleWithUserPrompt:auditToken:completion:](_NFCardSession, "isEligibleWithUserPrompt:auditToken:completion:", 1, v93, v85);

      v25 = v89;
    }
  }
  else
  {
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFLogGetLogger(v59);
    if (v60)
    {
      v61 = (void (*)(uint64_t, const char *, ...))v60;
      v62 = object_getClass(self);
      v63 = class_isMetaClass(v62);
      v77 = object_getClassName(self);
      v79 = sel_getName(a2);
      v64 = 45;
      if (v63)
        v64 = 43;
      v61(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v64, v77, v79, 6057, v12);
    }
    v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger(v65);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = object_getClass(self);
      if (class_isMetaClass(v68))
        v69 = 43;
      else
        v69 = 45;
      v70 = object_getClassName(self);
      v71 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v96 = v69;
      v97 = 2082;
      v98 = v70;
      v99 = 2082;
      v100 = v71;
      v101 = 1024;
      v102 = 6057;
      v103 = 2114;
      v104 = v12;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    v72 = objc_alloc((Class)NSError);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v107 = NSLocalizedDescriptionKey;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v108 = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
    v75 = objc_msgSend(v72, "initWithDomain:code:userInfo:", v25, 12, v74);
    v8[2](v8, 0, (uint64_t)v75);

  }
LABEL_43:

}

- (void)isCardSessionEligibleWithCompletion:(id)a3
{
  void (**v5)(id, uint64_t, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  const char *Name;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  const char *v45;
  const char *v46;
  id v47;
  _BOOL4 isMetaClass;
  const char *ClassName;
  _QWORD v50[5];
  void (**v51)(id, uint64_t, void *);
  SEL v52;
  _OWORD v53[2];
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  unsigned int v65;
  NSErrorUserInfoKey v66;
  void *v67;

  v5 = (void (**)(id, uint64_t, void *))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType")));

  if (v8
    && (v9 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && objc_msgSend(v8, "unsignedIntegerValue") == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_NFCardSession validateEntitlements:](_NFCardSession, "validateEntitlements:", v11));

    if (v12)
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
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ClientName")));
        v47 = objc_msgSend(v6, "processIdentifier");
        v20 = 45;
        if (isMetaClass)
          v20 = 43;
        v15(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v20, ClassName, Name, 6123, v19, v47);

      }
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFSharedLogGetLogger(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = object_getClass(self);
        if (class_isMetaClass(v24))
          v25 = 43;
        else
          v25 = 45;
        v26 = object_getClassName(self);
        v27 = sel_getName(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ClientName")));
        *(_DWORD *)buf = 67110402;
        v55 = v25;
        v56 = 2082;
        v57 = v26;
        v58 = 2082;
        v59 = v27;
        v60 = 1024;
        v61 = 6123;
        v62 = 2114;
        v63 = v29;
        v64 = 1026;
        v65 = objc_msgSend(v6, "processIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);

      }
      v5[2](v5, 3, v12);
    }
    else
    {
      if (v6)
        objc_msgSend(v6, "auditToken");
      else
        memset(v53, 0, sizeof(v53));
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10010D1A8;
      v50[3] = &unk_1002E8578;
      v50[4] = self;
      v52 = a2;
      v51 = v5;
      +[_NFCardSession isEligibleWithUserPrompt:auditToken:completion:](_NFCardSession, "isEligibleWithUserPrompt:auditToken:completion:", 0, v53, v50);

      v12 = 0;
    }
  }
  else
  {
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFLogGetLogger(v30);
    if (v31)
    {
      v32 = (void (*)(uint64_t, const char *, ...))v31;
      v33 = object_getClass(self);
      v34 = class_isMetaClass(v33);
      v45 = object_getClassName(self);
      v46 = sel_getName(a2);
      v35 = 45;
      if (v34)
        v35 = 43;
      v32(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v35, v45, v46, 6114, v8);
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
      *(_DWORD *)buf = 67110146;
      v55 = v40;
      v56 = 2082;
      v57 = object_getClassName(self);
      v58 = 2082;
      v59 = sel_getName(a2);
      v60 = 1024;
      v61 = 6114;
      v62 = 2114;
      v63 = v8;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    v41 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v66 = NSLocalizedDescriptionKey;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v67 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    v44 = objc_msgSend(v41, "initWithDomain:code:userInfo:", v12, 12, v43);
    v5[2](v5, 3, v44);

  }
}

- (void)preWarmWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010D3FC;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(workQueue, block);

}

- (void)updateBackgroundTagReading:(unsigned int)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  unsigned int v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010DBF0;
  v11[3] = &unk_1002E85A0;
  v14 = a3;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, v11);

}

- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E1DC;
  block[3] = &unk_1002E85C8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)handleRestartDiscovery
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
  NSObject *workQueue;
  const char *Name;
  _QWORD block[6];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

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
    v6(6, "%c[%{public}s %{public}s]:%i handleRestartDiscovery", v10, ClassName, Name, 6336);
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
    v20 = v15;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 6336;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handleRestartDiscovery", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010ECB0;
  block[3] = &unk_1002E5C30;
  block[4] = self;
  block[5] = a2;
  dispatch_async(workQueue, block);
}

- (void)handleHardwareReset:(const char *)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010EF8C;
  v4[3] = &unk_1002E5C30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)handleStackLoad
{
  uint64_t v4;
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NFDriverWrapper *driverWrapper;
  char v17;
  id v18;
  void *v19;
  NFHardwareControllerInfo *v20;
  NFHardwareControllerInfo *controllerInfo;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  NFPowerTrackingConsumer *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  NFDriverWrapper *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  id v59;
  NFDriverWrapper *v60;
  void *v61;
  uint64_t v62;
  void (*v63)(uint64_t, const char *, ...);
  objc_class *v64;
  _BOOL4 v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  NFPreferenceObserver *v75;
  NFPreferenceObserver *prefObserver;
  NFPreferenceObserver *v77;
  const char *ClassName;
  const char *Name;
  const char *v80;
  const char *v81;
  const char *v82;
  _QWORD v83[5];
  id v84;
  uint8_t buf[4];
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  int v94;

  v4 = NFGetProductType();
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ptype = %d", v10, ClassName, Name, 6360, v4);
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
    *(_DWORD *)buf = 67110146;
    v86 = v15;
    v87 = 2082;
    v88 = object_getClassName(self);
    v89 = 2082;
    v90 = sel_getName(a2);
    v91 = 1024;
    v92 = 6360;
    v93 = 1024;
    v94 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ptype = %d", buf, 0x28u);
  }

  driverWrapper = self->_driverWrapper;
  v84 = 0;
  v17 = sub_1001FC2F8(driverWrapper, &v84);
  v18 = v84;
  v19 = v18;
  if ((v17 & 1) != 0)
  {
    v20 = (NFHardwareControllerInfo *)v18;
    controllerInfo = self->_controllerInfo;
    self->_controllerInfo = v20;
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
      v80 = sel_getName(a2);
      v28 = 45;
      if (v26)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Failed to get controller info", v28, v27, v80, 6363);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    controllerInfo = (NFHardwareControllerInfo *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(&controllerInfo->super, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v86 = v32;
      v87 = 2082;
      v88 = v33;
      v89 = 2082;
      v90 = v34;
      v91 = 1024;
      v92 = 6363;
      _os_log_impl((void *)&_mh_execute_header, &controllerInfo->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get controller info", buf, 0x22u);
    }
  }

  if (-[NFHardwareControllerInfo hasAntenna](self->_controllerInfo, "hasAntenna"))
  {
    v35 = sub_100199368((uint64_t)NFPowerTrackingConsumer, -[NFHardwareControllerInfo siliconName](self->_controllerInfo, "siliconName"));
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)v36;
    if (v36)
      *(_BYTE *)(v36 + 16) = 1;
    v38 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    sub_10019C070((uint64_t)v39, v37);

    v40 = self->_driverWrapper;
    v41 = sub_10019C0D0((uint64_t)NFSystemPowerConsumptionMonitor);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    sub_10020266C((uint64_t)v40, v42);

  }
  if (self->_secureElementWrapper)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v43));

    if (v44)
    {
      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFLogGetLogger(v45);
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(self);
        v49 = class_isMetaClass(v48);
        v50 = object_getClassName(self);
        v81 = sel_getName(a2);
        v51 = 45;
        if (v49)
          v51 = 43;
        v47(3, "%c[%{public}s %{public}s]:%i Failed to set routing mode", v51, v50, v81, 6379);
      }
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFSharedLogGetLogger(v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(self);
        v58 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v86 = v56;
        v87 = 2082;
        v88 = v57;
        v89 = 2082;
        v90 = v58;
        v91 = 1024;
        v92 = 6379;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set routing mode", buf, 0x22u);
      }
    }
    else
    {
      -[_NFHardwareManager refreshSecureElementInfo](self, "refreshSecureElementInfo");
      v54 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
      v59 = -[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v54);
    }

  }
  -[_NFControllerManager initSETransactionsStates](self->_controllerManager, "initSETransactionsStates");
  v60 = self->_driverWrapper;
  if (v60 && v60->_hwState == 1)
    sub_10003CF20(self->_expressModeManager);
  if (self->_prefObserver)
  {
    v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v62 = NFLogGetLogger(v61);
    if (v62)
    {
      v63 = (void (*)(uint64_t, const char *, ...))v62;
      v64 = object_getClass(self);
      v65 = class_isMetaClass(v64);
      v66 = object_getClassName(self);
      v82 = sel_getName(a2);
      v67 = 45;
      if (v65)
        v67 = 43;
      v63(3, "%c[%{public}s %{public}s]:%i Error ! prefs observer still present", v67, v66, v82, 6393);
    }
    v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v69 = NFSharedLogGetLogger(v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = object_getClass(self);
      if (class_isMetaClass(v71))
        v72 = 43;
      else
        v72 = 45;
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v86 = v72;
      v87 = 2082;
      v88 = v73;
      v89 = 2082;
      v90 = v74;
      v91 = 1024;
      v92 = 6393;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error ! prefs observer still present", buf, 0x22u);
    }

    -[NFPreferenceObserver stop](self->_prefObserver, "stop");
  }
  v75 = objc_opt_new(NFPreferenceObserver);
  prefObserver = self->_prefObserver;
  self->_prefObserver = v75;

  v77 = self->_prefObserver;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10010F658;
  v83[3] = &unk_1002E5C58;
  v83[4] = self;
  -[NFPreferenceObserver start:](v77, "start:", v83);

}

- (void)handleHWRecoveryStarted
{
  sub_1000DE4E0((id *)&self->super.isa, 3);
}

- (void)handleHWRecoveryCompletion:(BOOL)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
    sub_1000DE4E0((id *)&self->super.isa, v4);
  }
}

- (void)handleStackUnload
{
  NFPreferenceObserver *prefObserver;
  id v4;

  sub_10003DA3C(&self->_expressModeManager->super.isa);
  sub_10004066C((uint64_t)self->_expressModeManager);
  -[NFPreferenceObserver stop](self->_prefObserver, "stop");
  prefObserver = self->_prefObserver;
  self->_prefObserver = 0;

  v4 = sub_1001F15DC(self);
}

- (void)handleExpressModeStarted
{
  NFApplet *v4;
  void *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *specific;
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
  const char *v35;
  const char *v36;
  __CFString *v37;
  NSMutableString *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  __CFString *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *i;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  id v77;
  __CFString *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  const char *Name;
  const char *v85;
  const char *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[2];
  _QWORD v92[2];
  uint8_t v93[128];
  uint8_t buf[4];
  _BYTE v95[24];
  __int16 v96;
  int v97;

  sub_1000057D4(self);
  v4 = objc_opt_new(NFApplet);
  -[NFSecureElementWrapper setActiveApplet:](self->_secureElementWrapper, "setActiveApplet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  objc_msgSend(v5, "holdPowerAssertion:", CFSTR("ExpressMode"));

  Logger = NFLogGetLogger(2);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: nfcd", v11, ClassName, Name, 6434);
  }
  v12 = NFSharedLogGetLogger(2);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v95 = v15;
    *(_WORD *)&v95[4] = 2082;
    *(_QWORD *)&v95[6] = object_getClassName(self);
    *(_WORD *)&v95[14] = 2082;
    *(_QWORD *)&v95[16] = sel_getName(a2);
    v96 = 1024;
    v97 = 6434;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: nfcd", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  v17 = objc_msgSend(v16, "wantsExpress");

  if ((v17 & 1) != 0)
  {
    v18 = kdebug_trace(724566168, 0, 0, 0, 0);
    v19 = NFSharedSignpostLog(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      v21 = sub_10003BE0C((__CFString *)self->_expressModeManager);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v95 = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_ENTERED", "Express type %@", buf, 0xCu);

    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFLogGetLogger(specific);
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(self);
      v85 = sel_getName(a2);
      v29 = 45;
      if (v27)
        v29 = 43;
      v25(6, "%c[%{public}s %{public}s]:%i express mode started", v29, v28, v85, 6447);
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
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v95 = v34;
      *(_WORD *)&v95[4] = 2082;
      *(_QWORD *)&v95[6] = v35;
      *(_WORD *)&v95[14] = 2082;
      *(_QWORD *)&v95[16] = v36;
      v96 = 1024;
      v97 = 6447;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express mode started", buf, 0x22u);
    }

    if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleExpressModeStarted") & 1) != 0)
    {
      self->_inSessionExpressSessionID = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
      -[_NFSession handleExpressModeStarted](self->_currentSecureElementSession, "handleExpressModeStarted");
      if (!-[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession)))return;
      v37 = sub_10003BE0C((__CFString *)self->_expressModeManager);
      v38 = (NSMutableString *)objc_claimAutoreleasedReturnValue(v37);
      sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.enter", v38);
    }
    else
    {
      self->_inSessionExpressSessionID = -1;
      v53 = sub_10003BE0C((__CFString *)self->_expressModeManager);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.enter", v54);

      v56 = NFSharedSignpostLog(v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_signpost_enabled(v57))
      {
        v58 = sub_10003BE0C((__CFString *)self->_expressModeManager);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v95 = "com.apple.stockholm.express.enter";
        *(_WORD *)&v95[8] = 2112;
        *(_QWORD *)&v95[10] = v59;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MODE_ENTERED_NOTIFICATION", "%s, type: %@", buf, 0x16u);

      }
      v38 = objc_opt_new(NSMutableString);
      v60 = sub_1001FBCC0((uint64_t)self->_driverWrapper);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if (objc_msgSend(v61, "notificationType") == (id)3)
      {
        v62 = v61;
        v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "tciArray"));
        if (v63)
        {
          v64 = (void *)v63;
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "tciArray"));
          v66 = objc_msgSend(v65, "count");

          if (v66)
          {
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "tciArray"));
            v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
            if (v68)
            {
              v69 = v68;
              v70 = *(_QWORD *)v88;
              do
              {
                for (i = 0; i != v69; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v88 != v70)
                    objc_enumerationMutation(v67);
                  v72 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
                  if (-[NSMutableString length](v38, "length"))
                    -[NSMutableString appendString:](v38, "appendString:", CFSTR(","));
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "NF_asHexString"));
                  -[NSMutableString appendString:](v38, "appendString:", v73);

                }
                v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
              }
              while (v69);
            }

            sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.field.ecp2.tci", v38);
            v75 = NFSharedSignpostLog(v74);
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (os_signpost_enabled(v76))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MOD_ECP2_FIELD_TCI_NOTIFICATION", "com.apple.stockholm.express.field.ecp2.tci", buf, 2u);
            }

          }
        }

      }
      v77 = objc_alloc((Class)NSMutableDictionary);
      v91[0] = CFSTR("xpcEventName");
      v91[1] = CFSTR("Type");
      v92[0] = CFSTR("com.apple.stockholm.express.enterV2");
      v78 = sub_10003BE0C((__CFString *)self->_expressModeManager);
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v92[1] = v79;
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v92, v91, 2));
      v81 = objc_msgSend(v77, "initWithDictionary:", v80);

      if (-[NSMutableString length](v38, "length"))
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v38, CFSTR("Ecp2TCI"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureXPCEventPublisherManager sharedManager](NFSecureXPCEventPublisherManager, "sharedManager"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "wallet"));
      objc_msgSend(v83, "sendDictionary:", v81);

    }
  }
  else
  {
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFLogGetLogger(v39);
    if (v40)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v40;
      v42 = object_getClass(self);
      v43 = class_isMetaClass(v42);
      v44 = object_getClassName(self);
      v86 = sel_getName(a2);
      v45 = 45;
      if (v43)
        v45 = 43;
      v41(4, "%c[%{public}s %{public}s]:%i Routing no longer in express mode; dropping signal", v45, v44, v86, 6437);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = object_getClass(self);
      if (class_isMetaClass(v49))
        v50 = 43;
      else
        v50 = 45;
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v95 = v50;
      *(_WORD *)&v95[4] = 2082;
      *(_QWORD *)&v95[6] = v51;
      *(_WORD *)&v95[14] = 2082;
      *(_QWORD *)&v95[16] = v52;
      v96 = 1024;
      v97 = 6437;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Routing no longer in express mode; dropping signal",
        buf,
        0x22u);
    }

    sub_10003DA78(self->_expressModeManager);
    v38 = (NSMutableString *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
    -[NSMutableString releasePowerAssertion:](v38, "releasePowerAssertion:", CFSTR("ExpressMode"));
  }

}

- (void)handleExpressModeExited
{
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *specific;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  int inSessionExpressSessionID;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  int v51;
  unsigned int v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  const char *Name;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  unsigned int v87;

  Logger = NFLogGetLogger(2);
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: nfcd", v9, ClassName, Name, 6504);
  }
  v10 = NFSharedLogGetLogger(2);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v77 = v13;
    v78 = 2082;
    v79 = object_getClassName(self);
    v80 = 2082;
    v81 = sel_getName(a2);
    v82 = 1024;
    v83 = 6504;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: nfcd", buf, 0x22u);
  }

  v14 = kdebug_trace(724566172, 0, 0, 0, 0);
  v15 = NFSharedSignpostLog(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_EXITED", ", buf, 2u);
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFLogGetLogger(specific);
  if (v18)
  {
    v19 = (void (*)(uint64_t, const char *, ...))v18;
    v20 = object_getClass(self);
    v21 = class_isMetaClass(v20);
    v22 = object_getClassName(self);
    v73 = sel_getName(a2);
    v23 = 45;
    if (v21)
      v23 = 43;
    v19(6, "%c[%{public}s %{public}s]:%i express mode exited", v23, v22, v73, 6509);
  }
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = NFSharedLogGetLogger(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(self);
    v30 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v77 = v28;
    v78 = 2082;
    v79 = v29;
    v80 = 2082;
    v81 = v30;
    v82 = 1024;
    v83 = 6509;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express mode exited", buf, 0x22u);
  }

  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleExpressModeExited") & 1) == 0)
  {
    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.exit", 0);
    v33 = NFSharedSignpostLog(v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_signpost_enabled(v34))
    {
LABEL_28:

      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
LABEL_27:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MODE_EXITED_NOTIFICATION", "com.apple.stockholm.express.exit", buf, 2u);
    goto LABEL_28;
  }
  inSessionExpressSessionID = self->_inSessionExpressSessionID;
  if (inSessionExpressSessionID == -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID"))
  {
    -[_NFSession handleExpressModeExited](self->_currentSecureElementSession, "handleExpressModeExited");
    if (-[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession)))sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.exit", 0);
    goto LABEL_40;
  }
  v35 = self->_inSessionExpressSessionID;
  v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v37 = NFLogGetLogger(v36);
  v38 = (void (*)(uint64_t, const char *, ...))v37;
  if (v35 == -1)
  {
    if (v37)
    {
      v57 = object_getClass(self);
      v58 = class_isMetaClass(v57);
      v59 = object_getClassName(self);
      v60 = sel_getName(a2);
      v61 = 45;
      if (v58)
        v61 = 43;
      v38(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v61, v59, v60, 6523, self->_inSessionExpressSessionID);
    }
    v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v63 = NFSharedLogGetLogger(v62);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = object_getClass(self);
      if (class_isMetaClass(v65))
        v66 = 43;
      else
        v66 = 45;
      v67 = object_getClassName(self);
      v68 = sel_getName(a2);
      v69 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      v77 = v66;
      v78 = 2082;
      v79 = v67;
      v80 = 2082;
      v81 = v68;
      v82 = 1024;
      v83 = 6523;
      v84 = 1024;
      v85 = v69;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.exit", 0);
    v71 = NFSharedSignpostLog(v70);
    v34 = objc_claimAutoreleasedReturnValue(v71);
    if (!os_signpost_enabled(v34))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    goto LABEL_27;
  }
  if (v37)
  {
    v39 = object_getClass(self);
    v40 = class_isMetaClass(v39);
    v41 = object_getClassName(self);
    v42 = sel_getName(a2);
    v74 = self->_inSessionExpressSessionID;
    v75 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    v43 = 45;
    if (v40)
      v43 = 43;
    v38(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - dropping", v43, v41, v42, 6528, v74, v75);
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
    v51 = self->_inSessionExpressSessionID;
    v52 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    *(_DWORD *)buf = 67110402;
    v77 = v48;
    v78 = 2082;
    v79 = v49;
    v80 = 2082;
    v81 = v50;
    v82 = 1024;
    v83 = 6528;
    v84 = 1024;
    v85 = v51;
    v86 = 1024;
    v87 = v52;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - dropping", buf, 0x2Eu);
  }

LABEL_40:
  -[_NFHardwareManager maybeStartNextSession](self, "maybeStartNextSession");
  sub_10004BA8C((uint64_t)self->_expressModeManager, 2.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  objc_msgSend(v53, "releasePowerAssertion:", CFSTR("ExpressMode"));

  self->_inSessionExpressSessionID = -1;
  if (self->_systemWillSleep)
  {
    v55 = NFSharedSignpostLog(v54);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_signpost_enabled(v56))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleExpressModeExited: allowing to sleep", ", buf, 2u);
    }

    -[NFPowerObserver allowSleep](self->_powerObserver, "allowSleep");
  }
}

- (void)handleExpressModeTimeout
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
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
  const char *v19;
  const char *v20;
  int inSessionExpressSessionID;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  int v41;
  unsigned int v42;
  objc_class *v43;
  _BOOL4 v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  const char *Name;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  unsigned int v72;

  v4 = kdebug_trace(724566184, 0, 0, 0, 0);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TIMEOUT", ", buf, 2u);
  }

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
    v9(6, "%c[%{public}s %{public}s]:%i Express mode timer fired", v13, ClassName, Name, 6562);
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
    *(_DWORD *)buf = 67109890;
    v62 = v18;
    v63 = 2082;
    v64 = v19;
    v65 = 2082;
    v66 = v20;
    v67 = 1024;
    v68 = 6562;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode timer fired", buf, 0x22u);
  }

  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleExpressModeTimeout") & 1) == 0)
  {
    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0);
    v23 = NFSharedSignpostLog(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_signpost_enabled(v24))
    {
LABEL_19:

      return;
    }
    *(_WORD *)buf = 0;
LABEL_18:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TRANSIT_TIMEOUT_NOTIFICATION", "com.apple.stockholm.express.transaction.timeout", buf, 2u);
    goto LABEL_19;
  }
  inSessionExpressSessionID = self->_inSessionExpressSessionID;
  if (inSessionExpressSessionID == -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID"))
  {
    -[_NFSession handleExpressModeTimeout](self->_currentSecureElementSession, "handleExpressModeTimeout");
    if (-[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession)))sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0);
    return;
  }
  v25 = self->_inSessionExpressSessionID;
  v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFLogGetLogger(v26);
  v28 = (void (*)(uint64_t, const char *, ...))v27;
  if (v25 == -1)
  {
    if (v27)
    {
      v43 = object_getClass(self);
      v44 = class_isMetaClass(v43);
      v45 = object_getClassName(self);
      v46 = sel_getName(a2);
      v47 = 45;
      if (v44)
        v47 = 43;
      v28(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v47, v45, v46, 6576, self->_inSessionExpressSessionID);
    }
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      v55 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      v62 = v52;
      v63 = 2082;
      v64 = v53;
      v65 = 2082;
      v66 = v54;
      v67 = 1024;
      v68 = 6576;
      v69 = 1024;
      v70 = v55;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0);
    v57 = NFSharedSignpostLog(v56);
    v24 = objc_claimAutoreleasedReturnValue(v57);
    if (!os_signpost_enabled(v24))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    goto LABEL_18;
  }
  if (v27)
  {
    v29 = object_getClass(self);
    v30 = class_isMetaClass(v29);
    v31 = object_getClassName(self);
    v32 = sel_getName(a2);
    v59 = self->_inSessionExpressSessionID;
    v60 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    v33 = 45;
    if (v30)
      v33 = 43;
    v28(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v33, v31, v32, 6581, v59, v60);
  }
  v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v35 = NFSharedLogGetLogger(v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = object_getClass(self);
    if (class_isMetaClass(v37))
      v38 = 43;
    else
      v38 = 45;
    v39 = object_getClassName(self);
    v40 = sel_getName(a2);
    v41 = self->_inSessionExpressSessionID;
    v42 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    *(_DWORD *)buf = 67110402;
    v62 = v38;
    v63 = 2082;
    v64 = v39;
    v65 = 2082;
    v66 = v40;
    v67 = 1024;
    v68 = 6581;
    v69 = 1024;
    v70 = v41;
    v71 = 1024;
    v72 = v42;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
  }

}

- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9;
  id v10;
  id v11;
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
  void *v23;
  NFExpressModeManager *expressModeManager;
  int inSessionExpressSessionID;
  _NFSession *currentSecureElementSession;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NFExpressModeManager *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  int v52;
  unsigned int v53;
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *v64;
  const char *v65;
  int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  const char *ClassName;
  const char *Name;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  const char *v75;
  uint8_t buf[4];
  _BYTE v77[24];
  __int16 v78;
  int v79;
  __int16 v80;
  _QWORD v81[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
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
    v14(6, "%c[%{public}s %{public}s]:%i Applet Inactivity Timeout : %{public}@", v17, ClassName, Name, 6592, v9);
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
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v77 = v22;
    *(_WORD *)&v77[4] = 2082;
    *(_QWORD *)&v77[6] = object_getClassName(self);
    *(_WORD *)&v77[14] = 2082;
    *(_QWORD *)&v77[16] = sel_getName(a2);
    v78 = 1024;
    v79 = 6592;
    v80 = 2114;
    v81[0] = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet Inactivity Timeout : %{public}@", buf, 0x2Cu);
  }

  if (v9)
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("applet")));
  else
    v23 = 0;
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleAppletInactivityTimeout:") & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v29);

    v31 = NFSharedSignpostLog(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_signpost_enabled(v32))
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v77 = "com.apple.stockholm.express.transaction.timeout";
    *(_WORD *)&v77[8] = 2112;
    *(_QWORD *)&v77[10] = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_APPLET_INACTIVITY_TIMEOUT_NOTIFICATION", "%s, aid: %@", buf, 0x16u);

    goto LABEL_22;
  }
  expressModeManager = self->_expressModeManager;
  if (!expressModeManager
    || !expressModeManager->_expressModeInProgress
    || (inSessionExpressSessionID = self->_inSessionExpressSessionID,
        inSessionExpressSessionID == -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID")))
  {
    currentSecureElementSession = self->_currentSecureElementSession;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("result")));
    -[_NFSession handleAppletInactivityTimeout:](currentSecureElementSession, "handleAppletInactivityTimeout:", v27);

    if (-[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession)))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v28);

      sub_1000A87F8((uint64_t)NFUnifiedAccessTransactionCALogger, v10);
      if (!v11)
        goto LABEL_42;
      goto LABEL_24;
    }
LABEL_23:
    if (!v11)
      goto LABEL_42;
    goto LABEL_24;
  }
  v38 = self->_inSessionExpressSessionID;
  v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v40 = NFLogGetLogger(v39);
  v41 = (void (*)(uint64_t, const char *, ...))v40;
  if (v38 == -1)
  {
    if (v40)
    {
      v54 = object_getClass(self);
      v55 = class_isMetaClass(v54);
      v56 = object_getClassName(self);
      v57 = sel_getName(a2);
      v58 = 45;
      if (v55)
        v58 = 43;
      v41(6, "%c[%{public}s %{public}s]:%i in session but express started before (sessionID:%d)", v58, v56, v57, 6614, self->_inSessionExpressSessionID);
    }
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger(v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = object_getClass(self);
      if (class_isMetaClass(v62))
        v63 = 43;
      else
        v63 = 45;
      v64 = object_getClassName(self);
      v65 = sel_getName(a2);
      v66 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v77 = v63;
      *(_WORD *)&v77[4] = 2082;
      *(_QWORD *)&v77[6] = v64;
      *(_WORD *)&v77[14] = 2082;
      *(_QWORD *)&v77[16] = v65;
      v78 = 1024;
      v79 = 6614;
      v80 = 1024;
      LODWORD(v81[0]) = v66;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (sessionID:%d)", buf, 0x28u);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v67);

    v69 = NFSharedSignpostLog(v68);
    v32 = objc_claimAutoreleasedReturnValue(v69);
    if (!os_signpost_enabled(v32))
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v40)
  {
    v42 = object_getClass(self);
    v74 = class_isMetaClass(v42);
    v75 = object_getClassName(self);
    v43 = sel_getName(a2);
    v72 = self->_inSessionExpressSessionID;
    v73 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    v44 = 45;
    if (v74)
      v44 = 43;
    v41(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v44, v75, v43, 6620, v72, v73);
  }
  v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v46 = NFSharedLogGetLogger(v45);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = object_getClass(self);
    if (class_isMetaClass(v48))
      v49 = 43;
    else
      v49 = 45;
    v50 = object_getClassName(self);
    v51 = sel_getName(a2);
    v52 = self->_inSessionExpressSessionID;
    v53 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v77 = v49;
    *(_WORD *)&v77[4] = 2082;
    *(_QWORD *)&v77[6] = v50;
    *(_WORD *)&v77[14] = 2082;
    *(_QWORD *)&v77[16] = v51;
    v78 = 1024;
    v79 = 6620;
    v80 = 1024;
    LODWORD(v81[0]) = v52;
    WORD2(v81[0]) = 1024;
    *(_DWORD *)((char *)v81 + 6) = v53;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
  }

  if (v11)
  {
LABEL_24:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
    v35 = objc_msgSend(v34, "embeddedMode");

    if (v35 != (id)1)
    {
      v36 = self->_expressModeManager;
      if (v36)
      {
        if (v36->_expressModeInProgress)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
          LOBYTE(v36) = sub_100043748((uint64_t)v36, v37);

        }
        else
        {
          LOBYTE(v36) = 0;
        }
      }
      sub_100227028((uint64_t)NFHciTransactionEventCALogger, v11, v10, (char)v36, 1);
    }
  }
LABEL_42:

}

- (void)handleRequestService:(id)a3 inExpress:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NFExpressModeManager *expressModeManager;
  int inSessionExpressSessionID;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  int v37;
  unsigned int v38;
  const char *Name;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;

  v4 = a4;
  v7 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i express=%d, %{public}@", v14, ClassName, Name, 6643, v4, v7);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67110402;
    v43 = v19;
    v44 = 2082;
    v45 = object_getClassName(self);
    v46 = 2082;
    v47 = sel_getName(a2);
    v48 = 1024;
    v49 = 6643;
    v50 = 1024;
    v51 = v4;
    v52 = 2114;
    v53 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express=%d, %{public}@", buf, 0x32u);
  }

  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleRequestService:") & 1) != 0)
  {
    expressModeManager = self->_expressModeManager;
    if (expressModeManager)
    {
      if (expressModeManager->_expressModeInProgress)
      {
        inSessionExpressSessionID = self->_inSessionExpressSessionID;
        if (inSessionExpressSessionID != -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID"))
        {
          v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v23 = NFLogGetLogger(v22);
          if (v23)
          {
            v24 = (void (*)(uint64_t, const char *, ...))v23;
            v25 = object_getClass(self);
            v26 = class_isMetaClass(v25);
            v27 = object_getClassName(self);
            v28 = sel_getName(a2);
            v40 = self->_inSessionExpressSessionID;
            v41 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
            v29 = 45;
            if (v26)
              v29 = 43;
            v24(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v29, v27, v28, 6650, v40, v41);
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
            v37 = self->_inSessionExpressSessionID;
            v38 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
            *(_DWORD *)buf = 67110402;
            v43 = v34;
            v44 = 2082;
            v45 = v35;
            v46 = 2082;
            v47 = v36;
            v48 = 1024;
            v49 = 6650;
            v50 = 1024;
            v51 = v37;
            v52 = 1024;
            LODWORD(v53) = v38;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
          }

          if (v4)
            goto LABEL_16;
          goto LABEL_17;
        }
      }
    }
    -[_NFSession handleRequestService:](self->_currentSecureElementSession, "handleRequestService:", v7);
  }
  if (v4)
LABEL_16:
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100306628);
LABEL_17:

}

- (void)handleForceExpressModeEndEvent
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
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *Name;
  const char *v49;
  const char *v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;

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
    v6(6, "%c[%{public}s %{public}s]:%i Switching to NFSecureElementRoutingModeNone", v10, ClassName, Name, 6667);
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
    v52 = v15;
    v53 = 2082;
    v54 = object_getClassName(self);
    v55 = 2082;
    v56 = sel_getName(a2);
    v57 = 1024;
    v58 = 6667;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching to NFSecureElementRoutingModeNone", buf, 0x22u);
  }

  v16 = sub_1001F84C8(self->_driverWrapper, CFSTR("Force Express End Event"), 1uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v17)
  {
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFLogGetLogger(v18);
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v47 = object_getClassName(self);
      v49 = sel_getName(a2);
      v23 = 45;
      if (v22)
        v23 = 43;
      v20(4, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v23, v47, v49, 6670, v17);
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
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v52 = v28;
      v53 = 2082;
      v54 = v29;
      v55 = 2082;
      v56 = v30;
      v57 = 1024;
      v58 = 6670;
      v59 = 2112;
      v60 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
    }

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v31));

    if (v32)
    {
      v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v34 = NFLogGetLogger(v33);
      if (v34)
      {
        v35 = (void (*)(uint64_t, const char *, ...))v34;
        v36 = object_getClass(self);
        v37 = class_isMetaClass(v36);
        v38 = object_getClassName(self);
        v50 = sel_getName(a2);
        v39 = 45;
        if (v37)
          v39 = 43;
        v35(4, "%c[%{public}s %{public}s]:%i Unable to switch to NFSecureElementRoutingModeNone", v39, v38, v50, 6675);
      }
      v40 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v41 = NFSharedLogGetLogger(v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = object_getClass(self);
        if (class_isMetaClass(v43))
          v44 = 43;
        else
          v44 = 45;
        v45 = object_getClassName(self);
        v46 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v52 = v44;
        v53 = 2082;
        v54 = v45;
        v55 = 2082;
        v56 = v46;
        v57 = 1024;
        v58 = 6675;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to switch to NFSecureElementRoutingModeNone", buf, 0x22u);
      }

    }
    sub_1001FABB8(self->_driverWrapper, CFSTR("Force Express End Event"));
  }

}

- (id)softResetSE:(id)a3
{
  id v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void **v41;
  uint64_t v42;
  BOOL (*v43)(uint64_t);
  void *v44;
  _NFHardwareManager *v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  uint64_t v63;
  _QWORD v64[4];
  _QWORD v65[4];

  v5 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_1000E3C80;
  v52 = sub_1000E3C90;
  v53 = 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Soft reset of SE :(", v9, ClassName, Name, 6700);
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
    v17 = object_getClassName(self);
    v18 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v55 = v16;
    v56 = 2082;
    v57 = v17;
    v58 = 2082;
    v59 = v18;
    v60 = 1024;
    v61 = 6700;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Soft reset of SE :(", buf, 0x22u);
  }

  if (objc_msgSend(v5, "isEqual:", self->_secureElementWrapper))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 0));
    v41 = _NSConcreteStackBlock;
    v42 = 3221225472;
    v43 = sub_100111F70;
    v44 = &unk_1002E83E8;
    v47 = &v48;
    v45 = self;
    v46 = v5;
    if ((sub_1000E3CEC((void **)&self->super.isa, &v41, CFSTR("SoftResetSE"), v19) & 1) == 0)
    {
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v20);
      if (v21)
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        v24 = object_getClassName(self);
        v25 = sel_getName(a2);
        v21(3, "%c[%{public}s %{public}s]:%i Failed to soft reset SE: %{public}@", v23, v24, v25, 6714, v49[5], v41, v42, v43, v44, v45);
      }
      v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFSharedLogGetLogger(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = object_getClass(self);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        v31 = object_getClassName(self);
        v32 = sel_getName(a2);
        v33 = v49[5];
        *(_DWORD *)buf = 67110146;
        v55 = v30;
        v56 = 2082;
        v57 = v31;
        v58 = 2082;
        v59 = v32;
        v60 = 1024;
        v61 = 6714;
        v62 = 2114;
        v63 = v33;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to soft reset SE: %{public}@", buf, 0x2Cu);
      }

    }
    v34 = (id)v49[5];

  }
  else
  {
    v35 = objc_alloc((Class)NSError);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v64[0] = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "SE not available"));
    v65[0] = v36;
    v65[1] = &off_1002FF5E8;
    v64[1] = CFSTR("Line");
    v64[2] = CFSTR("Method");
    v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v65[2] = v37;
    v64[3] = NSDebugDescriptionErrorKey;
    v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 6705);
    v65[3] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 4));
    v34 = objc_msgSend(v35, "initWithDomain:code:userInfo:", v19, 35, v39);

  }
  _Block_object_dispose(&v48, 8);

  return v34;
}

- (void)handleFilteredFieldNotification:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112310;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleSecureElementEndOfOperation
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112F50;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementEnteredRestrictedMode:(int)a3 os:(int64_t)a4
{
  NSObject *workQueue;
  _QWORD block[6];
  int v6;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112FF4;
  block[3] = &unk_1002E8668;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementEnteredRestrictedModeExit:(int)a3 os:(int64_t)a4
{
  uint64_t v5;
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
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  NSObject *workQueue;
  const char *ClassName;
  const char *v32;
  const char *Name;
  const char *v34;
  _QWORD block[7];
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int64_t v45;

  v5 = *(_QWORD *)&a3;
  if (-[NFSecureElementWrapper isSecureElement:](self->_secureElementWrapper, "isSecureElement:"))
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
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
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for %ld", v13, ClassName, Name, 6997, a4);
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
        v37 = v18;
        v38 = 2082;
        v39 = object_getClassName(self);
        v40 = 2082;
        v41 = sel_getName(a2);
        v42 = 1024;
        v43 = 6997;
        v44 = 2048;
        v45 = a4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for %ld", buf, 0x2Cu);
      }

    }
    else
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100113320;
      block[3] = &unk_1002E7DD8;
      block[4] = self;
      block[5] = a2;
      block[6] = a4;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFLogGetLogger(v19);
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      v23 = class_isMetaClass(v22);
      v32 = object_getClassName(self);
      v34 = sel_getName(a2);
      v24 = 45;
      if (v23)
        v24 = 43;
      v21(6, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for se ID %d", v24, v32, v34, 6992, v5);
    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      *(_DWORD *)buf = 67110146;
      v37 = v29;
      v38 = 2082;
      v39 = object_getClassName(self);
      v40 = 2082;
      v41 = sel_getName(a2);
      v42 = 1024;
      v43 = 6992;
      v44 = 1024;
      LODWORD(v45) = v5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for se ID %d", buf, 0x28u);
    }

  }
}

- (void)handleSelectEvent:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113600;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleEraseCounterExceeded
{
  void *v3;
  OS_dispatch_workloop *workQueue;
  id v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager defaultRoutingConfig:](self, "defaultRoutingConfig:", 3));
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100113888;
  v6[3] = &unk_1002E5C58;
  v6[4] = self;
  v5 = +[_NFBuiltinSession createSessionWithWorkQueue:routing:sessionQueuer:didStartWork:](_NFBuiltinSession, "createSessionWithWorkQueue:routing:sessionQueuer:didStartWork:", workQueue, v3, self, v6);

}

- (void)handleSecureElementReaderModeStarted:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001139E0;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleSecureElementReaderModeEnded:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113C54;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleReaderModeProhibitTimerEvent:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *workQueue;
  _QWORD block[7];

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    block[5] = v3;
    block[6] = v4;
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100113EA0;
    block[3] = &unk_1002E5C58;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100114050;
  v12[3] = &unk_1002E5CD0;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(workQueue, v12);

}

- (void)handleTimerExpiredEvent:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  _NFSession *currentSecureElementSession;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _NFSession *v31;

  v5 = a3;
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleTimerExpiredEvent:") & 1) != 0)
  {
    -[_NFSession handleTimerExpiredEvent:](self->_currentSecureElementSession, "handleTimerExpiredEvent:", v5);
  }
  else
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
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v8(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v13, ClassName, Name, 7118, self->_currentSecureElementSession);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      v23 = v18;
      v24 = 2082;
      v25 = v19;
      v26 = 2082;
      v27 = v20;
      v28 = 1024;
      v29 = 7118;
      v30 = 2114;
      v31 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }

  }
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9;
  id v10;
  id v11;
  NFExpressModeManager *expressModeManager;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NFExpressModeManager *v21;
  int inSessionExpressSessionID;
  NFExpressModeManager *v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  _NFSession *currentSecureElementSession;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint32_t v43;
  void *v44;
  unsigned int v45;
  void *v46;
  id v47;
  NFExpressModeManager *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  int v65;
  unsigned int v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  objc_class *v80;
  int v81;
  const char *v82;
  const char *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  _QWORD v97[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  expressModeManager = self->_expressModeManager;
  if (expressModeManager
    && expressModeManager->_expressModeInProgress
    && !expressModeManager->_didPerformExpressTransaction)
  {
    v13 = kdebug_trace(724566176, 0, 0, 0, 0);
    v14 = NFSharedSignpostLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TX_START", ", buf, 2u);
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyIdentifier"));

  if (v16)
  {
    v17 = objc_alloc((Class)NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appletIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyIdentifier"));
    v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("%@:%@"), v18, v19);

  }
  else
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appletIdentifier"));
  }
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleTransactionStartEvent:atlData:") & 1) == 0)
  {
    if (!self->_currentSecureElementSession)
    {
LABEL_32:
      sub_100114408(self, v9, v20);
      goto LABEL_33;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v26 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v31 = 45;
      if (isMetaClass)
        v31 = 43;
      v26(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v31, ClassName, Name, 7177, self->_currentSecureElementSession);
    }
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger(v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
LABEL_31:

      goto LABEL_32;
    }
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    v37 = object_getClassName(self);
    v38 = sel_getName(a2);
    currentSecureElementSession = self->_currentSecureElementSession;
    *(_DWORD *)buf = 67110146;
    v89 = v36;
    v90 = 2082;
    v91 = v37;
    v92 = 2082;
    v93 = v38;
    v94 = 1024;
    v95 = 7177;
    v96 = 2114;
    v97[0] = currentSecureElementSession;
    v40 = "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@";
    v41 = v34;
    v42 = OS_LOG_TYPE_ERROR;
    v43 = 44;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v41, v42, v40, buf, v43);
    goto LABEL_31;
  }
  v21 = self->_expressModeManager;
  if (!v21
    || !v21->_expressModeInProgress
    || (inSessionExpressSessionID = self->_inSessionExpressSessionID,
        inSessionExpressSessionID == -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID")))
  {
    -[_NFSession handleTransactionStartEvent:atlData:](self->_currentSecureElementSession, "handleTransactionStartEvent:atlData:", v9, v10);
    if (-[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession)))
    {
      v23 = self->_expressModeManager;
      if (v23)
      {
        if (v23->_expressModeInProgress && !v23->_didPerformExpressTransaction)
        {
          sub_1000EC8E8(self, (uint64_t)"com.apple.stockholm.express.transaction.start", v20);
          if (!v10)
            goto LABEL_36;
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    if (!v10)
      goto LABEL_36;
    goto LABEL_34;
  }
  v50 = self->_inSessionExpressSessionID;
  v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v52 = NFLogGetLogger(v51);
  v53 = (void (*)(uint64_t, const char *, ...))v52;
  if (v50 == -1)
  {
    if (v52)
    {
      v73 = object_getClass(self);
      v74 = class_isMetaClass(v73);
      v75 = object_getClassName(self);
      v76 = sel_getName(a2);
      v77 = 45;
      if (v74)
        v77 = 43;
      v53(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v77, v75, v76, 7168, self->_inSessionExpressSessionID);
    }
    v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v79 = NFSharedLogGetLogger(v78);
    v34 = objc_claimAutoreleasedReturnValue(v79);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v80 = object_getClass(self);
    if (class_isMetaClass(v80))
      v81 = 43;
    else
      v81 = 45;
    v82 = object_getClassName(self);
    v83 = sel_getName(a2);
    v84 = self->_inSessionExpressSessionID;
    *(_DWORD *)buf = 67110146;
    v89 = v81;
    v90 = 2082;
    v91 = v82;
    v92 = 2082;
    v93 = v83;
    v94 = 1024;
    v95 = 7168;
    v96 = 1024;
    LODWORD(v97[0]) = v84;
    v40 = "%c[%{public}s %{public}s]:%i in session but express started before (%d)";
    v41 = v34;
    v42 = OS_LOG_TYPE_DEFAULT;
    v43 = 40;
    goto LABEL_30;
  }
  if (v52)
  {
    v54 = object_getClass(self);
    v55 = class_isMetaClass(v54);
    v87 = object_getClassName(self);
    v56 = sel_getName(a2);
    v85 = self->_inSessionExpressSessionID;
    v86 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    v57 = 45;
    if (v55)
      v57 = 43;
    v53(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - drop", v57, v87, v56, 7172, v85, v86);
  }
  v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v59 = NFSharedLogGetLogger(v58);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = object_getClass(self);
    if (class_isMetaClass(v61))
      v62 = 43;
    else
      v62 = 45;
    v63 = object_getClassName(self);
    v64 = sel_getName(a2);
    v65 = self->_inSessionExpressSessionID;
    v66 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    *(_DWORD *)buf = 67110402;
    v89 = v62;
    v90 = 2082;
    v91 = v63;
    v92 = 2082;
    v93 = v64;
    v94 = 1024;
    v95 = 7172;
    v96 = 1024;
    LODWORD(v97[0]) = v65;
    WORD2(v97[0]) = 1024;
    *(_DWORD *)((char *)v97 + 6) = v66;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - drop", buf, 0x2Eu);
  }

  if (v10)
  {
LABEL_34:
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("RequiresPowerCycle")));
    v45 = objc_msgSend(v44, "BOOLValue");

    if (v45)
      self->_powerCycleAfterThisSession = 1;
  }
LABEL_36:
  if (v11)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
    v47 = objc_msgSend(v46, "embeddedMode");

    if (v47 != (id)1)
    {
      v48 = self->_expressModeManager;
      if (v48)
      {
        if (v48->_expressModeInProgress)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appletIdentifier"));
          LOBYTE(v48) = sub_100043748((uint64_t)v48, v49);

        }
        else
        {
          LOBYTE(v48) = 0;
        }
      }
      v67 = sub_1001FBCC0((uint64_t)self->_driverWrapper);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v69 = v68;
      if (v68 && objc_msgSend(v68, "notificationType") == (id)3)
      {
        v70 = objc_msgSend(v11, "mutableCopy");
        v71 = v69;
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v71, "terminalSubType") | (objc_msgSend(v71, "terminalType") << 8)));
        objc_msgSend(v70, "setObject:forKeyedSubscript:", v72, CFSTR("terminalType"));

        if (v10)
          sub_100227028((uint64_t)NFHciTransactionEventCALogger, v70, v10, (char)v48, 1);

      }
      else if (v10)
      {
        sub_100227028((uint64_t)NFHciTransactionEventCALogger, v11, v10, (char)v48, 1);
      }

    }
  }

}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NFExpressModeManager *expressModeManager;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  const char *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  unsigned int v39;
  id v40;
  void *v41;
  NSNumber *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  NFExpressModeManager *v49;
  int v50;
  id v51;
  NFExpressModeManager *v52;
  uint64_t v53;
  void *specific;
  uint64_t Logger;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  _NFSession *currentSecureElementSession;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  objc_class *v81;
  int v82;
  const char *v83;
  const char *v84;
  int inSessionExpressSessionID;
  const char *v86;
  NSObject *v87;
  uint32_t v88;
  int v89;
  void *v90;
  uint64_t v91;
  void (*v92)(uint64_t, const char *, ...);
  objc_class *v93;
  _BOOL4 v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  objc_class *v100;
  int v101;
  const char *v102;
  const char *v103;
  int v104;
  unsigned int v105;
  objc_class *v106;
  _BOOL4 v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  objc_class *v114;
  int v115;
  const char *v116;
  const char *v117;
  int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  NSObject *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  NFExpressModeManager *v131;
  void *v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  id v137;
  id v139;
  void *v140;
  void *v141;
  uint8_t buf[4];
  int v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  int v149;
  __int16 v150;
  _BYTE v151[10];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  v137 = objc_msgSend(v11, "embeddedMode");

  expressModeManager = self->_expressModeManager;
  if (expressModeManager
    && expressModeManager->_expressModeInProgress
    && !expressModeManager->_didPerformExpressTransaction)
  {
    v13 = kdebug_trace(724566180, 0, 0, 0, 0);
    v14 = NFSharedSignpostLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TX_END", ", buf, 2u);
    }

  }
  v141 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
  if (v16 && (v17 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v16, v17) & 1) != 0))
  {
    v18 = -[_NFControllerManager isUnifiedAccess:](self->_controllerManager, "isUnifiedAccess:", v16);
    v19 = v18;
    v140 = 0;
    if (v9 && v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));
        v22 = objc_msgSend(v8, "didError");
        v23 = CFSTR("noError");
        if (v22)
          v23 = CFSTR("withError");
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v21, v23));

      }
      else
      {
        v140 = 0;
      }
      v19 = 1;
    }
  }
  else
  {
    v19 = 0;
    v140 = 0;
  }
  if (objc_msgSend(v8, "didError"))
  {
    if (objc_msgSend(v8, "result") == 61444)
    {
      v24 = "com.apple.stockholm.express.transaction.end.incompatible";
    }
    else if (objc_msgSend(v8, "result") == 61446)
    {
      v24 = "com.apple.stockholm.express.transaction.end.keypairingmode";
    }
    else
    {
      v25 = objc_msgSend(v8, "result");
      v24 = "com.apple.stockholm.express.transaction.end.failed";
      if (v25 == 61445)
        v24 = "com.apple.stockholm.express.transaction.notfound";
    }
  }
  else
  {
    v24 = "com.apple.stockholm.express.transaction.end";
  }
  v136 = (char *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyIdentifier"));

  if (v26)
  {
    v27 = objc_alloc((Class)NSString);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appletIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyIdentifier"));
    v139 = objc_msgSend(v27, "initWithFormat:", CFSTR("%@:%@"), v28, v29);

  }
  else
  {
    v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appletIdentifier"));
  }
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parsedInfo"));
  if (v30)
  {
    v31 = (void *)v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parsedInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode")));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parsedInfo"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode")));
      objc_msgSend(0, "setObject:forKeyedSubscript:", v35, CFSTR("PairingModeBrandCode"));

    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));
  v37 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026A476, 9);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "NF_asHexString"));
  v39 = objc_msgSend(v16, "hasPrefix:", v38);

  if (v39)
  {
    v40 = sub_100041150(&self->_expressModeManager->super.isa, v16);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_1000A83FC((uint64_t)NFUnifiedAccessTransactionCALogger, v41));
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v43, CFSTR("keyType"));

    if (objc_msgSend(v8, "didError"))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("command")));
      v45 = objc_msgSend(v44, "unsignedIntValue");

      if (v45 == 22)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("informative")));

        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("command")));
          objc_msgSend(0, "setObject:forKeyedSubscript:", v47, CFSTR("command"));

          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("informative")));
          objc_msgSend(0, "setObject:forKeyedSubscript:", v48, CFSTR("informative"));

        }
      }
    }

  }
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleTransactionEndEvent:atlData:") & 1) == 0)
  {
    if (self->_currentSecureElementSession)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v56 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v61 = 45;
        if (isMetaClass)
          v61 = 43;
        v56(6, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v61, ClassName, Name, 7406, self->_currentSecureElementSession);
      }
      v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFSharedLogGetLogger(v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = object_getClass(self);
        if (class_isMetaClass(v65))
          v66 = 43;
        else
          v66 = 45;
        v67 = object_getClassName(self);
        v68 = sel_getName(a2);
        currentSecureElementSession = self->_currentSecureElementSession;
        *(_DWORD *)buf = 67110146;
        v143 = v66;
        v144 = 2082;
        v145 = v67;
        v146 = 2082;
        v147 = v68;
        v148 = 1024;
        v149 = 7406;
        v150 = 2114;
        *(_QWORD *)v151 = currentSecureElementSession;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
      }

    }
    if (self->_inSessionExpressSessionID != -1)
    {
      v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFLogGetLogger(v70);
      if (v71)
      {
        v72 = (void (*)(uint64_t, const char *, ...))v71;
        v73 = object_getClass(self);
        v74 = class_isMetaClass(v73);
        v75 = object_getClassName(self);
        v76 = sel_getName(a2);
        v77 = 45;
        if (v74)
          v77 = 43;
        v72(6, "%c[%{public}s %{public}s]:%i in-session express (ID:%d) but session got closed", v77, v75, v76, 7411, self->_inSessionExpressSessionID);
      }
      v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v79 = NFSharedLogGetLogger(v78);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        goto LABEL_78;
      v81 = object_getClass(self);
      if (class_isMetaClass(v81))
        v82 = 43;
      else
        v82 = 45;
      v83 = object_getClassName(self);
      v84 = sel_getName(a2);
      inSessionExpressSessionID = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      v143 = v82;
      v144 = 2082;
      v145 = v83;
      v146 = 2082;
      v147 = v84;
      v148 = 1024;
      v149 = 7411;
      v150 = 1024;
      *(_DWORD *)v151 = inSessionExpressSessionID;
      v86 = "%c[%{public}s %{public}s]:%i in-session express (ID:%d) but session got closed";
      v87 = v80;
      v88 = 40;
      goto LABEL_77;
    }
LABEL_91:
    sub_100114EF4(self, v8, v36, v139, v136, v19, v140);
    goto LABEL_102;
  }
  v49 = self->_expressModeManager;
  if (!v49
    || !v49->_expressModeInProgress
    || (v50 = self->_inSessionExpressSessionID,
        v50 == -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID")))
  {
    v51 = -[_NFSession isMemberOfClass:](self->_currentSecureElementSession, "isMemberOfClass:", objc_opt_class(_NFUnifiedAccessSession));
    if ((_DWORD)v51)
    {
      v52 = self->_expressModeManager;
      if (!v52 || !v52->_expressModeInProgress || v52->_didPerformExpressTransaction)
      {
        v53 = 2;
        if (!v19)
          goto LABEL_101;
LABEL_93:
        if (v36)
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("EventType")));
          v120 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v119, v120) & 1) != 0
            && objc_msgSend(v119, "isEqualToString:", CFSTR("EndEvent")))
          {
            v121 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureXPCEventPublisherManager sharedManager](NFSecureXPCEventPublisherManager, "sharedManager"));
            v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "homed"));
            -[_NFHardwareManager postEventForPublisher:event:objectString:](self, "postEventForPublisher:event:objectString:", v122, "com.apple.stockholm.forHome.transaction.end", v140);

            sub_1000A6FB8((uint64_t)NFUnifiedAccessTransactionCALogger, v36, v53, 0);
          }

        }
        v123 = NFSharedSignpostLog(v51);
        v124 = objc_claimAutoreleasedReturnValue(v123);
        if (os_signpost_enabled(v124))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v124, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlEndEventComplete", buf, 2u);
        }

        goto LABEL_101;
      }
      sub_1000EC568(self, v136, v139);
      v53 = 3;
      if (v19)
        goto LABEL_93;
    }
LABEL_101:
    -[_NFSession handleTransactionEndEvent:atlData:](self->_currentSecureElementSession, "handleTransactionEndEvent:atlData:", v8, v9);
    goto LABEL_102;
  }
  v89 = self->_inSessionExpressSessionID;
  v90 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v91 = NFLogGetLogger(v90);
  v92 = (void (*)(uint64_t, const char *, ...))v91;
  if (v89 == -1)
  {
    if (v91)
    {
      v106 = object_getClass(self);
      v107 = class_isMetaClass(v106);
      v108 = object_getClassName(self);
      v109 = sel_getName(a2);
      v110 = 45;
      if (v107)
        v110 = 43;
      v92(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v110, v108, v109, 7387, self->_inSessionExpressSessionID);
    }
    v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v112 = NFSharedLogGetLogger(v111);
    v113 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      v114 = object_getClass(self);
      if (class_isMetaClass(v114))
        v115 = 43;
      else
        v115 = 45;
      v116 = object_getClassName(self);
      v117 = sel_getName(a2);
      v118 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      v143 = v115;
      v144 = 2082;
      v145 = v116;
      v146 = 2082;
      v147 = v117;
      v148 = 1024;
      v149 = 7387;
      v150 = 1024;
      *(_DWORD *)v151 = v118;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    goto LABEL_91;
  }
  if (v91)
  {
    v93 = object_getClass(self);
    v94 = class_isMetaClass(v93);
    v95 = object_getClassName(self);
    v96 = sel_getName(a2);
    v134 = self->_inSessionExpressSessionID;
    v135 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
    v97 = 45;
    if (v94)
      v97 = 43;
    v92(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v97, v95, v96, 7401, v134, v135);
  }
  v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v99 = NFSharedLogGetLogger(v98);
  v80 = objc_claimAutoreleasedReturnValue(v99);
  if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    goto LABEL_78;
  v100 = object_getClass(self);
  if (class_isMetaClass(v100))
    v101 = 43;
  else
    v101 = 45;
  v102 = object_getClassName(self);
  v103 = sel_getName(a2);
  v104 = self->_inSessionExpressSessionID;
  v105 = -[_NFSession sessionID](self->_currentSecureElementSession, "sessionID");
  *(_DWORD *)buf = 67110402;
  v143 = v101;
  v144 = 2082;
  v145 = v102;
  v146 = 2082;
  v147 = v103;
  v148 = 1024;
  v149 = 7401;
  v150 = 1024;
  *(_DWORD *)v151 = v104;
  *(_WORD *)&v151[4] = 1024;
  *(_DWORD *)&v151[6] = v105;
  v86 = "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)";
  v87 = v80;
  v88 = 46;
LABEL_77:
  _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, v86, buf, v88);
LABEL_78:

LABEL_102:
  v125 = v141;
  if (v141 && v137 != (id)1)
  {
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));
    v127 = sub_100043468((uint64_t)self->_expressModeManager, v16, v126);
    v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
    v129 = objc_msgSend(v141, "mutableCopy");
    v130 = v129;
    if (v128)
      objc_msgSend(v129, "addEntriesFromDictionary:", v128);
    v131 = self->_expressModeManager;
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appletIdentifier"));
    v133 = sub_100043748((uint64_t)v131, v132);
    sub_100227028((uint64_t)NFHciTransactionEventCALogger, v130, v9, v133, 0);

    v125 = v141;
  }

}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v7;
  id v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  _NFSession *currentSecureElementSession;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _NFSession *v34;

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleFelicaStateEvent:appletAID:") & 1) != 0)
  {
    -[_NFSession handleFelicaStateEvent:appletAID:](self->_currentSecureElementSession, "handleFelicaStateEvent:appletAID:", v7, v8);
  }
  else
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
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v11(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v16, ClassName, Name, 7445, self->_currentSecureElementSession);
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
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      v26 = v21;
      v27 = 2082;
      v28 = v22;
      v29 = 2082;
      v30 = v23;
      v31 = 1024;
      v32 = 7445;
      v33 = 2114;
      v34 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }

  }
}

- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4
{
  id v7;
  id v8;
  NFExpressModeManager *expressModeManager;
  uint64_t v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  _NFSession *currentSecureElementSession;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _NFSession *v36;

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector(self->_currentSecureElementSession, "handleStepUpEvent:transactionType:forApplet:") & 1) != 0)
  {
    expressModeManager = self->_expressModeManager;
    v10 = 5;
    if (expressModeManager)
    {
      if (expressModeManager->_expressModeInProgress)
        v10 = 6;
      else
        v10 = 5;
    }
    -[_NFSession handleStepUpEvent:transactionType:forApplet:](self->_currentSecureElementSession, "handleStepUpEvent:transactionType:forApplet:", v7, v10, v8);
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
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v13(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v18, ClassName, Name, 7457, self->_currentSecureElementSession);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      v28 = v23;
      v29 = 2082;
      v30 = v24;
      v31 = 2082;
      v32 = v25;
      v33 = 1024;
      v34 = 7457;
      v35 = 2114;
      v36 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }

  }
}

- (void)handleHostCardReaderDetected:(id)a3
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
  NSObject *workQueue;
  id v19;
  const char *Name;
  _QWORD block[5];
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 7477);
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
    v24 = v17;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 7477;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001165C4;
  block[3] = &unk_1002E5CA8;
  block[4] = self;
  v22 = v5;
  v19 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleRemoteTagsDetected:(id)a3 dropAndRestartDiscovery:(BOOL)a4
{
  id v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001166C8;
  v10[3] = &unk_1002E8690;
  v13 = a4;
  v11 = v7;
  v12 = a2;
  v10[4] = self;
  v9 = v7;
  dispatch_async(workQueue, v10);

}

- (void)handleReaderBurnoutTimer
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
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
  const char *v19;
  const char *v20;
  _NFSession *currentSecureElementSession;
  void *v22;
  id v23;
  const char *Name;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_BURNOUT", ", buf, 2u);
  }

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
    v9(6, "%c[%{public}s %{public}s]:%i Reader mode must stop", v13, ClassName, Name, 7509);
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
    *(_DWORD *)buf = 67109890;
    v26 = v18;
    v27 = 2082;
    v28 = v19;
    v29 = 2082;
    v30 = v20;
    v31 = 1024;
    v32 = 7509;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader mode must stop", buf, 0x22u);
  }

  currentSecureElementSession = self->_currentSecureElementSession;
  if (currentSecureElementSession)
  {
    if ((objc_opt_respondsToSelector(currentSecureElementSession, "handleReaderBurnoutTimer") & 1) != 0)
      -[_NFSession handleReaderBurnoutTimer](self->_currentSecureElementSession, "handleReaderBurnoutTimer");
  }
  else
  {
    -[NFBackgroundTagReadingManager stop](self->_backgroundTagReadingManager, "stop");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager defaultRoutingConfig:](self, "defaultRoutingConfig:", 3));
    v23 = -[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v22);

  }
}

- (void)handleReaderBurnoutCleared
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
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
  const char *v19;
  const char *v20;
  _NFSession *currentSecureElementSession;
  void *v22;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_BURNOUT_CLEARED", ", buf, 2u);
  }

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
    v9(6, "%c[%{public}s %{public}s]:%i Reader mode can resume", v13, ClassName, Name, 7528);
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
    *(_DWORD *)buf = 67109890;
    v25 = v18;
    v26 = 2082;
    v27 = v19;
    v28 = 2082;
    v29 = v20;
    v30 = 1024;
    v31 = 7528;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader mode can resume", buf, 0x22u);
  }

  currentSecureElementSession = self->_currentSecureElementSession;
  if (currentSecureElementSession)
  {
    if ((objc_opt_respondsToSelector(currentSecureElementSession, "handleReaderBurnoutCleared") & 1) != 0)
      -[_NFSession handleReaderBurnoutCleared](self->_currentSecureElementSession, "handleReaderBurnoutCleared");
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.nfcd.burnout.cleared"), 0, 0, 3);

    -[_NFHardwareManager maybeStartNextSession](self, "maybeStartNextSession");
  }
}

- (void)handleSecureElementRemoved:(int)a3 withReason:(unsigned int)a4
{
  NSObject *workQueue;
  _QWORD block[6];
  int v6;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116EB4;
  block[3] = &unk_1002E8668;
  block[4] = self;
  block[5] = a2;
  v6 = a3;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementOSReset:(int64_t)a3 withReason:(unsigned int)a4
{
  uint64_t v4;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NSObject *workQueue;
  const char *Name;
  _QWORD block[7];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int v34;

  v4 = *(_QWORD *)&a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
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
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Unexpected OS reset notification : %ld, reason %d.", v14, ClassName, Name, 7605, a3, v4);
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
      *(_DWORD *)buf = 67110402;
      v24 = v19;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 7605;
      v31 = 2048;
      v32 = a3;
      v33 = 1024;
      v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected OS reset notification : %ld, reason %d.", buf, 0x32u);
    }

  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117404;
  block[3] = &unk_1002E7DD8;
  block[4] = self;
  block[5] = a2;
  block[6] = a3;
  dispatch_async(workQueue, block);
  +[NFExceptionsCALogger postAnalyticsOsResetEvent:osID:hardwareType:](NFExceptionsCALogger, "postAnalyticsOsResetEvent:osID:hardwareType:", v4, a3, sub_1000DFCAC((uint64_t)self));
}

- (void)stopFury
{
  _NFHardwareManager *v3;
  id WeakRetained;
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
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v3 = self;
  objc_sync_enter(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v3->_ffDelegate);
  objc_sync_exit(v3);

  if (!WeakRetained)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i delegate not set?!", v11, ClassName, Name, 7676);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(v3);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(v3);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 7676;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set?!", buf, 0x22u);
    }

  }
  objc_msgSend(WeakRetained, "stopFury");

}

- (void)handleFailForwardCompleted
{
  _NFHardwareManager *v3;
  id WeakRetained;
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
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v3 = self;
  objc_sync_enter(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v3->_ffDelegate);
  objc_sync_exit(v3);

  if (!WeakRetained)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i delegate not set?!", v11, ClassName, Name, 7690);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(v3);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(v3);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 7690;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set?!", buf, 0x22u);
    }

  }
  objc_msgSend(WeakRetained, "handleFailForwardCompleted");

}

- (void)handleHceTargetLost
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117DF8;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)secureElementReturnedRestrictedMode:(id)a3 os:(int64_t)a4
{
  NSObject *workQueue;
  _QWORD v5[6];

  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100117EBC;
  v5[3] = &unk_1002E5C30;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(workQueue, v5);
}

- (void)updateSeInfo:(id)a3
{
  void *v5;
  void *v6;
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

  sub_10003DA78(self->_expressModeManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v5));

  if (v6)
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
      v9(3, "%c[%{public}s %{public}s]:%i Failed to set routing mode", v13, ClassName, Name, 7723);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
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
      v27 = 7723;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set routing mode", buf, 0x22u);
    }

  }
  else
  {
    -[_NFHardwareManager refreshSecureElementInfo](self, "refreshSecureElementInfo");
  }

}

- (void)markApplicationForDelete:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = sub_100030030((uint64_t)NFTrustDataBase);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  sub_10002DA48((uint64_t)v5, v3);

}

- (void)powerObserverSystemWillSleep:(id)a3
{
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
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSMutableArray *v20;
  NSObject *workQueue;
  const char *Name;
  _QWORD block[6];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 7738);
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
    *(_DWORD *)buf = 67109890;
    v25 = v16;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 7738;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = NFSharedSignpostLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "powerObserverSystemWillSleep:", ", buf, 2u);
  }

  v20 = self->_secureElementSessionQueue;
  objc_sync_enter(v20);
  self->_systemWillSleep = 1;
  objc_sync_exit(v20);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011831C;
  block[3] = &unk_1002E5C30;
  block[4] = self;
  block[5] = a2;
  dispatch_async_and_wait(workQueue, block);
}

- (void)powerObserverSystemHasPoweredOn:(id)a3
{
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
  NSObject *workQueue;
  const char *Name;
  _QWORD block[6];
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
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 7822);
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
    *(_DWORD *)buf = 67109890;
    v21 = v16;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 7822;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001191F0;
  block[3] = &unk_1002E5C30;
  block[4] = self;
  block[5] = a2;
  dispatch_async(workQueue, block);
}

- (void)clientAppIsSuspended:(id)a3
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *workQueue;
  id v31;
  _QWORD block[4];
  id v33;
  _NFHardwareManager *v34;
  SEL v35;
  uint8_t buf[4];
  _BYTE v37[14];
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 7878, v14);

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
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v37 = v20;
    *(_WORD *)&v37[4] = 2082;
    *(_QWORD *)&v37[6] = v21;
    v38 = 2082;
    v39 = v22;
    v40 = 1024;
    v41 = 7878;
    v42 = 2114;
    v43 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v25 = kdebug_trace(724566124, (int)objc_msgSend(v5, "processIdentifier"), 0, 0, 0);
  v26 = NFSharedSignpostLog(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v37 = v29;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_APP_SUSPENDED", "client app %@ suspended", buf, 0xCu);

  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011984C;
  block[3] = &unk_1002E5C80;
  v33 = v5;
  v34 = self;
  v35 = a2;
  v31 = v5;
  dispatch_async(workQueue, block);

}

- (void)preferencesDidChange
{
  NSObject *workQueue;
  _QWORD v3[6];

  workQueue = self->_workQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011A01C;
  v3[3] = &unk_1002E5C30;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(workQueue, v3);
}

- (id)setHostEmulationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  NFDriverWrapper *driverWrapper;
  _BOOL4 fieldPresent;
  void *specific;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  const char *ClassName;
  const char *Name;
  NSErrorUserInfoKey v36;
  void *v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BOOL4 v47;

  v3 = a3;
  if (a3)
  {
    v6 = 2;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager defaultRoutingConfig:](self, "defaultRoutingConfig:", 3));
    v6 = (uint64_t)objc_msgSend(v7, "hostMode");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  v9 = objc_msgSend(v8, "hostMode");

  if ((id)v6 == v9)
    return 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  if (objc_msgSend(v11, "embeddedMode") != (id)2 || (driverWrapper = self->_driverWrapper) == 0)
  {

    goto LABEL_20;
  }
  -[NSLock lock](driverWrapper->_fieldPresentLock, "lock");
  fieldPresent = driverWrapper->_fieldPresent;
  -[NSLock unlock](driverWrapper->_fieldPresentLock, "unlock");

  if (!fieldPresent)
  {
LABEL_20:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "cloneWithHCE:", v3));

    v32 = sub_10011A4FC((uint64_t)self, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    return v33;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v16 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v19 = 45;
    if (isMetaClass)
      v19 = 43;
    v16(3, "%c[%{public}s %{public}s]:%i Host Card Emulation can not be modified while SE emulation is active and field is present: requested change= %d", v19, ClassName, Name, 8236, v3);
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
    *(_DWORD *)buf = 67110146;
    v39 = v24;
    v40 = 2082;
    v41 = object_getClassName(self);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 8236;
    v46 = 1024;
    v47 = v3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Host Card Emulation can not be modified while SE emulation is active and field is present: requested change= %d", buf, 0x28u);
  }

  v25 = objc_alloc((Class)NSError);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v36 = NSLocalizedDescriptionKey;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
  v37 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
  v29 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 12, v28);

  return v29;
}

- (void)reconfigureDynamicTransitRF:(unint64_t)a3 withOverride:(BOOL)a4
{
  _BOOL4 v4;
  int v8;
  NFExpressModeManager *expressModeManager;
  unint64_t dynamicTransitConfiguration;
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  unint64_t v21;
  const char *ClassName;
  const char *Name;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  id v38;
  NFExpressModeManager *v39;
  uint64_t v40;
  const char *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;

  v4 = a4;
  v8 = sub_100048B04((id *)&self->_expressModeManager->super.isa);
  expressModeManager = self->_expressModeManager;
  if (expressModeManager)
    dynamicTransitConfiguration = expressModeManager->_dynamicTransitConfiguration;
  else
    dynamicTransitConfiguration = 0;
  if (-[NFHardwareControllerInfo hasAntenna](self->_controllerInfo, "hasAntenna")
    && ((id)-[NFHardwareControllerInfo siliconName](self->_controllerInfo, "siliconName") == (id)8
     || -[NFHardwareControllerInfo siliconName](self->_controllerInfo, "siliconName") >= 0xA))
  {
    if (v4)
    {
      v11 = dynamicTransitConfiguration != a3;
      v12 = a3 == 2;
    }
    else
    {
      v13 = dynamicTransitConfiguration != 2;
      if (!v8)
        v13 = dynamicTransitConfiguration != 1;
      v14 = dynamicTransitConfiguration == 2;
      if (dynamicTransitConfiguration == 2)
        v15 = 0;
      else
        v15 = v8;
      if (v8)
        v14 = dynamicTransitConfiguration != 2;
      v11 = v13 && v14;
      v12 = v13 ? v15 : 0;
    }
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      v21 = a3;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      if (v4)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      if (v11)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      if (v12)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v41 = ClassName;
      v27 = 43;
      if (!isMetaClass)
        v27 = 45;
      a3 = v21;
      v18(6, "%c[%{public}s %{public}s]:%i RF override : %{public}@, update : %{public}@, alternate FDT : %{public}@", v27, v41, Name, 8332, v24, v25, v26);
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
      *(_DWORD *)buf = 67110658;
      v35 = CFSTR("YES");
      if (v4)
        v36 = CFSTR("YES");
      else
        v36 = CFSTR("NO");
      v43 = v32;
      if (v11)
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      v44 = 2082;
      if (!v12)
        v35 = CFSTR("NO");
      v45 = v33;
      v46 = 2082;
      v47 = v34;
      v48 = 1024;
      v49 = 8332;
      v50 = 2114;
      v51 = v36;
      v52 = 2114;
      v53 = v37;
      v54 = 2114;
      v55 = v35;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i RF override : %{public}@, update : %{public}@, alternate FDT : %{public}@", buf, 0x40u);
    }

    if (v11)
    {
      if (-[NFHardwareControllerInfo hasAntenna](self->_controllerInfo, "hasAntenna")
        && -[NFHardwareControllerInfo siliconName](self->_controllerInfo, "siliconName") >= 8)
      {
        if (!v4)
          return;
        v38 = sub_1001CB9D0(self->_driverWrapper, a3 == 2);
      }
      v39 = self->_expressModeManager;
      if (v39)
      {
        v40 = 1;
        if (v12)
          v40 = 2;
        v39->_dynamicTransitConfiguration = v40;
      }
    }
  }
}

- (BOOL)configureECPPolling:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  _NFHardwareManager *v9;
  id v10;
  SEL v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011ABCC;
  v8[3] = &unk_1002E86B8;
  v9 = self;
  v10 = a3;
  v11 = a2;
  v4 = v10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
  v6 = sub_1000E3CEC((void **)&v9->super.isa, v8, CFSTR("Config ECP Polling"), v5);

  return v6;
}

- (id)setRoutingConfig:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  NFDriverWrapper *driverWrapper;
  NFExpressModeManager *expressModeManager;
  uint64_t modeConfig;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  _BOOL8 v33;
  NFExpressModeManager *v34;
  BOOL v35;
  _BOOL4 v36;
  char v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  const char *v49;
  const char *Name;
  NSErrorUserInfoKey v52;
  void *v53;
  uint8_t buf[4];
  _BYTE v55[14];
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;

  v5 = a3;
  v6 = objc_msgSend(v5, "fieldDetectType");
  v7 = NFSharedSignpostLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v55 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetRoutingConfig", "begin; config = %@",
      buf,
      0xCu);
  }

  if (!objc_msgSend(v5, "wantsExpress"))
    goto LABEL_35;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager lastKnownRoutingConfig](self, "lastKnownRoutingConfig"));
  v10 = objc_msgSend(v5, "isEquivalentRouting:", v9);

  if ((v10 & 1) == 0)
  {
    -[_NFHardwareManager reconfigureDynamicTransitRF:withOverride:](self, "reconfigureDynamicTransitRF:withOverride:", 1, 0);
    driverWrapper = self->_driverWrapper;
    expressModeManager = self->_expressModeManager;
    if (!expressModeManager)
    {
      modeConfig = 0;
      if (!driverWrapper)
        goto LABEL_14;
      goto LABEL_13;
    }
    if (expressModeManager->_factoryTestMode)
    {
      if (expressModeManager->_testModeECP2)
        modeConfig = 16;
      else
        modeConfig = 4;
      if (!driverWrapper)
        goto LABEL_14;
      goto LABEL_13;
    }
    modeConfig = expressModeManager->_modeConfig;
    if (driverWrapper)
LABEL_13:
      sub_1001FEC70(driverWrapper, modeConfig, 0);
  }
LABEL_14:
  v14 = objc_msgSend(v5, "embeddedMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementWrapper handle](self->_secureElementWrapper, "handle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
  v17 = objc_msgSend(v16, "restrictedMode");

  if (v17)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v20(4, "%c[%{public}s %{public}s]:%i Bypassing express mode due to SE in restricted mode", v24, ClassName, Name, 8409);
    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v55 = v29;
      *(_WORD *)&v55[4] = 2082;
      *(_QWORD *)&v55[6] = v30;
      v56 = 2082;
      v57 = v31;
      v58 = 1024;
      v59 = 8409;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Bypassing express mode due to SE in restricted mode", buf, 0x22u);
    }

    v32 = sub_100042050((uint64_t)self->_expressModeManager);
LABEL_25:
    v33 = 0;
LABEL_34:
    v38 = objc_msgSend(v5, "wantsLPCD");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lpcdEcpFrame"));
    v40 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig wantsLPCD:expressForEmbedded:hostCardEmulation:fieldDetect:lpcdEcpFrame:](NFRoutingConfig, "wantsLPCD:expressForEmbedded:hostCardEmulation:fieldDetect:lpcdEcpFrame:", v38, v33, v32, v6, v39));

    v5 = (id)v40;
    goto LABEL_35;
  }
  v34 = self->_expressModeManager;
  v35 = v14 == (id)2;
  v33 = v14 == (id)2;
  if (v35)
  {
    v36 = sub_100044370((_BOOL8)v34);
    if ((sub_100042050((uint64_t)self->_expressModeManager) & 1) == 0)
    {
      if (v36)
        goto LABEL_35;
      v32 = 0;
      goto LABEL_25;
    }
    if (!v36)
    {
      v33 = 0;
LABEL_33:
      v32 = 1;
      goto LABEL_34;
    }
  }
  else
  {
    v37 = sub_100042050((uint64_t)v34);
    if ((v37 & 1) == 0)
      goto LABEL_35;
  }
  if (objc_msgSend(v5, "hostMode") != (id)2)
    goto LABEL_33;
LABEL_35:
  if (objc_msgSend(v5, "cardEmulationType") || !objc_msgSend(v5, "contactlessOnAny"))
  {
    v47 = sub_10011A4FC((uint64_t)self, v5);
    v46 = (id)objc_claimAutoreleasedReturnValue(v47);
    v48 = NFSharedSignpostLog(v46);
    v43 = objc_claimAutoreleasedReturnValue(v48);
    if (os_signpost_enabled(v43))
    {
      v49 = "Failed";
      if (!v46)
        v49 = "Success";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v55 = v49;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetRoutingConfig", "%s", buf, 0xCu);
    }
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NFHardwareManager.m"), 8450, CFSTR("Unexpected config: %@"), v5);

    v42 = objc_alloc((Class)NSError);
    v43 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v52 = NSLocalizedDescriptionKey;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
    v53 = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
    v46 = objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 13, v45);

  }
  return v46;
}

- (BOOL)restartDiscovery
{
  return sub_1001FBF60(self->_driverWrapper);
}

- (id)defaultRoutingConfig:(unint64_t)a3
{
  return sub_1000EA6F4((uint64_t)self, a3, 0);
}

- (void)notifyReaderModeActivityEnd
{
  if (self->_readerUserNotified)
  {
    sub_100007548(self, "com.apple.stockholm.reader.cardLost");
    self->_readerUserNotified = 0;
  }
}

- (void)notifyReaderModeActivityStart
{
  if (!self->_readerUserNotified)
  {
    sub_100007548(self, "com.apple.stockholm.reader.cardDetected");
    self->_readerUserNotified = 1;
  }
}

- (BOOL)configureExpressFelicaEntry:(int)a3
{
  _NFHardwareManager *v3;
  void *v4;
  _QWORD v6[6];
  int v7;

  v3 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011B38C;
  v6[3] = &unk_1002E86E0;
  v7 = a3;
  v6[4] = self;
  v6[5] = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
  LOBYTE(v3) = sub_1000E3CEC((void **)&v3->super.isa, v6, CFSTR("Configure ExpressFelica entry"), v4);

  return (char)v3;
}

- (NFRoutingConfig)lastKnownRoutingConfig
{
  NFDriverWrapper *driverWrapper;
  id v3;
  void *v4;

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper
    || (v3 = sub_1001F8494(driverWrapper), (v4 = (void *)objc_claimAutoreleasedReturnValue(v3)) == 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
  }
  return (NFRoutingConfig *)v4;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 368, 1);
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 376, 1);
}

- (NFHardwareControllerInfo)controllerInfo
{
  return (NFHardwareControllerInfo *)objc_getProperty(self, a2, 384, 1);
}

- (NFXPCEventPublisher)sesdEventPublisher
{
  return self->_sesdEventPublisher;
}

- (OS_dispatch_queue)xpcEventNotificationQueue
{
  return self->_xpcEventNotificationQueue;
}

- (BOOL)userInitiatedShutdown
{
  return self->_userInitiatedShutdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seSerialFromFDR, 0);
  objc_storeStrong((id *)&self->_connectionHandoverAssertionForCamera, 0);
  objc_storeStrong((id *)&self->_backgroundTagReadingManager, 0);
  objc_storeStrong((id *)&self->_xpcEventNotificationQueue, 0);
  objc_storeStrong((id *)&self->_sesdEventPublisher, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_keepAliveForFieldDetect, 0);
  objc_storeStrong((id *)&self->_fieldDetectTransaction, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastOSReset, 0);
  objc_storeStrong((id *)&self->_lpcdCountersLoggingURL, 0);
  objc_storeStrong((id *)&self->_ftaLPEMLogging, 0);
  objc_storeStrong((id *)&self->_hostEmulationLog, 0);
  objc_storeStrong((id *)&self->_suspendedSessionQueue, 0);
  objc_storeStrong((id *)&self->_secureElementSessionQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_corenfcHWCallbackHandler, 0);
  objc_storeStrong((id *)&self->_callbackHandlers, 0);
  objc_destroyWeak((id *)&self->_ffDelegate);
  objc_storeStrong((id *)&self->_delayCheckSEDPDTimer, 0);
  objc_storeStrong((id *)&self->_powerCountersTimer, 0);
  objc_storeStrong((id *)&self->_stockholmDispatchOnceTimer, 0);
  objc_storeStrong((id *)&self->_currentSecureElementSession, 0);
  objc_storeStrong((id *)&self->_hkEventPublisher, 0);
  objc_storeStrong((id *)&self->_schedulingDailyUpdating, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_storeStrong((id *)&self->_managedConfigMonitor, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_prefObserver, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_lastKnownRoutingConfig, 0);
  objc_storeStrong((id *)&self->_secureElementInfo, 0);
  objc_storeStrong((id *)&self->_expressModeManager, 0);
  objc_storeStrong((id *)&self->_fieldDetectManager, 0);
  objc_storeStrong((id *)&self->_controllerManager, 0);
}

- (void)didCameraStateChange:(BOOL)a3
{
  _BOOL4 v3;
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
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *Name;
  const char *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v3 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  v8 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v3)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Request assertion", v12, ClassName, Name, 327);
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
      v30 = v17;
      v31 = 2082;
      v32 = object_getClassName(self);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 327;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Request assertion", buf, 0x22u);
    }

    sub_10016FD64((uint64_t)self, CFSTR("NFCameraStateMonitor"));
  }
  else
  {
    if (Logger)
    {
      v18 = object_getClass(self);
      v19 = class_isMetaClass(v18);
      v20 = object_getClassName(self);
      v28 = sel_getName(a2);
      v21 = 45;
      if (v19)
        v21 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Release assertion", v21, v20, v28, 330);
    }
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      *(_DWORD *)buf = 67109890;
      v30 = v26;
      v31 = 2082;
      v32 = object_getClassName(self);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 330;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Release assertion", buf, 0x22u);
    }

    sub_100170134((uint64_t)self, CFSTR("NFCameraStateMonitor"));
  }
}

- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD *v13;
  SEL v14;
  unint64_t v15;
  _QWORD v16[5];
  id v17;

  v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10018A0BC;
  v16[4] = sub_10018A0CC;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = sub_100111A40((id *)&self->super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A0D4;
  block[3] = &unk_1002EA388;
  block[4] = self;
  v12 = v7;
  v14 = a2;
  v15 = a3;
  v13 = v16;
  v10 = v7;
  dispatch_async(v9, block);

  _Block_object_dispose(v16, 8);
}

- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  sub_10018ADF4((uint64_t)self, a3, 0, a4);
}

- (void)enableHeadlessTestMode:(unsigned __int16)a3 completion:(id)a4
{
  id v6;
  id *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unsigned __int16 v12;

  v6 = a4;
  v7 = sub_100111A40((id *)&self->super.isa);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C454;
  block[3] = &unk_1002E8348;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)configureHeadlessFactoryMode:(BOOL)a3 completion:(id)a4
{
  id v6;
  id *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  BOOL v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10018A0BC;
  v14[4] = sub_10018A0CC;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = sub_100111A40((id *)&self->super.isa);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018CD18;
  v10[3] = &unk_1002EA400;
  v13 = a3;
  v11 = v6;
  v12 = v14;
  v10[4] = self;
  v9 = v6;
  dispatch_async(v8, v10);

  _Block_object_dispose(v14, 8);
}

- (void)headlessFactoryModeWithCompletion:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10018A0BC;
  v11[4] = sub_10018A0CC;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = sub_100111A40((id *)&self->super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018DC74;
  block[3] = &unk_1002EA428;
  v9 = v4;
  v10 = v11;
  block[4] = self;
  v7 = v4;
  dispatch_async(v6, block);

  _Block_object_dispose(v11, 8);
}

- (void)disableHeadlessMiniNVWithCompletion:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10018A0BC;
  v11[4] = sub_10018A0CC;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = sub_100111A40((id *)&self->super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018E8C0;
  block[3] = &unk_1002EA428;
  v9 = v4;
  v10 = v11;
  block[4] = self;
  v7 = v4;
  dispatch_async(v6, block);

  _Block_object_dispose(v11, 8);
}

- (BOOL)isFirstInQueue
{
  _NFSession *v2;
  _NFSession *v4;
  BOOL v5;
  BOOL v6;
  NSMutableArray *secureElementSessionQueue;
  NSMutableArray *v8;

  if (self)
  {
    v4 = self->_currentSecureElementSession;
    v5 = v4 == 0;
    if (v4)
    {
      v2 = self->_currentSecureElementSession;
      if (!-[_NFSession isEnding](v2, "isEnding"))
      {
        v6 = 0;
LABEL_7:

        goto LABEL_8;
      }
    }
    secureElementSessionQueue = self->_secureElementSessionQueue;
  }
  else
  {
    v4 = 0;
    secureElementSessionQueue = 0;
    v5 = 1;
  }
  v8 = secureElementSessionQueue;
  v6 = -[NSMutableArray count](v8, "count") == 0;

  if (!v5)
    goto LABEL_7;
LABEL_8:

  return v6;
}

- (BOOL)_syncResumeSession:(id)a3
{
  return -[_NFHardwareManager _syncResumeSession:field:](self, "_syncResumeSession:field:", a3, 0);
}

- (BOOL)_syncResumeSession:(id)a3 field:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *suspendedSessionQueue;
  NSMutableArray *v10;
  id v11;
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
  unsigned int v23;
  void *v24;
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
  uint64_t v38;
  void *v39;
  BOOL v40;
  NSMutableArray *v42;
  _NFSession *currentSecureElementSession;
  _NFSession *v44;
  void *v45;
  _NFSession *v46;
  void *v47;
  id v48;
  NSMutableArray *secureElementSessionQueue;
  NSMutableArray *v50;
  id v51;
  void *v52;
  id v53;
  const char *ClassName;
  const char *Name;
  const char *v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  id v66;

  v7 = a3;
  v8 = a4;
  if (self)
    suspendedSessionQueue = self->_suspendedSessionQueue;
  else
    suspendedSessionQueue = 0;
  v10 = suspendedSessionQueue;
  v11 = -[NSMutableArray indexOfObject:](v10, "indexOfObject:", v7);

  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
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
      v14(6, "%c[%{public}s %{public}s]:%i %{public}@ is not in suspended state", v17, ClassName, Name, 420, v7);
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
      *(_DWORD *)buf = 67110146;
      v58 = v22;
      v59 = 2082;
      v60 = object_getClassName(self);
      v61 = 2082;
      v62 = sel_getName(a2);
      v63 = 1024;
      v64 = 420;
      v65 = 2114;
      v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ is not in suspended state", buf, 0x2Cu);
    }
LABEL_26:
    v40 = 0;
    goto LABEL_27;
  }
  v23 = objc_msgSend(v7, "isSessionSEOnly");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  v25 = sub_1001F84C8(v24, CFSTR("Session"), v23 ^ 1);
  v20 = objc_claimAutoreleasedReturnValue(v25);

  if (v20)
  {
    v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v27 = NFLogGetLogger(v26);
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v56 = sel_getName(a2);
      v32 = 45;
      if (v30)
        v32 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i Error - failed to restart parent session", v32, v31, v56, 450);
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
      *(_DWORD *)buf = 67109890;
      v58 = v37;
      v59 = 2082;
      v60 = object_getClassName(self);
      v61 = 2082;
      v62 = sel_getName(a2);
      v63 = 1024;
      v64 = 450;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error - failed to restart parent session", buf, 0x22u);
    }

    v38 = objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
    v39 = (void *)v38;
    if (v38)
      NFDriverSimulateCrash(*(_QWORD *)(v38 + 40), 57005, "Error - failed to restart parent session");

    goto LABEL_26;
  }
  if (self)
  {
    v42 = self->_suspendedSessionQueue;
    -[NSMutableArray removeObjectAtIndex:](v42, "removeObjectAtIndex:", v11);

    sub_10011B76C((uint64_t)self, v7);
    currentSecureElementSession = self->_currentSecureElementSession;
  }
  else
  {
    objc_msgSend(0, "removeObjectAtIndex:", v11);
    sub_10011B76C(0, v7);
    currentSecureElementSession = 0;
  }
  v44 = currentSecureElementSession;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession initialECPConfig](v44, "initialECPConfig"));

  if (objc_msgSend(v45, "length"))
    -[_NFHardwareManager configureECPPolling:](self, "configureECPPolling:", v45);
  if (self)
  {
    v46 = self->_currentSecureElementSession;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession initialRoutingConfigWithField:](v46, "initialRoutingConfigWithField:", v8));
    v48 = -[_NFHardwareManager setRoutingConfig:](self, "setRoutingConfig:", v47);

    objc_msgSend(v7, "resume");
    sub_1000E7A78((uint64_t)self);
    sub_1001C8CF8((uint64_t)self);
    secureElementSessionQueue = self->_secureElementSessionQueue;
  }
  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "initialRoutingConfigWithField:", v8));
    v53 = objc_msgSend(0, "setRoutingConfig:", v52);

    objc_msgSend(v7, "resume");
    sub_1000E7A78(0);
    sub_1001C8CF8(0);
    secureElementSessionQueue = 0;
  }
  v50 = secureElementSessionQueue;
  v51 = -[NSMutableArray count](v50, "count");

  if (!v51)
    sub_1000DBE28(self, 1);

  v20 = 0;
  v40 = 1;
LABEL_27:

  return v40;
}

- (void)dequeueSession:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = sub_100111A40((id *)&self->super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CA240;
  v8[3] = &unk_1002E5CA8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)queueSession:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = sub_100111A40((id *)&self->super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CA2E8;
  v8[3] = &unk_1002E5CA8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)prioritizeSession:(id)a3
{
  id v5;
  id *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;

  v5 = a3;
  v6 = sub_100111A40((id *)&self->super.isa);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CA3C4;
  block[3] = &unk_1002E5C80;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

- (id)switchToSession:(id)a3 withToken:(id)a4
{
  id v7;
  NSMutableArray *secureElementSessionQueue;
  _NFSession *currentSecureElementSession;
  _NFSession *v10;
  void *v11;
  unsigned __int8 v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  unsigned __int8 v15;
  _NFSession *v16;
  _NFSession *v17;
  void *v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  char *v32;
  void *v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  NSMutableArray *v51;
  NSMutableArray *v52;
  NSMutableArray *suspendedSessionQueue;
  NSMutableArray *v54;
  void *v55;
  int v56;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v60;
  const char *ClassName;
  const char *Name;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  const char *v72;
  void *v73;
  void (*v74)(uint64_t, const char *, ...);
  objc_class *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  id v84;
  void *v85;
  NSMutableArray *obj;
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint8_t buf[4];
  int v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  int v98;
  __int16 v99;
  id v100;
  __int16 v101;
  SEL v102;
  _QWORD v103[4];
  _QWORD v104[4];
  _QWORD v105[4];
  _QWORD v106[4];

  v88 = a3;
  v7 = a4;
  if (self)
    secureElementSessionQueue = self->_secureElementSessionQueue;
  else
    secureElementSessionQueue = 0;
  obj = secureElementSessionQueue;
  objc_sync_enter(obj);
  if (self)
    currentSecureElementSession = self->_currentSecureElementSession;
  else
    currentSecureElementSession = 0;
  v10 = currentSecureElementSession;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession token](v10, "token"));
  v12 = objc_msgSend(v11, "isEqualToData:", v7);

  if ((v12 & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v60 = 43;
      else
        v60 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Current session token doesn't match %{public}@", v60, ClassName, Name, 527, v7);
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
      *(_DWORD *)buf = 67110146;
      v92 = v67;
      v93 = 2082;
      v94 = object_getClassName(self);
      v95 = 2082;
      v96 = sel_getName(a2);
      v97 = 1024;
      v98 = 527;
      v99 = 2114;
      v100 = v7;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Current session token doesn't match %{public}@", buf, 0x2Cu);
    }

    v68 = objc_alloc((Class)NSError);
    v17 = (_NFSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v105[0] = NSLocalizedDescriptionKey;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v106[0] = v55;
    v106[1] = &off_100302B70;
    v105[1] = CFSTR("Line");
    v105[2] = CFSTR("Method");
    v69 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v106[2] = v69;
    v105[3] = NSDebugDescriptionErrorKey;
    v70 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 528);
    v106[3] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v106, v105, 4));
    v72 = (const char *)objc_msgSend(v68, "initWithDomain:code:userInfo:", v17, 12, v71);
    goto LABEL_60;
  }
  if (self)
    v13 = self->_secureElementSessionQueue;
  else
    v13 = 0;
  v14 = v13;
  v15 = -[NSMutableArray containsObject:](v14, "containsObject:", v88);

  if ((v15 & 1) == 0)
  {
    v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v73);
    if (v74)
    {
      v75 = object_getClass(self);
      if (class_isMetaClass(v75))
        v76 = 43;
      else
        v76 = 45;
      v77 = object_getClassName(self);
      v78 = sel_getName(a2);
      v74(3, "%c[%{public}s %{public}s]:%i Session isn't queued !", v76, v77, v78, 532);
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
      *(_DWORD *)buf = 67109890;
      v92 = v83;
      v93 = 2082;
      v94 = object_getClassName(self);
      v95 = 2082;
      v96 = sel_getName(a2);
      v97 = 1024;
      v98 = 532;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session isn't queued !", buf, 0x22u);
    }

    v84 = objc_alloc((Class)NSError);
    v17 = (_NFSession *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v103[0] = NSLocalizedDescriptionKey;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v104[0] = v55;
    v104[1] = &off_100302B88;
    v103[1] = CFSTR("Line");
    v103[2] = CFSTR("Method");
    v69 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v104[2] = v69;
    v103[3] = NSDebugDescriptionErrorKey;
    v70 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 533);
    v104[3] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v104, v103, 4));
    v72 = (const char *)objc_msgSend(v84, "initWithDomain:code:userInfo:", v17, 12, v71);
LABEL_60:
    a2 = v72;

    v56 = 0;
    goto LABEL_61;
  }
  if (self)
    v16 = self->_currentSecureElementSession;
  else
    v16 = 0;
  v17 = v16;
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v18);
  if (v19)
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "sessionUID"));
    v19(6, "%c[%{public}s %{public}s]:%i Assigning parent token %{public}@ to %{public}@", v21, v22, v23, 537, v7, v24);

  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    v32 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "sessionUID"));
    *(_DWORD *)buf = 67110402;
    v92 = v29;
    v93 = 2082;
    v94 = v30;
    v95 = 2082;
    v96 = v31;
    v97 = 1024;
    v98 = 537;
    v99 = 2114;
    v100 = v7;
    v101 = 2114;
    v102 = v32;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assigning parent token %{public}@ to %{public}@", buf, 0x36u);

  }
  objc_msgSend(v88, "setParentToken:", v7);
  v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v33);
  if (v34)
  {
    v35 = object_getClass(self);
    if (class_isMetaClass(v35))
      v36 = 43;
    else
      v36 = 45;
    v37 = object_getClassName(self);
    v38 = sel_getName(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](v17, "sessionUID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "sessionUID"));
    v34(6, "%c[%{public}s %{public}s]:%i Switching from %{public}@ to %{public}@", v36, v37, v38, 540, v39, v40);

  }
  v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v42 = NFSharedLogGetLogger(v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = object_getClass(self);
    if (class_isMetaClass(v44))
      v45 = 43;
    else
      v45 = 45;
    v46 = object_getClassName(self);
    v47 = sel_getName(a2);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](v17, "sessionUID"));
    a2 = (SEL)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "sessionUID"));
    *(_DWORD *)buf = 67110402;
    v92 = v45;
    v93 = 2082;
    v94 = v46;
    v95 = 2082;
    v96 = v47;
    v97 = 1024;
    v98 = 540;
    v99 = 2114;
    v100 = v48;
    v101 = 2114;
    v102 = a2;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching from %{public}@ to %{public}@", buf, 0x36u);

  }
  if (self)
    v49 = self->_secureElementSessionQueue;
  else
    v49 = 0;
  v50 = v49;
  -[NSMutableArray removeObject:](v50, "removeObject:", v88);

  if (self)
    v51 = self->_secureElementSessionQueue;
  else
    v51 = 0;
  v52 = v51;
  -[NSMutableArray insertObject:atIndex:](v52, "insertObject:atIndex:", v88, 0);

  sub_10011B76C((uint64_t)self, 0);
  if (self)
    suspendedSessionQueue = self->_suspendedSessionQueue;
  else
    suspendedSessionQueue = 0;
  v54 = suspendedSessionQueue;
  -[NSMutableArray addObject:](v54, "addObject:", v17);

  v89[0] = CFSTR("ReasonCode");
  v89[1] = CFSTR("Token");
  v90[0] = &off_100302BA0;
  v90[1] = v7;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 2));
  -[_NFSession suspendWithInfo:](v17, "suspendWithInfo:", v55);
  v56 = 1;
LABEL_61:

  objc_sync_exit(obj);
  if (v56)
  {
    -[_NFHardwareManager maybeStartNextSession](self, "maybeStartNextSession");
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
    sub_1001FABB8(v85, CFSTR("Session"));

    a2 = 0;
  }

  return (id)(id)a2;
}

- (void)logLPCDFalseDetects:(int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  NSURL *lpcdCountersLoggingURL;
  NSURL *v10;
  unsigned int v11;
  id v12;
  NSURL *v13;
  NSURL *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  NSURL *v19;
  unsigned __int8 v20;
  id v21;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v26;
  const char *ClassName;
  const char *Name;
  NSURL *v29;
  NSURL *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  NSURL *v38;
  NSURL *v39;
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  NSURL *v50;
  __int16 v51;
  id v52;
  void *v53;
  void *v54;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionWithLocale:", v7));

    if (v8)
    {
      if (self)
        lpcdCountersLoggingURL = self->_lpcdCountersLoggingURL;
      else
        lpcdCountersLoggingURL = 0;
      v10 = lpcdCountersLoggingURL;
      v11 = -[NSURL checkResourceIsReachableAndReturnError:](v10, "checkResourceIsReachableAndReturnError:", 0);

      if (v11)
      {
        v12 = objc_alloc((Class)NSMutableDictionary);
        if (self)
          v13 = self->_lpcdCountersLoggingURL;
        else
          v13 = 0;
        v14 = v13;
        v15 = (NSMutableDictionary *)objc_msgSend(v12, "initWithContentsOfURL:", v14);

      }
      else
      {
        v15 = objc_opt_new(NSMutableDictionary);
      }
      v53 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
      v54 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v17);

      if (self)
        v18 = self->_lpcdCountersLoggingURL;
      else
        v18 = 0;
      v19 = v18;
      v40 = 0;
      v20 = -[NSMutableDictionary writeToURL:error:](v15, "writeToURL:error:", v19, &v40);
      v21 = v40;

      if ((v20 & 1) == 0 && v21)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v24 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class))
            v26 = 43;
          else
            v26 = 45;
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self)
            v29 = self->_lpcdCountersLoggingURL;
          else
            v29 = 0;
          v30 = v29;
          v24(3, "%c[%{public}s %{public}s]:%i failed to write to URL:%{public}@  error:%{public}@", v26, ClassName, Name, 37, v30, v21);

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
          if (self)
            v38 = self->_lpcdCountersLoggingURL;
          else
            v38 = 0;
          v39 = v38;
          *(_DWORD *)buf = 67110402;
          v42 = v35;
          v43 = 2082;
          v44 = v36;
          v45 = 2082;
          v46 = v37;
          v47 = 1024;
          v48 = 37;
          v49 = 2114;
          v50 = v39;
          v51 = 2114;
          v52 = v21;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to write to URL:%{public}@  error:%{public}@", buf, 0x36u);

        }
      }

    }
  }
}

- (id)_updateAllPowerCounters
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  id Property;
  char v8;
  const char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  _BOOL4 v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  id obj;
  char v38;
  id v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  v46 = 0;
  v4 = sub_1001D1C18(v3, &v46);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v39 = v46;

  if (v40)
  {
    if (objc_msgSend(v40, "code") != (id)45)
    {
      v34 = v40;
      v33 = v40;
      goto LABEL_43;
    }
    if (!self)
      goto LABEL_44;
  }
  else
  {
    if (!self)
    {
LABEL_44:
      Property = 0;
      v8 = 1;
      goto LABEL_10;
    }
    if (self->_lpcdFalseDetectLoggingEnabled && objc_msgSend(v39, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("lpcdFalseDetectCount")));
      -[_NFHardwareManager logLPCDFalseDetects:](self, "logLPCDFalseDetects:", objc_msgSend(v6, "intValue"));

    }
  }
  Property = objc_getProperty(self, v5, 176, 1);
  v8 = 0;
LABEL_10:
  v36 = Property;
  objc_sync_enter(v36);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  if ((v8 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_getProperty(self, v9, 176, 1);
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v38 = v8;
  if (v11)
  {
    v41 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "NF_userInfo", v36));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("powerCounters")));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager controllerInfo](self, "controllerInfo"));
          if (objc_msgSend(v16, "siliconName") == (id)14)
          {
            v17 = 1;
          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager controllerInfo](self, "controllerInfo"));
            if (objc_msgSend(v18, "siliconName") == (id)15)
            {
              v17 = 1;
            }
            else
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager controllerInfo](self, "controllerInfo"));
              if (objc_msgSend(v19, "siliconName") == (id)16)
              {
                v17 = 1;
              }
              else
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager controllerInfo](self, "controllerInfo"));
                v17 = objc_msgSend(v20, "siliconName") == (id)17;

              }
            }

          }
          if ((v38 & 1) != 0)
            v22 = 0;
          else
            v22 = objc_getProperty(self, v21, 40, 1);
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sequenceCounter"));
          v25 = objc_msgSend(v24, "unsignedIntValue");

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
          if (v40)
            v27 = objc_msgSend(v40, "code") == (id)45;
          else
            v27 = 0;
          v28 = v25 < 0x212 && v17;
          v29 = sub_1001D2C3C((uint64_t)v26, v15, v39, v27, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "NF_userInfo"));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("powerCounters"));

          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v11 != v12);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      v11 = v32;
    }
    while (v32);
  }

  objc_sync_exit(v36);
  v33 = 0;
  v34 = v40;
LABEL_43:

  return v33;
}

- (id)updateAllPowerCounters
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  NFExpressModeManager *v39;
  _BOOL4 expressModeInProgress;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const char *Name;
  const char *v72;
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[5];
  _QWORD v78[5];
  uint8_t buf[4];
  int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  void *v88;
  _QWORD v89[4];
  _QWORD v90[4];

  if (self && self->_systemWillSleep)
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
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when device is going to sleep", v28, ClassName, Name, 94);
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
      *(_DWORD *)buf = 67109890;
      v80 = v33;
      v81 = 2082;
      v82 = object_getClassName(self);
      v83 = 2082;
      v84 = sel_getName(a2);
      v85 = 1024;
      v86 = 94;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when device is going to sleep", buf, 0x22u);
    }

    v34 = objc_alloc((Class)NSError);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v89[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Busy"));
    v90[0] = v19;
    v90[1] = &off_100302DC8;
    v89[1] = CFSTR("Line");
    v89[2] = CFSTR("Method");
    v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v90[2] = v35;
    v89[3] = NSDebugDescriptionErrorKey;
    v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 95);
    v90[3] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 4));
    v38 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v6, 2, v37);

    goto LABEL_40;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
  v5 = sub_1001F84C8(v4, CFSTR("Power Counters"), 1uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v6)
  {
    if (self
      && (v39 = self->_expressModeManager) != 0
      && (expressModeInProgress = v39->_expressModeInProgress, v39, expressModeInProgress))
    {
      v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v42 = NFLogGetLogger(v41);
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(self);
        v45 = class_isMetaClass(v44);
        v46 = object_getClassName(self);
        v72 = sel_getName(a2);
        v47 = 45;
        if (v45)
          v47 = 43;
        v43(5, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when express mode is active", v47, v46, v72, 106);
      }
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger(v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = object_getClass(self);
        if (class_isMetaClass(v51))
          v52 = 43;
        else
          v52 = 45;
        *(_DWORD *)buf = 67109890;
        v80 = v52;
        v81 = 2082;
        v82 = object_getClassName(self);
        v83 = 2082;
        v84 = sel_getName(a2);
        v85 = 1024;
        v86 = 106;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when express mode is active", buf, 0x22u);
      }

      v53 = objc_alloc((Class)NSError);
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v75[0] = NSLocalizedDescriptionKey;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Busy"));
      v76[0] = v55;
      v76[1] = &off_100302DF8;
      v75[1] = CFSTR("Line");
      v75[2] = CFSTR("Method");
      v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v76[2] = v56;
      v75[3] = NSDebugDescriptionErrorKey;
      v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 107);
      v76[3] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v76, v75, 4));
      v38 = objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v58);
    }
    else
    {
      v64 = objc_claimAutoreleasedReturnValue(-[_NFHardwareManager _updateAllPowerCounters](self, "_updateAllPowerCounters"));
      if (!v64)
      {
        v38 = 0;
LABEL_49:
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
        sub_1001FABB8(v6, CFSTR("Power Counters"));
        goto LABEL_41;
      }
      v65 = (void *)v64;
      v66 = objc_alloc((Class)NSError);
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v67 = objc_msgSend(v65, "code");
      v73[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)objc_msgSend(v65, "code") > 70)
        v68 = 71;
      else
        v68 = (uint64_t)objc_msgSend(v65, "code");
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_1002EAF78)[v68]));
      v74[0] = v55;
      v74[1] = v65;
      v73[1] = NSUnderlyingErrorKey;
      v73[2] = CFSTR("Line");
      v74[2] = &off_100302E10;
      v73[3] = CFSTR("Method");
      v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v74[3] = v56;
      v73[4] = NSDebugDescriptionErrorKey;
      v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 111);
      v74[4] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 5));
      v38 = objc_msgSend(v66, "initWithDomain:code:userInfo:", v54, v67, v58);

    }
    goto LABEL_49;
  }
  v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v8 = NFLogGetLogger(v7);
  if (v8)
  {
    v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(self);
    v11 = class_isMetaClass(v10);
    v69 = object_getClassName(self);
    v70 = sel_getName(a2);
    v12 = 45;
    if (v11)
      v12 = 43;
    v9(3, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v12, v69, v70, 100, v6);
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
    *(_DWORD *)buf = 67110146;
    v80 = v17;
    v81 = 2082;
    v82 = object_getClassName(self);
    v83 = 2082;
    v84 = sel_getName(a2);
    v85 = 1024;
    v86 = 100;
    v87 = 2112;
    v88 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v20 = objc_msgSend(v6, "code");
  v77[0] = NSLocalizedDescriptionKey;
  if ((uint64_t)objc_msgSend(v6, "code") > 70)
    v21 = 71;
  else
    v21 = (uint64_t)objc_msgSend(v6, "code");
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_1002EAF78)[v21]));
  v78[0] = v59;
  v78[1] = v6;
  v77[1] = NSUnderlyingErrorKey;
  v77[2] = CFSTR("Line");
  v78[2] = &off_100302DE0;
  v77[3] = CFSTR("Method");
  v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v78[3] = v60;
  v77[4] = NSDebugDescriptionErrorKey;
  v61 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 101);
  v78[4] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 5));
  v38 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, v20, v62);

LABEL_40:
LABEL_41:

  return v38;
}

- (void)getPowerCountersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = sub_100111A40((id *)&self->super.isa);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F11F4;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

- (void)_sync_getPowerCountersForConnection:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *v19;
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("powerCounters")));

    if (!v9)
    {
      v10 = objc_opt_new(NSDictionary);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("powerCounters"));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager updateAllPowerCounters](self, "updateAllPowerCounters"));
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("powerCounters")));

      v19 = objc_opt_new(NSDictionary);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NF_userInfo"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("powerCounters"));

    }
    v7[2](v7, v12, v13);

  }
  else
  {
    v14 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v21 = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v22 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v17 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v12, 58, v16);
    v7[2](v7, v17, 0);

  }
}

- (id)combineFlashWriteCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFCC Write Counters")));
    v11 = objc_msgSend(v10, "intValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NFCC Write Counters")));
    v13 = objc_msgSend(v12, "intValue") + v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("NFCC Write Counters"));

    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("NFCC Write Counters Overflow"));

    }
    v16 = objc_msgSend(v9, "copy");
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v9, "addEntriesFromDictionary:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("NFCC Write Counters Overflow"));

      v18 = v9;
    }
    else
    {
      v18 = v8;
    }
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v18));
  }
  v19 = v16;

  return v19;
}

- (id)openStackAndUpdateAllWriteCounters:(id *)p_isa
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  NSMutableArray *v42;
  NFExpressModeManager *v43;
  _BOOL4 expressModeInProgress;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  const char *v79;
  const char *v80;
  const char *Name;
  const char *v82;
  NSMutableArray *v83;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[5];
  _QWORD v89[5];
  uint8_t buf[4];
  int v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  id v99;
  _QWORD v100[4];
  _QWORD v101[4];

  if (self && self->_systemWillSleep)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v26 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v30 = 45;
      if (isMetaClass)
        v30 = 43;
      v26(3, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when device is going to sleep", v30, ClassName, Name, 265);
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
      *(_DWORD *)buf = 67109890;
      v91 = v35;
      v92 = 2082;
      v93 = object_getClassName(self);
      v94 = 2082;
      v95 = sel_getName(a2);
      v96 = 1024;
      v97 = 265;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when device is going to sleep", buf, 0x22u);
    }

    if (p_isa)
    {
      v36 = objc_alloc((Class)NSError);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v100[0] = NSLocalizedDescriptionKey;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Busy"));
      v101[0] = v38;
      v101[1] = &off_100302E58;
      v100[1] = CFSTR("Line");
      v100[2] = CFSTR("Method");
      v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v101[2] = v39;
      v100[3] = NSDebugDescriptionErrorKey;
      v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 266);
      v101[3] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v101, v100, 4));
      *p_isa = objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v41);

      v42 = 0;
      v8 = 0;
LABEL_54:
      p_isa = 0;
      goto LABEL_55;
    }
    v42 = 0;
    v8 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
    v7 = sub_1001F84C8(v6, CFSTR("Write Counters"), 1uLL);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v9 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v10 = NFLogGetLogger(v9);
      if (v10)
      {
        v11 = (void (*)(uint64_t, const char *, ...))v10;
        v12 = object_getClass(self);
        v13 = class_isMetaClass(v12);
        v79 = object_getClassName(self);
        v80 = sel_getName(a2);
        v14 = 45;
        if (v13)
          v14 = 43;
        v11(3, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v14, v79, v80, 272, v8);
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
        *(_DWORD *)buf = 67110146;
        v91 = v19;
        v92 = 2082;
        v93 = object_getClassName(self);
        v94 = 2082;
        v95 = sel_getName(a2);
        v96 = 1024;
        v97 = 272;
        v98 = 2112;
        v99 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
      }

      if (p_isa)
      {
        v20 = objc_alloc((Class)NSError);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v22 = objc_msgSend(v8, "code");
        v88[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)objc_msgSend(v8, "code") > 70)
          v23 = 71;
        else
          v23 = (uint64_t)objc_msgSend(v8, "code");
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_1002EAF78)[v23]));
        v89[0] = v63;
        v89[1] = v8;
        v88[1] = NSUnderlyingErrorKey;
        v88[2] = CFSTR("Line");
        v89[2] = &off_100302E70;
        v88[3] = CFSTR("Method");
        v64 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v89[3] = v64;
        v88[4] = NSDebugDescriptionErrorKey;
        v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 273);
        v89[4] = v65;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 5));
        *p_isa = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, v22, v66);

        v42 = 0;
        goto LABEL_54;
      }
      v42 = 0;
    }
    else
    {
      if (self
        && (v43 = self->_expressModeManager) != 0
        && (expressModeInProgress = v43->_expressModeInProgress, v43, expressModeInProgress))
      {
        v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v46 = NFLogGetLogger(v45);
        if (v46)
        {
          v47 = (void (*)(uint64_t, const char *, ...))v46;
          v48 = object_getClass(self);
          v49 = class_isMetaClass(v48);
          v50 = object_getClassName(self);
          v82 = sel_getName(a2);
          v51 = 45;
          if (v49)
            v51 = 43;
          v47(5, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when express mode is active", v51, v50, v82, 279);
        }
        v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v53 = NFSharedLogGetLogger(v52);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = object_getClass(self);
          if (class_isMetaClass(v55))
            v56 = 43;
          else
            v56 = 45;
          *(_DWORD *)buf = 67109890;
          v91 = v56;
          v92 = 2082;
          v93 = object_getClassName(self);
          v94 = 2082;
          v95 = sel_getName(a2);
          v96 = 1024;
          v97 = 279;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when express mode is active", buf, 0x22u);
        }

        v57 = objc_alloc((Class)NSError);
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v86[0] = NSLocalizedDescriptionKey;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Busy"));
        v87[0] = v59;
        v87[1] = &off_100302E88;
        v86[1] = CFSTR("Line");
        v86[2] = CFSTR("Method");
        v60 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v87[2] = v60;
        v86[3] = NSDebugDescriptionErrorKey;
        v61 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 280);
        v87[3] = v61;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 4));
        v8 = objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v62);

        v42 = 0;
      }
      else
      {
        v67 = sub_1001F15DC(self);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
        v83 = 0;
        v68 = sub_1001D36D0(v58, &v83);
        v8 = (id)objc_claimAutoreleasedReturnValue(v68);
        v42 = v83;
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager driverWrapper](self, "driverWrapper"));
      sub_1001FABB8(v69, CFSTR("Write Counters"));

      if (v8)
      {
        if (p_isa)
        {
          v70 = objc_alloc((Class)NSError);
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
          v72 = objc_msgSend(v8, "code");
          v84[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)objc_msgSend(v8, "code") > 70)
            v73 = 71;
          else
            v73 = (uint64_t)objc_msgSend(v8, "code");
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_1002EAF78)[v73]));
          v85[0] = v74;
          v85[1] = v8;
          v84[1] = NSUnderlyingErrorKey;
          v84[2] = CFSTR("Line");
          v85[2] = &off_100302EA0;
          v84[3] = CFSTR("Method");
          v75 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v85[3] = v75;
          v84[4] = NSDebugDescriptionErrorKey;
          v76 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 289);
          v85[4] = v76;
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 5));
          *p_isa = objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, v72, v77);

          goto LABEL_54;
        }
      }
      else
      {
        if (p_isa)
          *p_isa = 0;
        v42 = v42;
        v8 = 0;
        p_isa = (id *)&v42->super.super.isa;
      }
    }
  }
LABEL_55:

  return p_isa;
}

- (void)getFlashWriteCountersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = sub_100111A40((id *)&self->super.isa);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F2640;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

- (void)_sync_getFlashWriteCountersForConnection:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id, NSMutableDictionary *);
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v16;
  const char *v17;
  id v18;
  void (**v19)(id, id, NSMutableDictionary *);
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSErrorUserInfoKey v46;
  NSMutableDictionary *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;

  v7 = a3;
  v8 = (void (**)(id, id, NSMutableDictionary *))a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
    v17 = a2;
    v18 = v7;
    v19 = v8;
    v20 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@ requesting write counters", v22, ClassName, Name, 309, v21);

    v8 = v19;
    v7 = v18;
    a2 = v17;
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v49 = v27;
    v50 = 2082;
    v51 = v28;
    v52 = 2082;
    v53 = v29;
    v54 = 1024;
    v55 = 309;
    v56 = 2114;
    v57 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ requesting write counters", buf, 0x2Cu);

  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("flashWriteCounters")));

    if (!v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("flashWriteCounters"));

    }
    v36 = objc_opt_new(NSMutableDictionary);
    v45 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFHardwareManager openStackAndUpdateAllWriteCounters:](self, "openStackAndUpdateAllWriteCounters:", &v45));
    v38 = v45;
    if (!v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("flashWriteCounters")));
      -[NSMutableDictionary addEntriesFromDictionary:](v36, "addEntriesFromDictionary:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NF_userInfo"));
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("flashWriteCounters"));

      if (objc_msgSend(v37, "count"))
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, CFSTR("NFCC Page Erase Counters"));
    }
    v8[2](v8, v38, v36);
  }
  else
  {
    v43 = objc_alloc((Class)NSError);
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v46 = NSLocalizedDescriptionKey;
    v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unresponsive hardware"));
    v47 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v44 = objc_msgSend(v43, "initWithDomain:code:userInfo:", v38, 58, v37);
    v8[2](v8, v44, 0);

  }
}

@end
