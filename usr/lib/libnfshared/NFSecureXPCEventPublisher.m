@implementation NFSecureXPCEventPublisher

- (void)sendSimpleEvent:(id)a3
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:dispatch:](self, a3, 1);
}

void __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  __int128 v3;
  id v4;
  _QWORD v5[5];
  __int128 v6;

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = v1 + 4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2;
  v5[3] = &unk_1E7D7F040;
  v5[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v4 = (id)v3;
  v6 = v3;
  os_unfair_lock_lock(v2);
  __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2((uint64_t)v5);
  os_unfair_lock_unlock(v2);

}

void __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2(uint64_t a1)
{
  _xpc_connection_s *v2;
  Class Class;
  const _xpc_type_s *v4;
  char *v5;
  void *specific;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  char *v19;
  void *v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  char *v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  const char *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_syncSetupConnection");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    Class = object_getClass(*(id *)(a1 + 40));
    if (Class != (Class)MEMORY[0x1E0C812F8])
    {
      v4 = Class;
      v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific < 4)
      {
        v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
        if (v7)
        {
          v8 = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(v8);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 48));
          v38 = xpc_type_get_name(v4);
          v12 = 45;
          if (isMetaClass)
            v12 = 43;
          v7(3, "%c[%{public}s %{public}s]:%i Invalid event type: %s", v12, ClassName, Name, 146, v38);
          v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v13 = dispatch_get_specific(v5);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v14 = (id)_NFSharedLogClient[(_QWORD)v13];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v15))
            v16 = 43;
          else
            v16 = 45;
          v17 = object_getClassName(*(id *)(a1 + 32));
          v18 = sel_getName(*(SEL *)(a1 + 48));
          *(_DWORD *)buf = 67110146;
          v40 = v16;
          v41 = 2082;
          v42 = v17;
          v43 = 2082;
          v44 = v18;
          v45 = 1024;
          v46 = 146;
          v47 = 2080;
          v48 = xpc_type_get_name(v4);
          _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid event type: %s", buf, 0x2Cu);
        }

        goto LABEL_36;
      }
LABEL_37:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v35 = objc_msgSend(*(id *)(a1 + 32), "qosPropagation");
    NFSharedSignpostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_signpost_enabled(v36);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFSecureXPCEventPublisher_post_wQOS", (const char *)&unk_1C350844F, buf, 2u);
      }

      xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    }
    else
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFSecureXPCEventPublisher_post", (const char *)&unk_1C350844F, buf, 2u);
      }

      xpc_connection_send_notification();
    }
  }
  else
  {
    v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v20 >= 4)
      goto LABEL_37;
    v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v20);
    if (v21)
    {
      v22 = object_getClass(*(id *)(a1 + 32));
      v23 = class_isMetaClass(v22);
      v24 = object_getClassName(*(id *)(a1 + 32));
      v25 = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 45;
      if (v23)
        v27 = 43;
      v21(3, "%c[%{public}s %{public}s]:%i Service unavailable: %{public}@", v27, v24, v25, 141, v26);

      v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v28 = dispatch_get_specific(v19);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v29 = (id)_NFSharedLogClient[(_QWORD)v28];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(*(id *)(a1 + 32));
      v33 = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v40 = v31;
      v41 = 2082;
      v42 = v32;
      v43 = 2082;
      v44 = v33;
      v45 = 1024;
      v46 = 141;
      v47 = 2114;
      v48 = v34;
      _os_log_impl(&dword_1C34DB000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Service unavailable: %{public}@", buf, 0x2Cu);

    }
  }
LABEL_36:

}

- (id)_syncSetupConnection
{
  OS_xpc_object *connection;
  id v6;
  const char *v7;
  OS_xpc_object *mach_service;
  OS_xpc_object *v9;
  OS_xpc_object *v10;
  OS_xpc_object *v11;
  char *v12;
  void *specific;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *Name;
  _QWORD handler[4];
  id v25[2];
  id location;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
    return connection;
  -[NFSecureXPCEventPublisher serviceName](self, "serviceName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  mach_service = xpc_connection_create_mach_service(v7, (dispatch_queue_t)self->_xpcConnectionQueue, 2uLL);
  v9 = self->_connection;
  self->_connection = mach_service;

  if (self->_connection)
  {
    objc_initWeak(&location, self);
    v10 = self->_connection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke;
    handler[3] = &unk_1E7D7F7C8;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a2;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_activate(self->_connection);
    v11 = self->_connection;
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
    return v11;
  }
  else
  {
    v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v14 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v14)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Invalid connection creation", v18, ClassName, Name, 57);
      v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v19 = dispatch_get_specific(v12);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v20 = (id)_NFSharedLogClient[(_QWORD)v19];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      LODWORD(location) = 67109890;
      HIDWORD(location) = v22;
      v27 = 2082;
      v28 = object_getClassName(self);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 57;
      _os_log_impl(&dword_1C34DB000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid connection creation", (uint8_t *)&location, 0x22u);
    }

    return 0;
  }
}

- (void)_sendSimpleEvent:(char)a3 dispatch:
{
  xpc_object_t v5;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  if (a1)
  {
    keys[0] = "xpcEventName";
    values = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
    v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v5, a3);

  }
}

- (void)_sendEvent:(char)a3 dispatch:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  dispatch_block_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  char *v14;

  v5 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke;
  v12[3] = &unk_1E7D7F040;
  v12[4] = a1;
  v14 = sel__sendEvent_dispatch_;
  v6 = v5;
  v13 = v6;
  v7 = MEMORY[0x1C3BD24E8](v12);
  v8 = (void *)v7;
  if ((a3 & 1) != 0)
  {
    if (objc_msgSend(a1, "qosPropagation"))
    {
      v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, (dispatch_qos_class_t)objc_msgSend(a1, "qos"), -1, v8);
      objc_msgSend(a1, "eventSendQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v10, v9);

    }
    else
    {
      objc_msgSend(a1, "eventSendQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v11, v8);

    }
  }
  else
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }

}

- (OS_dispatch_queue)eventSendQueue
{
  return self->_eventSendQueue;
}

- (BOOL)sendDictionary:(id)a3
{
  return -[NFSecureXPCEventPublisher _sendDictionary:dispatch:](self, a3, 1);
}

- (BOOL)_sendDictionary:(char)a3 dispatch:
{
  id v5;
  void *v6;
  _BOOL8 v7;
  char *v8;
  void *specific;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
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
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v7 = v6 != 0;
    if (v6)
    {
      -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v6, a3);
    }
    else
    {
      v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v10 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v10)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(sel__sendDictionary_dispatch_);
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v10(3, "%c[%{public}s %{public}s]:%i Invalid dictionary content: %{public}@", v13, ClassName, Name, 245, v5);
        v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v14 = dispatch_get_specific(v8);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v15 = (id)_NFSharedLogClient[(_QWORD)v14];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(a1);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        *(_DWORD *)buf = 67110146;
        v22 = v17;
        v23 = 2082;
        v24 = object_getClassName(a1);
        v25 = 2082;
        v26 = sel_getName(sel__sendDictionary_dispatch_);
        v27 = 1024;
        v28 = 245;
        v29 = 2114;
        v30 = v5;
        _os_log_impl(&dword_1C34DB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid dictionary content: %{public}@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    xpc_connection_cancel(connection);
  v4.receiver = self;
  v4.super_class = (Class)NFSecureXPCEventPublisher;
  -[NFSecureXPCEventPublisher dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD v3[5];

  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__NFSecureXPCEventPublisher_invalidate__block_invoke;
  v3[3] = &unk_1E7D7F7A0;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __39__NFSecureXPCEventPublisher_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

void __39__NFSecureXPCEventPublisher_invalidate__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    xpc_connection_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

  }
}

void __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  Class Class;
  const _xpc_type_s *v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  char *v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  char *v36;
  char *v37;
  void *v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  char *v52;
  char *v53;
  void *v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *string_ptr;
  _QWORD v69[5];
  uint8_t buf[4];
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  const char *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_57;
  Class = object_getClass(v3);
  if (Class != (Class)MEMORY[0x1E0C81310])
  {
    v6 = Class;
    v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v9)
      {
        v10 = object_getClass(WeakRetained);
        isMetaClass = class_isMetaClass(v10);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 40));
        v67 = xpc_type_get_name(v6);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v9(4, "%c[%{public}s %{public}s]:%i Unexpected typed: %s", v14, ClassName, Name, 87, v67);
        v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v15 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v16 = (id)_NFSharedLogClient[(_QWORD)v15];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = object_getClass(WeakRetained);
        if (class_isMetaClass(v17))
          v18 = 43;
        else
          v18 = 45;
        v19 = object_getClassName(WeakRetained);
        v20 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        v71 = v18;
        v72 = 2082;
        v73 = v19;
        v74 = 2082;
        v75 = v20;
        v76 = 1024;
        v77 = 87;
        v78 = 2080;
        v79 = xpc_type_get_name(v6);
        _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected typed: %s", buf, 0x2Cu);
      }

      goto LABEL_57;
    }
LABEL_58:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if (xpc_equal(v3, MEMORY[0x1E0C81258]))
  {
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v22 >= 4)
      goto LABEL_58;
    v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v22);
    if (v23)
    {
      v24 = object_getClass(WeakRetained);
      v25 = class_isMetaClass(v24);
      v26 = object_getClassName(WeakRetained);
      v27 = sel_getName(*(SEL *)(a1 + 40));
      -[os_unfair_lock_s serviceName](WeakRetained, "serviceName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 45;
      if (v25)
        v29 = 43;
      v23(6, "%c[%{public}s %{public}s]:%i Service interrupted: %@", v29, v26, v27, 73, v28);

      v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v30 = dispatch_get_specific(v21);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v31 = (id)_NFSharedLogClient[(_QWORD)v30];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = object_getClass(WeakRetained);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(WeakRetained);
      v35 = sel_getName(*(SEL *)(a1 + 40));
      -[os_unfair_lock_s serviceName](WeakRetained, "serviceName");
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v71 = v33;
      v72 = 2082;
      v73 = v34;
      v74 = 2082;
      v75 = v35;
      v76 = 1024;
      v77 = 73;
      v78 = 2112;
      v79 = v36;
      _os_log_impl(&dword_1C34DB000, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service interrupted: %@", buf, 0x2Cu);

    }
    goto LABEL_56;
  }
  if (!xpc_equal(v3, MEMORY[0x1E0C81260]))
  {
    xpc_dictionary_get_value(v3, (const char *)*MEMORY[0x1E0C81270]);
    v31 = objc_claimAutoreleasedReturnValue();
    v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v54 >= 4)
      goto LABEL_58;
    v55 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v54);
    if (v55)
    {
      v56 = object_getClass(WeakRetained);
      v57 = class_isMetaClass(v56);
      v58 = object_getClassName(WeakRetained);
      v59 = sel_getName(*(SEL *)(a1 + 40));
      string_ptr = xpc_string_get_string_ptr(v31);
      v60 = 45;
      if (v57)
        v60 = 43;
      v55(3, "%c[%{public}s %{public}s]:%i %s", v60, v58, v59, 84, string_ptr);
      v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v61 = dispatch_get_specific(v53);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v62 = (id)_NFSharedLogClient[(_QWORD)v61];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = object_getClass(WeakRetained);
      if (class_isMetaClass(v63))
        v64 = 43;
      else
        v64 = 45;
      v65 = object_getClassName(WeakRetained);
      v66 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      v71 = v64;
      v72 = 2082;
      v73 = v65;
      v74 = 2082;
      v75 = v66;
      v76 = 1024;
      v77 = 84;
      v78 = 2080;
      v79 = xpc_string_get_string_ptr(v31);
      _os_log_impl(&dword_1C34DB000, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %s", buf, 0x2Cu);
    }

LABEL_56:
    goto LABEL_57;
  }
  v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v38 >= 4)
    goto LABEL_58;
  v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v38);
  if (v39)
  {
    v40 = object_getClass(WeakRetained);
    v41 = class_isMetaClass(v40);
    v42 = object_getClassName(WeakRetained);
    v43 = sel_getName(*(SEL *)(a1 + 40));
    -[os_unfair_lock_s serviceName](WeakRetained, "serviceName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 45;
    if (v41)
      v45 = 43;
    v39(6, "%c[%{public}s %{public}s]:%i Service not available: %@", v45, v42, v43, 75, v44);

    v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v46 = dispatch_get_specific(v37);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v47 = (id)_NFSharedLogClient[(_QWORD)v46];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = object_getClass(WeakRetained);
    if (class_isMetaClass(v48))
      v49 = 43;
    else
      v49 = 45;
    v50 = object_getClassName(WeakRetained);
    v51 = sel_getName(*(SEL *)(a1 + 40));
    -[os_unfair_lock_s serviceName](WeakRetained, "serviceName");
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v71 = v49;
    v72 = 2082;
    v73 = v50;
    v74 = 2082;
    v75 = v51;
    v76 = 1024;
    v77 = 75;
    v78 = 2112;
    v79 = v52;
    _os_log_impl(&dword_1C34DB000, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service not available: %@", buf, 0x2Cu);

  }
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4;
  v69[3] = &unk_1E7D7F7A0;
  v69[4] = WeakRetained;
  os_unfair_lock_lock(WeakRetained + 4);
  __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4((uint64_t)v69);
  os_unfair_lock_unlock(WeakRetained + 4);
LABEL_57:

}

void __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4(uint64_t a1)
{
  void *v2;
  _xpc_connection_s *v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  }
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4
{
  return -[NFSecureXPCEventPublisher initWithMachPort:xpcConnectionQueue:eventSendQueue:](self, "initWithMachPort:xpcConnectionQueue:eventSendQueue:", a3, a4, a4);
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 xpcConnectionQueue:(id)a4 eventSendQueue:(id)a5
{
  return -[NFSecureXPCEventPublisher initWithMachPort:qosPropagation:qos:xpcConnectionQueue:eventSendQueue:](self, "initWithMachPort:qosPropagation:qos:xpcConnectionQueue:eventSendQueue:", a3, 1, 33, a4, a5);
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 qosPropagation:(BOOL)a4 qos:(unsigned int)a5 xpcConnectionQueue:(id)a6 eventSendQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  NFSecureXPCEventPublisher *v16;
  NFSecureXPCEventPublisher *v17;
  NFSecureXPCEventPublisher *v18;
  id v19;
  objc_super v21;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFSecureXPCEventPublisher;
  v16 = -[NFSecureXPCEventPublisher init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceName, a3);
    v17->_qosPropagation = a4;
    v17->_qos = a5;
    objc_storeStrong((id *)&v17->_xpcConnectionQueue, a6);
    objc_storeStrong((id *)&v17->_eventSendQueue, a7);
    v17->_connectionLock._os_unfair_lock_opaque = 0;
    v18 = v17;
    os_unfair_lock_lock(&v17->_connectionLock);
    v19 = -[NFSecureXPCEventPublisher _syncSetupConnection](v18, "_syncSetupConnection");
    os_unfair_lock_unlock(&v17->_connectionLock);

  }
  return v17;
}

- (void)syncSendSimpleEvent:(id)a3
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:dispatch:](self, a3, 0);
}

- (void)_sendSimpleEvent:(void *)a3 objectString:(char)a4 dispatch:
{
  id v7;
  xpc_object_t v8;
  uint64_t i;
  xpc_object_t v10[2];
  char *keys[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    *(_OWORD *)keys = xmmword_1E7D7F7E8;
    v10[0] = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
    v10[1] = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String", v10[0]));
    v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v8, a4);

    for (i = 1; i != -1; --i)
  }

}

- (void)sendSimpleEvent:(id)a3 objectString:(id)a4
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:objectString:dispatch:](self, a3, a4, 1);
}

- (void)syncSendSimpleEvent:(id)a3 objectString:(id)a4
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:objectString:dispatch:](self, a3, a4, 0);
}

- (void)_sendSimpleEvent:(void *)a3 objectNumber:(char)a4 dispatch:
{
  id v7;
  int64_t v8;
  xpc_object_t v9;
  uint64_t i;
  xpc_object_t v11[2];
  char *keys[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    *(_OWORD *)keys = xmmword_1E7D7F7F8;
    v8 = objc_msgSend(v7, "integerValue", xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String")));
    v11[1] = xpc_int64_create(v8);
    v9 = xpc_dictionary_create((const char *const *)keys, v11, 2uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v9, a4);

    for (i = 1; i != -1; --i)
  }

}

- (void)sendSimpleEvent:(id)a3 objectNumber:(id)a4
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:objectNumber:dispatch:](self, a3, a4, 1);
}

- (void)syncSendSimpleEvent:(id)a3 objectNumber:(id)a4
{
  -[NFSecureXPCEventPublisher _sendSimpleEvent:objectNumber:dispatch:](self, a3, a4, 0);
}

- (BOOL)syncSendDictionary:(id)a3
{
  return -[NFSecureXPCEventPublisher _sendDictionary:dispatch:](self, a3, 0);
}

- (BOOL)qosPropagation
{
  return self->_qosPropagation;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, a3);
}

- (void)setEventSendQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventSendQueue, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_eventSendQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
