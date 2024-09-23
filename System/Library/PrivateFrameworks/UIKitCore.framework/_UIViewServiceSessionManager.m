@implementation _UIViewServiceSessionManager

+ (void)startViewServiceSessionManagerAsPlugin:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceSessionManager_startViewServiceSessionManagerAsPlugin___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  if (startViewServiceSessionManagerAsPlugin__onceToken != -1)
    dispatch_once(&startViewServiceSessionManagerAsPlugin__onceToken, block);
}

+ (BOOL)hasActiveSessions
{
  return objc_msgSend((id)__viewServiceSessionManager, "_hasActiveSessions");
}

- (id)_initAsPlugIn:(BOOL)a3
{
  _UIViewServiceSessionManager *v4;
  NSMutableArray *v5;
  NSMutableArray *sessions;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  _UIViewServiceSessionManager *v13;
  _UIViewServiceSessionManager *v14;
  uint64_t v16;
  _QWORD handler[4];
  _UIViewServiceSessionManager *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_UIViewServiceSessionManager;
  v4 = -[_UIViewServiceSessionManager init](&v19, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessions = v4->_sessions;
    v4->_sessions = v5;

    if (a3)
    {
      _UIMainBundleIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".viewservice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIViewServiceSessionManager _startListenerWithName:](v4, "_startListenerWithName:", v8);
    }
    else
    {
      v4->_connectionNotificationToken = 0;
      _UIMainBundleIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewServiceConnectionNotificationName(v9, v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "UTF8String");
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __46___UIViewServiceSessionManager__initAsPlugIn___block_invoke;
      handler[3] = &unk_1E16BDB68;
      v13 = v4;
      v18 = v13;
      notify_register_dispatch(v12, &v4->_connectionNotificationToken, MEMORY[0x1E0C80D38], handler);

      v16 = 0;
      notify_get_state(v4->_connectionNotificationToken, &v16);
      if (v16)
        -[_UIViewServiceSessionManager _startListener](v13, "_startListener");
      v8 = v18;
    }

    v14 = v4;
  }

  return v4;
}

- (_UIViewServiceSessionManager)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You may not directly init a %@"), v6);

  return 0;
}

+ (void)startViewServiceSessionWithDelegate:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___UIViewServiceSessionManager_startViewServiceSessionWithDelegate___block_invoke;
  block[3] = &unk_1E16B1B28;
  v9 = v3;
  v4 = startViewServiceSessionWithDelegate__onceToken;
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&startViewServiceSessionWithDelegate__onceToken, block);
    v6 = v9;
  }

}

+ (id)__serviceSessionManager
{
  return (id)__viewServiceSessionManager;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  notify_cancel(self->_connectionNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceSessionManager;
  -[_UIViewServiceSessionManager dealloc](&v3, sel_dealloc);
}

- (id)_initWithDelegate:(id)a3
{
  id v5;
  _UIViewServiceSessionManager *v6;
  NSMutableArray *v7;
  NSMutableArray *sessions;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  const char *v14;
  _UIViewServiceSessionManager *v15;
  _UIViewServiceSessionManager *v16;
  uint64_t v18;
  _QWORD handler[4];
  _UIViewServiceSessionManager *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIViewServiceSessionManager;
  v6 = -[_UIViewServiceSessionManager init](&v21, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessions = v6->_sessions;
    v6->_sessions = v7;

    objc_storeStrong((id *)&v6->_delegate, a3);
    if ((-[_UIViewServiceSessionManagerDelegate isExtensionViewServiceSessionManager:](v6->_delegate, "isExtensionViewServiceSessionManager:", v6) & 1) != 0)
    {
      _UIMainBundleIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".viewservice"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIViewServiceSessionManager _startListenerWithName:](v6, "_startListenerWithName:", v10);
    }
    else
    {
      v6->_connectionNotificationToken = 0;
      _UIMainBundleIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewServiceConnectionNotificationName(v11, v12);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __50___UIViewServiceSessionManager__initWithDelegate___block_invoke;
      handler[3] = &unk_1E16BDB68;
      v15 = v6;
      v20 = v15;
      notify_register_dispatch(v14, &v6->_connectionNotificationToken, MEMORY[0x1E0C80D38], handler);

      v18 = 0;
      notify_get_state(v6->_connectionNotificationToken, &v18);
      if (v18)
        -[_UIViewServiceSessionManager _startListener](v15, "_startListener");
      v10 = v20;
    }

    v16 = v6;
  }

  return v6;
}

- (void)_startListener
{
  void *v3;
  id v4;

  _UIMainBundleIdentifier();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _UIViewServiceMachServiceName((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceSessionManager _startListenerWithName:](self, "_startListenerWithName:", v3);

}

- (void)_startListenerWithName:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSXPCListener *v7;
  NSXPCListener *listener;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _startListenerWithName____s_category;
  if (!_startListenerWithName____s_category)
  {
    v5 = __UILogCategoryGetNode("ViewServiceSessionManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_startListenerWithName____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Starting connection listener with service name %{public}@", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_listener)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v7 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v4);
    listener = self->_listener;
    self->_listener = v7;

    os_unfair_lock_unlock(&self->_lock);
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
  }

}

- (void)_registerSessionForDefaultDeputies:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  v4 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke;
  v9[3] = &unk_1E16E8E30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "registerDeputyClass:withConnectionHandler:", v4, v9);
  if (+[_UIViewServiceTextEffectsOperator _shouldAddServiceOperator](_UIViewServiceTextEffectsOperator, "_shouldAddServiceOperator"))
  {
    v6 = objc_opt_class();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke_2;
    v7[3] = &unk_1E16E8E30;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "registerDeputyClass:withConnectionHandler:", v6, v7);
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (BOOL)_hasActiveSessions
{
  _UIViewServiceSessionManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_sessions, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_configureSessionForConnection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  _UIViewServiceSessionManager *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_UIViewServiceSession sessionWithConnection:manager:](_UIViewServiceSession, "sessionWithConnection:manager:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceSessionManager _registerSessionForDefaultDeputies:](self, "_registerSessionForDefaultDeputies:", v5);
  v6 = _configureSessionForConnection____s_category;
  if (!_configureSessionForConnection____s_category)
  {
    v6 = __UILogCategoryGetNode("ViewServiceSessionManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_configureSessionForConnection____s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v4, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "processIdentifier");
    objc_msgSend(v5, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v9;
    v20 = 1026;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Configuring connection on service %{public}@ to host pid %{public}d for session %{public}@", buf, 0x1Cu);

  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_sessions, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);
  -[_UIViewServiceSessionManager _startOrStopSystemsForBackgroundRunning](self, "_startOrStopSystemsForBackgroundRunning");
  objc_initWeak((id *)buf, v5);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63___UIViewServiceSessionManager__configureSessionForConnection___block_invoke;
  v15 = &unk_1E16B1500;
  objc_copyWeak(&v17, (id *)buf);
  v16 = self;
  objc_msgSend(v5, "setTerminationHandler:", &v12);
  objc_msgSend(v4, "resume", v12, v13, v14, v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  -[_UIViewServiceSessionManager _configureSessionForConnection:](self, "_configureSessionForConnection:", a4);
  return 1;
}

- (void)_startOrStopSystemsForBackgroundRunning
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceSessionManager__startOrStopSystemsForBackgroundRunning__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (_UIViewServiceSessionManagerDelegate)delegate
{
  return (_UIViewServiceSessionManagerDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
