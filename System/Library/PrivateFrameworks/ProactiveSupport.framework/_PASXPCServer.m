@implementation _PASXPCServer

- (_PASXPCServer)initWithXPCListeners:(id)a3 logHandle:(id)a4
{
  id v6;
  _PASXPCServer *v7;
  _PASXPCServer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PASXPCServer;
  v7 = -[_PASXPCServer init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_XPCListeners, a3);

  return v8;
}

- (void)registerXPCListeners
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_XPCListeners;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "serviceName", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PASXPCServer registerForService:delegate:](_PASXPCServer, "registerForService:delegate:", v8, v9);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCListeners, 0);
}

+ (void)registerForService:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _PASTuple2 *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASXPCServer.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASXPCServer.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v10 = a1;
  objc_sync_enter(v10);
  v11 = (void *)listeners;
  if (!listeners)
  {
    v12 = objc_opt_new();
    v13 = (void *)listeners;
    listeners = v12;

    v11 = (void *)listeners;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "SPI misuse: re-registering for XPC service '%@'", buf, 0xCu);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    objc_sync_exit(v10);
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v7);
    objc_msgSend(v15, "setDelegate:", v9);
    v16 = -[_PASTuple2 initWithFirst:second:]([_PASTuple2 alloc], "initWithFirst:second:", v15, v9);
    objc_msgSend((id)listeners, "setObject:forKeyedSubscript:", v16, v7);

    objc_sync_exit(v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = (id)objc_opt_class();
      v17 = v23;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Registered for XPC service '%@' with delegate of class %@", buf, 0x16u);

    }
    objc_msgSend(v15, "resume");
    v10 = v15;
  }

}

+ (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ registrations:\n"), v4);

  obj = a1;
  objc_sync_enter(obj);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)listeners, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)listeners, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@ => %@\n"), v10, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
  return v3;
}

@end
