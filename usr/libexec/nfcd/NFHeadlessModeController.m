@implementation NFHeadlessModeController

- (NFHeadlessModeController)init
{
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  id v14;
  id v15;
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
  const char *v28;
  const char *v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
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
  const char *Name;
  const char *v67;
  const char *v68;
  objc_super v69;
  uint8_t buf[4];
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;

  v69.receiver = self;
  v69.super_class = (Class)NFHeadlessModeController;
  v3 = -[NFHeadlessModeController init](&v69, "init");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = NFBootUUID();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataForKey:", CFSTR("LastBootUUID")));
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.nfcd.lpem", v11);
    v13 = (void *)*((_QWORD *)v3 + 3);
    *((_QWORD *)v3 + 3) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 3), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    if (v7 && (objc_msgSend(v6, "isEqualToData:", v7) & 1) != 0)
    {
      v14 = objc_msgSend(v4, "integerForKey:", CFSTR("HeadlessFeatures"));
      *((_QWORD *)v3 + 4) = v14;
      if (v14)
        v15 = sub_100203FD8(v3);
      else
        v32 = sub_100203F98(v3);
      v31 = 1;
    }
    else
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        v22 = 45;
        if (isMetaClass)
          v22 = 43;
        v18(6, "%c[%{public}s %{public}s]:%i LPEM first config after boot", v22, ClassName, Name, 190);
      }
      v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v24 = NFSharedLogGetLogger(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = object_getClass(v3);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        v28 = object_getClassName(v3);
        v29 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v71 = v27;
        v72 = 2082;
        v73 = v28;
        v74 = 2082;
        v75 = v29;
        v76 = 1024;
        v77 = 190;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i LPEM first config after boot", buf, 0x22u);
      }

      v30 = sub_100203F98(v3);
      v31 = 0;
    }
    v3[9] = v31;
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("LastBootUUID"));
    v3[10] = 0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/Library/Preferences/Logging/Subsystems/com.apple.nfc.plist")));
    v34 = v33;
    if (v33)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("OverrideB0LP")));
      if (v35)
      {
        v36 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
        {
          v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v38 = NFLogGetLogger(v37);
          if (v38)
          {
            v39 = (void (*)(uint64_t, const char *, ...))v38;
            v40 = object_getClass(v3);
            v41 = class_isMetaClass(v40);
            v42 = object_getClassName(v3);
            v67 = sel_getName(a2);
            v43 = 45;
            if (v41)
              v43 = 43;
            v39(6, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by Profile", v43, v42, v67, 216);
          }
          v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v45 = NFSharedLogGetLogger(v44);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = object_getClass(v3);
            if (class_isMetaClass(v47))
              v48 = 43;
            else
              v48 = 45;
            v49 = object_getClassName(v3);
            v50 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v71 = v48;
            v72 = 2082;
            v73 = v49;
            v74 = 2082;
            v75 = v50;
            v76 = 1024;
            v77 = 216;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by Profile", buf, 0x22u);
          }

          v3[10] = 1;
        }
      }

    }
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("OverrideB0LP")))
    {
      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFLogGetLogger(v51);
      if (v52)
      {
        v53 = (void (*)(uint64_t, const char *, ...))v52;
        v54 = object_getClass(v3);
        v55 = class_isMetaClass(v54);
        v56 = object_getClassName(v3);
        v68 = sel_getName(a2);
        v57 = 45;
        if (v55)
          v57 = 43;
        v53(6, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by defaults", v57, v56, v68, 221);
      }
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFSharedLogGetLogger(v58);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = object_getClass(v3);
        if (class_isMetaClass(v61))
          v62 = 43;
        else
          v62 = 45;
        v63 = object_getClassName(v3);
        v64 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v71 = v62;
        v72 = 2082;
        v73 = v63;
        v74 = 2082;
        v75 = v64;
        v76 = 1024;
        v77 = 221;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by defaults", buf, 0x22u);
      }

      v3[10] = 1;
    }
    v3[11] = 1;
    objc_msgSend(v3, "queryPMUCapability");

  }
  return (NFHeadlessModeController *)v3;
}

- (void)queryPMUCapability
{
  io_registry_entry_t v4;
  io_object_t v5;
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
  const char *ClassName;
  const char *Name;
  id CFProperty;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;

  v4 = -[NFHeadlessModeController copyPMUService](self, "copyPMUService");
  if (v4)
  {
    v5 = v4;
    CFProperty = (id)IORegistryEntryCreateCFProperty(v4, CFSTR("IOPMUBootLPMFWSCC"), 0, 0);
    IOObjectRelease(v5);
    if (CFProperty)
    {
      self->_requiresSilentCapabilityChecks = objc_msgSend(CFProperty, "intValue") == 0;

    }
    else
    {
      self->_requiresSilentCapabilityChecks = 1;
    }
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
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v11, ClassName, Name, 238, "AppleDialogSPMIPMU");
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
      *(_DWORD *)buf = 67110146;
      v21 = v16;
      v22 = 2082;
      v23 = object_getClassName(self);
      v24 = 2082;
      v25 = sel_getName(a2);
      v26 = 1024;
      v27 = 238;
      v28 = 2080;
      v29 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

  }
}

- (BOOL)hasAppleLPM
{
  if (qword_10032AC08 != -1)
    dispatch_once(&qword_10032AC08, &stru_1002EB6E8);
  return byte_10032ABF0;
}

- (char)getIndexFromLocale
{
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  void *v7;
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
  id v19;
  char v20;
  const char *ClassName;
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
  void *v33;

  -[NFHeadlessModeController print](self, "print");
  if (-[NFHeadlessModeController hasAppleLPM](self, "hasAppleLPM"))
    v4 = &off_100305FB0;
  else
    v4 = &off_100305FC8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v4, v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
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
      v10(6, "%c[%{public}s %{public}s]:%i Best match: %{public}@", v13, ClassName, Name, 360, v7);
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
      v25 = v18;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 360;
      v32 = 2114;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Best match: %{public}@", buf, 0x2Cu);
    }

    v19 = objc_msgSend(v4, "indexOfObject:", v7);
    if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
      v20 = 1;
    else
      v20 = (_BYTE)v19 + 1;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)print
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
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
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v29 = a2;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSLocaleIdentifier));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSLocaleLanguageCode));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    v16 = 43;
    if (!isMetaClass)
      v16 = 45;
    v6(6, "%c[%{public}s %{public}s]:%i Locale code = %{public}@, Language code = %{public}@, Preferred : %{public}@", v16, ClassName, Name, 378, v12, v14, v15);

    a2 = v29;
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
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", NSLocaleIdentifier));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", NSLocaleLanguageCode));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    *(_DWORD *)buf = 67110658;
    v31 = v21;
    v32 = 2082;
    v33 = v22;
    v34 = 2082;
    v35 = v23;
    v36 = 1024;
    v37 = 378;
    v38 = 2114;
    v39 = v25;
    v40 = 2114;
    v41 = v27;
    v42 = 2114;
    v43 = v28;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Locale code = %{public}@, Language code = %{public}@, Preferred : %{public}@", buf, 0x40u);

  }
}

- (id)pushB0LPToSMC:(unsigned __int16)a3
{
  unsigned int v3;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  kern_return_t v9;
  id v10;
  void *v11;
  void *v12;
  void **v13;
  NSErrorUserInfoKey *v14;
  void *v15;
  id v16;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  kern_return_t v31;
  void *v32;
  void (*v33)(uint64_t, const char *, ...);
  void *v34;
  uint64_t v35;
  NSObject *v36;
  const char *ClassName;
  const char *Name;
  io_connect_t connect;
  size_t outputStructCnt;
  char v41[8];
  NSErrorUserInfoKey v42;
  void *v43;
  NSErrorUserInfoKey v44;
  void *v45;
  uint8_t v46[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  kern_return_t v53;
  __int16 v54;
  int v55;
  _OWORD outputStruct[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[28];

  v3 = a3;
  connect = 0;
  v6 = IOServiceMatching("AppleSMC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService
    || (v8 = MatchingService, v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect), IOObjectRelease(v8), v9)
    || !connect
    || IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0))
  {
    connect = 0;
LABEL_4:
    v10 = objc_alloc((Class)NSError);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v44 = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v45 = v12;
    v13 = &v45;
    v14 = &v44;
    goto LABEL_5;
  }
  if (!connect)
    goto LABEL_4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v20 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v23 = 45;
    if (isMetaClass)
      v23 = 43;
    v20(6, "%c[%{public}s %{public}s]:%i Setting B0LP to %d", v23, ClassName, Name, 394, v3);
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
    *(_DWORD *)buf = 67110146;
    LODWORD(v61) = v28;
    WORD2(v61) = 2082;
    *(_QWORD *)((char *)&v61 + 6) = v29;
    HIWORD(v61) = 2082;
    *(_QWORD *)&v62 = v30;
    WORD4(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 10) = 394;
    HIWORD(v62) = 1024;
    LODWORD(v63) = v3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting B0LP to %d", buf, 0x28u);
  }

  outputStructCnt = 80;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  memset(v64, 0, sizeof(v64));
  memset(outputStruct, 0, sizeof(outputStruct));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  strcpy(v41, "B0LP");
  BYTE6(v63) = 6;
  *(_DWORD *)buf = 1110461520;
  DWORD2(v62) = 2;
  WORD6(v63) = v3;
  v31 = IOConnectCallStructMethod(connect, 2u, buf, 0x50uLL, outputStruct, &outputStructCnt);
  if (!v31 && !BYTE8(v57))
    goto LABEL_30;
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v32);
  if (v33)
    v33(3, "%s:%i Write failed for key '%s' (0x%X, 0x%X)\n", "_writeSMCKey", 131, v41, v31, BYTE8(v57));
  v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v35 = NFSharedLogGetLogger(v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v46 = 136447234;
    v47 = "_writeSMCKey";
    v48 = 1024;
    v49 = 131;
    v50 = 2080;
    v51 = v41;
    v52 = 1024;
    v53 = v31;
    v54 = 1024;
    v55 = BYTE8(v57);
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i Write failed for key '%s' (0x%X, 0x%X)\n", v46, 0x28u);
  }

  if (!v31)
  {
LABEL_30:
    v16 = 0;
    goto LABEL_6;
  }
  v10 = objc_alloc((Class)NSError);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v42 = NSLocalizedDescriptionKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
  v43 = v12;
  v13 = &v43;
  v14 = &v42;
LABEL_5:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
  v16 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 6, v15);

LABEL_6:
  if (connect && !IOConnectCallScalarMethod(connect, 1u, 0, 0, 0, 0))
    IOServiceClose(connect);
  return v16;
}

- (unsigned)copyPMUService
{
  const __CFDictionary *v4;
  uint64_t MatchingServices;
  uint64_t v6;
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
  const char *v18;
  const char *v19;
  io_object_t v20;
  io_iterator_t v21;
  io_registry_entry_t v22;
  CFTypeRef CFProperty;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  const char *ClassName;
  const char *v44;
  const char *Name;
  const char *v46;
  io_iterator_t existing;
  uint8_t buf[4];
  _BYTE v49[14];
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;

  existing = 0;
  v4 = IOServiceNameMatching("AppleDialogSPMIPMU");
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  if ((_DWORD)MatchingServices)
  {
    v6 = MatchingServices;
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
      v9(3, "%c[%{public}s %{public}s]:%i Error retrieving services : %d", v12, ClassName, Name, 416, v6);
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
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v49 = v17;
      *(_WORD *)&v49[4] = 2082;
      *(_QWORD *)&v49[6] = v18;
      v50 = 2082;
      v51 = v19;
      v52 = 1024;
      v53 = 416;
      v54 = 1024;
      LODWORD(v55) = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error retrieving services : %d", buf, 0x28u);
    }

    return 0;
  }
  v21 = existing;
  if (!existing)
  {
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFLogGetLogger(v29);
    if (v30)
    {
      v31 = (void (*)(uint64_t, const char *, ...))v30;
      v32 = object_getClass(self);
      v33 = class_isMetaClass(v32);
      v44 = object_getClassName(self);
      v46 = sel_getName(a2);
      v34 = 45;
      if (v33)
        v34 = 43;
      v31(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v34, v44, v46, 421, "AppleDialogSPMIPMU");
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
      v40 = object_getClassName(self);
      v41 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v49 = v39;
      *(_WORD *)&v49[4] = 2082;
      *(_QWORD *)&v49[6] = v40;
      v50 = 2082;
      v51 = v41;
      v52 = 1024;
      v53 = 421;
      v54 = 2080;
      v55 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    return 0;
  }
  do
  {
    if (!IOIteratorIsValid(v21))
      break;
    v22 = IOIteratorNext(existing);
    v20 = v22;
    if (!v22)
      goto LABEL_34;
    CFProperty = IORegistryEntryCreateCFProperty(v22, CFSTR("IOPMUPrimary"), 0, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      goto LABEL_34;
    }
    IOObjectRelease(v20);
    v21 = existing;
  }
  while (existing);
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
  if (v25)
    v25(3, "%s:%i Invalid iterator", "-[NFHeadlessModeController copyPMUService]", 428);
  v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v27 = NFSharedLogGetLogger(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)v49 = "-[NFHeadlessModeController copyPMUService]";
    *(_WORD *)&v49[8] = 1024;
    *(_DWORD *)&v49[10] = 428;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", buf, 0x12u);
  }

  v20 = 0;
LABEL_34:
  IOObjectRelease(existing);
  return v20;
}

- (id)getLPMControl
{
  io_registry_entry_t v4;
  io_object_t v5;
  void *CFProperty;
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
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = -[NFHeadlessModeController copyPMUService](self, "copyPMUService");
  if (v4)
  {
    v5 = v4;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("IOPMUBootLPMCtrl"), 0, 0);
    IOObjectRelease(v5);
    if (CFProperty)
      return CFProperty;
    else
      return 0;
  }
  else
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
      v10(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v13, ClassName, Name, 460, "AppleDialogSPMIPMU");
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
      *(_DWORD *)buf = 67110146;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(self);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 460;
      v29 = 2080;
      v30 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    return 0;
  }
}

- (id)pushIndexToPMU:(char)a3
{
  int v3;
  io_registry_entry_t v6;
  io_registry_entry_t v7;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v9;
  CFTypeID v10;
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
  io_registry_entry_t v22;
  int v23;
  unint64_t headlessModeFeature;
  CFMutableDictionaryRef MutableCopy;
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
  id v37;
  char *v38;
  void *v39;
  void **v40;
  NSErrorUserInfoKey *v41;
  __CFDictionary *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *v47;
  _BOOL4 v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  int v58;
  CFNumberRef v59;
  int v60;
  CFNumberRef v61;
  CFNumberRef v62;
  CFNumberRef v63;
  CFNumberRef v64;
  CFNumberRef v65;
  unsigned int v66;
  void *v67;
  uint64_t v68;
  void (*v69)(uint64_t, const char *, ...);
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  const char *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  const __CFString *v83;
  const char *v84;
  NSObject *v85;
  uint32_t v86;
  objc_class *v87;
  _BOOL4 v88;
  const char *v89;
  const char *v90;
  const __CFString *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  const __CFString *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void (*v104)(uint64_t, const char *, ...);
  objc_class *v105;
  _BOOL4 v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  objc_class *v111;
  int v112;
  const char *v113;
  const char *v114;
  void *v115;
  id v116;
  void *v118;
  uint64_t v119;
  void (*v120)(uint64_t, const char *, ...);
  objc_class *v121;
  _BOOL4 v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  NSObject *v126;
  objc_class *v127;
  int v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void (*v135)(uint64_t, const char *, ...);
  objc_class *v136;
  _BOOL4 v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  NSObject *v142;
  objc_class *v143;
  int v144;
  const char *v145;
  const char *v146;
  const char *v147;
  const char *ClassName;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *Name;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const __CFString *v157;
  int v158;
  io_registry_entry_t v159;
  int valuePtr;
  NSErrorUserInfoKey v161;
  void *v162;
  uint8_t buf[4];
  int v164;
  __int16 v165;
  const char *v166;
  __int16 v167;
  const char *v168;
  __int16 v169;
  int v170;
  __int16 v171;
  const char *v172;
  __int16 v173;
  __CFDictionary *v174;
  NSErrorUserInfoKey v175;
  void *v176;

  v3 = a3;
  valuePtr = 0;
  v6 = -[NFHeadlessModeController copyPMUService](self, "copyPMUService");
  if (!v6)
  {
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
      v28(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v31, ClassName, Name, 486, "AppleDialogSPMIPMU");
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
      *(_DWORD *)buf = 67110146;
      v164 = v36;
      v165 = 2082;
      v166 = object_getClassName(self);
      v167 = 2082;
      v168 = sel_getName(a2);
      v169 = 1024;
      v170 = 486;
      v171 = 2080;
      v172 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    v37 = objc_alloc((Class)NSError);
    v38 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v175 = NSLocalizedDescriptionKey;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v176 = v39;
    v40 = &v176;
    v41 = &v175;
    goto LABEL_88;
  }
  v7 = v6;
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v6, CFSTR("IOPMUBootLPMCtrl"), 0, 0);
  v9 = CFProperty;
  if (!CFProperty || (v10 = CFGetTypeID(CFProperty), v10 != CFDictionaryGetTypeID()))
  {
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFLogGetLogger(v11);
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(self);
      v15 = class_isMetaClass(v14);
      v147 = object_getClassName(self);
      v151 = sel_getName(a2);
      v16 = 45;
      if (v15)
        v16 = 43;
      v13(4, "%c[%{public}s %{public}s]:%i Failed to fetch property: %s.", v16, v147, v151, 492, "IOPMUBootLPMCtrl");
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      v21 = v3;
      v22 = v7;
      if (class_isMetaClass(v20))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67110146;
      v164 = v23;
      v7 = v22;
      v3 = v21;
      v165 = 2082;
      v166 = object_getClassName(self);
      v167 = 2082;
      v168 = sel_getName(a2);
      v169 = 1024;
      v170 = 492;
      v171 = 2080;
      v172 = "IOPMUBootLPMCtrl";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to fetch property: %s.", buf, 0x2Cu);
    }

  }
  headlessModeFeature = self->_headlessModeFeature;
  v159 = v7;
  if (v9)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 4, v9);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 4, 0, 0);
  v42 = MutableCopy;
  if ((headlessModeFeature & 3) != 0 || (headlessModeFeature & 0x1C) == 0)
  {
    v58 = v3;
  }
  else
  {
    v158 = v3;
    v43 = a2;
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v45 = NFLogGetLogger(v44);
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(self);
      v48 = class_isMetaClass(v47);
      v49 = object_getClassName(self);
      v153 = sel_getName(v43);
      v50 = 45;
      if (v48)
        v50 = 43;
      v46(6, "%c[%{public}s %{public}s]:%i Overriding image index to 0 since no express.", v50, v49, v153, 508);
    }
    v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFSharedLogGetLogger(v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = object_getClass(self);
      if (class_isMetaClass(v54))
        v55 = 43;
      else
        v55 = 45;
      v56 = object_getClassName(self);
      v57 = sel_getName(v43);
      *(_DWORD *)buf = 67109890;
      v164 = v55;
      v165 = 2082;
      v166 = v56;
      v167 = 2082;
      v168 = v57;
      v169 = 1024;
      v170 = 508;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding image index to 0 since no express.", buf, 0x22u);
    }

    v58 = 0;
    a2 = v43;
    v3 = v158;
  }
  valuePtr = v58;
  v59 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("imgIdx"), v59);
  CFRelease(v59);
  if ((headlessModeFeature & 4) != 0)
    v60 = v3;
  else
    v60 = 0;
  valuePtr = v60;
  v61 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("imgIdxFindMy"), v61);
  CFRelease(v61);
  valuePtr = (headlessModeFeature & 0x1F) != 0;
  v62 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("lpm0"), v62);
  CFRelease(v62);
  valuePtr = (headlessModeFeature & 2) >> 1;
  v63 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("lpm1"), v63);
  CFRelease(v63);
  valuePtr = (headlessModeFeature & 4) >> 2;
  v64 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("lpm2"), v64);
  CFRelease(v64);
  valuePtr = (headlessModeFeature & 0x18) != 0;
  v65 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v42, CFSTR("lpm3"), v65);
  CFRelease(v65);
  v66 = -[__CFDictionary isEqualToDictionary:](v42, "isEqualToDictionary:", v9);
  v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v68 = NFLogGetLogger(v67);
  v69 = (void (*)(uint64_t, const char *, ...))v68;
  if (v66)
  {
    if (v68)
    {
      v70 = object_getClass(self);
      v71 = class_isMetaClass(v70);
      v72 = object_getClassName(self);
      v73 = sel_getName(a2);
      if (v9)
        v74 = (const __CFString *)v9;
      else
        v74 = CFSTR("NULL");
      v75 = 45;
      if (v71)
        v75 = 43;
      v69(6, "%c[%{public}s %{public}s]:%i No change to LPEM : %{public}@", v75, v72, v73, 551, v74);
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
      *(_DWORD *)buf = 67110146;
      if (v9)
        v83 = (const __CFString *)v9;
      else
        v83 = CFSTR("NULL");
      v164 = v80;
      v165 = 2082;
      v166 = v81;
      v167 = 2082;
      v168 = v82;
      v169 = 1024;
      v170 = 551;
      v171 = 2114;
      v172 = (const char *)v83;
      v84 = "%c[%{public}s %{public}s]:%i No change to LPEM : %{public}@";
      v85 = v78;
      v86 = 44;
LABEL_74:
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, v84, buf, v86);
    }
  }
  else
  {
    if (v68)
    {
      v87 = object_getClass(self);
      v88 = class_isMetaClass(v87);
      v89 = object_getClassName(self);
      v90 = sel_getName(a2);
      if (v9)
        v91 = (const __CFString *)v9;
      else
        v91 = CFSTR("nil");
      v157 = v91;
      v92 = 45;
      if (v88)
        v92 = 43;
      v69(6, "%c[%{public}s %{public}s]:%i Changing new LPM control %{public}@ -> %{public}@", v92, v89, v90, 553, v157, v42);
    }
    v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v94 = NFSharedLogGetLogger(v93);
    v78 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v95 = object_getClass(self);
      if (class_isMetaClass(v95))
        v96 = 43;
      else
        v96 = 45;
      v97 = object_getClassName(self);
      v98 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      if (v9)
        v99 = (const __CFString *)v9;
      else
        v99 = CFSTR("nil");
      v164 = v96;
      v165 = 2082;
      v166 = v97;
      v167 = 2082;
      v168 = v98;
      v169 = 1024;
      v170 = 553;
      v171 = 2114;
      v172 = (const char *)v99;
      v173 = 2114;
      v174 = v42;
      v84 = "%c[%{public}s %{public}s]:%i Changing new LPM control %{public}@ -> %{public}@";
      v85 = v78;
      v86 = 54;
      goto LABEL_74;
    }
  }

  if (v9)
    CFRelease(v9);
  v100 = IORegistryEntrySetCFProperty(v159, CFSTR("IOPMUBootLPMCtrl"), v42);
  if (!(_DWORD)v100)
  {
    v38 = (char *)objc_claimAutoreleasedReturnValue(-[NFHeadlessModeController getLPMControl](self, "getLPMControl"));
    if ((objc_msgSend(v38, "isEqualToDictionary:", v42) & 1) == 0)
    {
      v118 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v119 = NFLogGetLogger(v118);
      if (v119)
      {
        v120 = (void (*)(uint64_t, const char *, ...))v119;
        v121 = object_getClass(self);
        v122 = class_isMetaClass(v121);
        v150 = object_getClassName(self);
        v155 = sel_getName(a2);
        v123 = 45;
        if (v122)
          v123 = 43;
        v120(3, "%c[%{public}s %{public}s]:%i Read back of LPM control error : %{public}@", v123, v150, v155, 570, v38);
      }
      v124 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v125 = NFSharedLogGetLogger(v124);
      v126 = objc_claimAutoreleasedReturnValue(v125);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v127 = object_getClass(self);
        if (class_isMetaClass(v127))
          v128 = 43;
        else
          v128 = 45;
        v129 = object_getClassName(self);
        v130 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v164 = v128;
        v165 = 2082;
        v166 = v129;
        v167 = 2082;
        v168 = v130;
        v169 = 1024;
        v170 = 570;
        v171 = 2114;
        v172 = v38;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read back of LPM control error : %{public}@", buf, 0x2Cu);
      }

    }
    CFRelease(v42);
    v131 = IOObjectRelease(v159);
    if (!NFProductHasB0LPKey(v131))
    {
      v116 = 0;
      goto LABEL_89;
    }
    if ((headlessModeFeature & 2) != 0)
    {
      v132 = 3;
    }
    else if ((headlessModeFeature & 5) == 5)
    {
      v132 = 2;
    }
    else
    {
      v132 = (headlessModeFeature & 5) != 0;
      if ((headlessModeFeature & 5) == 0)
      {
LABEL_119:
        v116 = (id)objc_claimAutoreleasedReturnValue(-[NFHeadlessModeController pushB0LPToSMC:](self, "pushB0LPToSMC:", v132));
        goto LABEL_89;
      }
    }
    if (self->_b0lpOverride)
    {
      v133 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v134 = NFLogGetLogger(v133);
      if (v134)
      {
        v135 = (void (*)(uint64_t, const char *, ...))v134;
        v136 = object_getClass(self);
        v137 = class_isMetaClass(v136);
        v138 = object_getClassName(self);
        v156 = sel_getName(a2);
        v139 = 45;
        if (v137)
          v139 = 43;
        v135(6, "%c[%{public}s %{public}s]:%i SMC value has been overwritten", v139, v138, v156, 590);
      }
      v140 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v141 = NFSharedLogGetLogger(v140);
      v142 = objc_claimAutoreleasedReturnValue(v141);
      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
      {
        v143 = object_getClass(self);
        if (class_isMetaClass(v143))
          v144 = 43;
        else
          v144 = 45;
        v145 = object_getClassName(self);
        v146 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v164 = v144;
        v165 = 2082;
        v166 = v145;
        v167 = 2082;
        v168 = v146;
        v169 = 1024;
        v170 = 590;
        _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value has been overwritten", buf, 0x22u);
      }

      v132 = 1;
    }
    goto LABEL_119;
  }
  v101 = v100;
  v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v103 = NFLogGetLogger(v102);
  if (v103)
  {
    v104 = (void (*)(uint64_t, const char *, ...))v103;
    v105 = object_getClass(self);
    v106 = class_isMetaClass(v105);
    v149 = object_getClassName(self);
    v154 = sel_getName(a2);
    v107 = 45;
    if (v106)
      v107 = 43;
    v104(3, "%c[%{public}s %{public}s]:%i Failed to set dictionary : 0x%x", v107, v149, v154, 562, v101);
  }
  v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v109 = NFSharedLogGetLogger(v108);
  v110 = objc_claimAutoreleasedReturnValue(v109);
  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
  {
    v111 = object_getClass(self);
    if (class_isMetaClass(v111))
      v112 = 43;
    else
      v112 = 45;
    v113 = object_getClassName(self);
    v114 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v164 = v112;
    v165 = 2082;
    v166 = v113;
    v167 = 2082;
    v168 = v114;
    v169 = 1024;
    v170 = 562;
    v171 = 1024;
    LODWORD(v172) = v101;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set dictionary : 0x%x", buf, 0x28u);
  }

  CFRelease(v42);
  IOObjectRelease(v159);
  v37 = objc_alloc((Class)NSError);
  v38 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v161 = NSLocalizedDescriptionKey;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
  v162 = v39;
  v40 = &v162;
  v41 = &v161;
LABEL_88:
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v41, 1));
  v116 = objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 6, v115);

LABEL_89:
  return v116;
}

- (void)_setHeadlessModeFeature:(unint64_t)a3
{
  id v4;

  self->_headlessModeFeature = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", self->_headlessModeFeature, CFSTR("HeadlessFeatures"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("HeadlessFeaturesSetTime"));
  objc_msgSend(v4, "synchronize");

}

- (void)localeChanged
{
  id v2;

  if (self->_headlessModeFeature)
    v2 = sub_100203FD8(self);
}

- (void)headlessTimerLogic
{
  const __CFDate *v4;
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
  void *v17;
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
  const char *Name;
  const char *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;

  v4 = (const __CFDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
  -[NFTimer startTimer:](self->_rtcKickTimer, "startTimer:", 1200.0);
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
    v7(6, "%c[%{public}s %{public}s]:%i Setting RTC timer", v11, ClassName, Name, 755);
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
    v34 = v16;
    v35 = 2082;
    v36 = object_getClassName(self);
    v37 = 2082;
    v38 = sel_getName(a2);
    v39 = 1024;
    v40 = 755;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting RTC timer", buf, 0x22u);
  }

  if (IOPMSchedulePowerEvent(v4, CFSTR("com.apple.nfcd.headless"), CFSTR("poweron")))
  {
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFLogGetLogger(v17);
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(self);
      v32 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Failed to set RTC timer", v23, v22, v32, 759);
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
      *(_DWORD *)buf = 67109890;
      v34 = v28;
      v35 = 2082;
      v36 = v29;
      v37 = 2082;
      v38 = v30;
      v39 = 1024;
      v40 = 759;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set RTC timer", buf, 0x22u);
    }

  }
}

- (void)kickRTCTimer
{
  id v3;
  dispatch_queue_global_t global_queue;
  void *v5;
  NFTimer *v6;
  NFTimer *rtcKickTimer;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_requiresSilentCapabilityChecks)
  {
    if (!self->_rtcKickTimer)
    {
      objc_initWeak(&location, self);
      v3 = objc_alloc((Class)NFTimer);
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472;
      v10 = sub_1002072C4;
      v11 = &unk_1002E5C08;
      objc_copyWeak(&v12, &location);
      global_queue = dispatch_get_global_queue(0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v6 = (NFTimer *)objc_msgSend(v3, "initSleepTimerWithCallback:queue:", &v8, v5);
      rtcKickTimer = self->_rtcKickTimer;
      self->_rtcKickTimer = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[NFHeadlessModeController headlessTimerLogic](self, "headlessTimerLogic", v8, v9, v10, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rtcKickTimer, 0);
}

@end
