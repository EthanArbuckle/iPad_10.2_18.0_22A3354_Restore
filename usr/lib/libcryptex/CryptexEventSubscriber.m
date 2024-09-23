@implementation CryptexEventSubscriber

+ (OS_dispatch_queue)streamQueue
{
  if (streamQueue_onceToken != -1)
    dispatch_once(&streamQueue_onceToken, &__block_literal_global_0);
  return (OS_dispatch_queue *)(id)_streamQueue;
}

void __37__CryptexEventSubscriber_streamQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.security.libcryptex.com.apple.security.cryptex.events", 0);
  v1 = (void *)_streamQueue;
  _streamQueue = (uint64_t)v0;

}

+ (NSMutableDictionary)subscribers
{
  NSObject *v2;

  if (subscribers_onceToken != -1)
    dispatch_once(&subscribers_onceToken, &__block_literal_global_5);
  +[CryptexEventSubscriber streamQueue](CryptexEventSubscriber, "streamQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return (NSMutableDictionary *)(id)_subscribers;
}

void __37__CryptexEventSubscriber_subscribers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_subscribers;
  _subscribers = (uint64_t)v0;

}

+ (void)initializeEventStream
{
  if (initializeEventStream_onceToken != -1)
    dispatch_once(&initializeEventStream_onceToken, &__block_literal_global_7);
}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke()
{
  NSObject *v0;

  +[CryptexEventSubscriber streamQueue](CryptexEventSubscriber, "streamQueue");
  v0 = objc_claimAutoreleasedReturnValue();
  xpc_set_event_stream_handler("com.apple.security.cryptex.events", v0, &__block_literal_global_10);

}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke_2(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  const char *string;
  void *v5;
  void *v6;
  id v7;

  v2 = (const char *)*MEMORY[0x24BDACF50];
  v3 = a2;
  string = xpc_dictionary_get_string(v3, v2);
  +[CryptexEventSubscriber subscribers](CryptexEventSubscriber, "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "handleXPCEvent:", v3);
}

+ (void)attachToStream:(id)a3 withRegistration:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[CryptexEventSubscriber initializeEventStream](CryptexEventSubscriber, "initializeEventStream");
  +[CryptexEventSubscriber streamQueue](CryptexEventSubscriber, "streamQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke;
  v10[3] = &unk_24CE0B830;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  +[CryptexEventSubscriber subscribers](CryptexEventSubscriber, "subscribers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpcEventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  objc_msgSend(*(id *)(a1 + 32), "xpcEventName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  xpc_set_event();

}

+ (void)detachFromStream:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  +[CryptexEventSubscriber initializeEventStream](CryptexEventSubscriber, "initializeEventStream");
  +[CryptexEventSubscriber streamQueue](CryptexEventSubscriber, "streamQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CryptexEventSubscriber_detachFromStream___block_invoke;
  block[3] = &unk_24CE0B858;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __43__CryptexEventSubscriber_detachFromStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[CryptexEventSubscriber subscribers](CryptexEventSubscriber, "subscribers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "xpcEventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(a1 + 32), "xpcEventName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  xpc_set_event();

}

- (CryptexEventSubscriber)initWithFlags:(unint64_t)a3 name:(id)a4
{
  id v7;
  CryptexEventSubscriber *v8;
  os_log_t v9;
  OS_os_log *log;
  OS_dispatch_queue *queue;
  CryptexEventSubscriber *v12;
  objc_super v14;

  v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)CryptexEventSubscriber;
    v8 = -[CryptexEventSubscriber init](&v14, sel_init);
    if (v8)
    {
      v9 = os_log_create("com.apple.libcryptex", "event_subscriber");
      log = v8->_log;
      v8->_log = (OS_os_log *)v9;

      v8->_flags = a3;
      v8->_active = 0;
      queue = v8->_queue;
      v8->_queue = 0;

      objc_storeStrong((id *)&v8->_xpcEventName, a4);
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)registerForEvents:(unint64_t)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  NSObject *v8;
  id v9;
  xpc_object_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  CFErrorRef v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  NSObject *v22;
  CFErrorRef Error;

  v8 = a4;
  v9 = a5;
  v10 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    -[CryptexEventSubscriber log](self, "log");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CryptexEventSubscriber log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]", "event.m", 118, "com.apple.security.cryptex", 3, 0, v20);
    goto LABEL_12;
  }
  if (!v9)
  {
    -[CryptexEventSubscriber log](self, "log");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[CryptexEventSubscriber log](self, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]", "event.m", 125, "com.apple.security.cryptex", 3, 0, v20);
LABEL_12:
    v17 = Error;
    free(v20);
    goto LABEL_13;
  }
  -[CryptexEventSubscriber setCallback:](self, "setCallback:", v9);
  dispatch_queue_attr_make_initially_inactive(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.security.libcryptex.event_subscriber", v11);

  -[CryptexEventSubscriber setQueue:](self, "setQueue:", v12);
  -[CryptexEventSubscriber queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v13, v8);

  -[CryptexEventSubscriber queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v14);

  -[CryptexEventSubscriber setActive:](self, "setActive:", 1);
  v15 = cryptex_event_mask_ext_to_int(a3);
  xpc_dictionary_set_uint64(v10, "CryptexEventMask", v15);
  v16 = getprogname();
  xpc_dictionary_set_string(v10, "CryptexEventClientName", v16);
  +[CryptexEventSubscriber attachToStream:withRegistration:](CryptexEventSubscriber, "attachToStream:withRegistration:", self, v10);
  v17 = 0;
LABEL_13:

  return v17;
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[CryptexEventSubscriber queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__CryptexEventSubscriber_cancel__block_invoke;
    block[3] = &unk_24CE0B858;
    block[4] = self;
    dispatch_async(v3, block);
  }

}

void __32__CryptexEventSubscriber_cancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "active"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCallback:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setQueue:", 0);
    +[CryptexEventSubscriber detachFromStream:](CryptexEventSubscriber, "detachFromStream:", *(_QWORD *)(a1 + 32));
    if (v2)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, 0, 0, 0);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[CryptexEventSubscriber cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CryptexEventSubscriber;
  -[CryptexEventSubscriber dealloc](&v3, sel_dealloc);
}

- (id)_handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  CFErrorRef v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  CFErrorRef Error;
  const void *data;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  CFErrorRef v26;
  id v27;
  size_t length;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0;
  v30 = 0;
  length = 0;
  -[CryptexEventSubscriber queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[CryptexEventSubscriber active](self, "active"))
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_23;
  }
  -[CryptexEventSubscriber callback](self, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CryptexEventSubscriber log](self, "log");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CryptexEventSubscriber log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      LOWORD(v31) = 0;
      v9 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(v31) = 0;
      v9 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 201, "com.apple.security.cryptex", 3, 0, v9);
    goto LABEL_22;
  }
  if (_xpc_dictionary_try_get_uint64(v4, "CRYPTEX_EVENT_TYPE", (uint64_t *)&v30))
  {
    -[CryptexEventSubscriber log](self, "log");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CryptexEventSubscriber log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      v9 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      v9 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 210, "com.apple.security.cryptex", 3, 0, v9);
LABEL_22:
    v11 = Error;
    free(v9);
    v10 = 0;
    goto LABEL_23;
  }
  if (_xpc_dictionary_try_get_string(v4, "CRYPTEX_EVENT_CRYPTEX_NAME", &v29))
  {
    -[CryptexEventSubscriber log](self, "log");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CryptexEventSubscriber log](self, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      v9 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      v9 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 219, "com.apple.security.cryptex", 3, 0, v9);
    goto LABEL_22;
  }
  data = xpc_dictionary_get_data(v4, "CRYPTEX_EVENT_INFO", &length);
  if (!data)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_25;
  }
  v18 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data, length);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v18, "propertyListWithData:options:format:error:", v19, 0, 0, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CFErrorRef)v27;

  if (v10)
  {
LABEL_25:
    v24 = cryptex_event_type_int_to_ext(v30);
    -[CryptexEventSubscriber callback](self, "callback");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, const char *, void *))v25)[2](v25, v24, v29, v10);

    goto LABEL_23;
  }
  -[CryptexEventSubscriber log](self, "log");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CryptexEventSubscriber log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    LOWORD(v31) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    LOWORD(v31) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();
  }
  v26 = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 232, "com.apple.security.cryptex", 3, v11, v22);
  free(v22);

  v10 = 0;
  v11 = v26;
LABEL_23:

  return v11;
}

- (void)handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CryptexEventSubscriber queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__CryptexEventSubscriber_handleXPCEvent___block_invoke;
  v7[3] = &unk_24CE0B830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__CryptexEventSubscriber_handleXPCEvent___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_handleXPCEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *__error();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 138543618;
      v6 = v2;
      v7 = 1024;
      v8 = 72;
      _os_log_impl(&dword_2126F8000, v4, OS_LOG_TYPE_FAULT, "Failed to handle XPC event: %{public}@: %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
    }

    *__error() = v3;
  }

}

- (NSString)xpcEventName
{
  return self->_xpcEventName;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_xpcEventName, 0);
}

@end
