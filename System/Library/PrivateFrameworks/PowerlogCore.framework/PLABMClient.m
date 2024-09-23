@implementation PLABMClient

void __32__PLABMClient_regMetricListener__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t block;
  uint64_t v5;
  BOOL (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __32__PLABMClient_regMetricListener__block_invoke_cold_1();
  v3 = objc_opt_class();
  block = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __32__PLABMClient_regMetricListener__block_invoke_54;
  v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  v8 = v3;
  if (_ZZZ32__PLABMClient_regMetricListener_EUb1_E11defaultOnce != -1)
    dispatch_once(&_ZZZ32__PLABMClient_regMetricListener_EUb1_E11defaultOnce, &block);
  if (_ZZZ32__PLABMClient_regMetricListener_EUb1_E17classDebugEnabled)
    NSLog(CFSTR("Received event metric: \n %@"), v2, block, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "sendMetricToLoggerUsing:", v2);

}

- (void)sendMetricToLoggerUsing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PLABMClient sendMetricToLoggerUsing:].cold.1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyMetricID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("metricId"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyPayload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("metricPayload"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyTriggerRef"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("metricTriggerRef"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyProfileID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("metricProfileId"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyAppID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("appId"));

  -[PLABMClient delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[PLABMClient delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "metricMessage:", v5);

  }
  else
  {
    v14 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLABMClient_sendMetricToLoggerUsing___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (-[PLABMClient sendMetricToLoggerUsing:]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient sendMetricToLoggerUsing:]::defaultOnce, block);
    if (-[PLABMClient sendMetricToLoggerUsing:]::classDebugEnabled)
      NSLog(CFSTR("*** unable to metric info to bbagent"));
    +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  }

}

- (PLABMClientMessageDelegate)delegate
{
  return (PLABMClientMessageDelegate *)objc_getProperty(self, a2, 32, 1);
}

void __40__PLABMClient_getBasebandTimeAndLatency__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = _CFXPCCreateCFObjectFromXPCObject();
  v13 = (id)v4;
  if (*a2)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFB7A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBCA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "unsignedIntegerValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue")/ 1000000.0+ (double)v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (id)getBasebandTimeAndLatency
{
  void *v3;
  NSObject *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  dispatch_time_t v10;
  TimeAndLatencyAbm *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  std::__shared_weak_count *v17;
  void *__p;
  char v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  cntrl = self->abmPLClnt.__cntrl_;
  v17 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  abm::client::GetBasebandTime();
  if (v19 < 0)
    operator delete(__p);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v10 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v4, v10))
  {
    dispatch_release(v4);
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v25[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v3);
    v15 = v14;
    dispatch_release(v4);
    v11 = -[TimeAndLatencyAbm initWithTime:andLatency:]([TimeAndLatencyAbm alloc], "initWithTime:andLatency:", v12, v15);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

+ (id)sharedABMClient
{
  if (+[PLABMClient sharedABMClient]::once != -1)
    dispatch_once(&+[PLABMClient sharedABMClient]::once, &__block_literal_global_29);
  return (id)+[PLABMClient sharedABMClient]::_sharedABMClient;
}

void __30__PLABMClient_sharedABMClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!+[PLABMClient sharedABMClient]::_sharedABMClient)
  {
    v0 = objc_opt_new();
    v1 = (void *)+[PLABMClient sharedABMClient]::_sharedABMClient;
    +[PLABMClient sharedABMClient]::_sharedABMClient = v0;

  }
}

- (PLABMClient)init
{
  PLABMClient *v2;
  NSObject *v3;
  NSObject *global_queue;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *__p;
  char v10;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLABMClient;
  v2 = -[PLABMClient init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(17, 0);
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create_with_target_V2("com.apple.powerlog.abm", v3, global_queue);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Powerlog");
    abm::client::CreateManager();
    std::shared_ptr<abm::client::Manager>::operator=[abi:ne180100]((uint64_t)&v2->abmPLClnt, &v11);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    if (v10 < 0)
      operator delete(__p);
  }
  return v2;
}

- (void)addDeviceConfigWith:(id)a3 andConfigExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  xpc_object_t v27;
  void *v28;
  void *v29;
  void *v30;
  __shared_weak_count *cntrl;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *__p;
  char v47;
  Manager *ptr;
  __shared_weak_count *v49;
  xpc_object_t *v50;
  void *v51;
  char v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  xpc_object_t object;
  xpc_object_t v60;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PLABMClient_addDeviceConfigWith_andConfigExtension___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v10;
  if (-[PLABMClient addDeviceConfigWith:andConfigExtension:]::defaultOnce != -1)
    dispatch_once(&-[PLABMClient addDeviceConfigWith:andConfigExtension:]::defaultOnce, block);
  if (-[PLABMClient addDeviceConfigWith:andConfigExtension:]::classDebugEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Bundle for this PLABMClient class: %@"), v11);

  }
  v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
      -[PLABMClient addDeviceConfigWith:andConfigExtension:].cold.4();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v9);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = xpc_data_create((const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
    if (!v21)
      v21 = xpc_null_create();
    if (!objc_msgSend(v20, "length") || MEMORY[0x1BCC9F134](v21) == MEMORY[0x1E0C81350])
    {
      v25 = 0;
      v26 = 0;
LABEL_50:
      xpc_release(v21);

      if (v26 < 0)
        operator delete(v25);
      goto LABEL_52;
    }
    v22 = xpc_dictionary_create(0, 0, 0);
    v23 = v22;
    v24 = MEMORY[0x1E0C812F8];
    if (v22)
    {
      v60 = v22;
    }
    else
    {
      v23 = xpc_null_create();
      v60 = v23;
      if (!v23)
      {
        v27 = xpc_null_create();
        v23 = 0;
        goto LABEL_23;
      }
    }
    if (MEMORY[0x1BCC9F134](v23) == v24)
    {
      xpc_retain(v23);
LABEL_24:
      xpc_release(v23);
      if (MEMORY[0x1BCC9F134](v60) == v24)
      {
        v58 = xpc_int64_create(1);
        if (!v58)
          v58 = xpc_null_create();
        v28 = (void *)*MEMORY[0x1E0CFC210];
        v50 = &v60;
        v51 = v28;
        xpc::dict::object_proxy::operator=((uint64_t)&v50, &v58, &object);
        xpc_release(object);
        object = 0;
        xpc_release(v58);
        v58 = 0;
        v56 = v21;
        if (v21)
          xpc_retain(v21);
        else
          v56 = xpc_null_create();
        v29 = (void *)*MEMORY[0x1E0CFAF78];
        v50 = &v60;
        v51 = v29;
        xpc::dict::object_proxy::operator=((uint64_t)&v50, &v56, &v57);
        xpc_release(v57);
        v57 = 0;
        xpc_release(v56);
        v56 = 0;
        v54 = xpc_int64_create(0);
        if (!v54)
          v54 = xpc_null_create();
        v30 = (void *)*MEMORY[0x1E0CFB0D8];
        v50 = &v60;
        v51 = v30;
        xpc::dict::object_proxy::operator=((uint64_t)&v50, &v54, &v55);
        xpc_release(v55);
        v55 = 0;
        xpc_release(v54);
        v53 = 0;
        v54 = 0;
        v53 = xpc_null_create();
        cntrl = self->abmPLClnt.__cntrl_;
        ptr = self->abmPLClnt.__ptr_;
        v49 = cntrl;
        if (cntrl)
        {
          v32 = (unint64_t *)((char *)cntrl + 8);
          do
            v33 = __ldxr(v32);
          while (__stxr(v33 + 1, v32));
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFB858]);
        abm::client::PerformCommand();
        v34 = (int)v50;
        v25 = v51;
        v26 = v52;
        v52 = 0;
        LOBYTE(v51) = 0;
        if (v47 < 0)
          operator delete(__p);
        v35 = (std::__shared_weak_count *)v49;
        if (v49)
        {
          v36 = (unint64_t *)((char *)v49 + 8);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v34)
        {
          if (v38)
            -[PLABMClient addDeviceConfigWith:andConfigExtension:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
          +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
        }
        else if (v38)
        {
          -[PLABMClient addDeviceConfigWith:andConfigExtension:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);
        }
      }
      else
      {
        v25 = 0;
        v26 = 0;
      }
      xpc_release(v60);
      goto LABEL_50;
    }
    v27 = xpc_null_create();
LABEL_23:
    v60 = v27;
    goto LABEL_24;
  }
  if (v12)
    -[PLABMClient addDeviceConfigWith:andConfigExtension:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
LABEL_52:

}

BOOL __54__PLABMClient_addDeviceConfigWith_andConfigExtension___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient addDeviceConfigWith:andConfigExtension:]::classDebugEnabled = result;
  return result;
}

- (void)regBootStateListener
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *__p;
  char v9;
  Manager *ptr;
  __shared_weak_count *v11;

  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFBD68]);
  abm::client::RegisterEventHandler();
  if (v9 < 0)
    operator delete(__p);
  v5 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v6 = (unint64_t *)((char *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void __35__PLABMClient_regBootStateListener__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t block;
  uint64_t v5;
  BOOL (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __35__PLABMClient_regBootStateListener__block_invoke_cold_1();
  v3 = objc_opt_class();
  block = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __35__PLABMClient_regBootStateListener__block_invoke_48;
  v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  v8 = v3;
  if (_ZZZ35__PLABMClient_regBootStateListener_EUb_E11defaultOnce != -1)
    dispatch_once(&_ZZZ35__PLABMClient_regBootStateListener_EUb_E11defaultOnce, &block);
  if (_ZZZ35__PLABMClient_regBootStateListener_EUb_E17classDebugEnabled)
    NSLog(CFSTR("Received boot state change: \n %@"), v2, block, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "sendBootStateChangInfoToLoggerUsing:", v2);

}

BOOL __35__PLABMClient_regBootStateListener__block_invoke_48(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _ZZZ35__PLABMClient_regBootStateListener_EUb_E17classDebugEnabled = result;
  return result;
}

- (void)regTriggerListener
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *__p;
  char v9;
  Manager *ptr;
  __shared_weak_count *v11;

  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFAFD8]);
  abm::client::RegisterEventHandler();
  if (v9 < 0)
    operator delete(__p);
  v5 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v6 = (unint64_t *)((char *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void __33__PLABMClient_regTriggerListener__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD block[5];

  v3 = (id)_CFXPCCreateCFObjectFromXPCObject();
  v2 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PLABMClient_regTriggerListener__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v2;
  if (_ZZZ33__PLABMClient_regTriggerListener_EUb0_E11defaultOnce != -1)
    dispatch_once(&_ZZZ33__PLABMClient_regTriggerListener_EUb0_E11defaultOnce, block);
  if (_ZZZ33__PLABMClient_regTriggerListener_EUb0_E17classDebugEnabled)
    NSLog(CFSTR("Received event trigger: \n %@"), v3);
  objc_msgSend(*(id *)(a1 + 32), "sendTriggerToLoggerUsing:", v3);

}

BOOL __33__PLABMClient_regTriggerListener__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _ZZZ33__PLABMClient_regTriggerListener_EUb0_E17classDebugEnabled = result;
  return result;
}

- (void)regMetricListener
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *__p;
  char v9;
  Manager *ptr;
  __shared_weak_count *v11;

  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFAFB0]);
  abm::client::RegisterEventHandler();
  if (v9 < 0)
    operator delete(__p);
  v5 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v6 = (unint64_t *)((char *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

BOOL __32__PLABMClient_regMetricListener__block_invoke_54(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _ZZZ32__PLABMClient_regMetricListener_EUb1_E17classDebugEnabled = result;
  return result;
}

- (void)regBBWakeListener
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *__p;
  char v9;
  Manager *ptr;
  __shared_weak_count *v11;

  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFB8A8]);
  abm::client::RegisterEventHandler();
  if (v9 < 0)
    operator delete(__p);
  v5 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v6 = (unint64_t *)((char *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void __32__PLABMClient_regBBWakeListener__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t block;
  uint64_t v5;
  BOOL (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __32__PLABMClient_regBBWakeListener__block_invoke_cold_1();
  v3 = objc_opt_class();
  block = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __32__PLABMClient_regBBWakeListener__block_invoke_57;
  v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  v8 = v3;
  if (_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E11defaultOnce != -1)
    dispatch_once(&_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E11defaultOnce, &block);
  if (_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E17classDebugEnabled)
    NSLog(CFSTR("Received BB wake info: \n %@"), v2, block, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "sendWakeInfoToLoggerUsing:", v2);

}

BOOL __32__PLABMClient_regBBWakeListener__block_invoke_57(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _ZZZ32__PLABMClient_regBBWakeListener_EUb2_E17classDebugEnabled = result;
  return result;
}

- (void)startListening
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "%s: Start listening", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

BOOL __29__PLABMClient_startListening__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient startListening]::classDebugEnabled = result;
  return result;
}

- (void)removeDeviceConfig
{
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  char v8;
  void *v9;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];
  _QWORD v20[5];
  void *__p;
  char v22;
  Manager *ptr;
  __shared_weak_count *v24;
  xpc_object_t *v25;
  void *v26;
  char v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  v5 = MEMORY[0x1E0C812F8];
  if (v3)
  {
    v31 = v3;
  }
  else
  {
    v4 = xpc_null_create();
    v31 = v4;
    if (!v4)
    {
      v6 = xpc_null_create();
      v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1BCC9F134](v4) == v5)
  {
    xpc_retain(v4);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  v31 = v6;
LABEL_9:
  xpc_release(v4);
  if (MEMORY[0x1BCC9F134](v31) == v5)
  {
    v29 = xpc_int64_create(1);
    if (!v29)
      v29 = xpc_null_create();
    v9 = (void *)*MEMORY[0x1E0CFC210];
    v25 = &v31;
    v26 = v9;
    xpc::dict::object_proxy::operator=((uint64_t)&v25, &v29, &v30);
    xpc_release(v30);
    v30 = 0;
    xpc_release(v29);
    v28 = 0;
    v29 = 0;
    v28 = xpc_null_create();
    cntrl = self->abmPLClnt.__cntrl_;
    ptr = self->abmPLClnt.__ptr_;
    v24 = cntrl;
    if (cntrl)
    {
      v11 = (unint64_t *)((char *)cntrl + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFBAA0]);
    abm::client::PerformCommand();
    v13 = (int)v25;
    v7 = v26;
    v8 = v27;
    v27 = 0;
    LOBYTE(v26) = 0;
    if (v22 < 0)
      operator delete(__p);
    v14 = (std::__shared_weak_count *)v24;
    if (v24)
    {
      v15 = (unint64_t *)((char *)v24 + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v13)
    {
      v17 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLABMClient_removeDeviceConfig__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v17;
      if (-[PLABMClient removeDeviceConfig]::defaultOnce != -1)
        dispatch_once(&-[PLABMClient removeDeviceConfig]::defaultOnce, block);
      if (-[PLABMClient removeDeviceConfig]::classDebugEnabled)
        NSLog(CFSTR("Failed to remove config"));
    }
    else
    {
      v18 = objc_opt_class();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __33__PLABMClient_removeDeviceConfig__block_invoke;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v18;
      if (-[PLABMClient removeDeviceConfig]::defaultOnce != -1)
        dispatch_once(&-[PLABMClient removeDeviceConfig]::defaultOnce, v20);
      if (-[PLABMClient removeDeviceConfig]::classDebugEnabled)
        NSLog(CFSTR("Successfully removed config"));
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  xpc_release(v31);
  if (v8 < 0)
    operator delete(v7);
}

BOOL __33__PLABMClient_removeDeviceConfig__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient removeDeviceConfig]::classDebugEnabled = result;
  return result;
}

BOOL __33__PLABMClient_removeDeviceConfig__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient removeDeviceConfig]::classDebugEnabled = result;
  return result;
}

- (void)triggerPeriodicMetrics:(int)a3
{
  uint64_t v3;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __shared_weak_count *cntrl;
  unint64_t *v25;
  unint64_t v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD block[5];
  _QWORD v48[5];
  void *__p;
  char v50;
  Manager *ptr;
  __shared_weak_count *v52;
  xpc_object_t *v53;
  void *v54;
  char v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  xpc_object_t v59;
  xpc_object_t v60;
  xpc_object_t v61;
  xpc_object_t v62;
  xpc_object_t v63;
  xpc_object_t v64;
  xpc_object_t v65;
  xpc_object_t v66;
  xpc_object_t v67;
  xpc_object_t v68;
  xpc_object_t v69;

  v3 = *(_QWORD *)&a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  v7 = MEMORY[0x1E0C812F8];
  if (v5)
  {
    v69 = v5;
  }
  else
  {
    v6 = xpc_null_create();
    v69 = v6;
    if (!v6)
    {
      v8 = xpc_null_create();
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1BCC9F134](v6) == v7)
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  v8 = xpc_null_create();
LABEL_8:
  v69 = v8;
LABEL_9:
  xpc_release(v6);
  if (MEMORY[0x1BCC9F134](v69) != v7)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_49;
  }
  v67 = xpc_int64_create(1);
  if (!v67)
    v67 = xpc_null_create();
  v11 = (void *)*MEMORY[0x1E0CFC210];
  v53 = &v69;
  v54 = v11;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v67, &v68);
  xpc_release(v68);
  v68 = 0;
  xpc_release(v67);
  v67 = 0;
  v65 = xpc_int64_create(0);
  if (!v65)
    v65 = xpc_null_create();
  v12 = (void *)*MEMORY[0x1E0CFB080];
  v53 = &v69;
  v54 = v12;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v65, &v66);
  xpc_release(v66);
  v66 = 0;
  xpc_release(v65);
  v65 = 0;
  v63 = xpc_int64_create(0);
  if (!v63)
    v63 = xpc_null_create();
  v13 = (void *)*MEMORY[0x1E0CFB108];
  v53 = &v69;
  v54 = v13;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v63, &v64);
  xpc_release(v64);
  v64 = 0;
  xpc_release(v63);
  v63 = 0;
  v61 = xpc_int64_create((int)v3);
  if (!v61)
    v61 = xpc_null_create();
  v14 = (void *)*MEMORY[0x1E0CFB038];
  v53 = &v69;
  v54 = v14;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v61, &v62);
  xpc_release(v62);
  v62 = 0;
  xpc_release(v61);
  v61 = 0;
  v59 = xpc_int64_create(0);
  if (!v59)
    v59 = xpc_null_create();
  v15 = (void *)*MEMORY[0x1E0CFB008];
  v53 = &v69;
  v54 = v15;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v59, &v60);
  xpc_release(v60);
  v60 = 0;
  xpc_release(v59);
  v59 = 0;
  v57 = xpc_int64_create(0);
  if (!v57)
    v57 = xpc_null_create();
  v16 = (void *)*MEMORY[0x1E0CFAFB8];
  v53 = &v69;
  v54 = v16;
  xpc::dict::object_proxy::operator=((uint64_t)&v53, &v57, &v58);
  xpc_release(v58);
  v58 = 0;
  xpc_release(v57);
  v57 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PLABMClient triggerPeriodicMetrics:].cold.3(v3, v17, v18, v19, v20, v21, v22, v23);
  v56 = 0;
  v56 = xpc_null_create();
  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  v52 = cntrl;
  if (cntrl)
  {
    v25 = (unint64_t *)((char *)cntrl + 8);
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E0CFB310]);
  abm::client::PerformCommand();
  v27 = (int)v53;
  v9 = v54;
  v10 = v55;
  v55 = 0;
  LOBYTE(v54) = 0;
  if (v50 < 0)
    operator delete(__p);
  v28 = (std::__shared_weak_count *)v52;
  if (!v52)
    goto LABEL_34;
  v29 = (unint64_t *)((char *)v52 + 8);
  do
    v30 = __ldaxr(v29);
  while (__stlxr(v30 - 1, v29));
  if (!v30)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if (v27)
      goto LABEL_35;
  }
  else
  {
LABEL_34:
    if (v27)
    {
LABEL_35:
      v31 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLABMClient_triggerPeriodicMetrics___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v31;
      if (-[PLABMClient triggerPeriodicMetrics:]::defaultOnce != -1)
        dispatch_once(&-[PLABMClient triggerPeriodicMetrics:]::defaultOnce, block);
      if (-[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled)
        NSLog(CFSTR("Failed query command"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[PLABMClient triggerPeriodicMetrics:].cold.2(v3, v32, v33, v34, v35, v36, v37, v38);
      +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
      goto LABEL_49;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PLABMClient triggerPeriodicMetrics:].cold.1(v3, v39, v40, v41, v42, v43, v44, v45);
  v46 = objc_opt_class();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __38__PLABMClient_triggerPeriodicMetrics___block_invoke;
  v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v48[4] = v46;
  if (-[PLABMClient triggerPeriodicMetrics:]::defaultOnce != -1)
    dispatch_once(&-[PLABMClient triggerPeriodicMetrics:]::defaultOnce, v48);
  if (-[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled)
    NSLog(CFSTR("Successfully executed query command"));
LABEL_49:
  xpc_release(v69);
  if (v10 < 0)
    operator delete(v9);
}

BOOL __38__PLABMClient_triggerPeriodicMetrics___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled = result;
  return result;
}

BOOL __38__PLABMClient_triggerPeriodicMetrics___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled = result;
  return result;
}

- (void)sendTriggerToLoggerUsing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t block;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  uint64_t v19;

  v14 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kKeyTriggerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("triggerId"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kKeyTriggerRef"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("triggerRef"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kKeyTriggerType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("triggerType"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kKeyTriggerTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("triggerTime"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kKeyAppID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("appId"));

  -[PLABMClient delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PLABMClient delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerMessage:", v4);

  }
  else
  {
    v13 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __40__PLABMClient_sendTriggerToLoggerUsing___block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v13;
    if (-[PLABMClient sendTriggerToLoggerUsing:]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient sendTriggerToLoggerUsing:]::defaultOnce, &block);
    if (-[PLABMClient sendTriggerToLoggerUsing:]::classDebugEnabled)
      NSLog(CFSTR("*** unable to send trigger info to bbagent"));
    +[PLDefaults debugEnabled](PLDefaults, "debugEnabled", v14, block, v16, v17, v18, v19);
  }

}

BOOL __40__PLABMClient_sendTriggerToLoggerUsing___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient sendTriggerToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

BOOL __39__PLABMClient_sendMetricToLoggerUsing___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient sendMetricToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (void)sendWakeInfoToLoggerUsing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t block;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  uint64_t v13;

  v8 = (id)objc_msgSend(a3, "copy");
  if (v8
    && (-[PLABMClient delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    -[PLABMClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wakeMessage:", v8);

  }
  else
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __41__PLABMClient_sendWakeInfoToLoggerUsing___block_invoke;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v7;
    if (-[PLABMClient sendWakeInfoToLoggerUsing:]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient sendWakeInfoToLoggerUsing:]::defaultOnce, &block);
    if (-[PLABMClient sendWakeInfoToLoggerUsing:]::classDebugEnabled)
      NSLog(CFSTR("*** unable to send wake info to bbagent"));
    +[PLDefaults debugEnabled](PLDefaults, "debugEnabled", v8, block, v10, v11, v12, v13);
  }

}

BOOL __41__PLABMClient_sendWakeInfoToLoggerUsing___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient sendWakeInfoToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (void)sendBootStateChangInfoToLoggerUsing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t block;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  uint64_t v13;

  v8 = (id)objc_msgSend(a3, "copy");
  if (v8
    && (-[PLABMClient delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    -[PLABMClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bootStateChange:", v8);

  }
  else
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __51__PLABMClient_sendBootStateChangInfoToLoggerUsing___block_invoke;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v7;
    if (-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::defaultOnce, &block);
    if (-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::classDebugEnabled)
      NSLog(CFSTR("*** unable to send boot state change to bbagent"));
    +[PLDefaults debugEnabled](PLDefaults, "debugEnabled", v8, block, v10, v11, v12, v13);
  }

}

BOOL __51__PLABMClient_sendBootStateChangInfoToLoggerUsing___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient sendBootStateChangInfoToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (id)getLTESleepManagerStats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  id v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  dispatch_time_t v16;
  std::__shared_weak_count *v18;
  void *__p;
  char v20;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFB778]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6ABAFE8, v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBC98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6ABAFE8, v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBF08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6ABAFE8, v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBF70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6ABAFE8, v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFB210]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6ABAFE8, v8);

  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  cntrl = self->abmPLClnt.__cntrl_;
  v18 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = v3;
  abm::client::GetBasebandLTEStatistics();
  if (v20 < 0)
    operator delete(__p);
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v16 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v9, v16);
  dispatch_release(v9);

  return v13;
}

void __38__PLABMClient_getLTESleepManagerStats__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v4 = _CFXPCCreateCFObjectFromXPCObject();
  v31 = (id)v4;
  if (*a2)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *MEMORY[0x1E0CFB778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFB778]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, v10);

    v11 = *(void **)(a1 + 32);
    v12 = *MEMORY[0x1E0CFBC98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBC98]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, v15);

    v16 = *(void **)(a1 + 32);
    v17 = *MEMORY[0x1E0CFBF08];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBF08]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v19, v20);

    v21 = *(void **)(a1 + 32);
    v22 = *MEMORY[0x1E0CFBF70];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFBF70]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, v25);

    v26 = *(void **)(a1 + 32);
    v27 = *MEMORY[0x1E0CFB210];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0CFB210]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v29, v30);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)getBasebandBootState
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void **v11;
  uint64_t v12;
  void **v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void **v18;
  uint64_t v19;
  void **v20;
  _QWORD v22[5];
  _QWORD v23[5];
  void *__p[2];
  char v25;
  _QWORD block[6];
  __shared_weak_count *v27;
  int v28;
  void *v29;
  char v30;
  void *v31[2];
  uint64_t v32;

  v31[0] = 0;
  v31[1] = 0;
  v32 = 0;
  cntrl = self->abmPLClnt.__cntrl_;
  block[5] = self->abmPLClnt.__ptr_;
  v27 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  abm::client::GetBasebandBootState();
  if (v27)
  {
    v5 = (uint64_t *)((char *)v27 + 8);
    do
      v6 = __ldaxr((unint64_t *)v5);
    while (__stlxr(v6 - 1, (unint64_t *)v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v27 + 16))(v27);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v27);
    }
  }
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PLABMClient_getBasebandBootState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v7;
  if (-[PLABMClient getBasebandBootState]::defaultOnce != -1)
    dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, block);
  if (-[PLABMClient getBasebandBootState]::classDebugEnabled)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    TelephonyXPC::Result::describe((uint64_t *)__p, (TelephonyXPC::Result *)&v28);
    v10 = v25;
    v11 = (void **)__p[0];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v10 >= 0)
      v13 = __p;
    else
      v13 = v11;
    objc_msgSend(v9, "stringWithCString:encoding:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 < 0)
      operator delete(__p[0]);
    NSLog(CFSTR("BB boot state result: %@"), v14);

  }
  if (v28)
  {
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __35__PLABMClient_getBasebandBootState__block_invoke_3;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = objc_opt_class();
    if (-[PLABMClient getBasebandBootState]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, v22);
    if (-[PLABMClient getBasebandBootState]::classDebugEnabled)
      NSLog(CFSTR("Failed query baseband boot state"));
    v15 = CFSTR("ABM Client: Server is not running.");
  }
  else
  {
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __35__PLABMClient_getBasebandBootState__block_invoke_2;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (-[PLABMClient getBasebandBootState]::defaultOnce != -1)
      dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, v23);
    if (-[PLABMClient getBasebandBootState]::classDebugEnabled)
      NSLog(CFSTR("Successfully query baseband boot state"));
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = SHIBYTE(v32);
    v18 = (void **)v31[0];
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v17 >= 0)
      v20 = v31;
    else
      v20 = v18;
    objc_msgSend(v16, "stringWithCString:encoding:", v20, v19);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v30 < 0)
    operator delete(v29);
  if (SHIBYTE(v32) < 0)
    operator delete(v31[0]);
  return v15;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

- (void)addICEDeviceConfig
{
  -[PLABMClient addDeviceConfigWith:andConfigExtension:](self, "addDeviceConfigWith:andConfigExtension:", CFSTR("abic-pl"), CFSTR("config"));
}

- (void)addICEDeviceConfigDebug
{
  -[PLABMClient addDeviceConfigWith:andConfigExtension:](self, "addDeviceConfigWith:andConfigExtension:", CFSTR("abic-pl-30s-period"), CFSTR("config"));
}

- (void)addMavDeviceConfig
{
  const __CFString *v3;

  if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
    v3 = CFSTR("Cellular_Power_Log_full_300s");
  else
    v3 = CFSTR("Cellular_Power_Log_lite_300s");
  -[PLABMClient addDeviceConfigWith:andConfigExtension:](self, "addDeviceConfigWith:andConfigExtension:", v3, CFSTR("config"));
}

- (void)addMavDeviceConfigDebug
{
  const __CFString *v3;

  if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
    v3 = CFSTR("Cellular_Power_Log_full_30s");
  else
    v3 = CFSTR("Cellular_Power_Log_lite_30s");
  -[PLABMClient addDeviceConfigWith:andConfigExtension:](self, "addDeviceConfigWith:andConfigExtension:", v3, CFSTR("config"));
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&self->abmPLClnt);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "Unable to use ABM component config file", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "Successfully added config", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "Failed to add config", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)addDeviceConfigWith:andConfigExtension:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "Found device config file at: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void __35__PLABMClient_regBootStateListener__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "Received boot state change: \n %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void __32__PLABMClient_regMetricListener__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "BBAgent: Received event metric: \n %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void __32__PLABMClient_regBBWakeListener__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "BBAgent: Received BB Wake info: \n %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "ABM Client: Successfully executed Query Command %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "ABM Client: Failed Query Command %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "ABM Client: triggerPeriodicMetrics with trigger id %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)sendMetricToLoggerUsing:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "BB Agent: sendMetricToLoggerUsing %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

@end
