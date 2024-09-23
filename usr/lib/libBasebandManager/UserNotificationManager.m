@implementation UserNotificationManager

+ (id)sharedInstance:()basic_string<char
{
  id v3;
  _QWORD block[4];
  __rep __p;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __42__UserNotificationManager_sharedInstance___block_invoke;
  block[3] = &__block_descriptor_56_ea8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
  if ((*((char *)&a3->var0.var0.var0.var1 + 23) & 0x80000000) == 0)
  {
    __p = a3->var0.var0;
    if (qword_1ED70FEA8 == -1)
      goto LABEL_3;
LABEL_6:
    dispatch_once(&qword_1ED70FEA8, block);
    v3 = (id)qword_1ED70FEA0;
    if ((*((char *)&__p.var0.var1 + 23) & 0x80000000) == 0)
      return v3;
    goto LABEL_7;
  }
  std::string::__init_copy_ctor_external((std::string *)&__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  if (qword_1ED70FEA8 != -1)
    goto LABEL_6;
LABEL_3:
  v3 = (id)qword_1ED70FEA0;
  if ((*((char *)&__p.var0.var1 + 23) & 0x80000000) == 0)
    return v3;
LABEL_7:
  operator delete(__p.var0.var1.var0);
  return v3;
}

void __42__UserNotificationManager_sharedInstance___block_invoke(uint64_t a1)
{
  UserNotificationManager *v2;
  uint64_t v3;
  void *v4;
  std::string __p;

  v2 = [UserNotificationManager alloc];
  if (*(char *)(a1 + 55) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    __p = *(std::string *)(a1 + 32);
  v3 = -[UserNotificationManager init:](v2, "init:", &__p);
  v4 = (void *)qword_1ED70FEA0;
  qword_1ED70FEA0 = v3;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (id)init:()basic_string<char
{
  UserNotificationManager *v4;
  dispatch_queue_t v5;
  NSObject *fObj;
  void *v7;
  dispatch_queue_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UserNotificationManager;
  v4 = -[UserNotificationManager init](&v10, sel_init);
  if (!v4)
    return v4;
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
  {
    if (!var0->var0.var0.var0.var1.var1)
      return v4;
    v9 = dispatch_queue_create(var0->var0.var0.var0.var1.var0, 0);
    fObj = v4->fQueue.fObj.fObj;
    v4->fQueue.fObj.fObj = (dispatch_object_s *)v9;
    if (!fObj)
      goto LABEL_6;
  }
  else
  {
    if (!*((_BYTE *)&var0->var0.var0.var0.var1 + 23))
      return v4;
    v5 = dispatch_queue_create(var0->var0.var0.var0.var0.var0, 0);
    fObj = v4->fQueue.fObj.fObj;
    v4->fQueue.fObj.fObj = (dispatch_object_s *)v5;
    if (!fObj)
      goto LABEL_6;
  }
  dispatch_release(fObj);
LABEL_6:
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserNotificationManager setUpNotificationCenter:](v4, "setUpNotificationCenter:", v7);

  return v4;
}

- (void)setUpNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  UNUserNotificationCenter *v6;
  UNUserNotificationCenter *fUserNotificationCenter;
  unsigned __int8 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 buf;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->fUserNotificationCenter)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.telephony.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v5);
  fUserNotificationCenter = self->fUserNotificationCenter;
  self->fUserNotificationCenter = v6;

  -[UNUserNotificationCenter setDelegate:](self->fUserNotificationCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->fUserNotificationCenter, "setWantsNotificationResponsesDelivered");
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
  }
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 0x40000000;
  v18 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v19 = &__block_descriptor_tmp_13_2;
  v20 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v9 = *(std::__shared_weak_count **)algn_1ED710088;
    v15 = GetABMLogServer(void)::sLogServer;
    v16 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
      goto LABEL_5;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &buf);
    v9 = *(std::__shared_weak_count **)algn_1ED710088;
    v15 = GetABMLogServer(void)::sLogServer;
    v16 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
    {
LABEL_5:
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
  }
  v12 = *((_QWORD *)GetGlobalLogger(&v15) + 4);
  if (v9)
  {
    v13 = (unint64_t *)&v9->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1BF335000, v12, OS_LOG_TYPE_DEFAULT, "#I UserNotificationCenter created with bundleID %@", (uint8_t *)&buf, 0xCu);
  }

LABEL_15:
}

- (BOOL)setActionForHeader:(UserNotificationManager *)self notificationContent:(SEL)a2 callbackData:(NotificationInfo *)a3
{
  void *v3;
  uint64_t v4;
  config::hw *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  __raw *p_var1;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __raw *v15;
  size_t v16;
  unint64_t v17;
  __raw *v18;
  size_t v19;
  unint64_t v20;
  __raw *v21;
  size_t v22;
  unint64_t v23;
  __raw *v24;
  size_t v25;
  unint64_t v26;
  __raw *v27;
  size_t v28;
  unint64_t v29;
  __raw *v30;
  size_t v31;
  void *v32;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *left;
  char v35;
  NotificationInfo *v36;
  unint64_t v37;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v39;
  int left_high;
  char *v41;
  unint64_t v42;
  size_t v43;
  int v44;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v45;
  int v46;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v47;
  size_t v48;
  size_t v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void **p_left;
  char v56;
  __int128 v57;
  void *v58;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v59;
  unint64_t v60;
  __raw *v61;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v62;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v63;
  int v64;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v65;
  size_t v66;
  int v67;
  NotificationInfo *v68;
  unint64_t v69;
  size_t v70;
  int v71;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v72;
  size_t v73;
  size_t v74;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *v75;
  size_t v76;
  size_t v77;
  int v78;
  int v79;
  BOOL v80;
  size_t v81;
  unint64_t v82;
  __raw *v83;
  size_t v84;
  unsigned __int8 v85;
  std::__shared_weak_count *v86;
  unint64_t *p_shared_owners;
  unint64_t v88;
  NSObject *v89;
  unint64_t *v90;
  unint64_t v91;
  BOOL v92;
  void *v93;
  size_t v94;
  char *v95;
  uint64_t *v96;
  void *v97;
  NSObject *v98;
  std::string *v99;
  void *v100;
  unsigned __int8 v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  NSObject *v105;
  unint64_t *v106;
  unint64_t v107;
  size_t v109;
  NotificationInfo *var0;
  unint64_t var1;
  size_t v112;
  __CFString *v113;
  __CFString *v114;
  UserNotificationManager *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 buf;
  void (*v123)(uint64_t);
  void *v124;
  uint64_t *v125;
  uint64_t v126;

  v116 = v4;
  v126 = *MEMORY[0x1E0C80C00];
  v7 = v3;
  v117 = v7;
  v8 = atomic_load((unsigned __int8 *)&qword_1ED70FEB0);
  v115 = self;
  if ((v8 & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1ED70FEB0);
    if ((_DWORD)v7)
    {
      _MergedGlobals = TelephonyUtilIsInternalBuild();
      __cxa_guard_release(&qword_1ED70FEB0);
    }
  }
  v9 = atomic_load((unsigned __int8 *)&qword_1ED70FEC0);
  if ((v9 & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1ED70FEC0);
    if ((_DWORD)v7)
    {
      if (_MergedGlobals)
        v113 = CFSTR("prefs:root=INTERNAL_SETTINGS&path=Baseband%20Manager/Manage%20Logs");
      else
        v113 = CFSTR("prefs:root=CARRIER_SETTINGS&path=Baseband%20Manager/Manage%20Logs");
      qword_1ED70FEB8 = v113;
      __cxa_guard_release(&qword_1ED70FEC0);
    }
  }
  v10 = atomic_load((unsigned __int8 *)&qword_1ED70FED0);
  if ((v10 & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1ED70FED0);
    if ((_DWORD)v7)
    {
      if (_MergedGlobals)
        v114 = CFSTR("prefs:root=INTERNAL_SETTINGS&path=Baseband%20Manager/Logging%20Settings");
      else
        v114 = CFSTR("prefs:root=CARRIER_SETTINGS&path=Baseband%20Manager/Logging%20Settings");
      qword_1ED70FEC8 = v114;
      __cxa_guard_release(&qword_1ED70FED0);
    }
  }
  if ((config::hw::watch(v7) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
  else
    objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setIcon:", v12);

  p_var1 = &a3->var0.var0.var1;
  LODWORD(v12) = SHIBYTE(a3->var0.var0.var1.var0[2]);
  v13 = HIBYTE(a3->var0.var0.var1.var0[2]);
  v14 = v13;
  v15 = &a3->var0.var0.var1;
  if ((v12 & 0x80000000) != 0)
  {
    v15 = (__raw *)a3->var0.var0.var1.var0[0];
    v14 = a3->var0.var0.var1.var0[1];
  }
  if (v14 >= 0x14)
    v16 = 20;
  else
    v16 = v14;
  if (!memcmp(v15, "Telephony_Dump_Ready", v16) && v14 == 20)
  {
    if (!_MergedGlobals)
      goto LABEL_39;
    objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", CFSTR("com.apple.TapToRadar"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setIcon:", v12);
    goto LABEL_38;
  }
  v17 = v13;
  v18 = &a3->var0.var0.var1;
  if ((v12 & 0x80000000) != 0)
  {
    v18 = (__raw *)a3->var0.var0.var1.var0[0];
    v17 = a3->var0.var0.var1.var0[1];
  }
  if (v17 >= 0x1D)
    v19 = 29;
  else
    v19 = v17;
  if (!memcmp(v18, "Logging_Profile_Not_Installed", v19) && v17 == 29)
    goto LABEL_37;
  v20 = v13;
  v21 = &a3->var0.var0.var1;
  if ((v12 & 0x80000000) != 0)
  {
    v21 = (__raw *)a3->var0.var0.var1.var0[0];
    v20 = a3->var0.var0.var1.var0[1];
  }
  v22 = v20 >= 0x1B ? 27 : v20;
  if (!memcmp(v21, "Telephony_Dump_Insufficient", v22) && v20 == 27)
    goto LABEL_37;
  v23 = v13;
  v24 = &a3->var0.var0.var1;
  if ((v12 & 0x80000000) != 0)
  {
    v24 = (__raw *)a3->var0.var0.var1.var0[0];
    v23 = a3->var0.var0.var1.var0[1];
  }
  v25 = v23 >= 0x17 ? 23 : v23;
  if (!memcmp(v24, "Cellular_Issue_Detected", v25) && v23 == 23)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setIcon:", v12);
LABEL_38:

    LOBYTE(v12) = HIBYTE(a3->var0.var0.var1.var0[2]);
    goto LABEL_39;
  }
  v83 = &a3->var0.var0.var1;
  if ((v12 & 0x80000000) != 0)
  {
    v83 = (__raw *)a3->var0.var0.var1.var0[0];
    v13 = a3->var0.var0.var1.var0[1];
  }
  if (v13 >= 0x16)
    v84 = 22;
  else
    v84 = v13;
  if (memcmp(v83, "Telephony_Dump_Started", v84) || v13 != 22)
  {
    {
      __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
    }
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 0x40000000;
    v123 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
    v124 = &__block_descriptor_tmp_13_2;
    v125 = &GetABMLogServer(void)::sLogServer;
    if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
    {
      v86 = *(std::__shared_weak_count **)algn_1ED710088;
      v120 = GetABMLogServer(void)::sLogServer;
      v121 = *(_QWORD *)algn_1ED710088;
      if (*(_QWORD *)algn_1ED710088)
        goto LABEL_187;
    }
    else
    {
      dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &buf);
      v86 = *(std::__shared_weak_count **)algn_1ED710088;
      v120 = GetABMLogServer(void)::sLogServer;
      v121 = *(_QWORD *)algn_1ED710088;
      if (*(_QWORD *)algn_1ED710088)
      {
LABEL_187:
        p_shared_owners = (unint64_t *)&v86->__shared_owners_;
        do
          v88 = __ldxr(p_shared_owners);
        while (__stxr(v88 + 1, p_shared_owners));
      }
    }
    v89 = *((_QWORD *)GetGlobalLogger(&v120) + 4);
    if (v86)
    {
      v90 = (unint64_t *)&v86->__shared_owners_;
      do
        v91 = __ldaxr(v90);
      while (__stlxr(v91 - 1, v90));
      if (!v91)
      {
        ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
        std::__shared_weak_count::__release_weak(v86);
      }
    }
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0)
        p_var1 = (__raw *)p_var1->var0[0];
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = p_var1;
      _os_log_error_impl(&dword_1BF335000, v89, OS_LOG_TYPE_ERROR, "Not supported header - %s", (uint8_t *)&buf, 0xCu);
      v92 = 0;
    }
    else
    {
      v92 = 0;
    }
    goto LABEL_229;
  }
LABEL_39:
  if ((v12 & 0x80) != 0)
  {
    v27 = (__raw *)a3->var0.var0.var1.var0[0];
    v26 = a3->var0.var0.var1.var0[1];
  }
  else
  {
    v26 = v12;
    v27 = &a3->var0.var0.var1;
  }
  if (v26 >= 0x16)
    v28 = 22;
  else
    v28 = v26;
  if (!memcmp(v27, "Telephony_Dump_Started", v28) && v26 == 22
    || ((v12 & 0x80) != 0
      ? (__raw *)(v30 = (__raw *)a3->var0.var0.var1.var0[0], v29 = a3->var0.var0.var1.var0[1])
      : (v29 = v12, v30 = &a3->var0.var0.var1),
        v29 >= 0x14 ? (v31 = 20) : (v31 = v29),
        !memcmp(v30, "Telephony_Dump_Ready", v31) && v29 == 20))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", qword_1ED70FEB8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setDefaultActionURL:", v32);
  }
  else
  {
    if ((v12 & 0x80) != 0)
    {
      v61 = (__raw *)a3->var0.var0.var1.var0[0];
      v60 = a3->var0.var0.var1.var0[1];
    }
    else
    {
      v60 = v12;
      v61 = &a3->var0.var0.var1;
    }
    if (v60 >= 0x1B)
      v81 = 27;
    else
      v81 = v60;
    if (!memcmp(v61, "Telephony_Dump_Insufficient", v81) && v60 == 27)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", qword_1ED70FEC8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setDefaultActionURL:", v32);
    }
    else
    {
      if ((v12 & 0x80) != 0)
      {
        p_var1 = (__raw *)a3->var0.var0.var1.var0[0];
        v82 = a3->var0.var0.var1.var0[1];
      }
      else
      {
        v82 = v12;
      }
      if (v82 >= 0x17)
        v109 = 23;
      else
        v109 = v82;
      if (!memcmp(p_var1, "Cellular_Issue_Detected", v109) && v82 == 23)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR_DIAGNOSTICS_ID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setDefaultActionURL:", v32);
      }
      else
      {
        if (*((char *)&a3[1].var0.var0.var0.var0.var1 + 23) < 0)
        {
          var0 = (NotificationInfo *)a3[1].var0.var0.var0.var0.var1.var0;
          var1 = a3[1].var0.var0.var0.var0.var1.var1;
        }
        else
        {
          var0 = a3 + 1;
          var1 = *((unsigned __int8 *)&a3[1].var0.var0.var0.var0.var1 + 23);
        }
        if (var1 >= 0x21)
          v112 = 33;
        else
          v112 = var1;
        if (memcmp(var0, "Install_Logging_Profile_UIAllowed", v112) || var1 != 33)
          goto LABEL_57;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=ManagedConfigurationList"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setDefaultActionURL:", v32);
      }
    }
  }

LABEL_57:
  p_pair1 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
    v45 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
    if (self->fCallBackMapWithQueue.__tree_.__begin_node_ == p_pair1)
    {
      v58 = 0;
      v45 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
      v59 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
      if (!p_pair1->__value_.__left_)
        goto LABEL_164;
      goto LABEL_215;
    }
LABEL_112:
    v59 = v45;
    do
    {
      v63 = v59;
      v59 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v59[2].__value_.__left_;
    }
    while (v59->__value_.__left_ == v63);
    v58 = 0;
    goto LABEL_115;
  }
  v35 = *((_BYTE *)&a3->var0.var0.var0.var0.var1 + 23);
  if (v35 >= 0)
    v36 = a3;
  else
    v36 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
  if (v35 >= 0)
    v37 = *((unsigned __int8 *)&a3->var0.var0.var0.var0.var1 + 23);
  else
    v37 = a3->var0.var0.var0.var0.var1.var1;
  v38 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
  v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_;
  do
  {
    while (1)
    {
      left_high = SHIBYTE(v39[6].__value_.__left_);
      v41 = left_high >= 0 ? (char *)&v39[4] : (char *)v39[4].__value_.__left_;
      v42 = left_high >= 0 ? HIBYTE(v39[6].__value_.__left_) : (unint64_t)v39[5].__value_.__left_;
      v43 = v37 >= v42 ? v42 : v37;
      v44 = memcmp(v41, v36, v43);
      if (v44)
        break;
      if (v42 >= v37)
        goto LABEL_79;
LABEL_65:
      v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v39[1].__value_.__left_;
      if (!v39)
        goto LABEL_80;
    }
    if (v44 < 0)
      goto LABEL_65;
LABEL_79:
    v38 = v39;
    v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v39->__value_.__left_;
  }
  while (v39);
LABEL_80:
  v45 = p_pair1;
  if (v38 == p_pair1)
    goto LABEL_107;
  v46 = SHIBYTE(v38[6].__value_.__left_);
  if (v46 >= 0)
    v47 = v38 + 4;
  else
    v47 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v38[4].__value_.__left_;
  if (v46 >= 0)
    v48 = HIBYTE(v38[6].__value_.__left_);
  else
    v48 = (size_t)v38[5].__value_.__left_;
  if (v48 >= v37)
    v49 = v37;
  else
    v49 = v48;
  v50 = memcmp(v36, v47, v49);
  if (!v50)
  {
    if (v37 < v48)
      goto LABEL_106;
LABEL_92:
    v51 = _Block_copy(*(const void **)v116);
    v52 = v38[7].__value_.__left_;
    v38[7].__value_.__left_ = v51;

    v53 = *(void **)(v116 + 8);
    if (v53)
      dispatch_retain(*(dispatch_object_t *)(v116 + 8));
    v54 = v38[8].__value_.__left_;
    v38[8].__value_.__left_ = v53;
    if (v54)
      dispatch_release(v54);
    if (&v38[7] != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v116)
    {
      p_left = &v38[9].__value_.__left_;
      v56 = *(_BYTE *)(v116 + 39);
      if (SHIBYTE(v38[11].__value_.__left_) < 0)
      {
        if (v56 >= 0)
          v93 = (void *)(v116 + 16);
        else
          v93 = *(void **)(v116 + 16);
        if (v56 >= 0)
          v94 = *(unsigned __int8 *)(v116 + 39);
        else
          v94 = *(_QWORD *)(v116 + 24);
        std::string::__assign_no_alias<false>(p_left, v93, v94);
      }
      else if ((*(_BYTE *)(v116 + 39) & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(p_left, *(void **)(v116 + 16), *(_QWORD *)(v116 + 24));
      }
      else
      {
        v57 = *(_OWORD *)(v116 + 16);
        v38[11].__value_.__left_ = *(void **)(v116 + 32);
        *(_OWORD *)p_left = v57;
      }
    }
    goto LABEL_215;
  }
  if ((v50 & 0x80000000) == 0)
    goto LABEL_92;
LABEL_106:
  v45 = v38;
LABEL_107:
  v58 = v45->__value_.__left_;
  self = v115;
  if (v115->fCallBackMapWithQueue.__tree_.__begin_node_ == v45)
  {
    v59 = v45;
    if (v58)
      p_pair1 = v45 + 1;
    else
      p_pair1 = v45;
    if (!p_pair1->__value_.__left_)
      goto LABEL_164;
    goto LABEL_215;
  }
  if (!v58)
    goto LABEL_112;
  v62 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v45->__value_.__left_;
  do
  {
    v59 = v62;
    v62 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v62[1].__value_.__left_;
  }
  while (v62);
LABEL_115:
  v64 = SHIBYTE(v59[6].__value_.__left_);
  if (v64 >= 0)
    v65 = v59 + 4;
  else
    v65 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v59[4].__value_.__left_;
  if (v64 >= 0)
    v66 = HIBYTE(v59[6].__value_.__left_);
  else
    v66 = (size_t)v59[5].__value_.__left_;
  v67 = *((char *)&a3->var0.var0.var0.var0.var1 + 23);
  if (v67 >= 0)
    v68 = a3;
  else
    v68 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
  if (v67 >= 0)
    v69 = *((unsigned __int8 *)&a3->var0.var0.var0.var0.var1 + 23);
  else
    v69 = a3->var0.var0.var0.var0.var1.var1;
  if (v69 >= v66)
    v70 = v66;
  else
    v70 = v69;
  v71 = memcmp(v65, v68, v70);
  if (v71)
  {
    self = v115;
    if ((v71 & 0x80000000) == 0)
    {
LABEL_132:
      if (!left)
      {
        v72 = p_pair1;
        goto LABEL_204;
      }
      while (1)
      {
        v72 = left;
        v73 = HIBYTE(left[6].__value_.__left_);
        v74 = (size_t)left[5].__value_.__left_;
        if ((v73 & 0x80u) == 0)
          v75 = left + 4;
        else
          v75 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)left[4].__value_.__left_;
        if ((v73 & 0x80u) == 0)
          v76 = v73;
        else
          v76 = v74;
        if (v76 >= v69)
          v77 = v69;
        else
          v77 = v76;
        v78 = memcmp(v68, v75, v77);
        if (v78)
        {
          if ((v78 & 0x80000000) == 0)
            goto LABEL_148;
        }
        else if (v69 >= v76)
        {
LABEL_148:
          v79 = memcmp(v75, v68, v77);
          if (v79)
          {
            if ((v79 & 0x80000000) == 0)
              goto LABEL_215;
          }
          else if (v76 >= v69)
          {
            goto LABEL_215;
          }
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v72[1].__value_.__left_;
          if (!left)
          {
            p_pair1 = v72 + 1;
            goto LABEL_204;
          }
          continue;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v72->__value_.__left_;
        if (!v72->__value_.__left_)
        {
          p_pair1 = v72;
          goto LABEL_204;
        }
      }
    }
  }
  else
  {
    v80 = v66 >= v69;
    self = v115;
    if (v80)
      goto LABEL_132;
  }
  if (v58)
    p_pair1 = v59 + 1;
  else
    p_pair1 = v45;
  if (!p_pair1->__value_.__left_)
  {
LABEL_164:
    if (v58)
      v72 = v59;
    else
      v72 = v45;
    LOBYTE(v67) = *((_BYTE *)&a3->var0.var0.var0.var0.var1 + 23);
LABEL_204:
    v95 = (char *)operator new(0x60uLL);
    v96 = (uint64_t *)v95;
    if ((v67 & 0x80) != 0)
    {
      std::string::__init_copy_ctor_external((std::string *)(v95 + 32), a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
    }
    else
    {
      *((_OWORD *)v95 + 2) = *(_OWORD *)a3->var0.var0.var0.var0.var0.var0;
      *((_QWORD *)v95 + 6) = *((_QWORD *)&a3->var0.var0.var0.var0.var1 + 2);
    }
    v97 = _Block_copy(*(const void **)v116);
    v98 = *(NSObject **)(v116 + 8);
    v96[7] = (uint64_t)v97;
    v96[8] = (uint64_t)v98;
    if (v98)
      dispatch_retain(v98);
    v99 = (std::string *)(v96 + 9);
    if (*(char *)(v116 + 39) < 0)
    {
      std::string::__init_copy_ctor_external(v99, *(const std::string::value_type **)(v116 + 16), *(_QWORD *)(v116 + 24));
    }
    else
    {
      *(_OWORD *)&v99->__r_.__value_.__l.__data_ = *(_OWORD *)(v116 + 16);
      v96[11] = *(_QWORD *)(v116 + 32);
    }
    *v96 = 0;
    v96[1] = 0;
    v96[2] = (uint64_t)v72;
    p_pair1->__value_.__left_ = v96;
    v100 = *(void **)self->fCallBackMapWithQueue.__tree_.__begin_node_;
    if (v100)
    {
      self->fCallBackMapWithQueue.__tree_.__begin_node_ = v100;
      v96 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_, v96);
    ++self->fCallBackMapWithQueue.__tree_.__pair3_.__value_;
  }
LABEL_215:
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
  }
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 0x40000000;
  v123 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v124 = &__block_descriptor_tmp_13_2;
  v125 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v102 = *(std::__shared_weak_count **)algn_1ED710088;
    v118 = GetABMLogServer(void)::sLogServer;
    v119 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
    {
LABEL_218:
      v103 = (unint64_t *)&v102->__shared_owners_;
      do
        v104 = __ldxr(v103);
      while (__stxr(v104 + 1, v103));
    }
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &buf);
    v102 = *(std::__shared_weak_count **)algn_1ED710088;
    v118 = GetABMLogServer(void)::sLogServer;
    v119 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
      goto LABEL_218;
  }
  v105 = *((_QWORD *)GetGlobalLogger(&v118) + 4);
  if (!v102)
    goto LABEL_274;
  v106 = (unint64_t *)&v102->__shared_owners_;
  do
    v107 = __ldaxr(v106);
  while (__stlxr(v107 - 1, v106));
  if (!v107)
  {
    ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
    std::__shared_weak_count::__release_weak(v102);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
LABEL_225:
      if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0)
        a3 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_1BF335000, v105, OS_LOG_TYPE_DEFAULT, "#I Add callback for id: %s", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
LABEL_274:
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      goto LABEL_225;
  }
  v92 = 1;
LABEL_229:

  return v92;
}

- (void)showNotification:(NotificationInfo *)a3 withCallBackData:
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  __rep var0;
  __raw var1;
  __rep v12;
  id v13;
  dispatch_object_t object;
  std::string __p;

  v4 = v3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __61__UserNotificationManager_showNotification_withCallBackData___block_invoke;
  block[3] = &unk_1E78FC6F8;
  block[4] = self;
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  else
    var0 = a3->var0.var0.var0;
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  else
    var1 = a3->var0.var0.var1;
  if (*((char *)&a3[1].var0.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&v12, a3[1].var0.var0.var0.var0.var1.var0, a3[1].var0.var0.var0.var0.var1.var1);
  else
    v12 = a3[1].var0.var0.var0;
  v7 = _Block_copy(*(const void **)v4);
  v8 = *(NSObject **)(v4 + 8);
  v13 = v7;
  object = v8;
  if (v8)
    dispatch_retain(v8);
  if (*(char *)(v4 + 39) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v4 + 16), *(_QWORD *)(v4 + 24));
  else
    __p = *(std::string *)(v4 + 16);
  dispatch_async((dispatch_queue_t)self->fQueue.fObj.fObj, block);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (object)
    dispatch_release(object);

  if (*((char *)&v12.var0.var1 + 23) < 0)
  {
    operator delete(v12.var0.var1.var0);
    if ((SHIBYTE(var1.var0[2]) & 0x80000000) == 0)
    {
LABEL_21:
      if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0)
        return;
LABEL_25:
      operator delete(var0.var0.var1.var0);
      return;
    }
  }
  else if ((SHIBYTE(var1.var0[2]) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete((void *)var1.var0[0]);
  if (*((char *)&var0.var0.var1 + 23) < 0)
    goto LABEL_25;
}

void __61__UserNotificationManager_showNotification_withCallBackData___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *v6;
  void *v7;
  NSObject *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  const void *v16;
  size_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  const void *v24;
  size_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  NSObject *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  size_t v40;
  void *context;
  uint64_t v42;
  uint64_t v43;
  id v44;
  dispatch_object_t object;
  std::string __p;
  std::string v47;
  std::string v48;
  std::string v49;
  __int128 buf;
  void (*v51)(uint64_t);
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3B8A350]();
  v2 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  v3 = *(void **)(a1 + 32);
  v4 = (_OWORD *)(a1 + 40);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    *(_OWORD *)&v47.__r_.__value_.__l.__data_ = *v4;
    v47.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 56);
  }
  v5 = (_OWORD *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(&v48, *(const std::string::value_type **)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    *(_OWORD *)&v48.__r_.__value_.__l.__data_ = *v5;
    v48.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 80);
  }
  v6 = (_OWORD *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
  {
    std::string::__init_copy_ctor_external(&v49, *(const std::string::value_type **)(a1 + 88), *(_QWORD *)(a1 + 96));
  }
  else
  {
    *(_OWORD *)&v49.__r_.__value_.__l.__data_ = *v6;
    v49.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 104);
  }
  v7 = _Block_copy(*(const void **)(a1 + 112));
  v8 = *(NSObject **)(a1 + 120);
  v44 = v7;
  object = v8;
  if (v8)
    dispatch_retain(v8);
  if (*(char *)(a1 + 151) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 128), *(_QWORD *)(a1 + 136));
  else
    __p = *(std::string *)(a1 + 128);
  v9 = objc_msgSend(v3, "setActionForHeader:notificationContent:callbackData:", &v47, v2, &v44);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (object)
    dispatch_release(object);

  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v48.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_21:
      if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_22;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v48.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete(v48.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_22:
    if ((v9 & 1) == 0)
      goto LABEL_68;
    goto LABEL_27;
  }
LABEL_26:
  operator delete(v47.__r_.__value_.__l.__data_);
  if ((v9 & 1) == 0)
    goto LABEL_68;
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a1 + 64;
  if (*(char *)(a1 + 87) < 0)
    v11 = *(_QWORD *)v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E790CD10, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeader:", v13);

  v14 = *(unsigned __int8 *)(a1 + 87);
  v15 = v14;
  v16 = (const void *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
  {
    v16 = *(const void **)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 72);
  }
  if (v15 >= 0x1B)
    v17 = 27;
  else
    v17 = v15;
  if (!memcmp(v16, "Telephony_Dump_Insufficient", v17) && v15 == 27)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Telephony_Dump_Insufficient_Details_%@"), &stru_1E790CD10, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(char *)(a1 + 111) < 0)
      v6 = *(_OWORD **)v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBody:", v22);
LABEL_49:

LABEL_50:
    goto LABEL_51;
  }
  v23 = v14;
  v24 = (const void *)(a1 + 64);
  if ((v14 & 0x80) != 0)
  {
    v24 = *(const void **)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 72);
  }
  if (v23 >= 0x16)
    v25 = 22;
  else
    v25 = v23;
  if (!memcmp(v24, "Telephony_Dump_Started", v25) && v23 == 22)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(char *)(a1 + 111) < 0)
      v6 = *(_OWORD **)v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_1E790CD10, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBody:", v22);
    goto LABEL_49;
  }
  if ((v14 & 0x80) != 0)
  {
    v5 = *(_OWORD **)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 72);
  }
  if (v14 >= 0x17)
    v40 = 23;
  else
    v40 = v14;
  if (memcmp(v5, "Cellular_Issue_Detected", v40) || v14 != 23)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(char *)(a1 + 111) < 0)
      v6 = *(_OWORD **)v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_1E790CD10, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBody:", v21);
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Check_Settings_Cellular_Diagnostics"), &stru_1E790CD10, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBody:", v20);
LABEL_51:

  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSound:", v27);

  objc_msgSend(v2, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v2, "setShouldAuthenticateDefaultAction:", 1);
  v28 = a1 + 40;
  if (*(char *)(a1 + 63) < 0)
    v28 = *(_QWORD *)v4;
  v29 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "requestWithIdentifier:content:trigger:", v30, v2, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addNotificationRequest:withCompletionHandler:", v31, 0);
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
  }
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 0x40000000;
  v51 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v52 = &__block_descriptor_tmp_13_2;
  v53 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v33 = *(std::__shared_weak_count **)algn_1ED710088;
    v42 = GetABMLogServer(void)::sLogServer;
    v43 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
      goto LABEL_56;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &buf);
    v33 = *(std::__shared_weak_count **)algn_1ED710088;
    v42 = GetABMLogServer(void)::sLogServer;
    v43 = *(_QWORD *)algn_1ED710088;
    if (*(_QWORD *)algn_1ED710088)
    {
LABEL_56:
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v35 = __ldxr(p_shared_owners);
      while (__stxr(v35 + 1, p_shared_owners));
    }
  }
  v36 = *((_QWORD *)GetGlobalLogger(&v42) + 4);
  if (v33)
  {
    v37 = (unint64_t *)&v33->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v39 = a1 + 40;
    if (*(char *)(a1 + 63) < 0)
      v39 = *(_QWORD *)v4;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v39;
    _os_log_impl(&dword_1BF335000, v36, OS_LOG_TYPE_DEFAULT, "#I Add notification request with id: %s", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateAnalyticsEvent:withUserReponse:", a1 + 40, 0);

LABEL_68:
  objc_autoreleasePoolPop(context);
}

- (void)updateAnalyticsEvent:(const void *)a3 withUserReponse:(BOOL)a4
{
  _BOOL4 v4;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  const char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  const char *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  const void *v21;
  size_t v22;
  std::string::size_type v23;
  std::string *p_dst;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  NSObject *v31;
  unint64_t *v32;
  unint64_t v33;
  void **v34;
  int v35;
  xpc_object_t object;
  std::string v37;
  uint64_t v38;
  uint64_t v39;
  std::string __dst;
  xpc_object_t xdict;
  void *__p[2];
  void (*v43)(uint64_t);
  void *v44;
  uint64_t *v45;
  uint8_t buf[4];
  const void *v47;
  __int16 v48;
  void **v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (v6)
  {
    xdict = v6;
  }
  else
  {
    v7 = xpc_null_create();
    xdict = v7;
    if (!v7)
    {
      v8 = xpc_null_create();
      v7 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B8A86C](v7) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v7);
    goto LABEL_9;
  }
  v8 = xpc_null_create();
LABEL_8:
  xdict = v8;
LABEL_9:
  xpc_release(v7);
  if (*((char *)a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = xpc_string_create(v9);
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0CFBCD8], v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  v14 = (const char *)*((_QWORD *)a3 + 3);
  v13 = (char *)a3 + 24;
  v12 = v14;
  if (v13[23] >= 0)
    v15 = v13;
  else
    v15 = v12;
  v16 = xpc_string_create(v15);
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0CFBCE0], v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (v4)
    v18 = "userResponded";
  else
    v18 = "shown";
  v19 = xpc_string_create(v18);
  if (!v19)
    v19 = xpc_null_create();
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0CFBCD0], v19);
  v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  memset(&__dst, 170, sizeof(__dst));
  v21 = (const void *)*MEMORY[0x1E0CFBBD0];
  v22 = strlen((const char *)*MEMORY[0x1E0CFBBD0]);
  if (v22 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v23 = v22;
  if (v22 >= 0x17)
  {
    v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17)
      v25 = v22 | 7;
    v26 = v25 + 1;
    p_dst = (std::string *)operator new(v25 + 1);
    __dst.__r_.__value_.__l.__size_ = v23;
    __dst.__r_.__value_.__r.__words[2] = v26 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v22;
    p_dst = &__dst;
    if (!v22)
      goto LABEL_32;
  }
  memmove(p_dst, v21, v23);
LABEL_32:
  p_dst->__r_.__value_.__s.__data_[v23] = 0;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
  }
  __p[0] = (void *)MEMORY[0x1E0C809B0];
  __p[1] = (void *)0x40000000;
  v43 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v44 = &__block_descriptor_tmp_13_2;
  v45 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v28 = *(std::__shared_weak_count **)algn_1ED710088;
    v38 = GetABMLogServer(void)::sLogServer;
    v39 = *(_QWORD *)algn_1ED710088;
    if (!*(_QWORD *)algn_1ED710088)
      goto LABEL_37;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, __p);
    v28 = *(std::__shared_weak_count **)algn_1ED710088;
    v38 = GetABMLogServer(void)::sLogServer;
    v39 = *(_QWORD *)algn_1ED710088;
    if (!*(_QWORD *)algn_1ED710088)
      goto LABEL_37;
  }
  p_shared_owners = (unint64_t *)&v28->__shared_owners_;
  do
    v30 = __ldxr(p_shared_owners);
  while (__stxr(v30 + 1, p_shared_owners));
LABEL_37:
  v31 = *((_QWORD *)GetGlobalLogger(&v38) + 4);
  if (!v28)
    goto LABEL_41;
  v32 = (unint64_t *)&v28->__shared_owners_;
  do
    v33 = __ldaxr(v32);
  while (__stlxr(v33 - 1, v32));
  if (!v33)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_48;
  }
  else
  {
LABEL_41:
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_48;
  }
  xpc::object::to_string((xpc::object *)&xdict);
  if (SHIBYTE(v43) >= 0)
    v34 = __p;
  else
    v34 = (void **)__p[0];
  *(_DWORD *)buf = 136315394;
  v47 = v21;
  v48 = 2080;
  v49 = v34;
  _os_log_impl(&dword_1BF335000, v31, OS_LOG_TYPE_DEFAULT, "#I Submitting CoreAnalytics event[%s] - %s", buf, 0x16u);
  if (SHIBYTE(v43) < 0)
    operator delete(__p[0]);
LABEL_48:
  v35 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v37, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v37 = __dst;
  object = xdict;
  if (xdict)
    xpc_retain(xdict);
  else
    object = xpc_null_create();
  metric::sendCoreAnalyticsEvent((const void **)&v37.__r_.__value_.__l.__data_, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v37.__r_.__value_.__l.__data_);
    if ((v35 & 0x80000000) == 0)
      goto LABEL_56;
LABEL_58:
    operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_56;
  }
  if (v35 < 0)
    goto LABEL_58;
LABEL_56:
  xpc_release(xdict);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *fObj;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  UserNotificationManager *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_1E78FC760;
  v14 = self;
  v15 = v8;
  v13 = v7;
  fObj = self->fQueue.fObj.fObj;
  v10 = v8;
  v11 = v7;
  dispatch_async(fObj, block);

}

void __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  size_t v6;
  std::string::size_type v7;
  std::string *p_dst;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  std::string::size_type v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  NSObject *v16;
  unint64_t *v17;
  unint64_t v18;
  std::string *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t **v22;
  uint64_t *v23;
  uint64_t **v24;
  std::string *v25;
  std::string::size_type size;
  uint64_t *v27;
  int v28;
  uint64_t *v29;
  size_t v30;
  size_t v31;
  int v32;
  int v33;
  const void *v34;
  size_t v35;
  size_t v36;
  int v37;
  __int128 v38;
  NSObject *v39;
  void **v40;
  std::string *v41;
  size_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  BOOL v47;
  uint64_t *v48;
  NSObject *v49;
  unsigned __int8 v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  NSObject *v54;
  unint64_t *v55;
  unint64_t v56;
  std::string *v57;
  NSObject *v58;
  std::string *v59;
  size_t v60;
  void *context;
  uint64_t v62;
  uint64_t v63;
  _QWORD block[4];
  id v65;
  dispatch_object_t object;
  std::string __p;
  void *aBlock[2];
  std::string v69;
  std::string v70;
  uint64_t v71;
  uint64_t v72;
  std::string __dst;
  std::string buf[2];
  __int128 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3B8A350]();
  memset(&__dst, 170, sizeof(__dst));
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v6;
    p_dst = &__dst;
    if (!v6)
      goto LABEL_9;
  }
  memmove(p_dst, v5, v7);
LABEL_9:
  p_dst->__r_.__value_.__s.__data_[v7] = 0;

  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
  }
  v12 = MEMORY[0x1E0C809B0];
  buf[0].__r_.__value_.__r.__words[0] = MEMORY[0x1E0C809B0];
  buf[0].__r_.__value_.__l.__size_ = 0x40000000;
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  buf[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&__block_descriptor_tmp_13_2;
  buf[1].__r_.__value_.__l.__size_ = (std::string::size_type)&GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v13 = *(std::__shared_weak_count **)algn_1ED710088;
    v71 = GetABMLogServer(void)::sLogServer;
    v72 = *(_QWORD *)algn_1ED710088;
    if (!*(_QWORD *)algn_1ED710088)
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, buf);
    v13 = *(std::__shared_weak_count **)algn_1ED710088;
    v71 = GetABMLogServer(void)::sLogServer;
    v72 = *(_QWORD *)algn_1ED710088;
    if (!*(_QWORD *)algn_1ED710088)
      goto LABEL_14;
  }
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
LABEL_14:
  v16 = *((_QWORD *)GetGlobalLogger(&v71) + 4);
  if (!v13)
    goto LABEL_18;
  v17 = (unint64_t *)&v13->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
  }
  else
  {
LABEL_18:
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
  }
  v19 = &__dst;
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v19 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  LODWORD(buf[0].__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v19;
  _os_log_impl(&dword_1BF335000, v16, OS_LOG_TYPE_DEFAULT, "#I Received notification response with id: %s", (uint8_t *)buf, 0xCu);
LABEL_22:
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(void))(v20 + 16))();
  memset(&v70, 0, sizeof(v70));
  v21 = *(_QWORD *)(a1 + 40);
  v24 = *(uint64_t ***)(v21 + 32);
  v23 = (uint64_t *)(v21 + 32);
  v22 = v24;
  if (v24)
  {
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = &__dst;
    else
      v25 = (std::string *)__dst.__r_.__value_.__r.__words[0];
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    else
      size = __dst.__r_.__value_.__l.__size_;
    v27 = v23;
    while (1)
    {
      v28 = *((char *)v22 + 55);
      if (v28 >= 0)
        v29 = (uint64_t *)(v22 + 4);
      else
        v29 = v22[4];
      if (v28 >= 0)
        v30 = *((unsigned __int8 *)v22 + 55);
      else
        v30 = (size_t)v22[5];
      if (size >= v30)
        v31 = v30;
      else
        v31 = size;
      v32 = memcmp(v29, v25, v31);
      if (v32)
      {
        if (v32 < 0)
          goto LABEL_32;
LABEL_46:
        v27 = (uint64_t *)v22;
        v22 = (uint64_t **)*v22;
        if (!v22)
        {
LABEL_47:
          if (v27 == v23)
            break;
          v33 = *((char *)v27 + 55);
          if (v33 >= 0)
            v34 = v27 + 4;
          else
            v34 = (const void *)v27[4];
          if (v33 >= 0)
            v35 = *((unsigned __int8 *)v27 + 55);
          else
            v35 = v27[5];
          if (v35 >= size)
            v36 = size;
          else
            v36 = v35;
          v37 = memcmp(v25, v34, v36);
          if (v37)
          {
            if (v37 < 0)
              break;
          }
          else if (size < v35)
          {
            break;
          }
          v69.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)aBlock = v38;
          *(_OWORD *)&v69.__r_.__value_.__l.__data_ = v38;
          aBlock[0] = _Block_copy((const void *)v27[7]);
          v39 = v27[8];
          aBlock[1] = v39;
          if (v39)
            dispatch_retain(v39);
          v40 = (void **)(v27 + 9);
          if (*((char *)v27 + 95) < 0)
          {
            std::string::__init_copy_ctor_external(&v69, (const std::string::value_type *)v27[9], v27[10]);
          }
          else
          {
            *(_OWORD *)&v69.__r_.__value_.__l.__data_ = *(_OWORD *)v40;
            v69.__r_.__value_.__r.__words[2] = v27[11];
          }
          if (aBlock[0])
          {
            if (aBlock[1])
            {
              block[0] = v12;
              block[1] = 3321888768;
              block[2] = __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_46;
              block[3] = &__block_descriptor_72_ea8_32c18_ZTS12CallBackData_e5_v8__0l;
              v65 = _Block_copy(aBlock[0]);
              object = (dispatch_object_t)aBlock[1];
              dispatch_retain((dispatch_object_t)aBlock[1]);
              if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&__p, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
              else
                __p = v69;
              dispatch_async((dispatch_queue_t)aBlock[1], block);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              if (object)
                dispatch_release(object);

            }
            else
            {
              (*((void (**)(void))aBlock[0] + 2))();
            }
          }
          if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
          {
            if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v41 = &v69;
            else
              v41 = (std::string *)v69.__r_.__value_.__r.__words[0];
            if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v42 = HIBYTE(v69.__r_.__value_.__r.__words[2]);
            else
              v42 = v69.__r_.__value_.__l.__size_;
            std::string::__assign_no_alias<false>((void **)&v70.__r_.__value_.__l.__data_, v41, v42);
          }
          else if ((*((_BYTE *)&v69.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>(&v70, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
          }
          else
          {
            v70 = v69;
          }
          v43 = *(_QWORD **)(a1 + 40);
          v44 = (uint64_t *)v27[1];
          if (v44)
          {
            do
            {
              v45 = v44;
              v44 = (uint64_t *)*v44;
            }
            while (v44);
          }
          else
          {
            v46 = v27;
            do
            {
              v45 = (uint64_t *)v46[2];
              v47 = *v45 == (_QWORD)v46;
              v46 = v45;
            }
            while (!v47);
          }
          if ((uint64_t *)v43[3] == v27)
            v43[3] = v45;
          v48 = (uint64_t *)v43[4];
          --v43[5];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v48, v27);
          if (*((char *)v27 + 95) < 0)
            operator delete(*v40);
          v49 = v27[8];
          if (v49)
            dispatch_release(v49);

          if (*((char *)v27 + 55) < 0)
            operator delete((void *)v27[4]);
          operator delete(v27);
          {
            __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_1BF335000);
          }
          buf[0].__r_.__value_.__r.__words[0] = v12;
          buf[0].__r_.__value_.__l.__size_ = 0x40000000;
          buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
          buf[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&__block_descriptor_tmp_13_2;
          buf[1].__r_.__value_.__l.__size_ = (std::string::size_type)&GetABMLogServer(void)::sLogServer;
          if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
          {
            v51 = *(std::__shared_weak_count **)algn_1ED710088;
            v62 = GetABMLogServer(void)::sLogServer;
            v63 = *(_QWORD *)algn_1ED710088;
            if (*(_QWORD *)algn_1ED710088)
            {
LABEL_107:
              v52 = (unint64_t *)&v51->__shared_owners_;
              do
                v53 = __ldxr(v52);
              while (__stxr(v53 + 1, v52));
            }
          }
          else
          {
            dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, buf);
            v51 = *(std::__shared_weak_count **)algn_1ED710088;
            v62 = GetABMLogServer(void)::sLogServer;
            v63 = *(_QWORD *)algn_1ED710088;
            if (*(_QWORD *)algn_1ED710088)
              goto LABEL_107;
          }
          v54 = *((_QWORD *)GetGlobalLogger(&v62) + 4);
          if (!v51)
            goto LABEL_159;
          v55 = (unint64_t *)&v51->__shared_owners_;
          do
            v56 = __ldaxr(v55);
          while (__stlxr(v56 - 1, v55));
          if (!v56)
          {
            ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
            std::__shared_weak_count::__release_weak(v51);
            if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              goto LABEL_120;
LABEL_114:
            v57 = &__dst;
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v57 = (std::string *)__dst.__r_.__value_.__r.__words[0];
            LODWORD(buf[0].__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v57;
            _os_log_impl(&dword_1BF335000, v54, OS_LOG_TYPE_DEFAULT, "#I Remove callback for id: %s", (uint8_t *)buf, 0xCu);
            if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_117;
LABEL_121:
            v58 = aBlock[1];
            if (!aBlock[1])
            {
LABEL_123:

              break;
            }
          }
          else
          {
LABEL_159:
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              goto LABEL_114;
LABEL_120:
            if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_121;
LABEL_117:
            operator delete(v69.__r_.__value_.__l.__data_);
            v58 = aBlock[1];
            if (!aBlock[1])
              goto LABEL_123;
          }
          dispatch_release(v58);
          goto LABEL_123;
        }
      }
      else
      {
        if (v30 >= size)
          goto LABEL_46;
LABEL_32:
        v22 = (uint64_t **)v22[1];
        if (!v22)
          goto LABEL_47;
      }
    }
  }
  v76 = 0;
  v75 = 0u;
  memset(buf, 0, sizeof(buf));
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    buf[0] = __dst;
    if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_126:
      buf[1] = v70;
      goto LABEL_137;
    }
    goto LABEL_129;
  }
  std::string::__assign_no_alias<true>(buf, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  if ((SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((*((_BYTE *)&v70.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_126;
LABEL_129:
    std::string::__assign_no_alias<true>(buf[1].__r_.__value_.__r.__words, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
    goto LABEL_137;
  }
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v59 = &v70;
  else
    v59 = (std::string *)v70.__r_.__value_.__r.__words[0];
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v60 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
  else
    v60 = v70.__r_.__value_.__l.__size_;
  std::string::__assign_no_alias<false>((void **)&buf[1].__r_.__value_.__l.__data_, v59, v60);
LABEL_137:
  objc_msgSend(*(id *)(a1 + 40), "updateAnalyticsEvent:withUserReponse:", buf, 1);
  if (SHIBYTE(v76) < 0)
  {
    operator delete((void *)v75);
    if ((SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_139:
      if ((SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_140;
      goto LABEL_145;
    }
  }
  else if ((SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_139;
  }
  operator delete(buf[1].__r_.__value_.__l.__data_);
  if ((SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_140:
    if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_141;
LABEL_146:
    operator delete(v70.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_142;
LABEL_147:
    operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_142;
  }
LABEL_145:
  operator delete(buf[0].__r_.__value_.__l.__data_);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_146;
LABEL_141:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_147;
LABEL_142:
  objc_autoreleasePoolPop(context);
}

uint64_t __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  NSObject *fObj;

  std::__tree<std::__value_type<std::string,CallBackData>,std::__map_value_compare<std::string,std::__value_type<std::string,CallBackData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CallBackData>>>::destroy((char *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_);
  fObj = self->fQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
  objc_storeStrong((id *)&self->fUserNotificationCenter, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  return self;
}

@end
