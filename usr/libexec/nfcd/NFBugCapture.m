@implementation NFBugCapture

- (NFBugCapture)init
{
  NFBugCapture *v3;
  Class v4;
  NSString *pendingRequest;
  NSString *componentName;
  NSMutableDictionary *additionalInfo;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSUserDefaults *userDefaults;
  NSString *type;
  NSString *subTypeContext;
  NFBugCapture *v17;
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
  const char *ClassName;
  const char *Name;
  objc_super v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;

  v34.receiver = self;
  v34.super_class = (Class)NFBugCapture;
  v3 = -[NFBugCapture init](&v34, "init");
  if (!v3)
    goto LABEL_4;
  v4 = NSClassFromString(CFSTR("LSApplicationWorkspace"));
  v3->_lsApplicationWorkspace = v4;
  if (v4)
  {
    pendingRequest = v3->_pendingRequest;
    v3->_pendingRequest = 0;

    componentName = v3->_componentName;
    v3->_componentName = 0;

    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = 0;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.stockholm.BugCapture", v11);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v12;

    userDefaults = v3->_userDefaults;
    v3->_userDefaults = 0;

    type = v3->_type;
    v3->_type = 0;

    subTypeContext = v3->_subTypeContext;
    v3->_subTypeContext = 0;

LABEL_4:
    v17 = v3;
    goto LABEL_15;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v20 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v3);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v3);
    Name = sel_getName(a2);
    v23 = 45;
    if (isMetaClass)
      v23 = 43;
    v20(3, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", v23, ClassName, Name, 77, CFSTR("LSApplicationWorkspace"));
  }
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v25 = NFSharedLogGetLogger(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = object_getClass(v3);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(v3);
    v30 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v36 = v28;
    v37 = 2082;
    v38 = v29;
    v39 = 2082;
    v40 = v30;
    v41 = 1024;
    v42 = 77;
    v43 = 2114;
    v44 = CFSTR("LSApplicationWorkspace");
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", buf, 0x2Cu);
  }

  v17 = 0;
LABEL_15:

  return v17;
}

+ (id)_getInstance
{
  if (qword_10032AAB8 != -1)
    dispatch_once(&qword_10032AAB8, &stru_1002EA0A0);
  return (id)qword_10032AAB0;
}

- (id)_buildTapToRadarURL
{
  NSMutableArray *v4;
  NSURLComponents *v5;
  NSString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *specific;
  uint64_t Logger;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *ClassName;
  const char *v55;
  const char *Name;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  NSURLComponents *v66;

  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSURLComponents);
  v6 = self->_pendingRequest;
  if (-[NSString isEqualToString:](self->_componentName, "isEqualToString:", CFSTR("NFC-SE")))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_additionalInfo, "removeObjectForKey:", CFSTR("FailureKey"));

    v7 = CFSTR("Crash/Hang/Data Loss");
    if (self->_additionalInfo)
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), self->_additionalInfo));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_additionalInfo, "objectForKeyedSubscript:", CFSTR("Status Word")));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_additionalInfo, "objectForKeyedSubscript:", CFSTR("Status Word")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Returned with status: %@ \n"), v10));
        v12 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v11));

        v8 = (__CFString *)v12;
      }
      v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_additionalInfo, "objectForKey:", CFSTR("Classification")));
      v14 = (void *)v13;
      if (v13)
        v15 = (__CFString *)v13;
      else
        v15 = CFSTR("Crash/Hang/Data Loss");
      v7 = v15;

    }
    else
    {
      v8 = &stru_1002ED8A8;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error: %@\n"), self->_pendingRequest));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v31));

    v16 = CFSTR("1414626");
    v17 = CFSTR("TTR");
    goto LABEL_23;
  }
  if (-[NSString isEqualToString:](self->_componentName, "isEqualToString:", CFSTR("Purple Stockholm")))
  {
    v16 = CFSTR("483780");
    v7 = CFSTR("Crash/Hang/Data Loss");
    v17 = CFSTR("1.0");
LABEL_23:
    if ((-[__CFString isEqual:](v16, "isEqual:", CFSTR("483780")) & 1) == 0)
    {
      v32 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("Please provide the following details inline (in RADAR DESCRIPTION) for transaction failures.\n\n****IMPORTANT****\n\nTransactional issues frequently require follow up at the site of the failure. Without merchant name and location, this is not possible. In order to facilitate and expedite investigation into your issue, please provide the following details inline (in RADAR DESCRIPTION). Thanks.\n\n1. Merchant name and location: \n\n2. Where was the error reported (e.g. in-store terminal, gas pump, transit gate, on phone/watch)? \n\n3. Has the card been used successfully at other merchants? (Yes/No): \n\n4. When was the last time this card worked at this merchant? (Specific date/'n' days ago/Never/I don't remember): \n\n5.Apple Card (yes/no)? \n\nPlease provide responses inline (in RADAR DESCRIPTION)")));

      v6 = (NSString *)v32;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentID"), v16));
    -[NSMutableArray addObject:](v4, "addObject:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentName"), self->_componentName));
    -[NSMutableArray addObject:](v4, "addObject:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentVersion"), v17));
    -[NSMutableArray addObject:](v4, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Classification"), v7));
    -[NSMutableArray addObject:](v4, "addObject:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try")));
    -[NSMutableArray addObject:](v4, "addObject:", v37);

    v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("NFC/SE TTR - %@"), self->_pendingRequest);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), v38));
    -[NSMutableArray addObject:](v4, "addObject:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Description"), v6));
    -[NSMutableArray addObject:](v4, "addObject:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), CFSTR("1")));
    -[NSMutableArray addObject:](v4, "addObject:", v41);

    -[NSURLComponents setScheme:](v5, "setScheme:", CFSTR("tap-to-radar"));
    -[NSURLComponents setHost:](v5, "setHost:", CFSTR("new"));
    -[NSURLComponents setQueryItems:](v5, "setQueryItems:", v4);
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v44 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v47 = 45;
      if (isMetaClass)
        v47 = 43;
      v44(6, "%c[%{public}s %{public}s]:%i URL: %{public}@", v47, ClassName, Name, 156, v5);
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
      *(_DWORD *)buf = 67110146;
      v58 = v52;
      v59 = 2082;
      v60 = object_getClassName(self);
      v61 = 2082;
      v62 = sel_getName(a2);
      v63 = 1024;
      v64 = 156;
      v65 = 2114;
      v66 = v5;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i URL: %{public}@", buf, 0x2Cu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v5, "URL"));
    goto LABEL_35;
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFLogGetLogger(v18);
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(self);
    v55 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with wrong component name. Should either be NFC-SE or Purple Stockholm", v24, v23, v55, 135);
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
    *(_DWORD *)buf = 67109890;
    v58 = v29;
    v59 = 2082;
    v60 = object_getClassName(self);
    v61 = 2082;
    v62 = sel_getName(a2);
    v63 = 1024;
    v64 = 135;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with wrong component name. Should either be NFC-SE or Purple Stockholm", buf, 0x22u);
  }

  v30 = 0;
  v7 = CFSTR("Crash/Hang/Data Loss");
LABEL_35:

  return v30;
}

- (void)_handleCallbackSync:(unint64_t)a3
{
  NSUserDefaults *userDefaults;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NSUserDefaults *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *subTypeContext;
  objc_class *v32;
  int v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  int v45;
  void *specific;
  uint64_t Logger;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  objc_class *v56;
  int v57;
  void *v58;
  void *v59;
  __CFRunLoop *Main;
  __CFRunLoopSource *runLoopSource;
  __CFUserNotification *userNotification;
  NSString *pendingRequest;
  NSString *componentName;
  NSMutableDictionary *additionalInfo;
  NSUserDefaults *v66;
  NSString *type;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *Name;
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    if (self->_componentName)
    {
      userDefaults = self->_userDefaults;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
      -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v7, CFSTR("NFTTRProhibitRequestsUntil"));

      -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
      if (a3 == 1)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v48 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v52 = 45;
          if (isMetaClass)
            v52 = 43;
          v48(6, "%c[%{public}s %{public}s]:%i NotNow response", v52, ClassName, Name, 191);
        }
        v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v54 = NFSharedLogGetLogger(v53);
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = object_getClass(self);
          if (class_isMetaClass(v56))
            v57 = 43;
          else
            v57 = 45;
          *(_DWORD *)buf = 67109890;
          v73 = v57;
          v74 = 2082;
          v75 = object_getClassName(self);
          v76 = 2082;
          v77 = sel_getName(a2);
          v78 = 1024;
          v79 = 191;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NotNow response", buf, 0x22u);
        }

      }
      else
      {
        if (a3 != 2)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[NFBugCapture _buildTapToRadarURL](self, "_buildTapToRadarURL"));
          if (v58)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultWorkspace](self->_lsApplicationWorkspace, "defaultWorkspace"));
            objc_msgSend(v59, "openURL:configuration:completionHandler:", v58, 0, 0);

          }
          goto LABEL_48;
        }
        v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v9 = NFLogGetLogger(v8);
        if (v9)
        {
          v10 = (void (*)(uint64_t, const char *, ...))v9;
          v11 = object_getClass(self);
          v12 = class_isMetaClass(v11);
          v13 = object_getClassName(self);
          v68 = sel_getName(a2);
          v14 = 45;
          if (v12)
            v14 = 43;
          v10(6, "%c[%{public}s %{public}s]:%i User canceled response", v14, v13, v68, 183);
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
          *(_DWORD *)buf = 67109890;
          v73 = v19;
          v74 = 2082;
          v75 = object_getClassName(self);
          v76 = 2082;
          v77 = sel_getName(a2);
          v78 = 1024;
          v79 = 183;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i User canceled response", buf, 0x22u);
        }

        v20 = self->_userDefaults;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
        -[NSUserDefaults setObject:forKey:](v20, "setObject:forKey:", v21, CFSTR("NFTTRProhibitRequestsUntil"));

        -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
      }
      +[NFBugCapture requestAutoBugCapture:withSubType:withSubTypeContext:](NFBugCapture, "requestAutoBugCapture:withSubType:withSubTypeContext:", self->_type, self->_pendingRequest, self->_subTypeContext);
LABEL_48:
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveSource(Main, self->_runLoopSource, kCFRunLoopCommonModes);
      runLoopSource = self->_runLoopSource;
      if (runLoopSource)
        CFRelease(runLoopSource);
      self->_runLoopSource = 0;
      userNotification = self->_userNotification;
      if (userNotification)
        CFRelease(userNotification);
      self->_userNotification = 0;
      pendingRequest = self->_pendingRequest;
      self->_pendingRequest = 0;

      componentName = self->_componentName;
      self->_componentName = 0;

      additionalInfo = self->_additionalInfo;
      self->_additionalInfo = 0;

      v66 = self->_userDefaults;
      self->_userDefaults = 0;

      type = self->_type;
      self->_type = 0;

      subTypeContext = self->_subTypeContext;
      self->_subTypeContext = 0;
      goto LABEL_53;
    }
    v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v36 = NFLogGetLogger(v35);
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(self);
      v39 = class_isMetaClass(v38);
      v40 = object_getClassName(self);
      v70 = sel_getName(a2);
      v41 = 45;
      if (v39)
        v41 = 43;
      v37(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no component name", v41, v40, v70, 172);
    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    subTypeContext = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(subTypeContext, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(self);
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      *(_DWORD *)buf = 67109890;
      v73 = v45;
      v74 = 2082;
      v75 = object_getClassName(self);
      v76 = 2082;
      v77 = sel_getName(a2);
      v78 = 1024;
      v79 = 172;
      v34 = "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no component name";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, subTypeContext, OS_LOG_TYPE_ERROR, v34, buf, 0x22u);
    }
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
      v69 = sel_getName(a2);
      v28 = 45;
      if (v26)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", v28, v27, v69, 169);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    subTypeContext = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(subTypeContext, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      *(_DWORD *)buf = 67109890;
      v73 = v33;
      v74 = 2082;
      v75 = object_getClassName(self);
      v76 = 2082;
      v77 = sel_getName(a2);
      v78 = 1024;
      v79 = 169;
      v34 = "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request";
      goto LABEL_33;
    }
  }
LABEL_53:

}

+ (void)handleCallback:(unint64_t)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  unint64_t v9;

  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NFBugCapture _getInstance](NFBugCapture, "_getInstance"));
  v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100187A18;
    v7[3] = &unk_1002E5C30;
    v8 = v4;
    v9 = a3;
    dispatch_async(v6, v7);

  }
}

- (void)_requestTapToRadarSync:(id)a3 componentName:(id)a4 preferences:(id)a5 withType:(id)a6 withSubTypeContext:(id)a7 additionalInfo:(id)a8
{
  id v15;
  __CFString *v16;
  id *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  id v23;
  _BOOL4 v24;
  const char *v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  char v40;
  void *specific;
  uint64_t Logger;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
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
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, const char *, ...);
  objc_class *v71;
  _BOOL4 v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  id v82;
  const __CFString *v83;
  NSUserDefaults *v84;
  NSUserDefaults *userDefaults;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  objc_class *v97;
  int v98;
  const char *v99;
  const char *v100;
  NSUserDefaults *v101;
  uint64_t v102;
  void *v103;
  const __CFDictionary *v104;
  __CFUserNotification *v105;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  void *v108;
  uint64_t v109;
  void (*v110)(uint64_t, const char *, ...);
  objc_class *v111;
  _BOOL4 v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSObject *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  NSMutableDictionary *v122;
  NSMutableDictionary *additionalInfo;
  NSString *v124;
  NSUserDefaults *subTypeContext;
  void *v126;
  uint64_t v127;
  void (*v128)(uint64_t, const char *, ...);
  objc_class *v129;
  _BOOL4 v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  objc_class *v137;
  int v138;
  const char *v139;
  const char *v140;
  __CFUserNotification *userNotification;
  void *v142;
  uint64_t v143;
  void (*v144)(uint64_t, const char *, ...);
  objc_class *v145;
  _BOOL4 v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  objc_class *v152;
  int v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *Name;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *ClassName;
  const __CFDictionary *v169;
  id obj;
  id *location;
  void *v172;
  __CFString *v173;
  id v174;
  id v175;
  SInt32 error;
  _QWORD v177[7];
  _QWORD v178[7];
  _BYTE buf[28];
  __int16 v180;
  int v181;
  __int16 v182;
  NSObject *v183;

  v15 = a3;
  v175 = a4;
  v16 = (__CFString *)a5;
  v174 = a6;
  v17 = (id *)a7;
  v18 = a8;
  if ((NFProductIsDevBoard() & 1) == 0 && (NFProductIsVM() & 1) == 0 && !NFProductIsNED())
  {
    obj = a6;
    v172 = v18;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("FailureKey")));
    v173 = v16;
    if (v30)
    {
      location = v17;
      v35 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("nfcd"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v30));

      if (v36
        && (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v30)),
            v38 = objc_msgSend(v37, "integerValue"),
            v37,
            !v38))
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v43 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v46 = 45;
          if (isMetaClass)
            v46 = 43;
          v43(6, "%c[%{public}s %{public}s]:%i Ignoring TTR callback. Toggle switch for this failure is set to OFF in Stockholm internal settings.", v46, ClassName, Name, 371);
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
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v51;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = object_getClassName(self);
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = sel_getName(a2);
          v180 = 1024;
          v181 = 371;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring TTR callback. Toggle switch for this failure is set to OFF in Stockholm internal settings.", buf, 0x22u);
        }

        v40 = 0;
        v16 = v173;
      }
      else
      {
        if (-[NSObject isEqual:](v30, "isEqual:", CFSTR("ttrTransaction")))
          usleep(0x2625A0u);
        if (location)
        {
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:"));

          v40 = 1;
          v15 = (id)v39;
        }
        else
        {
          v40 = 1;
        }
      }

      v17 = location;
    }
    else
    {
      v40 = 1;
    }
    error = 0;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_pendingRequest && self->_componentName)
    {
      v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = NFLogGetLogger(v52);
      if (v53)
      {
        v54 = (void (*)(uint64_t, const char *, ...))v53;
        v55 = object_getClass(self);
        v56 = class_isMetaClass(v55);
        v57 = object_getClassName(self);
        v163 = sel_getName(a2);
        v58 = 45;
        if (v56)
          v58 = 43;
        v54(3, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", v58, v57, v163, 391);
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
        *(_DWORD *)&buf[4] = v63;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v64;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v65;
        v180 = 1024;
        v181 = 391;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", buf, 0x22u);
      }
      v34 = v174;
      v33 = v175;
      v18 = v172;
      v16 = v173;
      goto LABEL_106;
    }
    if (!qword_10032AAC0)
    {
      *(_OWORD *)buf = off_1002EA110;
      *(_QWORD *)&buf[16] = 0;
      qword_10032AAC0 = _sl_dlopen(buf, 0);
    }
    if (!qword_10032AAC0
      || (sub_100188DD8(), v67 = (void *)objc_claimAutoreleasedReturnValue(v66), v67, !v67))
    {
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFLogGetLogger(v68);
      if (v69)
      {
        v70 = (void (*)(uint64_t, const char *, ...))v69;
        v71 = object_getClass(self);
        v72 = class_isMetaClass(v71);
        v73 = object_getClassName(self);
        v164 = sel_getName(a2);
        v74 = 45;
        if (v72)
          v74 = 43;
        v156 = v73;
        v16 = v173;
        v70(3, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", v74, v156, v164, 397);
      }
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
        v81 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v79;
        v16 = v173;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v80;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v81;
        v180 = 1024;
        v181 = 397;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", buf, 0x22u);
      }

      v40 = 0;
    }
    v82 = objc_alloc((Class)NSUserDefaults);
    if (v16)
      v83 = v16;
    else
      v83 = CFSTR("com.apple.nfcd.nfttr");
    v84 = (NSUserDefaults *)objc_msgSend(v82, "initWithSuiteName:", v83);
    userDefaults = self->_userDefaults;
    self->_userDefaults = v84;

    v61 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("NFTTRProhibitRequestsUntil")));
    if (v61
      && (v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
          v87 = -[NSObject compare:](v61, "compare:", v86),
          v86,
          v26 = v87 == (id)1,
          v16 = v173,
          v26))
    {
      v88 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v89 = NFLogGetLogger(v88);
      if (v89)
      {
        v90 = (void (*)(uint64_t, const char *, ...))v89;
        v91 = object_getClass(self);
        v92 = class_isMetaClass(v91);
        v157 = object_getClassName(self);
        v165 = sel_getName(a2);
        v93 = 45;
        if (v92)
          v93 = 43;
        v90(6, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", v93, v157, v165, 406, v61);
      }
      v94 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v95 = NFSharedLogGetLogger(v94);
      v96 = objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v97 = object_getClass(self);
        if (class_isMetaClass(v97))
          v98 = 43;
        else
          v98 = 45;
        v99 = object_getClassName(self);
        v100 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v98;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v99;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v100;
        v180 = 1024;
        v181 = 406;
        v182 = 2114;
        v183 = v61;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", buf, 0x2Cu);
      }

      v101 = self->_userDefaults;
      self->_userDefaults = 0;

      v16 = v173;
    }
    else if ((v40 & 1) != 0)
    {
      v177[0] = kCFUserNotificationAlertHeaderKey;
      v177[1] = kCFUserNotificationAlertMessageKey;
      v178[0] = CFSTR("NFC/SE Error Detected!");
      v178[1] = CFSTR("Please file a Radar");
      v177[2] = kCFUserNotificationDefaultButtonTitleKey;
      v177[3] = kCFUserNotificationAlternateButtonTitleKey;
      v178[2] = CFSTR("File Radar");
      v178[3] = CFSTR("Not Now");
      v177[4] = kCFUserNotificationOtherButtonTitleKey;
      v177[5] = kCFUserNotificationAlertTopMostKey;
      v178[4] = CFSTR("Never bother me again");
      v178[5] = &__kCFBooleanTrue;
      sub_100188DD8();
      v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
      v177[6] = v103;
      v178[6] = &__kCFBooleanFalse;
      v104 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v178, v177, 7));

      v169 = v104;
      v105 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v104);
      self->_userNotification = v105;
      if (!v105 || error)
      {
        v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v127 = NFLogGetLogger(v126);
        if (v127)
        {
          v128 = (void (*)(uint64_t, const char *, ...))v127;
          v129 = object_getClass(self);
          v130 = class_isMetaClass(v129);
          v131 = object_getClassName(self);
          v132 = sel_getName(a2);
          v133 = 45;
          if (v130)
            v133 = 43;
          v159 = v131;
          v16 = v173;
          v128(3, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", v133, v159, v132, 431, error);
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
          *(_DWORD *)&buf[4] = v138;
          v16 = v173;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = v139;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v140;
          v180 = 1024;
          v181 = 431;
          v182 = 1024;
          LODWORD(v183) = error;
          _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", buf, 0x28u);
        }

        userNotification = self->_userNotification;
        v18 = v172;
        if (userNotification)
          CFRelease(userNotification);
        self->_userNotification = 0;
        subTypeContext = self->_userDefaults;
        self->_userDefaults = 0;
      }
      else
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v105, (CFUserNotificationCallBack)sub_100188EF0, 0);
        self->_runLoopSource = RunLoopSource;
        if (!RunLoopSource)
        {
          v142 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v143 = NFLogGetLogger(v142);
          if (v143)
          {
            v144 = (void (*)(uint64_t, const char *, ...))v143;
            v145 = object_getClass(self);
            v146 = class_isMetaClass(v145);
            v147 = object_getClassName(self);
            v167 = sel_getName(a2);
            v148 = 45;
            if (v146)
              v148 = 43;
            v160 = v147;
            v16 = v173;
            v144(3, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", v148, v160, v167, 441);
          }
          v149 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v150 = NFSharedLogGetLogger(v149);
          v151 = objc_claimAutoreleasedReturnValue(v150);
          if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
          {
            v152 = object_getClass(self);
            if (class_isMetaClass(v152))
              v153 = 43;
            else
              v153 = 45;
            v154 = object_getClassName(self);
            v155 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v153;
            v16 = v173;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = v154;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = v155;
            v180 = 1024;
            v181 = 441;
            _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", buf, 0x22u);
          }

          CFRelease(self->_userNotification);
          self->_userNotification = 0;
          subTypeContext = self->_userDefaults;
          self->_userDefaults = 0;
          v34 = v174;
          v33 = v175;
          v18 = v172;
          goto LABEL_105;
        }
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_runLoopSource, kCFRunLoopCommonModes);
        v108 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v109 = NFLogGetLogger(v108);
        if (v109)
        {
          v110 = (void (*)(uint64_t, const char *, ...))v109;
          v111 = object_getClass(self);
          v112 = class_isMetaClass(v111);
          v113 = object_getClassName(self);
          v166 = sel_getName(a2);
          v114 = 45;
          if (v112)
            v114 = 43;
          v158 = v113;
          v16 = v173;
          v110(6, "%c[%{public}s %{public}s]:%i TTR prompt created", v114, v158, v166, 449);
        }
        v115 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v116 = NFSharedLogGetLogger(v115);
        v117 = objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          v118 = object_getClass(self);
          if (class_isMetaClass(v118))
            v119 = 43;
          else
            v119 = 45;
          v120 = object_getClassName(self);
          v121 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v119;
          v16 = v173;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = v120;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v121;
          v180 = 1024;
          v181 = 449;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR prompt created", buf, 0x22u);
        }

        objc_storeStrong((id *)&self->_pendingRequest, v15);
        objc_storeStrong((id *)&self->_componentName, a4);
        v18 = v172;
        v122 = (NSMutableDictionary *)objc_msgSend(v172, "mutableCopy");
        additionalInfo = self->_additionalInfo;
        self->_additionalInfo = v122;

        objc_storeStrong((id *)&self->_type, obj);
        v124 = v17;
        subTypeContext = (NSUserDefaults *)self->_subTypeContext;
        self->_subTypeContext = v124;
      }
      v34 = v174;
      v33 = v175;
LABEL_105:

      goto LABEL_106;
    }
    v34 = v174;
    +[NFBugCapture requestAutoBugCapture:withSubType:withSubTypeContext:](NFBugCapture, "requestAutoBugCapture:withSubType:withSubTypeContext:", v174, v15, v17);
    v33 = v175;
    v18 = v172;
LABEL_106:

    goto LABEL_14;
  }
  v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v20 = NFLogGetLogger(v19);
  if (v20)
  {
    v21 = (void (*)(uint64_t, const char *, ...))v20;
    v22 = object_getClass(self);
    v23 = v18;
    v24 = class_isMetaClass(v22);
    v25 = object_getClassName(self);
    v161 = sel_getName(a2);
    v26 = !v24;
    v18 = v23;
    v27 = 45;
    if (!v26)
      v27 = 43;
    v21(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", v27, v25, v161, 356);
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
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v32;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = object_getClassName(self);
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = sel_getName(a2);
    v180 = 1024;
    v181 = 356;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", buf, 0x22u);
  }
  v34 = v174;
  v33 = v175;
LABEL_14:

}

- (void)_requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSUserDefaults *v13;
  NSUserDefaults *userDefaults;
  NSObject *v15;
  void *v16;
  id v17;
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
  NSUserDefaults *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  int v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  int v52;
  NSUserDefaults *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  objc_class *v67;
  int v68;
  const char *ClassName;
  const char *Name;
  const char *v71;
  const char *v72;
  const char *v73;
  _QWORD v74[6];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint8_t buf[8];
  _BYTE v80[36];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v10)
    {
      if (v11)
      {
        v13 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.nfcd.nfttr"));
        userDefaults = self->_userDefaults;
        self->_userDefaults = v13;

        v15 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("NFABCProhibitRequestsUntil")));
        if (v15
          && (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
              v17 = -[NSObject compare:](v15, "compare:", v16),
              v16,
              v17 == (id)1))
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
            v23 = 45;
            if (isMetaClass)
              v23 = 43;
            v20(6, "%c[%{public}s %{public}s]:%i ABC is prohibited until %{public}@", v23, ClassName, Name, 476, v15);
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
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v28;
            *(_WORD *)v80 = 2082;
            *(_QWORD *)&v80[2] = object_getClassName(self);
            *(_WORD *)&v80[10] = 2082;
            *(_QWORD *)&v80[12] = sel_getName(a2);
            *(_WORD *)&v80[20] = 1024;
            *(_DWORD *)&v80[22] = 476;
            *(_WORD *)&v80[26] = 2114;
            *(_QWORD *)&v80[28] = v15;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ABC is prohibited until %{public}@", buf, 0x2Cu);
          }

          v29 = self->_userDefaults;
          self->_userDefaults = 0;
        }
        else
        {
          v53 = self->_userDefaults;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
          -[NSUserDefaults setObject:forKey:](v53, "setObject:forKey:", v54, CFSTR("NFABCProhibitRequestsUntil"));

          -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
          v75 = 0;
          v76 = &v75;
          v77 = 0x2050000000;
          v55 = (void *)qword_10032AA98;
          v78 = qword_10032AA98;
          if (!qword_10032AA98)
          {
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)v80 = 3221225472;
            *(_QWORD *)&v80[8] = sub_100189D44;
            *(_QWORD *)&v80[16] = &unk_1002E5E30;
            *(_QWORD *)&v80[24] = &v75;
            sub_100189D44((uint64_t)buf);
            v55 = (void *)v76[3];
          }
          v56 = objc_retainAutorelease(v55);
          _Block_object_dispose(&v75, 8);
          v29 = (NSUserDefaults *)objc_alloc_init(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](v29, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("NFC/SE"), v9, v10, v12, CFSTR("Stockholm"), 0));
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_1001895D4;
          v74[3] = &unk_1002EA0F0;
          v74[4] = self;
          v74[5] = a2;
          -[NSUserDefaults snapshotWithSignature:delay:events:payload:actions:reply:](v29, "snapshotWithSignature:delay:events:payload:actions:reply:", v57, 0, 0, 0, v74, 0.0);

        }
        goto LABEL_48;
      }
      v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFLogGetLogger(v58);
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        v73 = sel_getName(a2);
        v64 = 45;
        if (v62)
          v64 = 43;
        v60(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype context.", v64, v63, v73, 467);
      }
      v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = NFSharedLogGetLogger(v65);
      v15 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67))
          v68 = 43;
        else
          v68 = 45;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v68;
        *(_WORD *)v80 = 2082;
        *(_QWORD *)&v80[2] = object_getClassName(self);
        *(_WORD *)&v80[10] = 2082;
        *(_QWORD *)&v80[12] = sel_getName(a2);
        *(_WORD *)&v80[20] = 1024;
        *(_DWORD *)&v80[22] = 467;
        v41 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype context.";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v41, buf, 0x22u);
      }
    }
    else
    {
      v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFLogGetLogger(v42);
      if (v43)
      {
        v44 = (void (*)(uint64_t, const char *, ...))v43;
        v45 = object_getClass(self);
        v46 = class_isMetaClass(v45);
        v47 = object_getClassName(self);
        v72 = sel_getName(a2);
        v48 = 45;
        if (v46)
          v48 = 43;
        v44(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype.", v48, v47, v72, 464);
      }
      v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v50 = NFSharedLogGetLogger(v49);
      v15 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v51 = object_getClass(self);
        if (class_isMetaClass(v51))
          v52 = 43;
        else
          v52 = 45;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v52;
        *(_WORD *)v80 = 2082;
        *(_QWORD *)&v80[2] = object_getClassName(self);
        *(_WORD *)&v80[10] = 2082;
        *(_QWORD *)&v80[12] = sel_getName(a2);
        *(_WORD *)&v80[20] = 1024;
        *(_DWORD *)&v80[22] = 464;
        v41 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype.";
        goto LABEL_47;
      }
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
      v35 = object_getClassName(self);
      v71 = sel_getName(a2);
      v36 = 45;
      if (v34)
        v36 = 43;
      v32(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error type.", v36, v35, v71, 461);
    }
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFSharedLogGetLogger(v37);
    v15 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v40;
      *(_WORD *)v80 = 2082;
      *(_QWORD *)&v80[2] = object_getClassName(self);
      *(_WORD *)&v80[10] = 2082;
      *(_QWORD *)&v80[12] = sel_getName(a2);
      *(_WORD *)&v80[20] = 1024;
      *(_DWORD *)&v80[22] = 461;
      v41 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error type.";
      goto LABEL_47;
    }
  }
LABEL_48:

}

+ (void)requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5
{
  void *specific;
  id v11;
  id v12;
  id v13;
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
  void *v25;
  const char *Name;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = a5;
  v12 = a4;
  v13 = a3;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v19 = 45;
    if (isMetaClass)
      v19 = 43;
    v15(6, "%c[%{public}s %{public}s]:%i Requesting Auto Bug Capture!", v19, ClassName, Name, 509);
  }
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v21 = NFSharedLogGetLogger(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = object_getClass(a1);
    if (class_isMetaClass(v23))
      v24 = 43;
    else
      v24 = 45;
    *(_DWORD *)buf = 67109890;
    v28 = v24;
    v29 = 2082;
    v30 = object_getClassName(a1);
    v31 = 2082;
    v32 = sel_getName(a2);
    v33 = 1024;
    v34 = 509;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Requesting Auto Bug Capture!", buf, 0x22u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NFBugCapture _getInstance](NFBugCapture, "_getInstance"));
  objc_msgSend(v25, "_requestAutoBugCapture:withSubType:withSubTypeContext:", v13, v12, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTypeContext, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
