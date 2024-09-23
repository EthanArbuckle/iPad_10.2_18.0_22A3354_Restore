@implementation RTIInputSystemService

- (void)inputSessionDidBegin:(id)a3 options:(id)a4
{
  id v7;
  NSString *lastAppId;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  id WeakRetained;
  void *v17;
  id v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  id v25;

  v25 = a3;
  v7 = a4;
  lastAppId = self->_lastAppId;
  if (lastAppId)
  {
    objc_msgSend(v25, "documentTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqualToString:](lastAppId, "isEqualToString:", v10);

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:", CFSTR("RTIInputSessionWillChangeToNewProcessNotification"), 0);

    }
  }
  objc_msgSend(v25, "documentTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appId");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = self->_lastAppId;
  self->_lastAppId = v14;

  objc_storeStrong((id *)&self->_currentSession, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v17 = WeakRetained;
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      if (!v7)
      {
        +[RTISessionOptions defaultBeginOptions](RTISessionOptions, "defaultBeginOptions");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "inputSystemService:inputSessionDidBegin:options:", self, v25, v7);
      goto LABEL_12;
    }
  }
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v21)
  {
    v22 = v21;
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "inputSystemService:inputSessionDidBegin:", self, v25);
LABEL_12:

    }
  }

}

- (void)prepareForInputSession:(id)a3 options:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:prepareForInputSession:options:", self, v12, v6);

    }
  }

}

- (void)inputSessionDidDie:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  RTIInputSystemServiceSession *v19;

  v19 = (RTIInputSystemServiceSession *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "inputSystemService:inputSessionDidDie:", self, v19);
LABEL_10:

      goto LABEL_11;
    }
  }
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v9)
  {
    v10 = v9;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      +[RTISessionOptions defaultOptions](RTISessionOptions, "defaultOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShouldResign:", 0);
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "inputSystemService:inputSessionDidEnd:options:", self, v19, v8);

      goto LABEL_10;
    }
  }
  v14 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v14)
  {
    v15 = v14;
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "inputSystemService:inputSessionDidEnd:", self, v19);
      goto LABEL_10;
    }
  }
LABEL_11:
  if (self->_currentSession == v19)
  {
    self->_currentSession = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("RTIInputSessionDidEndUnexpectedlyNotification"), 0);

  }
  os_unfair_lock_lock(&self->_sessionsLock);
  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v19);
  os_unfair_lock_unlock(&self->_sessionsLock);

}

- (void)inputSession:(id)a3 didReceiveConnection:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "setSessionDelegate:", self);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  os_unfair_lock_lock(&self->_sessionsLock);
  -[NSMutableSet addObject:](self->_sessions, "addObject:", v12);
  os_unfair_lock_unlock(&self->_sessionsLock);
  if (-[RTIInputSystemService _canResumeConnection](self, "_canResumeConnection"))
    objc_msgSend(v6, "resume");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:didCreateInputSession:", self, v12);

    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)inputSessionDidEnd:(id)a3 options:(id)a4 completion:(id)a5
{
  RTIInputSystemServiceSession *v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  dispatch_time_t v12;
  id WeakRetained;
  void *v14;
  id v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  char v26;
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;

  v8 = (RTIInputSystemServiceSession *)a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = dispatch_group_create();
  v12 = dispatch_time(0, 2100000000);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  if (!v10 || !WeakRetained)
  {

    goto LABEL_8;
  }
  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
LABEL_8:
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v18
      && (v19 = v18,
          v20 = objc_loadWeakRetained((id *)&self->_delegate),
          v21 = objc_opt_respondsToSelector(),
          v20,
          v19,
          (v21 & 1) != 0))
    {
      if (!v9)
      {
        +[RTISessionOptions defaultEndOptions](RTISessionOptions, "defaultEndOptions");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "inputSystemService:inputSessionDidEnd:options:", self, v8, v9);
    }
    else
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      if (!v23)
        goto LABEL_17;
      v24 = v23;
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_17;
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "inputSystemService:inputSessionDidEnd:", self, v8);
    }

    goto LABEL_17;
  }
  if (!v9)
  {
    +[RTISessionOptions defaultEndOptions](RTISessionOptions, "defaultEndOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  dispatch_group_enter(v11);
  v17 = objc_loadWeakRetained((id *)&self->_delegate);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__RTIInputSystemService_inputSessionDidEnd_options_completion___block_invoke;
  v28[3] = &unk_1E35C25C0;
  v29 = v11;
  objc_msgSend(v17, "inputSystemService:inputSessionDidEnd:options:completion:", self, v8, v9, v28);

LABEL_17:
  if (self->_currentSession == v8)
  {
    self->_currentSession = 0;

  }
  os_unfair_lock_lock(&self->_sessionsLock);
  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v8);
  os_unfair_lock_unlock(&self->_sessionsLock);
  if (v10)
  {
    if (dispatch_group_wait(v11, v12))
    {
      RTIInputSessionChangeLogFacility();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemService inputSessionDidEnd:options:completion:].cold.1(v8, v27);

    }
    v10[2](v10);
  }

}

- (void)inputSessionDidEnd:(id)a3 options:(id)a4
{
  -[RTIInputSystemService inputSessionDidEnd:options:completion:](self, "inputSessionDidEnd:options:completion:", a3, a4, 0);
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:performInputOperation:", self, v10, v6);

  }
}

+ (id)sharedServiceWithMachName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  RTIInputSystemService *v5;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (sharedServiceWithMachName__onceToken == -1)
  {
    if (v3)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&sharedServiceWithMachName__onceToken, &__block_literal_global_3);
    if (v4)
    {
LABEL_3:
      if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.iosmac.remote-text-editing")))goto LABEL_5;
    }
  }

  v4 = CFSTR("Anonymous");
LABEL_5:
  objc_msgSend((id)sharedServiceWithMachName___services, "objectForKey:", v4);
  v5 = (RTIInputSystemService *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[RTIInputSystemService initWithMachName:]([RTIInputSystemService alloc], "initWithMachName:", v4);
    objc_msgSend((id)sharedServiceWithMachName___services, "setObject:forKey:", v5, v4);
  }

  return v5;
}

void __51__RTIInputSystemService_sharedServiceWithMachName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)sharedServiceWithMachName___services;
  sharedServiceWithMachName___services = v0;

}

- (RTIInputSystemService)initWithMachName:(id)a3
{
  id v5;
  RTIInputSystemService *v6;
  RTIInputSystemService *v7;
  NSMutableSet *v8;
  NSMutableSet *sessions;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *dispatchQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTIInputSystemService;
  v6 = -[RTIInputSystemService init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_enabled = 1;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sessions = v7->_sessions;
    v7->_sessions = v8;

    v7->_sessionsLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.RemoteTextInput.service", v11);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_machName, a3);
    -[RTIInputSystemService _createListenerIfNecessary](v7, "_createListenerIfNecessary");

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[RTIInputSystemService _destroyListenerIfNecessary](self, "_destroyListenerIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemService;
  -[RTIInputSystemService dealloc](&v3, sel_dealloc);
}

+ (Class)serviceSessionClass
{
  return (Class)objc_opt_class();
}

- (void)_createListenerIfNecessary
{
  NSXPCListener *v3;
  NSXPCListener *listener;

  if (!self->_listener)
  {
    if (-[NSString isEqualToString:](self->_machName, "isEqualToString:", CFSTR("Anonymous")))
    {
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", self->_machName);
    }
    listener = self->_listener;
    self->_listener = v3;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_listener, "resume");
  }
}

- (void)_destroyListenerIfNecessary
{
  NSXPCListener *listener;
  NSXPCListener *v4;

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener setDelegate:](listener, "setDelegate:", 0);
    -[NSXPCListener invalidate](self->_listener, "invalidate");
    v4 = self->_listener;
    self->_listener = 0;

  }
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (BOOL)_canResumeConnection
{
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "serviceSessionClass"), "sessionWithConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemService inputSession:didReceiveConnection:](self, "inputSession:didReceiveConnection:", v6, v5);

  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3)
    -[RTIInputSystemService _createListenerIfNecessary](self, "_createListenerIfNecessary");
  else
    -[RTIInputSystemService _destroyListenerIfNecessary](self, "_destroyListenerIfNecessary");
}

void __63__RTIInputSystemService_inputSessionDidEnd_options_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v16 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:inputSession:documentTraitsDidChange:", self, v16, v6);
LABEL_7:

      goto LABEL_8;
    }
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v12)
  {
    v13 = v12;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:inputSessionDocumentDidChange:", self, v16);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)inputSession:(id)a3 documentStateDidChange:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v16 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:inputSession:documentStateDidChange:", self, v16, v6);
LABEL_7:

      goto LABEL_8;
    }
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v12)
  {
    v13 = v12;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "inputSystemService:inputSessionDocumentDidChange:", self, v16);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)inputSession:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  char v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (v6)
  {
    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "inputSystemService:inputSessionDidPause:withReason:", self, v16, v8);
LABEL_8:

      }
    }
  }
  else if (WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "inputSystemService:inputSessionDidUnpause:withReason:", self, v16, v8);
      goto LABEL_8;
    }
  }

}

- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:textSuggestionsChanged:", self, v10, v6);

  }
}

- (void)inputSession:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:didAddSupplementalLexicon:", self, v10, v6);

  }
}

- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:didAddRTISupplementalLexicon:", self, v10, v6);

  }
}

- (void)inputSession:(id)a3 didRemoveSupplementalLexicon:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:didRemoveSupplementalLexicon:", self, v10, v6);

  }
}

- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "inputSystemService:inputSession:didRemoveRTISupplementalLexicon:", self, v10, v6);

  }
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "inputSystemService:inputSession:performInputOperation:withResponse:", self, v13, v8, v9);

  }
}

- (RTIInputSystemServiceSession)currentSession
{
  return self->_currentSession;
}

- (RTIInputSystemDelegate)delegate
{
  return (RTIInputSystemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
  objc_storeStrong((id *)&self->_machName, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSString)lastAppId
{
  return self->_lastAppId;
}

- (void)setLastAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppId, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)inputSessionDidEnd:(void *)a1 options:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[RTIInputSystemService inputSessionDidEnd:options:completion:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1991A8000, a2, OS_LOG_TYPE_ERROR, "%s  Timeout while waiting to end session. sessionID = %@", (uint8_t *)&v4, 0x16u);

}

@end
