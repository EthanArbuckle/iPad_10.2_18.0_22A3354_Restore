@implementation NFBackgroundActivityScheduler

- (NFBackgroundActivityScheduler)initWithQueue:(id)a3
{
  id v5;
  NFBackgroundActivityScheduler *v6;
  NFBackgroundActivityScheduler *v7;
  uint64_t v8;
  NSMutableDictionary *activityMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFBackgroundActivityScheduler;
  v6 = -[NFBackgroundActivityScheduler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_invalidated = 0;
    v8 = objc_opt_new();
    activityMap = v7->_activityMap;
    v7->_activityMap = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)getActivity:(id)a3
{
  id v4;
  NFBackgroundActivityScheduler *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_activityMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)registerActivity:(id)a3 identifier:(id)a4
{
  id v6;
  NFBackgroundActivityScheduler *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKey:](v7->_activityMap, "setObject:forKey:", v8, v6);
  objc_sync_exit(v7);

}

- (void)unregisterActivity:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NFBackgroundActivityScheduler_unregisterActivity___block_invoke;
  block[3] = &unk_1E7D7F040;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(queue, block);

}

void __52__NFBackgroundActivityScheduler_unregisterActivity___block_invoke(uint64_t a1)
{
  void *v2;
  char *v3;
  void *specific;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getActivity:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v5 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v5)
  {
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v5(6, "%c[%{public}s %{public}s]:%i unregisterActivity %{public}@ for identifier: %{public}@", v10, ClassName, Name, 49, v2, *(_QWORD *)(a1 + 40));
    v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v11 = dispatch_get_specific(v3);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v12 = (id)_NFSharedLogClient[(_QWORD)v11];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 2082;
    v25 = v16;
    v26 = 1024;
    v27 = 49;
    v28 = 2114;
    v29 = v2;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_1C34DB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i unregisterActivity %{public}@ for identifier: %{public}@", buf, 0x36u);
  }

  if (v2)
  {
    objc_msgSend(v2, "invalidate");

  }
  v18 = *(id *)(a1 + 32);
  objc_sync_enter(v18);
  objc_msgSend(*(id *)(a1 + 32), "activityMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_sync_exit(v18);
}

- (void)schedulePreRegisteredActivity:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  NSObject *queue;
  id v21;
  id v22;
  const char *Name;
  _QWORD block[5];
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v11)
  {
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 63);
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v16 = dispatch_get_specific(v9);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v17 = (id)_NFSharedLogClient[(_QWORD)v16];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v19;
    v30 = 2082;
    v31 = object_getClassName(self);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 63;
    _os_log_impl(&dword_1C34DB000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke;
  block[3] = &unk_1E7D7F090;
  block[4] = self;
  v25 = v7;
  v26 = v8;
  v27 = a2;
  v21 = v8;
  v22 = v7;
  dispatch_async(queue, block);

}

void __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *v4;
  void *specific;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getActivity:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v6)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        v11 = 45;
        if (isMetaClass)
          v11 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", v11, ClassName, Name, 69, *(_QWORD *)(a1 + 40), v3);
        v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v12 = dispatch_get_specific(v4);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v13 = (id)_NFSharedLogClient[(_QWORD)v12];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        v16 = object_getClassName(*(id *)(a1 + 32));
        v17 = sel_getName(*(SEL *)(a1 + 56));
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 67110402;
        v37 = v15;
        v38 = 2082;
        v39 = v16;
        v40 = 2082;
        v41 = v17;
        v42 = 1024;
        v43 = 69;
        v44 = 2114;
        v45 = v18;
        v46 = 2114;
        v47 = v3;
        _os_log_impl(&dword_1C34DB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", buf, 0x36u);
      }

      objc_msgSend(v3, "invalidate");
      goto LABEL_28;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", *(_QWORD *)(a1 + 40));
  v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v20 >= 4)
    goto LABEL_29;
  v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v20);
  if (v21)
  {
    v22 = object_getClass(*(id *)(a1 + 32));
    v23 = class_isMetaClass(v22);
    v24 = object_getClassName(*(id *)(a1 + 32));
    v25 = sel_getName(*(SEL *)(a1 + 56));
    v26 = 45;
    if (v23)
      v26 = 43;
    v21(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. Create a new activity: %{public}@", v26, v24, v25, 73, *(_QWORD *)(a1 + 40), v3);
    v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v27 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v28 = (id)_NFSharedLogClient[(_QWORD)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(*(id *)(a1 + 32));
    v32 = sel_getName(*(SEL *)(a1 + 56));
    v33 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    v37 = v30;
    v38 = 2082;
    v39 = v31;
    v40 = 2082;
    v41 = v32;
    v42 = 1024;
    v43 = 73;
    v44 = 2114;
    v45 = v33;
    v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_1C34DB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. Create a new activity: %{public}@", buf, 0x36u);
  }

LABEL_28:
  objc_msgSend(v3, "setPreregistered:", 1);
  objc_msgSend(*(id *)(a1 + 32), "registerActivity:identifier:", v3, *(_QWORD *)(a1 + 40));
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke_6;
  v34[3] = &unk_1E7D7F068;
  v35 = *(id *)(a1 + 48);
  objc_msgSend(v3, "scheduleWithBlock:", v34);

}

void __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);
  void (**v4)(id, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, _QWORD))(v2 + 16);
  v4 = a2;
  v3(v2, 0);
  v4[2](v4, 1);

}

- (void)backgroundActivityScheduler:(id)a3 interval:(double)a4 tolerance:(double)a5 repeats:(BOOL)a6 qualityOfService:(int64_t)a7 delay:(double)a8 callback:(id)a9
{
  id v17;
  id v18;
  char *v19;
  void *specific;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  NSObject *queue;
  id v31;
  id v32;
  const char *Name;
  _QWORD block[5];
  id v35;
  id v36;
  SEL v37;
  double v38;
  double v39;
  int64_t v40;
  double v41;
  BOOL v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a9;
  v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v21)
  {
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v25 = 45;
    if (isMetaClass)
      v25 = 43;
    v21(6, "%c[%{public}s %{public}s]:%i ", v25, ClassName, Name, 94);
    v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v26 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v27 = (id)_NFSharedLogClient[(_QWORD)v26];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    *(_DWORD *)buf = 67109890;
    v44 = v29;
    v45 = 2082;
    v46 = object_getClassName(self);
    v47 = 2082;
    v48 = sel_getName(a2);
    v49 = 1024;
    v50 = 94;
    _os_log_impl(&dword_1C34DB000, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke;
  block[3] = &unk_1E7D7F0B8;
  block[4] = self;
  v35 = v17;
  v38 = a4;
  v39 = a5;
  v42 = a6;
  v40 = a7;
  v41 = a8;
  v36 = v18;
  v37 = a2;
  v31 = v18;
  v32 = v17;
  dispatch_async(queue, block);

}

void __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *v4;
  void *specific;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getActivity:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v6)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        v11 = 45;
        if (isMetaClass)
          v11 = 43;
        v6(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", v11, ClassName, Name, 100, *(_QWORD *)(a1 + 40), v3);
        v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v12 = dispatch_get_specific(v4);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v13 = (id)_NFSharedLogClient[(_QWORD)v12];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        v16 = object_getClassName(*(id *)(a1 + 32));
        v17 = sel_getName(*(SEL *)(a1 + 56));
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 67110402;
        v37 = v15;
        v38 = 2082;
        v39 = v16;
        v40 = 2082;
        v41 = v17;
        v42 = 1024;
        v43 = 100;
        v44 = 2114;
        v45 = v18;
        v46 = 2114;
        v47 = v3;
        _os_log_impl(&dword_1C34DB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", buf, 0x36u);
      }

      objc_msgSend(v3, "invalidate");
      goto LABEL_28;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", *(_QWORD *)(a1 + 40));
  v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v20 >= 4)
    goto LABEL_29;
  v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v20);
  if (v21)
  {
    v22 = object_getClass(*(id *)(a1 + 32));
    v23 = class_isMetaClass(v22);
    v24 = object_getClassName(*(id *)(a1 + 32));
    v25 = sel_getName(*(SEL *)(a1 + 56));
    v26 = 45;
    if (v23)
      v26 = 43;
    v21(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. New activity: %{public}@", v26, v24, v25, 104, *(_QWORD *)(a1 + 40), v3);
    v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v27 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v28 = (id)_NFSharedLogClient[(_QWORD)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(*(id *)(a1 + 32));
    v32 = sel_getName(*(SEL *)(a1 + 56));
    v33 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    v37 = v30;
    v38 = 2082;
    v39 = v31;
    v40 = 2082;
    v41 = v32;
    v42 = 1024;
    v43 = 104;
    v44 = 2114;
    v45 = v33;
    v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_1C34DB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. New activity: %{public}@", buf, 0x36u);
  }

LABEL_28:
  objc_msgSend(v3, "setInterval:", *(double *)(a1 + 64));
  objc_msgSend(v3, "setTolerance:", *(double *)(a1 + 72));
  objc_msgSend(v3, "setRepeats:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(v3, "setQualityOfService:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v3, "setDelay:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "registerActivity:identifier:", v3, *(_QWORD *)(a1 + 40));
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke_9;
  v34[3] = &unk_1E7D7F068;
  v35 = *(id *)(a1 + 48);
  objc_msgSend(v3, "scheduleWithBlock:", v34);

}

void __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);
  void (**v4)(id, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, _QWORD))(v2 + 16);
  v4 = a2;
  v3(v2, 0);
  v4[2](v4, 1);

}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)activityMap
{
  return self->_activityMap;
}

- (void)setActivityMap:(id)a3
{
  objc_storeStrong((id *)&self->_activityMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
