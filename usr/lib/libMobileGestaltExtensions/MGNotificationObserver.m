@implementation MGNotificationObserver

- (void)startDynaStoreMonitoringWithArgument:(id)a3
{
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  const __CFString *v7;
  const __CFAllocator *v8;
  NSMutableArray *v9;
  CFStringRef ComputerName;
  const char *v11;
  uint64_t v12;
  const __CFArray *v13;
  NSMutableArray *darwinTokens;
  NSObject *global_queue;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  char v30;
  SCDynamicStoreContext context;
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  context.version = 0;
  context.info = self;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  context.copyDescription = 0;
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
    Identifier = CFBundleGetIdentifier(MainBundle);
  else
    Identifier = CFSTR("com.apple.mobilegestaltlistener");
  if (Identifier)
    v7 = Identifier;
  else
    v7 = CFSTR("com.apple.mobilegestaltlistener");
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = (NSMutableArray *)SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, (SCDynamicStoreCallBack)sub_1A40C23D8, &context);
  self->_registration._darwinTokens = v9;
  if (v9)
  {
    ComputerName = SCDynamicStoreKeyCreateComputerName(v8);
    v34[0] = ComputerName;
    v13 = (const __CFArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v34, 1, v12);
    if (ComputerName)
      CFRelease(ComputerName);
    if (SCDynamicStoreSetNotificationKeys(self->_registration._scPrefs, v13, 0))
    {
      darwinTokens = self->_registration._darwinTokens;
      global_queue = dispatch_get_global_queue(0, 0);
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)darwinTokens, global_queue);
    }
    else
    {
      v23 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
      if (v23)
        v29 = v23 + 1;
      else
        v29 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
      sub_1A40C0884((uint64_t)v29, 285, (uint64_t)CFSTR("Failed to register for %@"), v24, v25, v26, v27, v28, (char)a3);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = a3;
        _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to register for %@", buf, 0xCu);
      }
      CFRelease(self->_registration._darwinTokens);
      self->_registration._darwinTokens = 0;
    }
  }
  else
  {
    v16 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
    if (v16)
      v22 = v16 + 1;
    else
      v22 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
    sub_1A40C0884((uint64_t)v22, 294, (uint64_t)CFSTR("Failed to create dynamic store"), v17, v18, v19, v20, v21, v30);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create dynamic store", buf, 2u);
    }
  }
}

- (MGNotificationObserver)initWithType:(int)a3 argument:(id)a4
{
  MGNotificationObserver *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  NSObject *global_queue;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  int type;
  const __SCPreferences *v41;
  const __SCPreferences *scPrefs;
  NSObject *v43;
  MGFileWatcher *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  NSMutableArray *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSMutableArray *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  NSObject *v78;
  const char *v79;
  uint64_t (*v80)(uint64_t, const __CFString *, dispatch_queue_global_t, _QWORD);
  uint64_t v81;
  dispatch_queue_global_t v82;
  NSMutableArray *v83;
  uint64_t v84;
  void (*v85)(NSMutableArray *, uint64_t, _QWORD *);
  NSMutableArray *v86;
  uint64_t *v87;
  uint64_t v88;
  MGNotificationObserver *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  NSMutableArray *darwinTokens;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t j;
  int v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  CFIndex argument;
  uint32_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  char v146;
  _QWORD v147[5];
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD handler[5];
  int out_token;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  objc_super v159;
  SCPreferencesContext buf;
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v159.receiver = self;
  v159.super_class = (Class)MGNotificationObserver;
  v6 = -[MGNotificationObserver init](&v159, sel_init);
  if (v6)
  {
    v6->_blocks = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6->_type = a3;
    v7 = (NSString *)a4;
    v6->_argument = v7;
    switch(v6->_type)
    {
      case 1:
        v12 = (void *)objc_msgSend_componentsSeparatedByString_(v7, v8, (uint64_t)CFSTR(","), v10, v11);
        v6->_registration._darwinTokens = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v155, (uint64_t)v162, 16);
        if (!v14)
          goto LABEL_48;
        v19 = v14;
        v20 = *(_QWORD *)v156;
        while (1)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v156 != v20)
              objc_enumerationMutation(v12);
            v22 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * i);
            out_token = -1;
            v23 = (const char *)objc_msgSend_UTF8String(v22, v15, v16, v17, v18);
            global_queue = dispatch_get_global_queue(0, 0);
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = sub_1A40C23E0;
            handler[3] = &unk_1E4BA1090;
            handler[4] = v6;
            if (notify_register_dispatch(v23, &out_token, global_queue, handler))
            {
              v90 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
              if (v90)
                v96 = v90 + 1;
              else
                v96 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
              sub_1A40C0884((uint64_t)v96, 317, (uint64_t)CFSTR("failed to register for %@ notification"), v91, v92, v93, v94, v95, (char)v22);
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.version) = 138412290;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v22;
                _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to register for %@ notification", (uint8_t *)&buf, 0xCu);
              }
              v151 = 0u;
              v152 = 0u;
              v149 = 0u;
              v150 = 0u;
              darwinTokens = v6->_registration._darwinTokens;
              v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(darwinTokens, v97, (uint64_t)&v149, (uint64_t)v161, 16);
              if (v99)
              {
                v104 = v99;
                v105 = *(_QWORD *)v150;
                do
                {
                  for (j = 0; j != v104; ++j)
                  {
                    if (*(_QWORD *)v150 != v105)
                      objc_enumerationMutation(darwinTokens);
                    v107 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v149 + 1) + 8 * j), v100, v101, v102, v103);
                    notify_cancel(v107);
                  }
                  v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(darwinTokens, v100, (uint64_t)&v149, (uint64_t)v161, 16);
                }
                while (v104);
              }

              v6->_registration._darwinTokens = 0;
              goto LABEL_90;
            }
            v28 = v6->_registration._darwinTokens;
            v29 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v25, out_token, v26, v27);
            objc_msgSend_addObject_(v28, v30, v29, v31, v32);
          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v155, (uint64_t)v162, 16);
          if (!v19)
            goto LABEL_48;
        }
      case 2:
        v41 = SCPreferencesCreate(0, CFSTR("MobileGestalt"), (CFStringRef)a4);
        v6->_registration._darwinTokens = (NSMutableArray *)v41;
        if (v41)
        {
          buf.version = 0;
          buf.info = v6;
          buf.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
          buf.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
          buf.copyDescription = 0;
          SCPreferencesSetCallback(v41, (SCPreferencesCallBack)sub_1A40C23E8, &buf);
          scPrefs = v6->_registration._scPrefs;
          v43 = dispatch_get_global_queue(0, 0);
          SCPreferencesSetDispatchQueue(scPrefs, v43);
          goto LABEL_48;
        }
        v115 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v115)
          v121 = v115 + 1;
        else
          v121 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        sub_1A40C0884((uint64_t)v121, 339, (uint64_t)CFSTR("failed to register for %@ notification"), v116, v117, v118, v119, v120, (char)v6->_argument);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_90;
LABEL_72:
        argument = (CFIndex)v6->_argument;
        LODWORD(buf.version) = 138412290;
        *(CFIndex *)((char *)&buf.version + 4) = argument;
        v78 = MEMORY[0x1E0C81028];
        v79 = "failed to register for %@ notification";
        v123 = 12;
        goto LABEL_89;
      case 3:
        v44 = [MGFileWatcher alloc];
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = sub_1A40C23F8;
        v148[3] = &unk_1E4BA1048;
        v148[4] = v6;
        v47 = objc_msgSend_initWithPath_block_(v44, v45, (uint64_t)a4, (uint64_t)v148, v46);
        v6->_registration._darwinTokens = (NSMutableArray *)v47;
        if (v47)
          goto LABEL_48;
        v48 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v48)
          v54 = v48 + 1;
        else
          v54 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        sub_1A40C0884((uint64_t)v54, 359, (uint64_t)CFSTR("failed to register for %@ notification"), v49, v50, v51, v52, v53, (char)v6->_argument);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_72;
        goto LABEL_90;
      case 4:
        v55 = *(void **)(qword_1ECDA0C28 + 752);
        if (!v55)
          v55 = sub_1A40C0684(94, 3);
        v56 = (NSMutableArray *)(id)objc_msgSend_sharedConnection(v55, v8, v9, v10, v11);
        v6->_registration._darwinTokens = v56;
        if (v56)
        {
          objc_msgSend_addObserver_(v56, v57, (uint64_t)v6, v58, v59);
          goto LABEL_48;
        }
        v124 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v124)
          v130 = v124 + 1;
        else
          v130 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        sub_1A40C0884((uint64_t)v130, 370, (uint64_t)CFSTR("failed to register for notification"), v125, v126, v127, v128, v129, v146);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_90;
        LOWORD(buf.version) = 0;
        v78 = MEMORY[0x1E0C81028];
        v79 = "failed to register for notification";
        goto LABEL_88;
      case 5:
        if (MGGetSInt32Answer() == 4)
        {
          v64 = *(void **)qword_1ECDA0C28;
          if (!*(_QWORD *)qword_1ECDA0C28)
            v64 = sub_1A40C0684(0, 3);
          v65 = (NSMutableArray *)objc_msgSend_mainDisplay(v64, v60, v61, v62, v63);
          v6->_registration._darwinTokens = v65;
          if (v65)
          {
            objc_msgSend_addObserver_forKeyPath_options_context_(v65, v66, (uint64_t)v6, (uint64_t)CFSTR("currentMode"), 0, 0);
            objc_msgSend_currentMode(v6->_registration._darwinTokens, v67, v68, v69, v70);
            goto LABEL_48;
          }
          v138 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v138)
            v144 = v138 + 1;
          else
            v144 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          sub_1A40C0884((uint64_t)v144, 383, (uint64_t)CFSTR("failed to register for notification"), v139, v140, v141, v142, v143, v146);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E0C81028];
            v79 = "failed to register for notification";
            goto LABEL_88;
          }
        }
        else
        {
          v108 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v108)
            v114 = v108 + 1;
          else
            v114 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          sub_1A40C0884((uint64_t)v114, 395, (uint64_t)CFSTR("can't observe display mode changes"), v109, v110, v111, v112, v113, v146);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E0C81028];
            v79 = "can't observe display mode changes";
            goto LABEL_88;
          }
        }
        goto LABEL_90;
      case 6:
        v71 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v71)
          v77 = v71 + 1;
        else
          v77 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        sub_1A40C0884((uint64_t)v77, 403, (uint64_t)CFSTR("MGNotificationTypeSWBehavior not supported"), v72, v73, v74, v75, v76, v146);
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_90;
        LOWORD(buf.version) = 0;
        v78 = MEMORY[0x1E0C81028];
        v79 = "MGNotificationTypeSWBehavior not supported";
        goto LABEL_88;
      case 7:
        v80 = *(uint64_t (**)(uint64_t, const __CFString *, dispatch_queue_global_t, _QWORD))(qword_1ECDA0C28 + 152);
        if (!v80)
          v80 = (uint64_t (*)(uint64_t, const __CFString *, dispatch_queue_global_t, _QWORD))sub_1A40C0684(19, 2);
        v81 = *MEMORY[0x1E0C9AE00];
        v82 = dispatch_get_global_queue(0, 0);
        v83 = (NSMutableArray *)v80(v81, CFSTR("com.apple.mobilegestalt"), v82, 0);
        v6->_registration._darwinTokens = v83;
        if (v83)
        {
          CFRetain(v83);
          v84 = qword_1ECDA0C28;
          v85 = *(void (**)(NSMutableArray *, uint64_t, _QWORD *))(qword_1ECDA0C28 + 192);
          if (!v85)
          {
            v85 = (void (*)(NSMutableArray *, uint64_t, _QWORD *))sub_1A40C0684(24, 2);
            v84 = qword_1ECDA0C28;
          }
          v86 = v6->_registration._darwinTokens;
          v87 = *(uint64_t **)(v84 + 600);
          if (!v87)
            v87 = (uint64_t *)sub_1A40C0684(75, 1);
          v88 = *v87;
          v147[0] = MEMORY[0x1E0C809B0];
          v147[1] = 3221225472;
          v147[2] = sub_1A40C2400;
          v147[3] = &unk_1E4BA10B8;
          v147[4] = v6;
          v85(v86, v88, v147);
LABEL_48:
          if (v6->_type != -1)
            v89 = v6;
        }
        else
        {
          v131 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v131)
            v137 = v131 + 1;
          else
            v137 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          sub_1A40C0884((uint64_t)v137, 412, (uint64_t)CFSTR("failed to connect to CTServer"), v132, v133, v134, v135, v136, v146);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E0C81028];
            v79 = "failed to connect to CTServer";
LABEL_88:
            v123 = 2;
LABEL_89:
            _os_log_impl(&dword_1A40BF000, v78, OS_LOG_TYPE_DEFAULT, v79, (uint8_t *)&buf, v123);
          }
LABEL_90:
          v6->_type = -1;
        }
        break;
      case 8:
        objc_msgSend_startDynaStoreMonitoringWithArgument_(v6, v8, (uint64_t)v7, v10, v11);
        goto LABEL_48;
      default:
        v33 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v33)
          v39 = v33 + 1;
        else
          v39 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        sub_1A40C0884((uint64_t)v39, 424, (uint64_t)CFSTR("can't create observer of type %d"), v34, v35, v36, v37, v38, v6->_type);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          type = v6->_type;
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = type;
          _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "can't create observer of type %d", (uint8_t *)&buf, 8u);
        }
        goto LABEL_48;
    }
  }
  return v6;
}

- (void)_addBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ECDA0C00);
  objc_msgSend_addObject_(self->_blocks, v5, (uint64_t)a3, v6, v7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MGNotificationObserver;
  -[MGNotificationObserver dealloc](&v3, sel_dealloc);
}

- (void)invokeBlocks
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A40C22E4;
  block[3] = &unk_1E4BA1048;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1ECDA0C00, block);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  ((void (*)(MGNotificationObserver *, char *, id, id))MEMORY[0x1E0DE7D20])(self, sel_invokeBlocks, a3, a4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  ((void (*)(MGNotificationObserver *, char *, id, id))MEMORY[0x1E0DE7D20])(self, sel_invokeBlocks, a3, a4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  MEMORY[0x1E0DE7D20](self, sel_invokeBlocks, a3, a4, a5);
}

- (void)_cancelRegistration
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int type;
  NSMutableArray *darwinTokens;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  int v25;
  NSMutableArray *v26;
  $AF8C015E79CFD324C34D5C7DA72BF008 *p_registration;
  NSMutableArray *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  SCPreferencesRef scPrefs;
  uint64_t v33;
  void (*v34)(SCPreferencesRef, _QWORD);
  _QWORD *v35;
  NSMutableArray *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ECDA0C00);
  type = self->_type;
  switch(type)
  {
    case 1:
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      darwinTokens = self->_registration._darwinTokens;
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(darwinTokens, v3, (uint64_t)&v37, (uint64_t)v43, 16);
      if (v9)
      {
        v14 = v9;
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(darwinTokens);
            v17 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v37 + 1) + 8 * i), v10, v11, v12, v13);
            notify_cancel(v17);
          }
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(darwinTokens, v10, (uint64_t)&v37, (uint64_t)v43, 16);
        }
        while (v14);
      }

      self->_registration._darwinTokens = 0;
      goto LABEL_15;
    case 2:
      p_registration = &self->_registration;
      v26 = self->_registration._darwinTokens;
      if (!v26)
        goto LABEL_38;
      SCPreferencesSetDispatchQueue((SCPreferencesRef)v26, 0);
      SCPreferencesSetCallback(p_registration->_scPrefs, 0, 0);
      goto LABEL_36;
    case 3:
      p_registration = &self->_registration;
      v28 = self->_registration._darwinTokens;
      if (!v28)
        goto LABEL_38;
      objc_msgSend_cancel(v28, v3, v4, v5, v6);
      v29 = p_registration->_darwinTokens;
      goto LABEL_26;
    case 4:
      p_registration = &self->_registration;
      v30 = self->_registration._darwinTokens;
      if (!v30)
        goto LABEL_38;
      objc_msgSend_removeObserver_(v30, v3, (uint64_t)self, v5, v6);
      goto LABEL_25;
    case 5:
      p_registration = &self->_registration;
      v31 = self->_registration._darwinTokens;
      if (!v31)
        goto LABEL_38;
      objc_msgSend_removeObserver_forKeyPath_(v31, v3, (uint64_t)self, (uint64_t)CFSTR("currentMode"), v6);
LABEL_25:
      v29 = self->_registration._darwinTokens;
LABEL_26:

      goto LABEL_37;
    case 6:
      p_registration = &self->_registration;
      goto LABEL_37;
    case 7:
      p_registration = &self->_registration;
      scPrefs = self->_registration._scPrefs;
      if (!scPrefs)
        goto LABEL_38;
      v33 = qword_1ECDA0C28;
      v34 = *(void (**)(SCPreferencesRef, _QWORD))(qword_1ECDA0C28 + 200);
      if (!v34)
      {
        v34 = (void (*)(SCPreferencesRef, _QWORD))sub_1A40C0684(25, 2);
        scPrefs = (SCPreferencesRef)p_registration->_darwinTokens;
        v33 = qword_1ECDA0C28;
      }
      v35 = *(_QWORD **)(v33 + 600);
      if (!v35)
        v35 = sub_1A40C0684(75, 1);
      v34(scPrefs, *v35);
      goto LABEL_36;
    case 8:
      p_registration = &self->_registration;
      v36 = self->_registration._darwinTokens;
      if (!v36)
        goto LABEL_38;
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)v36, 0);
LABEL_36:
      CFRelease(p_registration->_darwinTokens);
LABEL_37:
      p_registration->_darwinTokens = 0;
LABEL_38:
      self->_type = -1;
LABEL_39:

      return;
    default:
      v18 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
      if (v18)
        v24 = v18 + 1;
      else
        v24 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
      sub_1A40C0884((uint64_t)v24, 519, (uint64_t)CFSTR("can't cancel registration of type %d"), v19, v20, v21, v22, v23, self->_type);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_type;
        *(_DWORD *)buf = 67109120;
        v42 = v25;
        _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "can't cancel registration of type %d", buf, 8u);
      }
LABEL_15:
      self->_type = -1;
      if (type == -1)
        return;
      goto LABEL_39;
  }
}

- (void)_removeBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *argument;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ECDA0C00);
  objc_msgSend_removeObject_(self->_blocks, v5, (uint64_t)a3, v6, v7);
  if (!objc_msgSend_count(self->_blocks, v8, v9, v10, v11))
  {
    v16 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v12, self->_type, v14, v15);
    argument = self->_argument;
    v28[0] = v16;
    v28[1] = argument;
    v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v28, 2, v19);
    objc_msgSend_removeObjectForKey_((void *)qword_1ECDA0C08, v21, v20, v22, v23);
    objc_msgSend__cancelRegistration(self, v24, v25, v26, v27);
  }
  if (!objc_msgSend_count((void *)qword_1ECDA0C08, v12, v13, v14, v15))
  {

    qword_1ECDA0C08 = 0;
  }
}

@end
