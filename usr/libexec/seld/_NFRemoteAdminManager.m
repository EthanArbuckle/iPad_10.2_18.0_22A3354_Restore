@implementation _NFRemoteAdminManager

- (_NFRemoteAdminManager)init
{
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  dispatch_queue_attr_t v33;
  NSObject *v34;
  dispatch_queue_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v44;
  const char *ClassName;
  const char *Name;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  id v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
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
  const char *v84;
  const char *v85;
  void *v86;
  void (*v87)(uint64_t, const char *, ...);
  objc_class *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  objc_class *v95;
  int v96;
  const char *v97;
  const char *v98;
  nw_path_monitor_t v99;
  void *v100;
  nw_path_monitor_t v101;
  void *v102;
  nw_path_monitor_t v103;
  void *v104;
  nw_path_monitor_t v105;
  void *v106;
  unsigned __int8 *v107;
  NSObject *v108;
  unsigned __int8 *v109;
  NSObject *v110;
  unsigned __int8 *v111;
  NSObject *v112;
  unsigned __int8 *v113;
  NSObject *v114;
  unsigned __int8 *v115;
  id v117;
  objc_super v118;
  _QWORD v119[4];
  unsigned __int8 *v120;
  void **v121;
  uint64_t v122;
  void *v123;
  void *v124;
  char *v125;
  void **v126;
  uint64_t v127;
  void *v128;
  void *v129;
  id v130;
  void **update_handler;
  uint64_t v132;
  void *v133;
  void *v134;
  unsigned __int8 *v135;
  id location;
  unsigned __int8 md[8];
  _BYTE v138[26];
  __int16 v139;
  _BYTE v140[12];

  v118.receiver = self;
  v118.super_class = (Class)_NFRemoteAdminManager;
  v3 = -[_NFRemoteAdminManager init](&v118, "init");
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "dataForKey:", CFSTR("APNTokenUpdateInfo")));

    LOBYTE(v4) = v5 == 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = v6;
    if ((v4 & 1) != 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataForKey:", CFSTR("APNToken")));

      if (objc_msgSend(v8, "length"))
      {
        v9 = objc_retainAutorelease(v8);
        CC_SHA256(objc_msgSend(v9, "bytes"), (CC_LONG)objc_msgSend(v9, "length"), md);
        v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", md, 32, 0);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("APNTokenHash"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("APNToken"));

      }
    }
    else
    {
      objc_msgSend(v6, "removeObjectForKey:", CFSTR("APNTokenUpdateInfo"));

      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("APNToken"));
    }

    atomic_store(0, (unsigned __int8 *)v3 + 154);
    v12 = sub_100033D5C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)*((_QWORD *)v3 + 3);
    *((_QWORD *)v3 + 3) = v13;

    v15 = *((_QWORD *)v3 + 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v17 = objc_msgSend(v16, "integerForKey:", CFSTR("SecureElementSequenceCounter"));
    if (v15)
      *(_QWORD *)(v15 + 48) = v17;

    v18 = *((_QWORD *)v3 + 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringForKey:", CFSTR("SecureElementPlatformId")));
    sub_1000368B0(v18, v20);

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.seld.adminSession", v22);
    v24 = (void *)*((_QWORD *)v3 + 13);
    *((_QWORD *)v3 + 13) = v23;

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = dispatch_queue_create("com.apple.seld.aps", v26);
    v28 = (void *)*((_QWORD *)v3 + 10);
    *((_QWORD *)v3 + 10) = v27;

    v29 = objc_msgSend(objc_alloc((Class)NFPowerObserver), "initWithDelegate:", v3);
    v30 = (void *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = v29;

    v31 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v31;

    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = dispatch_queue_create("com.apple.seld.xpcConnection", v34);
    v36 = (void *)*((_QWORD *)v3 + 9);
    *((_QWORD *)v3 + 9) = v35;

    v117 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
    byte_10005C3E8 = objc_msgSend(v117, "BOOLForKey:", CFSTR("LogTSM"));
    v37 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/Library/Preferences/Logging/Subsystems/com.apple.nfc.plist"));
    v38 = v37;
    if (v37)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("LogTSM")));

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("LogTSM")));
        byte_10005C3E8 = objc_msgSend(v40, "BOOLValue");

        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
        if (Logger)
        {
          Class = object_getClass(v3);
          if (class_isMetaClass(Class))
            v44 = 43;
          else
            v44 = 45;
          ClassName = object_getClassName(v3);
          Name = sel_getName(a2);
          Logger(6, "%c[%{public}s %{public}s]:%i Overriding LogTSM value with managed profile: %d", v44, ClassName, Name, 293, byte_10005C3E8);
        }
        v47 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v48 = NFSharedLogGetLogger(v47);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = object_getClass(v3);
          if (class_isMetaClass(v50))
            v51 = 43;
          else
            v51 = 45;
          v52 = object_getClassName(v3);
          v53 = sel_getName(a2);
          *(_DWORD *)md = 67110146;
          *(_DWORD *)&md[4] = v51;
          *(_WORD *)v138 = 2082;
          *(_QWORD *)&v138[2] = v52;
          *(_WORD *)&v138[10] = 2082;
          *(_QWORD *)&v138[12] = v53;
          *(_WORD *)&v138[20] = 1024;
          *(_DWORD *)&v138[22] = 293;
          v139 = 1024;
          *(_DWORD *)v140 = byte_10005C3E8;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding LogTSM value with managed profile: %d", md, 0x28u);
        }

      }
    }
    v54 = objc_alloc_init((Class)NSLock);
    v55 = (void *)*((_QWORD *)v3 + 16);
    *((_QWORD *)v3 + 16) = v54;

    v3[153] = 0;
    v3[155] = 0;
    *(_QWORD *)(v3 + 156) = -1;
    sub_100017AAC((uint64_t)v3);
    v56 = objc_opt_new(NSMutableArray);
    v57 = (void *)*((_QWORD *)v3 + 21);
    *((_QWORD *)v3 + 21) = v56;

    v58 = objc_msgSend(objc_alloc((Class)NFXPCEventPublisher), "initWithStreamName:queue:", CFSTR("com.apple.seld.xpc.events"), *((_QWORD *)v3 + 9));
    v59 = (void *)*((_QWORD *)v3 + 28);
    *((_QWORD *)v3 + 28) = v58;

    update_handler = _NSConcreteStackBlock;
    v132 = 3221225472;
    v133 = sub_10001CD48;
    v134 = &unk_100054990;
    v135 = (unsigned __int8 *)v3;
    if ((sub_10001CDC8((uint64_t)v3, CFSTR("com.apple.seld.alarm"), &update_handler) & 1) == 0)
    {
      v60 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v60);
      if (v61)
      {
        v62 = object_getClass(v3);
        if (class_isMetaClass(v62))
          v63 = 43;
        else
          v63 = 45;
        v64 = object_getClassName(v3);
        v65 = sel_getName("registerActivityHandlers");
        v61(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v63, v64, v65, 720, CFSTR("com.apple.seld.alarm"));
      }
      v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFSharedLogGetLogger(v66);
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = object_getClass(v3);
        if (class_isMetaClass(v69))
          v70 = 43;
        else
          v70 = 45;
        v71 = object_getClassName(v3);
        v72 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v70;
        *(_WORD *)v138 = 2082;
        *(_QWORD *)&v138[2] = v71;
        *(_WORD *)&v138[10] = 2082;
        *(_QWORD *)&v138[12] = v72;
        *(_WORD *)&v138[20] = 1024;
        *(_DWORD *)&v138[22] = 720;
        v139 = 2112;
        *(_QWORD *)v140 = CFSTR("com.apple.seld.alarm");
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }

    }
    v126 = _NSConcreteStackBlock;
    v127 = 3221225472;
    v128 = sub_10001CE8C;
    v129 = &unk_100054990;
    v130 = v3;
    if ((sub_10001CDC8((uint64_t)v3, CFSTR("com.apple.seld.processing"), &v126) & 1) == 0)
    {
      v73 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v73);
      if (v74)
      {
        v75 = object_getClass(v3);
        if (class_isMetaClass(v75))
          v76 = 43;
        else
          v76 = 45;
        v77 = object_getClassName(v3);
        v78 = sel_getName("registerActivityHandlers");
        v74(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v76, v77, v78, 731, CFSTR("com.apple.seld.processing"));
      }
      v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFSharedLogGetLogger(v79);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v82 = object_getClass(v3);
        if (class_isMetaClass(v82))
          v83 = 43;
        else
          v83 = 45;
        v84 = object_getClassName(v3);
        v85 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v83;
        *(_WORD *)v138 = 2082;
        *(_QWORD *)&v138[2] = v84;
        *(_WORD *)&v138[10] = 2082;
        *(_QWORD *)&v138[12] = v85;
        *(_WORD *)&v138[20] = 1024;
        *(_DWORD *)&v138[22] = 731;
        v139 = 2112;
        *(_QWORD *)v140 = CFSTR("com.apple.seld.processing");
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }

    }
    v121 = _NSConcreteStackBlock;
    v122 = 3221225472;
    v123 = sub_10001CF0C;
    v124 = &unk_100054990;
    v125 = v3;
    if ((sub_10001CDC8((uint64_t)v3, CFSTR("com.apple.seld.osupdate"), &v121) & 1) == 0)
    {
      v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v86);
      if (v87)
      {
        v88 = object_getClass(v3);
        if (class_isMetaClass(v88))
          v89 = 43;
        else
          v89 = 45;
        v90 = object_getClassName(v3);
        v91 = sel_getName("registerActivityHandlers");
        v87(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v89, v90, v91, 742, CFSTR("com.apple.seld.osupdate"));
      }
      v92 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v93 = NFSharedLogGetLogger(v92);
      v94 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        v95 = object_getClass(v3);
        if (class_isMetaClass(v95))
          v96 = 43;
        else
          v96 = 45;
        v97 = object_getClassName(v3);
        v98 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v96;
        *(_WORD *)v138 = 2082;
        *(_QWORD *)&v138[2] = v97;
        *(_WORD *)&v138[10] = 2082;
        *(_QWORD *)&v138[12] = v98;
        *(_WORD *)&v138[20] = 1024;
        *(_DWORD *)&v138[22] = 742;
        v139 = 2112;
        *(_QWORD *)v140 = CFSTR("com.apple.seld.osupdate");
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }

    }
    *((_QWORD *)v3 + 27) = 15;
    v99 = nw_path_monitor_create_with_type(nw_interface_type_wifi);
    v100 = (void *)*((_QWORD *)v3 + 23);
    *((_QWORD *)v3 + 23) = v99;

    v101 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
    v102 = (void *)*((_QWORD *)v3 + 24);
    *((_QWORD *)v3 + 24) = v101;

    v103 = nw_path_monitor_create_with_type(nw_interface_type_wired);
    v104 = (void *)*((_QWORD *)v3 + 25);
    *((_QWORD *)v3 + 25) = v103;

    v105 = nw_path_monitor_create_with_type(nw_interface_type_other);
    v106 = (void *)*((_QWORD *)v3 + 26);
    *((_QWORD *)v3 + 26) = v105;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 23), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 24), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 25), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 26), *((dispatch_queue_t *)v3 + 13));
    objc_initWeak(&location, v3);
    *(_QWORD *)md = _NSConcreteStackBlock;
    *(_QWORD *)v138 = 3221225472;
    *(_QWORD *)&v138[8] = sub_100018CF4;
    *(_QWORD *)&v138[16] = &unk_1000548D8;
    objc_copyWeak((id *)&v138[24], &location);
    *(_QWORD *)&v140[4] = "_setupNetworkMonitor";
    v107 = objc_retainBlock(md);
    v108 = *((_QWORD *)v3 + 23);
    update_handler = _NSConcreteStackBlock;
    v132 = 3221225472;
    v133 = sub_1000192AC;
    v134 = &unk_100054900;
    v109 = v107;
    v135 = v109;
    nw_path_monitor_set_update_handler(v108, &update_handler);
    v110 = *((_QWORD *)v3 + 24);
    v126 = _NSConcreteStackBlock;
    v127 = 3221225472;
    v128 = sub_100019334;
    v129 = &unk_100054900;
    v111 = v109;
    v130 = v111;
    nw_path_monitor_set_update_handler(v110, &v126);
    v112 = *((_QWORD *)v3 + 25);
    v121 = _NSConcreteStackBlock;
    v122 = 3221225472;
    v123 = sub_1000193BC;
    v124 = &unk_100054900;
    v113 = v111;
    v125 = (char *)v113;
    nw_path_monitor_set_update_handler(v112, &v121);
    v114 = *((_QWORD *)v3 + 26);
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100019444;
    v119[3] = &unk_100054900;
    v115 = v113;
    v120 = v115;
    nw_path_monitor_set_update_handler(v114, v119);

    objc_destroyWeak((id *)&v138[24]);
    objc_destroyWeak(&location);

  }
  return (_NFRemoteAdminManager *)v3;
}

- (void)hardwareStateDidChange
{
  _NFRemoteAdminManager *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  OS_os_transaction *waitForNFCDTransaction;
  _NFRemoteAdminManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isRunning)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v4 = objc_msgSend(v3, "getHwSupport");
    if (v4 == 4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
      objc_msgSend(v6, "unregisterEventListener:", obj);

      waitForNFCDTransaction = obj->_waitForNFCDTransaction;
      obj->_waitForNFCDTransaction = 0;

    }
    else if (v4 == 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
      objc_msgSend(v5, "unregisterEventListener:", obj);

      sub_10001A438((uint64_t)obj);
LABEL_7:

      v2 = obj;
      goto LABEL_8;
    }
    sub_10001A5A4(obj);
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

}

- (void)powerObserverSystemWillSleep:(id)a3
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
  _NFRemoteAdminManager *v18;
  void *v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  NFAdminSession *activeSession;
  uint64_t v33;
  const char *Name;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;

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
    v8(6, "%c[%{public}s %{public}s]:%i System is sleeping", v12, ClassName, Name, 920);
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
    v36 = v17;
    v37 = 2082;
    v38 = object_getClassName(self);
    v39 = 2082;
    v40 = sel_getName(a2);
    v41 = 1024;
    v42 = 920;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is sleeping", buf, 0x22u);
  }

  v18 = self;
  objc_sync_enter(v18);
  if (v18->_activeSession)
  {
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v19);
    if (v20)
    {
      v21 = object_getClass(v18);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(v18);
      v24 = sel_getName(a2);
      v20(5, "%c[%{public}s %{public}s]:%i Aborting active session", v22, v23, v24, 923);
    }
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = object_getClass(v18);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(v18);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v36 = v29;
      v37 = 2082;
      v38 = v30;
      v39 = 2082;
      v40 = v31;
      v41 = 1024;
      v42 = 923;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting active session", buf, 0x22u);
    }

    -[NFAdminSession abort:](v18->_activeSession, "abort:", 4);
    activeSession = v18->_activeSession;
    v33 = objc_opt_class(NFRemoteAdminReaderSession);
    if ((objc_opt_isKindOfClass(activeSession, v33) & 1) == 0)
      v18->_sessionWasAbortedOnSleep = 1;
  }
  -[NFPowerObserver allowSleep](v18->_powerObserver, "allowSleep");
  objc_sync_exit(v18);

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
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

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
    v7(6, "%c[%{public}s %{public}s]:%i System is powered on", v11, ClassName, Name, 936);
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
    v19 = v16;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 936;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is powered on", buf, 0x22u);
  }

  if (self->_sessionWasAbortedOnSleep)
  {
    self->_sessionWasAbortedOnSleep = 0;
    sub_1000172F4((unsigned __int8 *)self);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 hardwareLoadComplete;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
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
  NSMutableSet *v28;
  NSObject *v29;
  void *v30;
  id v31;
  BOOL v32;
  void *specific;
  uint64_t Logger;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v37;
  const char *ClassName;
  const char *Name;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  unsigned int v48;
  void *v49;
  objc_class *v50;
  _BOOL4 isMetaClass;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  objc_class *v56;
  int v57;
  const char *v59;
  void *v60;
  _QWORD v62[6];
  _QWORD v63[6];
  uint8_t buf[8];
  _BYTE v65[52];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NFServiceWhitelistChecker), "initWithConnection:", v7);
  v60 = v6;
  if ((objc_msgSend(v8, "remoteAdminAccess") & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v35 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v37 = 43;
      else
        v37 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v40 = objc_msgSend(v7, "processIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
      v35(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", v37, ClassName, Name, 981, v40, v41, "com.apple.seld.tsmmanager");

    }
    v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v43 = NFSharedLogGetLogger(v42);
    v29 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(self);
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      v46 = object_getClassName(self);
      v47 = sel_getName(a2);
      v48 = objc_msgSend(v7, "processIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&buf[4] = v45;
      *(_WORD *)v65 = 2082;
      *(_QWORD *)&v65[2] = v46;
      *(_WORD *)&v65[10] = 2082;
      *(_QWORD *)&v65[12] = v47;
      *(_WORD *)&v65[20] = 1024;
      *(_DWORD *)&v65[22] = 981;
      *(_WORD *)&v65[26] = 1024;
      *(_DWORD *)&v65[28] = v48;
      *(_WORD *)&v65[32] = 2114;
      *(_QWORD *)&v65[34] = v49;
      *(_WORD *)&v65[42] = 2080;
      *(_QWORD *)&v65[44] = "com.apple.seld.tsmmanager";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", buf, 0x3Cu);

    }
    goto LABEL_33;
  }
  hardwareLoadComplete = self->_hardwareLoadComplete;
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFLogGetLogger(v10);
  v12 = (void (*)(uint64_t, const char *, ...))v11;
  if (!hardwareLoadComplete)
  {
    if (v11)
    {
      v50 = object_getClass(self);
      isMetaClass = class_isMetaClass(v50);
      v52 = object_getClassName(self);
      v59 = sel_getName(a2);
      v53 = 45;
      if (isMetaClass)
        v53 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Hardware isn't loaded. Rejecting XPC connections", v53, v52, v59, 986);
    }
    v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v55 = NFSharedLogGetLogger(v54);
    v29 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v56 = object_getClass(self);
      if (class_isMetaClass(v56))
        v57 = 43;
      else
        v57 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v57;
      *(_WORD *)v65 = 2082;
      *(_QWORD *)&v65[2] = object_getClassName(self);
      *(_WORD *)&v65[10] = 2082;
      *(_QWORD *)&v65[12] = sel_getName(a2);
      *(_WORD *)&v65[20] = 1024;
      *(_DWORD *)&v65[22] = 986;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware isn't loaded. Rejecting XPC connections", buf, 0x22u);
    }
LABEL_33:
    v32 = 0;
    goto LABEL_34;
  }
  if (v11)
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(self);
    v16 = sel_getName(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
    v12(6, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", v14, v15, v16, 990, v17, v7);

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
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)v65 = 2082;
    *(_QWORD *)&v65[2] = v23;
    *(_WORD *)&v65[10] = 2082;
    *(_QWORD *)&v65[12] = v24;
    *(_WORD *)&v65[20] = 1024;
    *(_DWORD *)&v65[22] = 990;
    *(_WORD *)&v65[26] = 2114;
    *(_QWORD *)&v65[28] = v25;
    *(_WORD *)&v65[36] = 2114;
    *(_QWORD *)&v65[38] = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", buf, 0x36u);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NFRemoteAdminManagerCallbacks interface](NFRemoteAdminManagerCallbacks, "interface"));
  objc_msgSend(v7, "setRemoteObjectInterface:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NFRemoteAdminManagerInterface interface](NFRemoteAdminManagerInterface, "interface"));
  objc_msgSend(v7, "setExportedInterface:", v27);

  objc_msgSend(v7, "setExportedObject:", self);
  v28 = objc_opt_new(NSMutableSet);
  v29 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v28, CFSTR("ProxyObjects")));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
  -[NSObject setObject:forKey:](v29, "setObject:forKey:", v30, CFSTR("ClientName"));

  -[NSObject setObject:forKey:](v29, "setObject:forKey:", v8, CFSTR("ServiceWhitelist"));
  objc_msgSend(v7, "setUserInfo:", v29);
  *(_QWORD *)buf = 0;
  *(_QWORD *)v65 = buf;
  *(_QWORD *)&v65[8] = 0x3032000000;
  *(_QWORD *)&v65[16] = sub_10001E434;
  *(_QWORD *)&v65[24] = sub_10001E444;
  v31 = v7;
  *(_QWORD *)&v65[32] = v31;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10001E44C;
  v63[3] = &unk_100054AC8;
  v63[4] = self;
  v63[5] = buf;
  objc_msgSend(v31, "setInvalidationHandler:", v63);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10001E6B4;
  v62[3] = &unk_100054AC8;
  v62[4] = self;
  v62[5] = buf;
  objc_msgSend(v31, "setInterruptionHandler:", v62);
  objc_msgSend(v31, "_setQueue:", self->_xpcConnectionQueue);
  objc_msgSend(v31, "resume");
  _Block_object_dispose(buf, 8);

  v32 = 1;
LABEL_34:

  return v32;
}

- (void)registerForCallbacks:(id)a3
{
  void *v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v10;
  const char *ClassName;
  const char *Name;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
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

  v26 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
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
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v8(6, "%c[%{public}s %{public}s]:%i Registering callback handler for %{public}@", v10, ClassName, Name, 1104, v14);

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
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v28 = v19;
    v29 = 2082;
    v30 = v20;
    v31 = 2082;
    v32 = v21;
    v33 = 1024;
    v34 = 1104;
    v35 = 2114;
    v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Registering callback handler for %{public}@", buf, 0x2Cu);

  }
  v24 = self->_callbackHandlers;
  objc_sync_enter(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (int)objc_msgSend(v5, "processIdentifier")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_callbackHandlers, "setObject:forKeyedSubscript:", v26, v25);

  objc_sync_exit(v24);
}

- (void)unregisterForCallbacks:(id)a3
{
  void *v5;
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
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", a3));
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
    v8(6, "%c[%{public}s %{public}s]:%i Unregistering callback handler for %{public}@", v15, ClassName, Name, 1120, v14);

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
    v26 = v20;
    v27 = 2082;
    v28 = v21;
    v29 = 2082;
    v30 = v22;
    v31 = 1024;
    v32 = 1120;
    v33 = 2114;
    v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unregistering callback handler for %{public}@", buf, 0x2Cu);

  }
  sub_10001E6C8((uint64_t)self, v5);

}

- (void)setRegistrationInfo:(id)a3 primaryRegionTopic:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  const char *Name;
  _QWORD v30[5];
  id v31;
  id v32;
  NSErrorUserInfoKey v33;
  void *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", v18, ClassName, Name, 1190, v9, v10);
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
    *(_DWORD *)buf = 67110402;
    v36 = v23;
    v37 = 2082;
    v38 = object_getClassName(self);
    v39 = 2082;
    v40 = sel_getName(a2);
    v41 = 1024;
    v42 = 1190;
    v43 = 2114;
    v44 = v9;
    v45 = 2114;
    v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", buf, 0x36u);
  }

  if ((sub_1000368F4(self->_storage, v9, v10) & 1) != 0)
  {
    v11[2](v11, 0);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001FCE8;
    v30[3] = &unk_100054B40;
    v30[4] = self;
    v31 = v9;
    v32 = v10;
    sub_10001F344(self, v30);

  }
  else
  {
    v24 = objc_alloc((Class)NSError);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v33 = NSLocalizedDescriptionKey;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
    v34 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v28 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 10, v27);
    ((void (**)(id, id))v11)[2](v11, v28);

  }
}

- (void)registrationInfoWithCompletion:(id)a3
{
  NFRemoteAdminStorage *storage;
  id v5;
  id v6;
  id v7;

  storage = self->_storage;
  v5 = a3;
  v6 = sub_100036110(storage);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v7, 0);

}

- (void)primaryRegionTopicWithCompletion:(id)a3
{
  NFRemoteAdminStorage *storage;
  id v5;
  id v6;
  id v7;

  storage = self->_storage;
  v5 = a3;
  v6 = sub_10003758C(storage);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v7, 0);

}

- (void)nextRequestForServer:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  _NFRemoteAdminManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002045C;
  v7[3] = &unk_100054B90;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  sub_10001F344(v8, v7);

}

- (void)connectToServer:(id)a3 initialClientRequestInfo:(id)a4 completion:(id)a5
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
  const char *v18;
  id v19;
  const char *v20;
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
  id v33;
  id v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  SEL v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;

  v9 = a3;
  v39 = a4;
  v38 = a5;
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
    v18 = a2;
    v19 = v9;
    v20 = Name;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v37 = v20;
    v9 = v19;
    a2 = v18;
    v23 = 45;
    if (isMetaClass)
      v23 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i Server connection request from %{public}@", v23, ClassName, v37, 1340, v22);

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
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_userInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v47 = v28;
    v48 = 2082;
    v49 = v29;
    v50 = 2082;
    v51 = v30;
    v52 = 1024;
    v53 = 1340;
    v54 = 2114;
    v55 = v32;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Server connection request from %{public}@", buf, 0x2Cu);

  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100022730;
  v40[3] = &unk_100054BE0;
  v40[4] = self;
  v41 = v10;
  v42 = v9;
  v43 = v39;
  v44 = v38;
  v45 = a2;
  v33 = v38;
  v34 = v39;
  v35 = v9;
  v36 = v10;
  sub_10001F344(self, v40);

}

- (void)queueServerConnection:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *v15;
  const char *Name;
  void *v17;
  void *v18;
  id v19;
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
  const char *v31;
  void *v32;
  _NFRemoteAdminManager *v33;
  _BOOL4 apsInited;
  const char *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  SEL v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;

  v36 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v15 = a2;
    Name = sel_getName(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v18 = v8;
    v19 = v7;
    v20 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v35 = Name;
    a2 = v15;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v35, 1382, v21, v36);

    v7 = v19;
    v8 = v18;
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
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v31 = a2;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v42 = v27;
    v43 = 2082;
    v44 = v28;
    v45 = 2082;
    v46 = v29;
    v47 = 1024;
    v48 = 1382;
    v49 = 2114;
    v50 = v32;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    a2 = v31;
  }

  v33 = self;
  objc_sync_enter(v33);
  apsInited = v33->_apsInited;
  objc_sync_exit(v33);

  if (apsInited)
  {
    sub_100022F00((void **)&v33->super.isa, v36, v7);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000237FC;
    v37[3] = &unk_100054C08;
    v37[4] = v33;
    v40 = a2;
    v38 = v8;
    v39 = v36;
    sub_10001F344(v33, v37);

  }
}

- (void)queueServerConnectionForApplets:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *v15;
  const char *Name;
  void *v17;
  void *v18;
  id v19;
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
  const char *v31;
  void *v32;
  _NFRemoteAdminManager *v33;
  _BOOL4 apsInited;
  const char *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  SEL v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;

  v36 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    v15 = a2;
    Name = sel_getName(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v18 = v8;
    v19 = v7;
    v20 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v35 = Name;
    a2 = v15;
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v35, 1449, v21, v36);

    v7 = v19;
    v8 = v18;
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
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v31 = a2;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v42 = v27;
    v43 = 2082;
    v44 = v28;
    v45 = 2082;
    v46 = v29;
    v47 = 1024;
    v48 = 1449;
    v49 = 2114;
    v50 = v32;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    a2 = v31;
  }

  v33 = self;
  objc_sync_enter(v33);
  apsInited = v33->_apsInited;
  objc_sync_exit(v33);

  if (apsInited)
  {
    sub_100023A0C(v33, v36, v7);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002451C;
    v37[3] = &unk_100054C08;
    v37[4] = v33;
    v40 = a2;
    v38 = v8;
    v39 = v36;
    sub_10001F344(v33, v37);

  }
}

- (void)ingestCard:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v16;
  id v17;
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
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  SEL v38;
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

  v7 = a3;
  v33 = a4;
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
    v16 = a2;
    v17 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v20 = 45;
    if (isMetaClass)
      v20 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, Name, 1627, v19);

    v7 = v17;
    a2 = v16;
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
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110146;
    v40 = v25;
    v41 = 2082;
    v42 = v26;
    v43 = 2082;
    v44 = v27;
    v45 = 1024;
    v46 = 1627;
    v47 = 2114;
    v48 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100025984;
  v34[3] = &unk_100054C80;
  v34[4] = self;
  v35 = v8;
  v36 = v7;
  v37 = v33;
  v38 = a2;
  v30 = v33;
  v31 = v7;
  v32 = v8;
  sub_10001F344(self, v34);

}

- (void)cancelCardIngestionWithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1672, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1672;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100026F08;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)getSELDInfoForBrokerWithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1719, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1719;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100027AA8;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)deleteAllAppletsAndCleanupWithTSMWithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1833, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1833;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100028BE4;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)deleteAllWalletAppletsAndCleanupWithTSMWithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1851, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1851;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000290FC;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)deleteAllSPAppletsAndCleanupWithTSMithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1870, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1870;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100029614;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)getAPNPublicTokenWithCompletion:(id)a3
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
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

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
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1901, v17);

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
    v35 = v23;
    v36 = 2082;
    v37 = v24;
    v38 = 2082;
    v39 = v25;
    v40 = 1024;
    v41 = 1901;
    v42 = 2114;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100029B2C;
  v30[3] = &unk_100054CA8;
  v30[4] = self;
  v31 = v6;
  v32 = v5;
  v33 = a2;
  v28 = v5;
  v29 = v6;
  sub_10001F344(self, v30);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
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
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  const char *Name;
  const char *v43;
  unsigned __int8 md[32];
  _BYTE state[18];
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  v5 = a4;
  v6 = _os_activity_create((void *)&_mh_execute_header, "connection:didReceivePublicToken:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v7 = v5;
  v8 = v7;
  if (self)
  {
    if (objc_msgSend(v7, "length"))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v10 = objc_retainAutorelease(v8);
      CC_SHA256(objc_msgSend(v10, "bytes"), (CC_LONG)objc_msgSend(v10, "length"), md);
      v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", md, 32, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dataForKey:](v9, "dataForKey:", CFSTR("APNTokenHash")));
      if ((objc_msgSend(v12, "isEqualToData:", v11) & 1) == 0)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v15 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName("_checkForAPNTokenUpdate:");
          v19 = 45;
          if (isMetaClass)
            v19 = 43;
          v15(5, "%c[%{public}s %{public}s]:%i New APN token received", v19, ClassName, Name, 872);
        }
        v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v21 = NFSharedLogGetLogger(v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = object_getClass(self);
          if (class_isMetaClass(v23))
            v24 = 43;
          else
            v24 = 45;
          v25 = object_getClassName(self);
          v26 = sel_getName("_checkForAPNTokenUpdate:");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v24;
          *(_WORD *)&state[8] = 2082;
          *(_QWORD *)&state[10] = v25;
          v46 = 2082;
          v47 = v26;
          v48 = 1024;
          v49 = 872;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New APN token received", state, 0x22u);
        }

        -[NSObject setObject:forKey:](v9, "setObject:forKey:", v11, CFSTR("APNTokenHash"));
        v27 = sub_100033D5C();
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        sub_100037D1C(v28, v10);

        sub_1000172F4((unsigned __int8 *)self);
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
        v43 = sel_getName("_checkForAPNTokenUpdate:");
        v35 = 45;
        if (v33)
          v35 = 43;
        v31(3, "%c[%{public}s %{public}s]:%i Inalid token", v35, v34, v43, 859);
      }
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v37 = NFSharedLogGetLogger(v36);
      v9 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v38 = object_getClass(self);
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(self);
        v41 = sel_getName("_checkForAPNTokenUpdate:");
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v39;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v40;
        v46 = 2082;
        v47 = v41;
        v48 = 1024;
        v49 = 859;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Inalid token", state, 0x22u);
      }
    }

  }
  sub_100019698(self);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  id v26;
  id v27;
  NFRemoteAdminStorage *storage;
  unsigned int v29;
  _UNKNOWN **v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const char *ClassName;
  const char *Name;
  id v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _BYTE state[18];
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  id v51;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = _os_activity_create((void *)&_mh_execute_header, "connection:didReceiveMessageForTopic:userInfo:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v12, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v15(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 1988, v9);
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
    *(_DWORD *)state = 67110146;
    *(_DWORD *)&state[4] = v23;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v24;
    v46 = 2082;
    v47 = v25;
    v48 = 1024;
    v49 = 1988;
    v50 = 2114;
    v51 = v9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", state, 0x2Cu);
  }

  v26 = objc_alloc_init((Class)NSDateFormatter);
  v27 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v26, "setLocale:", v27);

  objc_msgSend(v26, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss z"));
  storage = self->_storage;
  v43[0] = CFSTR("APNClientConnected");
  v29 = objc_msgSend(v11, "isConnected");
  v30 = &off_1000572C8;
  if (v29)
    v30 = &off_1000572B0;
  v44[0] = v30;
  v43[1] = CFSTR("APNTopicsRegistered");
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enabledTopics"));

  v44[1] = v31;
  v43[2] = CFSTR("CheckIn");
  v42[0] = v9;
  v41[0] = CFSTR("Reason");
  v41[1] = CFSTR("PushRxData");
  v32 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v10);

  v42[1] = v32;
  v41[2] = CFSTR("PushRxTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringFromDate:", v33));
  v42[2] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 3));
  v44[2] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
  sub_100037EA4(storage, v36, v9);

  v40 = v9;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  sub_10001E768((uint64_t)self, v37);

  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &off_100057370);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL4 v4;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;

  v4 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (v4)
      v14 = "connected";
    else
      v14 = "disconnected";
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v9(5, "%c[%{public}s %{public}s]:%i APS connection status - %s", v15, ClassName, Name, 2010, v14);
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
    *(_DWORD *)buf = 67110146;
    if (v4)
      v23 = "connected";
    else
      v23 = "disconnected";
    v25 = v20;
    v26 = 2082;
    v27 = v21;
    v28 = 2082;
    v29 = v22;
    v30 = 1024;
    v31 = 2010;
    v32 = 2080;
    v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS connection status - %s", buf, 0x2Cu);
  }

}

- (void)handleCardSessionToken:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_callbackHandlers;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_callbackHandlers, "allValues", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "readerModeCardSessionToken:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleCardIngestionStatus:(unint64_t)a3
{
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = self->_callbackHandlers;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_callbackHandlers, "allValues", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "readerModeCardIngestionStatus:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleAppletStateChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
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
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
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
  const __CFString *v39;
  id v40;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v39 = CFSTR("appletChanged");
    v40 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v11 = 43;
      else
        v11 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", v11, ClassName, Name, 2049, v7);
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
      v30 = v18;
      v31 = 2082;
      v32 = object_getClassName(self);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 2049;
      v37 = 2112;
      v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", buf, 0x2Cu);
    }

    -[NFXPCEventPublisher sendXpcNotificationEventWithDictionary:](self->_xpcEventPublisher, "sendXpcNotificationEventWithDictionary:", v7);
    v19 = self->_callbackHandlers;
    objc_sync_enter(v19);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_callbackHandlers, "allValues"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v23), "appletStateChange:", v6);
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v21);
    }

    objc_sync_exit(v19);
  }

}

- (void)handleAppletsDeleted:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
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
  const __CFString *v49;
  NSMutableDictionary *v50;
  _BYTE v51[128];

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v35;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_100057398, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v8);
    }

    v49 = CFSTR("appletsDeleted");
    v50 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v15 = 43;
      else
        v15 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", v15, ClassName, Name, 2068, v11);
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
      *(_DWORD *)buf = 67110146;
      v40 = v22;
      v41 = 2082;
      v42 = v23;
      v43 = 2082;
      v44 = v24;
      v45 = 1024;
      v46 = 2068;
      v47 = 2112;
      v48 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", buf, 0x2Cu);
    }

    -[NFXPCEventPublisher sendXpcNotificationEventWithDictionary:](self->_xpcEventPublisher, "sendXpcNotificationEventWithDictionary:", v11);
    v25 = self->_callbackHandlers;
    objc_sync_enter(v25);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_callbackHandlers, "allValues"));
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v31;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v29), "appletsDeleted:", v7);
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v27);
    }

    objc_sync_exit(v25);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_otherMonitor, 0);
  objc_storeStrong((id *)&self->_wiredMonitor, 0);
  objc_storeStrong((id *)&self->_cellularMonitor, 0);
  objc_storeStrong((id *)&self->_wifiMonitor, 0);
  objc_storeStrong((id *)&self->_waitForNFCDTransaction, 0);
  objc_storeStrong((id *)&self->_delayedXPCRequests, 0);
  objc_storeStrong((id *)&self->_keepAliveTransactionLock, 0);
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_activeServerState, 0);
  objc_storeStrong((id *)&self->_apsInitQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_apsInitTimer, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_NFRemoteAdminManagerService, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_callbackHandlers, 0);
}

@end
