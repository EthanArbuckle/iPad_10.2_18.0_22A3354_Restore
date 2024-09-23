@implementation NFXPCEventPublisher

- (NFXPCEventPublisher)initWithStreamName:(id)a3 queue:(id)a4
{
  id v8;
  id v9;
  NFXPCEventPublisher *v10;
  NFXPCEventPublisher *v11;
  id v12;
  uint64_t v13;
  OS_xpc_event_publisher *publisher;
  uint64_t v15;
  NSMutableArray *pendingSendEvents;
  uint64_t v17;
  NSMutableSet *tokens;
  void *v19;
  NFXPCEventPublisher *v20;
  char *v21;
  void *specific;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v25;
  const char *ClassName;
  const char *Name;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  id v35;
  id v36[2];
  _QWORD v37[4];
  id v38;
  objc_super v39;
  id location;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NFXPCEventPublisher;
  v10 = -[NFXPCEventPublisher init](&v39, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  objc_storeStrong((id *)&v10->_streamName, a3);
  objc_storeStrong((id *)&v11->_queue, a4);
  v12 = objc_retainAutorelease(v8);
  objc_msgSend(v12, "UTF8String");
  xpc_event_publisher_create();
  v13 = objc_claimAutoreleasedReturnValue();
  publisher = v11->_publisher;
  v11->_publisher = (OS_xpc_event_publisher *)v13;

  v15 = objc_opt_new();
  pendingSendEvents = v11->_pendingSendEvents;
  v11->_pendingSendEvents = (NSMutableArray *)v15;

  v17 = objc_opt_new();
  tokens = v11->_tokens;
  v11->_tokens = (NSMutableSet *)v17;

  if (v11->_publisher)
  {
    objc_initWeak(&location, v11);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke;
    v37[3] = &unk_1E7D7F5A8;
    objc_copyWeak(&v38, &location);
    v19 = (void *)MEMORY[0x1C3BD24E8](v37);
    xpc_event_publisher_set_handler();
    objc_copyWeak(v36, &location);
    v36[1] = (id)a2;
    v35 = v12;
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();

    objc_destroyWeak(v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
LABEL_4:
    v20 = v11;
    goto LABEL_19;
  }
  v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v23)
  {
    Class = object_getClass(v11);
    if (class_isMetaClass(Class))
      v25 = 43;
    else
      v25 = 45;
    ClassName = object_getClassName(v11);
    Name = sel_getName(a2);
    v23(3, "%c[%{public}s %{public}s]:%i Could not create the Publisher!!!", v25, ClassName, Name, 65);
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v28 = dispatch_get_specific(v21);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v29 = (id)_NFSharedLogClient[(_QWORD)v28];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = object_getClass(v11);
    if (class_isMetaClass(v30))
      v31 = 43;
    else
      v31 = 45;
    v32 = object_getClassName(v11);
    v33 = sel_getName(a2);
    LODWORD(location) = 67109890;
    HIDWORD(location) = v31;
    v41 = 2082;
    v42 = v32;
    v43 = 2082;
    v44 = v33;
    v45 = 1024;
    v46 = 65;
    _os_log_impl(&dword_1C34DB000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create the Publisher!!!", (uint8_t *)&location, 0x22u);
  }

  v20 = 0;
LABEL_19:

  return v20;
}

void __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleEventWithAction:token:descriptor:", a2, a3, v9);

}

void __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
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
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v5 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v5)
    {
      Class = object_getClass(WeakRetained);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(WeakRetained);
      Name = sel_getName(*(SEL *)(a1 + 48));
      v18 = *(_QWORD *)(a1 + 32);
      v19 = xpc_strerror();
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i Unexpected error from XPC event publisher for stream %{public}@: %s", v10, ClassName, Name, 59, v18, v19);
      v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v11 = dispatch_get_specific(v3);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v12 = (id)_NFSharedLogClient[(_QWORD)v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(WeakRetained);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(WeakRetained);
      v16 = sel_getName(*(SEL *)(a1 + 48));
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67110402;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 2082;
      v25 = v16;
      v26 = 1024;
      v27 = 59;
      v28 = 2114;
      v29 = v17;
      v30 = 2080;
      v31 = xpc_strerror();
      _os_log_impl(&dword_1C34DB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error from XPC event publisher for stream %{public}@: %s", buf, 0x36u);
    }

  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableSet *tokens;
  NSMutableSet *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1C3BD2800](v8);
    if (v10)
      free(v10);
  }
  switch(a3)
  {
    case 0u:
      tokens = self->_tokens;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](tokens, "addObject:", v12);
LABEL_17:

      break;
    case 1u:
      v18 = self->_tokens;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v18, "removeObject:", v12);
      goto LABEL_17;
    case 2u:
      self->_receivedInitialBarrier = 1;
      v11 = (void *)-[NSMutableArray copy](self->_pendingSendEvents, "copy");
      -[NSMutableArray removeAllObjects](self->_pendingSendEvents, "removeAllObjects");
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            -[NFXPCEventPublisher sendXpcNotificationEvent:](self, "sendXpcNotificationEvent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++), (_QWORD)v19);
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }

      goto LABEL_17;
  }

}

- (void)sendXpcNotificationEvent:(id)a3
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
  block[2] = __48__NFXPCEventPublisher_sendXpcNotificationEvent___block_invoke;
  block[3] = &unk_1E7D7F040;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(queue, block);

}

void __48__NFXPCEventPublisher_sendXpcNotificationEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(v2 + 48);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
    if (v3)
    {
      v4 = v3;
      v26 = *(_QWORD *)v28;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v28 != v26)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
          objc_msgSend(v6, "unsignedLongLongValue");
          if (xpc_event_publisher_fire())
          {
            v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)specific >= 4)
              __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
            v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
            if (v9)
            {
              Class = object_getClass(*(id *)(a1 + 32));
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(*(id *)(a1 + 32));
              Name = sel_getName(*(SEL *)(a1 + 48));
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
              v24 = xpc_strerror();
              v15 = 45;
              if (isMetaClass)
                v15 = 43;
              v9(3, "%c[%{public}s %{public}s]:%i Failed to send event to XPC event stream %{public}@ for token %{public}@: %s", v15, ClassName, Name, 112, v14, v6, v24);
              v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v16 = dispatch_get_specific(v7);
            if (NFSharedLogInitialize_onceToken != -1)
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            v17 = (id)_NFSharedLogClient[(_QWORD)v16];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = object_getClass(*(id *)(a1 + 32));
              if (class_isMetaClass(v18))
                v19 = 43;
              else
                v19 = 45;
              v20 = object_getClassName(*(id *)(a1 + 32));
              v21 = sel_getName(*(SEL *)(a1 + 48));
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
              v23 = xpc_strerror();
              *(_DWORD *)buf = 67110658;
              v32 = v19;
              v33 = 2082;
              v34 = v20;
              v35 = 2082;
              v36 = v21;
              v37 = 1024;
              v38 = 112;
              v39 = 2114;
              v40 = v22;
              v41 = 2114;
              v42 = v6;
              v43 = 2080;
              v44 = v23;
              _os_log_impl(&dword_1C34DB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to send event to XPC event stream %{public}@ for token %{public}@: %s", buf, 0x40u);
            }

          }
          ++v5;
        }
        while (v4 != v5);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
      }
      while (v4);
    }

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 40), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void)sendXpcNotificationEventWithString:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  v5 = objc_retainAutorelease(v4);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  xpc_dictionary_set_string(xdict, "Payload", v6);
  -[NFXPCEventPublisher sendXpcNotificationEvent:](self, "sendXpcNotificationEvent:", xdict);

}

- (void)sendXpcNotificationEventWithDictionary:(id)a3
{
  void *v5;
  void *v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v6 = v5;
  if (v5)
  {
    if (xpc_dictionary_get_count(v5))
      -[NFXPCEventPublisher sendXpcNotificationEvent:](self, "sendXpcNotificationEvent:", v6);
  }
  else
  {
    v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v9)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Unable to create event dictionary; dropping event",
        v13,
        ClassName,
        Name,
        132);
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v14 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v15 = (id)_NFSharedLogClient[(_QWORD)v14];
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
      v26 = 132;
      _os_log_impl(&dword_1C34DB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to create event dictionary; dropping event",
        buf,
        0x22u);
    }

  }
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  objc_storeStrong((id *)&self->_streamName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSendEvents, a3);
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (BOOL)receivedInitialBarrier
{
  return self->_receivedInitialBarrier;
}

- (void)setReceivedInitialBarrier:(BOOL)a3
{
  self->_receivedInitialBarrier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
