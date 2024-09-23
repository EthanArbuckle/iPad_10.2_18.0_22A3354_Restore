@implementation NFBackgroundTagReadingManager

- (void)touchSystemReady:(BOOL)a3
{
  _BOOL4 v3;
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
  NSObject *workQueue;
  const char *ClassName;
  const char *Name;
  _QWORD block[5];
  BOOL v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;

  v3 = a3;
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
    v8(6, "%c[%{public}s %{public}s]:%i Ready=%d", v11, ClassName, Name, 845, v3);
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
    v23 = v16;
    v24 = 2082;
    v25 = object_getClassName(self);
    v26 = 2082;
    v27 = sel_getName(a2);
    v28 = 1024;
    v29 = 845;
    v30 = 1024;
    v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ready=%d", buf, 0x28u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventProcessingQueue);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008554;
  block[3] = &unk_1002E5BB8;
  block[4] = self;
  v21 = v3;
  dispatch_async(workQueue, block);
}

- (NFBackgroundTagReadingManager)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  _BYTE *v8;
  NFBackgroundTagReadingManager *v9;
  void *v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v26;
  const char *ClassName;
  const char *Name;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  const __CFString *v37;
  const __CFString *v38;
  NFBackgroundTagReadingManager *v39;
  NFTagAppProcessorDockKit *v40;
  NFTagAppProcessorAMSAccessory *v41;
  NFTagAppProcessorHomeKitAccessory *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  id *v47;
  NFTagAppLauncher *appLauncher;
  dispatch_queue_attr_t v49;
  NSObject *v50;
  dispatch_queue_attr_t v51;
  NSObject *v52;
  dispatch_queue_t v53;
  OS_dispatch_queue *eventProcessingQueue;
  SCPreferencesRef v55;
  id v56;
  void *v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  OS_os_transaction *keepAliveAssertion;
  NFTagAppLauncher *v73;
  _QWORD *v74;
  void *v75;
  void *v76;
  NFTagAppProcessorWallet *v77;
  id v78;
  objc_super v79;
  id location;
  _QWORD v81[4];
  _BYTE buf[44];
  __int16 v83;
  const __CFString *v84;

  v78 = a3;
  v8 = a4;
  v79.receiver = self;
  v79.super_class = (Class)NFBackgroundTagReadingManager;
  v9 = -[NFBackgroundTagReadingManager init](&v79, "init");
  if (!v9)
  {
LABEL_51:
    v39 = v9;
    goto LABEL_52;
  }
  if (!v78 || !v8)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v9);
      if (class_isMetaClass(Class))
        v26 = 43;
      else
        v26 = 45;
      ClassName = object_getClassName(v9);
      Name = sel_getName(a2);
      v29 = CFSTR("nil queue, ");
      if (v78)
        v29 = &stru_1002ED8A8;
      v30 = CFSTR("nil wrapper");
      if (v8)
        v30 = &stru_1002ED8A8;
      Logger(3, "%c[%{public}s %{public}s]:%i %{public}@%{public}@", v26, ClassName, Name, 142, v29, v30);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v18 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v33 = object_getClass(v9);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      v35 = object_getClassName(v9);
      v36 = sel_getName(a2);
      v37 = CFSTR("nil queue, ");
      if (v78)
        v37 = &stru_1002ED8A8;
      *(_DWORD *)buf = 67110402;
      v38 = CFSTR("nil wrapper");
      if (v8)
        v38 = &stru_1002ED8A8;
      *(_DWORD *)&buf[4] = v34;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = v35;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v36;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 142;
      *(_WORD *)&buf[34] = 2114;
      *(_QWORD *)&buf[36] = v37;
      v83 = 2114;
      v84 = v38;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@%{public}@", buf, 0x36u);
    }
    goto LABEL_34;
  }
  if ((v8[218] & 1) != 0)
  {
    v73 = [NFTagAppLauncher alloc];
    v77 = objc_opt_new(NFTagAppProcessorWallet);
    v81[0] = v77;
    v40 = [NFTagAppProcessorDockKit alloc];
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "xpcEventNotificationQueue"));
    v74 = sub_10019002C(v40, CFSTR("com.apple.dockaccessoryd.pairsetup"), v75);
    v81[1] = v74;
    v41 = objc_opt_new(NFTagAppProcessorAMSAccessory);
    v81[2] = v41;
    v42 = [NFTagAppProcessorHomeKitAccessory alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "xpcEventNotificationQueue"));
    v45 = sub_10013A378(v42, CFSTR("com.apple.nfcd.homekit.proxcard"), v44);
    v81[3] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 4));
    v47 = sub_1001CE89C((id *)&v73->super.isa, v46);
    appLauncher = v9->_appLauncher;
    v9->_appLauncher = (NFTagAppLauncher *)v47;

    v9->_userDefaultsOverride = 0;
    objc_storeStrong((id *)&v9->_driverWrapper, a4);
    objc_storeStrong((id *)&v9->_workQueue, a3);
    v49 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    v51 = dispatch_queue_attr_make_with_qos_class(v50, QOS_CLASS_USER_INITIATED, 0);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v53 = dispatch_queue_create("com.apple.nfcd.background.scan.eventProcessing", v52);
    eventProcessingQueue = v9->_eventProcessingQueue;
    v9->_eventProcessingQueue = (OS_dispatch_queue *)v53;

    v55 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("nfcd"), CFSTR("com.apple.radios.plist"));
    v9->_radiosPreferences = v55;
    if (v55)
    {
      sub_1001D798C((uint64_t)v9);
      memset(buf, 0, 40);
      v56 = objc_initWeak(&location, v9);
      *(_QWORD *)&buf[8] = v9;

      SCPreferencesSetCallback(v9->_radiosPreferences, (SCPreferencesCallBack)sub_1001D7C5C, (SCPreferencesContext *)buf);
      SCPreferencesSetDispatchQueue(v9->_radiosPreferences, (dispatch_queue_t)v9->_workQueue);
      objc_destroyWeak(&location);
    }
    else
    {
      v57 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v57);
      if (v58)
      {
        v59 = object_getClass(v9);
        if (class_isMetaClass(v59))
          v60 = 43;
        else
          v60 = 45;
        v61 = object_getClassName(v9);
        v62 = sel_getName("listenForAirplaneMode");
        v58(3, "%c[%{public}s %{public}s]:%i Failed to listen for Airplane mode", v60, v61, v62, 230);
      }
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v64 = NFSharedLogGetLogger(v63);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = object_getClass(v9);
        if (class_isMetaClass(v66))
          v67 = 43;
        else
          v67 = 45;
        v68 = object_getClassName(v9);
        v69 = sel_getName("listenForAirplaneMode");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v67;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v68;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v69;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 230;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to listen for Airplane mode", buf, 0x22u);
      }

    }
    if (v9->_airplaneMode)
      -[NFBackgroundTagReadingManager suspend](v9, "suspend");
    v70 = os_transaction_create("com.apple.nfcd.background.scan.keepalive");
    keepAliveAssertion = v9->_keepAliveAssertion;
    v9->_keepAliveAssertion = (OS_os_transaction *)v70;

    -[NFBackgroundTagReadingManager refreshUserDefaultsOverride](v9, "refreshUserDefaultsOverride");
    goto LABEL_51;
  }
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v10);
  if (v11)
  {
    v12 = object_getClass(v9);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(v9);
    v15 = sel_getName(a2);
    v11(6, "%c[%{public}s %{public}s]:%i No RF capabilites, no BG tag reading", v13, v14, v15, 148);
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(v9);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(v9);
    v22 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v20;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = v21;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = v22;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = 148;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No RF capabilites, no BG tag reading", buf, 0x22u);
  }
LABEL_34:

  v39 = 0;
  v9->_backgroundTagDetectState = 2;
LABEL_52:

  return v39;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __SCPreferences *radiosPreferences;
  id v5;
  os_unfair_lock_s *v6;
  NFTimer *suspendTimer;
  objc_super v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  if (self)
  {
    radiosPreferences = self->_radiosPreferences;
    if (radiosPreferences)
    {
      CFRelease(radiosPreferences);
      self->_radiosPreferences = 0;
    }
  }
  if (self->_backgroundTagDetectState != 2)
  {
    v5 = sub_100170854((uint64_t)NFCameraStateMonitor);
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v5);
    sub_1001715DC(v6, CFSTR("NFBackgroundTagReadingManager"));

  }
  sub_1001D7908((uint64_t)self);
  sub_1001D794C((uint64_t)self);
  suspendTimer = self->_suspendTimer;
  self->_suspendTimer = 0;

  v8.receiver = self;
  v8.super_class = (Class)NFBackgroundTagReadingManager;
  -[NFBackgroundTagReadingManager dealloc](&v8, "dealloc");
}

- (BOOL)isActive
{
  _BOOL8 v3;
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v3 = sub_1001EC974(self->_screenStateMonitor);
  v4 = sub_100170854((uint64_t)NFCameraStateMonitor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_100171B38(v5);

  if (self->_backgroundTagDetectState != 1)
    return 0;
  v7 = self->_suspend <= 0 && v3;
  if (!v7 || v6)
    return 0;
  if (self->_touchSensorMonitor)
    return self->_touchSystemReady;
  return 1;
}

- (BOOL)isSuspended
{
  return self->_suspend > 0;
}

- (void)suspend
{
  sub_1001D7EF0(self, 0);
}

- (void)queueSuspend
{
  sub_1001D7EF0(self, 1);
}

- (void)resume
{
  sub_1001D8134(self, 0);
}

- (void)queueResume
{
  sub_1001D8134(self, 1);
}

- (void)handleDetectedTags:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  _BOOL4 v22;
  void *specific;
  uint64_t Logger;
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
  uint64_t v37;
  void **p_backgroundNDEFTag;
  id v39;
  __CFString *v40;
  __CFString *v41;
  SEL v42;
  uint64_t (*v43)(__CFString *, SEL);
  uint64_t v44;
  NSObject *v45;
  __CFString *v46;
  __CFString *v47;
  SEL v48;
  uint64_t (*v49)(__CFString *, SEL);
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  __CFString *v65;
  objc_class *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *driverWrapper;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  NFDriverWrapper *v85;
  int v86;
  id v87;
  void *v88;
  void *v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  const __CFString *v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  int v100;
  const char *v101;
  const char *v102;
  const __CFString *v103;
  void *v104;
  void (*v105)(uint64_t, const char *, ...);
  objc_class *v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  void *v110;
  uint64_t v111;
  NSObject *v112;
  objc_class *v113;
  int v114;
  const char *v115;
  const char *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  objc_class *Class;
  uint64_t v123;
  const char *ClassName;
  const char *Name;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  objc_class *v129;
  int v130;
  const char *v131;
  const char *v132;
  id v133;
  id v134;
  id *p_suspendTimer;
  NFTimer *suspendTimer;
  uint64_t v137;
  NSObject *v138;
  NFDriverWrapper *v139;
  id v140;
  uint64_t v141;
  NSObject *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  NSObject *v151;
  id v152;
  NFDriverWrapper *v153;
  unsigned int v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  uint64_t v162;
  NSObject *v163;
  uint64_t v164;
  NFDriverWrapper *v165;
  unsigned int *tagTypeReadCount;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  unsigned int v174;
  void *v175;
  void *v176;
  char *sel;
  id v178;
  _QWORD v179[4];
  id v180[2];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  uint8_t v185[16];
  uint8_t v186[128];
  uint8_t buf[8];
  _BYTE v188[36];
  id v189;
  const __CFString *v190;
  const __CFString **v191;
  uint64_t v192;
  const __CFString *v193;
  const __CFString *v194;

  v178 = a3;
  v5 = NFSharedSignpostLog(v178);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_TAG_DETECTED", ", buf, 2u);
  }

  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", ", buf, 2u);
  }

  if (self->_backgroundTagDetectState != 1)
  {
    v16 = 0;
    goto LABEL_152;
  }
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v11 = v178;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v181, v186, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v182;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v182 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "type") != 10 && objc_msgSend(v15, "type"))
        {
          v12 = v15;
          goto LABEL_18;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v181, v186, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_18:

  v17 = v12;
  if (objc_msgSend(v17, "type") == 5)
  {
    *(_DWORD *)buf = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tagB"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pupi"));
    v20 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 4);
    v21 = objc_msgSend(v19, "isEqualToData:", v20);

    if (v21)
    {
      v22 = self->_suspendTimer == 0;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      if (v22)
      {
        if (Logger)
        {
          Class = object_getClass(self);
          if (class_isMetaClass(Class))
            v123 = 43;
          else
            v123 = 45;
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v25(6, "%c[%{public}s %{public}s]:%i Ignore non-compliant tag; suspend tag detect for %f",
            v123,
            ClassName,
            Name,
            416,
            0x3FF8000000000000);
        }
        v126 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v127 = NFSharedLogGetLogger(v126);
        v128 = objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        {
          v129 = object_getClass(self);
          if (class_isMetaClass(v129))
            v130 = 43;
          else
            v130 = 45;
          v131 = object_getClassName(self);
          v132 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v130;
          *(_WORD *)v188 = 2082;
          *(_QWORD *)&v188[2] = v131;
          *(_WORD *)&v188[10] = 2082;
          *(_QWORD *)&v188[12] = v132;
          *(_WORD *)&v188[20] = 1024;
          *(_DWORD *)&v188[22] = 416;
          *(_WORD *)&v188[26] = 2048;
          *(_QWORD *)&v188[28] = 0x3FF8000000000000;
          _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore non-compliant tag; suspend tag detect for %f",
            buf,
            0x2Cu);
        }

        objc_initWeak((id *)buf, self);
        -[NFBackgroundTagReadingManager suspend](self, "suspend");
        v133 = objc_alloc((Class)NFTimer);
        v179[0] = _NSConcreteStackBlock;
        v179[1] = 3221225472;
        v179[2] = sub_1001D9ADC;
        v179[3] = &unk_1002E6290;
        objc_copyWeak(v180, (id *)buf);
        v180[1] = (id)a2;
        v134 = objc_msgSend(v133, "initWithCallback:queue:", v179, self->_workQueue);
        suspendTimer = self->_suspendTimer;
        p_suspendTimer = (id *)&self->_suspendTimer;
        *p_suspendTimer = v134;

        objc_msgSend(*p_suspendTimer, "startTimer:", 1.5);
        objc_destroyWeak(v180);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (Logger)
        {
          v26 = object_getClass(self);
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName(self);
          v29 = sel_getName(a2);
          v25(4, "%c[%{public}s %{public}s]:%i Timer has already started", v27, v28, v29, 431);
        }
        v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v31 = NFSharedLogGetLogger(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = object_getClass(self);
          if (class_isMetaClass(v33))
            v34 = 43;
          else
            v34 = 45;
          v35 = object_getClassName(self);
          v36 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v34;
          *(_WORD *)v188 = 2082;
          *(_QWORD *)&v188[2] = v35;
          *(_WORD *)&v188[10] = 2082;
          *(_QWORD *)&v188[12] = v36;
          *(_WORD *)&v188[20] = 1024;
          *(_DWORD *)&v188[22] = 431;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timer has already started", buf, 0x22u);
        }

      }
      v137 = NFSharedSignpostLog(v37);
      v138 = objc_claimAutoreleasedReturnValue(v137);
      if (os_signpost_enabled(v138))
      {
        *(_QWORD *)buf = 67240192;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v138, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", "tagProcessed=%{public, signpost.description:attribute}u", buf, 8u);
      }

      goto LABEL_165;
    }
  }
  else
  {

  }
  p_backgroundNDEFTag = (void **)&self->_backgroundNDEFTag;
  objc_storeStrong((id *)&self->_backgroundNDEFTag, v12);
  if (v17)
  {
    sel = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tagID"));
    v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(sel, "NF_asHexString"));
    v190 = 0;
    v191 = &v190;
    v192 = 0x2050000000;
    v40 = (__CFString *)qword_10032AB70;
    v193 = (const __CFString *)qword_10032AB70;
    if (!qword_10032AB70)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)v188 = 3221225472;
      *(_QWORD *)&v188[8] = sub_1001DAD8C;
      *(_QWORD *)&v188[16] = &unk_1002E5E30;
      *(_QWORD *)&v188[24] = &v190;
      sub_1001DAD8C((uint64_t)buf);
      v40 = (__CFString *)v191[3];
    }
    v41 = v40;
    _Block_object_dispose(&v190, 8);
    v42 = NSSelectorFromString(CFSTR("keyPathForNFCTagIdentifiers"));
    v43 = (uint64_t (*)(__CFString *, SEL))-[__CFString methodForSelector:](v41, "methodForSelector:", v42);
    if (v43 && (objc_opt_respondsToSelector(v41, v42) & 1) != 0)
    {
      v44 = v43(v41, v42);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (v45)
      {
        v190 = 0;
        v191 = &v190;
        v192 = 0x2050000000;
        v46 = (__CFString *)qword_10032AB78;
        v193 = (const __CFString *)qword_10032AB78;
        if (!qword_10032AB78)
        {
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)v188 = 3221225472;
          *(_QWORD *)&v188[8] = sub_1001DAF50;
          *(_QWORD *)&v188[16] = &unk_1002E5E30;
          *(_QWORD *)&v188[24] = &v190;
          sub_1001DAF50((uint64_t)buf);
          v46 = (__CFString *)v191[3];
        }
        v47 = v46;
        _Block_object_dispose(&v190, 8);
        v48 = NSSelectorFromString(CFSTR("userContext"));
        v49 = (uint64_t (*)(__CFString *, SEL))-[__CFString methodForSelector:](v47, "methodForSelector:", v48);
        if (v49 && (objc_opt_respondsToSelector(v47, v48) & 1) != 0)
        {
          v50 = v49(v47, v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          v189 = v39;
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v189, 1));
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v52, v45);

        }
      }
    }
    else
    {
      v53 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v53);
      if (v54)
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55))
          v56 = 43;
        else
          v56 = 45;
        v57 = object_getClassName(self);
        v58 = sel_getName("_updateLastNFCTag:");
        v54(3, "%c[%{public}s %{public}s]:%i keyPath not found", v56, v57, v58, 386);
      }
      v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFSharedLogGetLogger(v59);
      v45 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v61 = object_getClass(self);
        if (class_isMetaClass(v61))
          v62 = 43;
        else
          v62 = 45;
        v63 = object_getClassName(self);
        v64 = sel_getName("_updateLastNFCTag:");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v62;
        *(_WORD *)v188 = 2082;
        *(_QWORD *)&v188[2] = v63;
        *(_WORD *)&v188[10] = 2082;
        *(_QWORD *)&v188[12] = v64;
        *(_WORD *)&v188[20] = 1024;
        *(_DWORD *)&v188[22] = 386;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i keyPath not found", buf, 0x22u);
      }
    }

    v190 = 0;
    v191 = &v190;
    v192 = 0x2050000000;
    v65 = (__CFString *)qword_10032AB80;
    v193 = (const __CFString *)qword_10032AB80;
    if (!qword_10032AB80)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)v188 = 3221225472;
      *(_QWORD *)&v188[8] = sub_1001DB014;
      *(_QWORD *)&v188[16] = &unk_1002E5E30;
      *(_QWORD *)&v188[24] = &v190;
      sub_1001DB014((uint64_t)buf);
      v65 = (__CFString *)v191[3];
    }
    v66 = objc_retainAutorelease(v65);
    _Block_object_dispose(&v190, 8);
    v67 = objc_msgSend([v66 alloc], "initWithTagID:", v39);
    if (v67)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)v188 = buf;
      *(_QWORD *)&v188[8] = 0x2020000000;
      v68 = off_10032AB88;
      *(_QWORD *)&v188[16] = off_10032AB88;
      if (!off_10032AB88)
      {
        v69 = sub_1001DB0D8();
        v68 = dlsym(v69, "__BMRootLibrary");
        *(_QWORD *)(*(_QWORD *)v188 + 24) = v68;
        off_10032AB88 = v68;
      }
      _Block_object_dispose(buf, 8);
      if (!v68)
      {
        v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id<BMRootLibrary> NFBiomeLibrary(void)"));
        objc_msgSend(v175, "handleFailureInFunction:file:lineNumber:description:", v176, CFSTR("NFBackgroundTagReadingManager.m"), 64, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v70 = ((uint64_t (*)(void))v68)();
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "Device"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "Wireless"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "NFCTag"));

      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "source"));
      objc_msgSend(v75, "sendEvent:", v67);

    }
  }
  v76 = sub_100226308((uint64_t)NFTagReadCALogger);
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  sub_100226374((uint64_t)v77, *p_backgroundNDEFTag);

  v78 = *p_backgroundNDEFTag;
  if (!v78)
  {
    v81 = 0;
    v82 = 3;
    goto LABEL_143;
  }
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  objc_msgSend(v79, "notifyReaderModeActivityStart");

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (driverWrapper = (void *)sub_10017E9A4(driverWrapper, v78, 0), !(_DWORD)driverWrapper))
  {
    v83 = NFSharedSignpostLog(driverWrapper);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "start", buf, 2u);
    }

    v190 = 0;
    v191 = 0;
    v192 = 0;
    v85 = self->_driverWrapper;
    v189 = 0;
    v86 = sub_10017F4D4(v85, v78, (uint64_t *)&v190, (uint64_t)&v189);
    v87 = v189;
    v88 = v87;
    if (v86)
    {
      v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v90 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v89);
      if (v90)
      {
        v91 = object_getClass(self);
        if (class_isMetaClass(v91))
          v92 = 43;
        else
          v92 = 45;
        v93 = object_getClassName(self);
        v94 = sel_getName("_readNDEFFromTag:readResult:");
        if ((_BYTE)v192)
          v95 = CFSTR("readable");
        else
          v95 = CFSTR("not readable");
        v90(6, "%c[%{public}s %{public}s]:%i NDEF tag %{public}@", v92, v93, v94, 685, v95);
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
        v102 = sel_getName("_readNDEFFromTag:readResult:");
        v103 = CFSTR("readable");
        if (!(_BYTE)v192)
          v103 = CFSTR("not readable");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v100;
        *(_WORD *)v188 = 2082;
        *(_QWORD *)&v188[2] = v101;
        *(_WORD *)&v188[10] = 2082;
        *(_QWORD *)&v188[12] = v102;
        *(_WORD *)&v188[20] = 1024;
        *(_DWORD *)&v188[22] = 685;
        *(_WORD *)&v188[26] = 2114;
        *(_QWORD *)&v188[28] = v103;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NDEF tag %{public}@", buf, 0x2Cu);
      }

    }
    if (v88)
    {
      v104 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v105 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v104);
      if (v105)
      {
        v106 = object_getClass(self);
        if (class_isMetaClass(v106))
          v107 = 43;
        else
          v107 = 45;
        v108 = object_getClassName(self);
        v109 = sel_getName("_readNDEFFromTag:readResult:");
        v105(6, "%c[%{public}s %{public}s]:%i Tag does not contain NDEF, status=%{public}@", v107, v108, v109, 689, v88);
      }
      v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v111 = NFSharedLogGetLogger(v110);
      v112 = objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        v113 = object_getClass(self);
        if (class_isMetaClass(v113))
          v114 = 43;
        else
          v114 = 45;
        v115 = object_getClassName(self);
        v116 = sel_getName("_readNDEFFromTag:readResult:");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v114;
        *(_WORD *)v188 = 2082;
        *(_QWORD *)&v188[2] = v115;
        *(_WORD *)&v188[10] = 2082;
        *(_QWORD *)&v188[12] = v116;
        *(_WORD *)&v188[20] = 1024;
        *(_DWORD *)&v188[22] = 689;
        *(_WORD *)&v188[26] = 2114;
        *(_QWORD *)&v188[28] = v88;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag does not contain NDEF, status=%{public}@", buf, 0x2Cu);
      }

      if (objc_msgSend(v88, "code") == (id)51 || objc_msgSend(v88, "code") == (id)15)
      {
        sub_1001FBF60(self->_driverWrapper);
      }
      else
      {
        if (objc_msgSend(v88, "code") != (id)28)
        {
          if (objc_msgSend(v88, "code") == (id)37)
          {
            sub_10017EF78(self->_driverWrapper, v78, 1);
            +[NFLPCDStatisticsCALogger postAnalyticsLPCDStatistic:](NFLPCDStatisticsCALogger, "postAnalyticsLPCDStatistic:", &off_100306B78);
            v82 = 2;
          }
          else if (objc_msgSend(v88, "code") == (id)64)
          {
            v82 = 4;
          }
          else
          {
            v82 = 3;
          }
          goto LABEL_103;
        }
        sub_1001FF318(self->_driverWrapper);
      }
      v82 = 5;
LABEL_103:
      v117 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      objc_msgSend(v117, "notifyReaderModeActivityEnd");

      v119 = NFSharedSignpostLog(v118);
      v120 = objc_claimAutoreleasedReturnValue(v119);
      if (os_signpost_enabled(v120))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v120, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "done", buf, 2u);
      }
      v81 = 0;
      goto LABEL_142;
    }
    if ((_BYTE)v192)
    {
      v139 = self->_driverWrapper;
      *(_QWORD *)buf = 0;
      v140 = sub_100182148(v139, v78, v190, buf);
      v120 = objc_claimAutoreleasedReturnValue(v140);
      v87 = *(id *)buf;
      v88 = v87;
    }
    else
    {
      v88 = 0;
      v120 = 0;
    }
    v141 = NFSharedSignpostLog(v87);
    v142 = objc_claimAutoreleasedReturnValue(v141);
    if (os_signpost_enabled(v142))
    {
      *(_WORD *)v185 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v142, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "tag read", v185, 2u);
    }

    v143 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    objc_msgSend(v143, "notifyReaderModeActivityEnd");

    v145 = NFSharedSignpostLog(v144);
    v146 = objc_claimAutoreleasedReturnValue(v145);
    if (os_signpost_enabled(v146))
    {
      *(_WORD *)v185 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v146, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LPCD_READ_NDEF", "done", v185, 2u);
    }

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject asData](v120, "asData"));
    v148 = objc_msgSend(v147, "length");

    v149 = sub_100226308((uint64_t)NFTagReadCALogger);
    v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
    sub_10022684C((uint64_t)v150, (uint64_t)v148);

    if (v88)
    {
      if (objc_msgSend(v88, "code") == (id)51)
      {
        sub_1001FBF60(self->_driverWrapper);
LABEL_137:
        v81 = 0;
        v82 = 3;
LABEL_142:

        goto LABEL_143;
      }
      v152 = objc_msgSend(v88, "code");
      v153 = self->_driverWrapper;
      if (v152 == (id)21)
      {
        sub_1001FF318(v153);
        goto LABEL_137;
      }
      sub_10017EF78(v153, v78, 1);
      v151 = v120;
      v120 = v151;
    }
    else
    {
      sub_10017EF78(self->_driverWrapper, v78, 1);
      v151 = v120;
      v120 = v151;
      v88 = 0;
    }
    v82 = 3;
    v81 = v151;
    goto LABEL_142;
  }
  if ((_DWORD)driverWrapper == 51)
    sub_1001FBF60(self->_driverWrapper);
  else
    sub_1001FF318(self->_driverWrapper);
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  objc_msgSend(v121, "notifyReaderModeActivityEnd");

  v81 = 0;
  v82 = 5;
LABEL_143:

  if (sub_1001CEC90((uint64_t)self->_appLauncher, self->_backgroundNDEFTag, v81))
  {
    v154 = objc_msgSend(*p_backgroundNDEFTag, "type") - 1;
    if (v154 <= 0xE && ((0x65EDu >> v154) & 1) != 0)
      ++*(_DWORD *)((char *)&self->super.isa + qword_10026A928[v154]);
    v82 = 1;
    v16 = 1;
    if (!v81)
      goto LABEL_151;
    goto LABEL_150;
  }
  v16 = 0;
  if (v81)
  {
LABEL_150:
    v155 = sub_100226308((uint64_t)NFTagReadCALogger);
    v156 = (void *)objc_claimAutoreleasedReturnValue(v155);
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject asData](v81, "asData"));
    sub_10022684C((uint64_t)v156, (uint64_t)objc_msgSend(v157, "length"));

  }
LABEL_151:
  v158 = sub_100226308((uint64_t)NFTagReadCALogger);
  v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
  sub_100226958((uint64_t)v159, v82);

  v160 = sub_100226308((uint64_t)NFTagReadCALogger);
  v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
  sub_100226434((uint64_t)v161, *p_backgroundNDEFTag, objc_msgSend(*p_backgroundNDEFTag, "type"));

LABEL_152:
  v162 = NFSharedSignpostLog(v10);
  v163 = objc_claimAutoreleasedReturnValue(v162);
  if (os_signpost_enabled(v163))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v163, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "handleDetectedTags", "tagProcessed=%{public, signpost.description:attribute}u", buf, 8u);
  }

  v165 = self->_driverWrapper;
  if (v165 && v165->_hasAntenna)
  {
    tagTypeReadCount = self->_tagTypeReadCount;
    if (*(_QWORD *)self->_tagTypeReadCount
      || self->_tagTypeReadCount[2]
      || self->_tagTypeReadCount[3]
      || self->_tagTypeReadCount[4])
    {
      v190 = CFSTR("tagType1ReadSuccessCount");
      v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
      *(_QWORD *)buf = v167;
      v191 = (const __CFString **)CFSTR("tagType2ReadSuccessCount");
      v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tagTypeReadCount[1]));
      *(_QWORD *)v188 = v168;
      v192 = (uint64_t)CFSTR("tagType3ReadSuccessCount");
      v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tagTypeReadCount[2]));
      *(_QWORD *)&v188[8] = v169;
      v193 = CFSTR("tagType4ReadSuccessCount");
      v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tagTypeReadCount[3]));
      *(_QWORD *)&v188[16] = v170;
      v194 = CFSTR("tagType5ReadSuccessCount");
      v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tagTypeReadCount[4]));
      *(_QWORD *)&v188[24] = v171;
      v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v190, 5));
      +[NFLPCDStatisticsCALogger postAnalyticsLPCDStatistic:](NFLPCDStatisticsCALogger, "postAnalyticsLPCDStatistic:", v172);

    }
    *(_QWORD *)tagTypeReadCount = 0;
    *((_QWORD *)tagTypeReadCount + 1) = 0;
    tagTypeReadCount[4] = 0;
  }
  if (NFIsInternalBuild(v164))
  {
    v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v174 = objc_msgSend(v173, "BOOLForKey:", CFSTR("postBackgroundTagEvents"));

    if (v174)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.nfcd.backgroundTag.detect.event"), 0, 0, 1);
LABEL_165:

    }
  }

}

- (id)getECPFrame
{
  id v3;
  id v4;
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  id v8;
  os_unfair_lock_s *v9;

  if (self->_ecpCHEnableCount)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &unk_10026A920, 8);
    v4 = sub_100172E84((uint64_t)NFLPCDRandomGenerator);
    v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v4);
    v6 = sub_100173588(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    objc_msgSend(v3, "appendData:", v7);
    v8 = sub_100172E84((uint64_t)NFLPCDRandomGenerator);
    v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v8);
    self->_ecpCHRandom = sub_100173268(v9);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)start
{
  int64_t suspend;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  int64_t v20;
  id v21;
  id v22;
  void *v23;
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
  os_unfair_lock_s *v37;
  const char *Name;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;

  suspend = self->_suspend;
  if (self->_backgroundTagDetectState != 1)
  {
    if (suspend <= 0)
    {
      v21 = sub_100170854((uint64_t)NFCameraStateMonitor);
      v15 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v21);
      if (!sub_100171B84(v15, CFSTR("NFBackgroundTagReadingManager")))
        sub_100170A84(v15, self, CFSTR("NFBackgroundTagReadingManager"));
      if (self->_userDefaultsOverride != 1)
      {
        self->_backgroundTagDetectState = 1;
        v22 = sub_1001F84C8(self->_driverWrapper, CFSTR("TagReader"), 1uLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

        if (v23)
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
            v26(3, "%c[%{public}s %{public}s]:%i Fail background tag read configuration", v30, ClassName, Name, 550);
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
            v40 = v35;
            v41 = 2082;
            v42 = object_getClassName(self);
            v43 = 2082;
            v44 = sel_getName(a2);
            v45 = 1024;
            v46 = 550;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail background tag read configuration", buf, 0x22u);
          }

          self->_backgroundTagDetectState = 0;
        }
        else
        {
          sub_1001D84DC((void **)&self->super.isa);
          sub_1001D8488((uint64_t)self);
          v36 = sub_100172E84((uint64_t)NFLPCDRandomGenerator);
          v37 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v36);
          sub_100173704(v37);

        }
      }
      goto LABEL_29;
    }
LABEL_5:
    v5 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v6 = NFLogGetLogger(v5);
    if (v6)
    {
      v7 = (void (*)(uint64_t, const char *, ...))v6;
      v8 = object_getClass(self);
      v9 = class_isMetaClass(v8);
      v10 = object_getClassName(self);
      v11 = sel_getName(a2);
      v12 = 45;
      if (v9)
        v12 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i suspend count = %d", v12, v10, v11, 524, self->_suspend);
    }
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger(v13);
    v15 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      v20 = self->_suspend;
      *(_DWORD *)buf = 67110146;
      v40 = v17;
      v41 = 2082;
      v42 = v18;
      v43 = 2082;
      v44 = v19;
      v45 = 1024;
      v46 = 524;
      v47 = 1024;
      v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i suspend count = %d", buf, 0x28u);
    }
LABEL_29:

    return;
  }
  if (suspend >= 1)
    goto LABEL_5;
}

- (void)stop
{
  NFTag *backgroundNDEFTag;

  if (self->_backgroundTagDetectState)
  {
    sub_1001D7908((uint64_t)self);
    sub_1001D794C((uint64_t)self);
    self->_backgroundTagDetectState = 0;
    sub_1001FABB8(self->_driverWrapper, CFSTR("TagReader"));
    backgroundNDEFTag = self->_backgroundNDEFTag;
    self->_backgroundNDEFTag = 0;

  }
}

- (void)refreshUserDefaultsOverride
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("backgroundTagDetect")));

  v4 = v8;
  if (v8)
  {
    v5 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    {
      v6 = objc_msgSend(v8, "BOOLValue");
      v7 = 1;
      if (v6)
        v7 = 2;
    }
    else
    {
      v7 = 0;
    }
    v4 = v8;
  }
  else
  {
    v7 = 0;
  }
  self->_userDefaultsOverride = v7;

}

- (void)retainECPOption:(unint64_t)a3
{
  unsigned int ecpCHEnableCount;
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
  const char *Name;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  if ((a3 & 1) != 0)
  {
    ecpCHEnableCount = self->_ecpCHEnableCount;
    if (ecpCHEnableCount < 0xB)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v22 = ecpCHEnableCount;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unexpected retain count=%d", buf, 8u);
      ecpCHEnableCount = self->_ecpCHEnableCount;
    }
    if (ecpCHEnableCount == -1)
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
        v8(4, "%c[%{public}s %{public}s]:%i count overflow", v12, ClassName, Name, 642);
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
        *(_DWORD *)buf = 67109890;
        v22 = v17;
        v23 = 2082;
        v24 = v18;
        v25 = 2082;
        v26 = v19;
        v27 = 1024;
        v28 = 642;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i count overflow", buf, 0x22u);
      }

    }
    else
    {
LABEL_6:
      self->_ecpCHEnableCount = ecpCHEnableCount + 1;
    }
  }
}

- (void)releaseECPOption:(unint64_t)a3
{
  unsigned int ecpCHEnableCount;
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
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  if ((a3 & 1) != 0)
  {
    ecpCHEnableCount = self->_ecpCHEnableCount;
    if (ecpCHEnableCount)
    {
      self->_ecpCHEnableCount = ecpCHEnableCount - 1;
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
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v8(4, "%c[%{public}s %{public}s]:%i count underflow", v12, ClassName, Name, 653);
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
        v20 = v17;
        v21 = 2082;
        v22 = object_getClassName(self);
        v23 = 2082;
        v24 = sel_getName(a2);
        v25 = 1024;
        v26 = 653;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i count underflow", buf, 0x22u);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Retain count underflow", buf, 2u);
      }
    }
  }
}

- (void)didScreenStateChange:(int64_t)a3
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  NSObject *workQueue;
  const char *v24;
  _QWORD block[5];
  BOOL v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  const char *v38;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (a3 == 1)
      v13 = "yes";
    else
      v13 = "no";
    v24 = v13;
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i screenState=%ld -- allowBackgroundTagReading=%s", v14, ClassName, Name, 803, a3, v24);
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
    if (a3 == 1)
      v22 = "yes";
    else
      v22 = "no";
    v28 = v19;
    v29 = 2082;
    v30 = v20;
    v31 = 2082;
    v32 = v21;
    v33 = 1024;
    v34 = 803;
    v35 = 2048;
    v36 = a3;
    v37 = 2080;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i screenState=%ld -- allowBackgroundTagReading=%s", buf, 0x36u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventProcessingQueue);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DAA00;
  block[3] = &unk_1002E5BB8;
  v26 = a3 == 1;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)didCameraStateChange:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD block[4];
  BOOL v5;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DAB14;
  block[3] = &unk_1002EABB0;
  v5 = a3;
  dispatch_async(workQueue, block);
}

- (id)dumpState
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_backgroundTagDetectState));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("State"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_suspend));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("Suspend"));

  if (self->_appLauncher)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("App Launcher"));
  if (self->_backgroundNDEFTag)
    v7 = &off_100302D38;
  else
    v7 = &off_100302D50;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("Tag count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_userDefaultsOverride));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("Defaults Override"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_touchSystemReady));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("Touch Ready"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_airplaneMode));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, CFSTR("Airplane mode"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ecpCHEnableCount));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, CFSTR("CH Enable Count"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_eventProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_suspendTimer, 0);
  objc_storeStrong((id *)&self->_touchSensorEventTimer, 0);
  objc_storeStrong((id *)&self->_screenStateMonitor, 0);
  objc_storeStrong((id *)&self->_touchSensorMonitor, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_backgroundNDEFTag, 0);
}

@end
